package kr.or.epm.Service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.epm.DAO.BranchDAO;
import kr.or.epm.DAO.DeptDAO;
import kr.or.epm.DAO.Low_deptDAO;
import kr.or.epm.DAO.PositionDAO;
import kr.or.epm.VO.Branch;
import kr.or.epm.VO.Dept;
import kr.or.epm.VO.DeptJoinBonus;
import kr.or.epm.VO.LowDeptJoin;
import kr.or.epm.VO.Low_dept;
import kr.or.epm.VO.Position;
import kr.or.epm.VO.PositionJoin;
import kr.or.epm.VO.Set_homepage;
import kr.or.epm.VO.Set_time;
import net.sf.json.JSONArray;

@Service
public class AdminService {

	@Autowired
	private SqlSession sqlsession;
	
	//지점 관리 페이지
	public List<Branch> listBranch(){
		BranchDAO branchDAO = sqlsession.getMapper(BranchDAO.class);
		List<Branch> list = null;
		list = branchDAO.selectBranch();
		System.out.println("지점 싸이즈 : " +list.size());
		return list;
	}
	
	//선택한 지점 정보 보기
	public Branch chooseBranch(String selectBranchName){
		BranchDAO branchDAO = sqlsession.getMapper(BranchDAO.class);
		Branch dto = branchDAO.selectChooseBranch(selectBranchName);
		System.out.println("조회 결과 : "+dto.toString());
		return dto;
	}
	
	//지점 추가 
	public int addBranch(Branch dto){
		BranchDAO branchDAO = sqlsession.getMapper(BranchDAO.class);
		int result = branchDAO.addBranch(dto);
		return result;
	}
	
	//지점 정보 수정 
	public int branchModify(Branch dto){
		BranchDAO branchDAO = sqlsession.getMapper(BranchDAO.class);
		int result = branchDAO.branchModify(dto);
		return result;
	}

	
	//부서 페이지 사용 - 지점에 따른 부서 리스트 출력
	public List<Dept> listDept(String branch_name){
		DeptDAO deptDAO =  sqlsession.getMapper(DeptDAO.class);
		
		List<Dept> list = null;
		list = deptDAO.deptList(branch_name);
		
		return list; 
	}
	
	//부서관리 > 부서 조회하기
	public DeptJoinBonus selectChooseDept(String dept_no){
		DeptDAO deptDAO =  sqlsession.getMapper(DeptDAO.class);
		DeptJoinBonus dept= deptDAO.selectChooseDept(dept_no);
		return dept;
	}
	
	//부서관리 > 부서 정보 수정
	public int insert_re_Dept(DeptJoinBonus dto){
		
		DeptDAO deptDAO =  sqlsession.getMapper(DeptDAO.class);
		int result=0;
		String pre_dept_no = dto.getDept_no();
		//수정한 부서 정보 insert 1)
		result = deptDAO.insert_re_Dept(dto);
		
		//이전 부서 update 2)
		result += deptDAO.update_pre_dept(dto);
	    	
		//수정된 dept_no 조회하기 3)
		String dept_no=deptDAO.search_new_dept_no(dto);
		
		//상여금 update 4)
		dto.setDept_no(dept_no);
		dto.setPre_dept_no(pre_dept_no);
		
		result +=deptDAO.modifyset_bonus(dto);
		
		return result;
	}
	
	//부서 등록하기
	public int addBranch(DeptJoinBonus dto){
		//우리가 입력한 지점 이름
		String branch_Name = dto.getBranch_name();
		DeptDAO deptDAO =  sqlsession.getMapper(DeptDAO.class);
		
		//지점 번호 뽑아옴
		String branch_No = deptDAO.selectBranchName_No(branch_Name);
		//DB 에서 읽어온 지점 번호 셋팅
		dto.setBranch_no(branch_No);
		int result = 0;
		//부서 정보 인서트
		result = deptDAO.insertDept(dto);
		
		//부서번호 (dept_no  -> next.val 된 것 뽑아야 함)
		String dept_No = deptDAO.selectDeptNo(dto.getBranch_name(), dto.getDept_name());
		dto.setDept_no(dept_No);
		
		//상여금 설정 인서트
		result += deptDAO.addDept_set_bonus(dto);
		
		return result;
	}
	
	//하위부서 > 조회 > selectbox
	public List<Low_dept> select_lowdept_name(String dept_name){
		Low_deptDAO lowdao = sqlsession.getMapper(Low_deptDAO.class);
		List<Low_dept> list = lowdao.select_lowdept_name(dept_name);
		return list;
	}
	
	//하위 부서 > 조회하기
	public LowDeptJoin selectLow_dept_detail(String low_dept_no){
		Low_deptDAO lowdao = sqlsession.getMapper(Low_deptDAO.class);
		LowDeptJoin low_dept= lowdao.selectLow_dept_detail(low_dept_no);
		Set_homepage home= lowdao.selectHomePage(low_dept_no);
		Set_time time = lowdao.selectTime(low_dept_no);
		
		low_dept.setOpen(home.getOpen());
		low_dept.setClose(home.getClose());
		low_dept.setIn_time(time.getIn_time());
		low_dept.setOut_time(time.getOut_time());
		return low_dept;
	}
	
	//하위 부서 > 등록하기
	public int insertLow_dept(LowDeptJoin lowDeptJoin){
		Low_deptDAO lowdao = sqlsession.getMapper(Low_deptDAO.class);
		int result=0; 
		//부서등록
		result =lowdao.insertLow_dept(lowDeptJoin);
		//부서번호 조회
		String low_dept_no = lowdao.select_add_no(lowDeptJoin);
		lowDeptJoin.setLow_dept_no(low_dept_no);
		//홈페이지 접근시간 등록
		result +=lowdao.insert_homepage(lowDeptJoin);
		//출퇴근시간 등록
		result += lowdao.insert_time(lowDeptJoin);
		return result;
	}
	
	
	//직위 관리 페이지 사용 - 직위 리스트 읽어 오기
	public List<PositionJoin> listPosition(){
		PositionDAO positionDAO = sqlsession.getMapper(PositionDAO.class);
		List<PositionJoin> list = positionDAO.selectPosition();
		return list;
	}
	
	//직위 관리 페이지 - select 박스 선택시 한 직위 관련 정보 읽어 오기
	public PositionJoin dtoPosition(String option){
		System.out.println("서비스 옵션 : "+option);
		PositionDAO positionDAO = sqlsession.getMapper(PositionDAO.class);
		PositionJoin position = positionDAO.selectOptionJoin(option);
		return position;
	}
	
	//직위 추가  insert 부분
	public int positionInsert(PositionJoin position){
		int result = 0;
		PositionDAO positionDAO = sqlsession.getMapper(PositionDAO.class);
					result += positionDAO.insertPosition(position);
					
					String p_no = positionDAO.selectPosition_no(position);
					position.setPosition_no(p_no);
					
					result += positionDAO.insertSet_pay(position);
					result += positionDAO.insertSet_add_Pay(position);
		return result;
	}
	
	//직위 정보 수정 관련 > selectbox 사용시
	public int positionUpdate(PositionJoin position){
		
		int result = 0;
		PositionDAO positionDAO = sqlsession.getMapper(PositionDAO.class);
		Position positionDTO = new Position();
		positionDTO.setPosition_name(position.getPosition_name());
		positionDTO.setPosition_no(position.getPosition_no());
		result = positionDAO.updatePosition(positionDTO);
		
		if(result > 0){
			result = positionDAO.updateset_pay(position);
		}
		int resultAddpay = positionDAO.updateset_add_pay(position);
		int total = 0;
		if(result != 0 && resultAddpay != 0){
			total = 1;
		}else{
			total = 0;
		}
		return total;
	}
	
	//직위 권한 관련 업데이트 !!  드래그앤 드랍 
	public int positionUpdateDragAndDrop(List<Map<String, Object>> resultMap){
		int result = 0;
		PositionDAO positionDAO = sqlsession.getMapper(PositionDAO.class);
	
		
		for(Map<String, Object>map : resultMap){
			System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% : "+map.get("position_name")+" / "+map.get("step"));
			String position_name = (String)map.get("position_name");
			int step = (int)map.get("step");
			result = positionDAO.updatePositionStep(position_name,step);
		}
		
		System.out.println("서비스쪽 : "+result);
		return result;
	}
	
	
}
