package kr.or.epm.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.mail.Session;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.or.epm.DAO.BranchDAO;
import kr.or.epm.DAO.DeptDAO;
import kr.or.epm.DAO.Low_deptDAO;
import kr.or.epm.DAO.PayDAO;
import kr.or.epm.DAO.PositionDAO;
import kr.or.epm.VO.Branch;
import kr.or.epm.VO.Dept;
import kr.or.epm.VO.DeptJoinBonus;
import kr.or.epm.VO.LowDeptJoin;
import kr.or.epm.VO.Low_dept;
import kr.or.epm.VO.Pay;
import kr.or.epm.VO.Position;
import kr.or.epm.VO.PositionJoin;
import kr.or.epm.VO.Set_homepage;
import kr.or.epm.VO.Set_pay_date;
import kr.or.epm.VO.Set_time;

@Service
public class AdminService {

	@Autowired
	private SqlSession sqlsession;

	// 지점 관리 페이지
	public List<Branch> listBranch() {
		BranchDAO branchDAO = sqlsession.getMapper(BranchDAO.class);
		List<Branch> list = null;
		list = branchDAO.selectBranch();
		System.out.println("지점 싸이즈 : " + list.size());
		return list;
	}

	// 선택한 지점 정보 보기
	public Branch chooseBranch(String selectBranchName) {
		BranchDAO branchDAO = sqlsession.getMapper(BranchDAO.class);
		Branch dto = branchDAO.selectChooseBranch(selectBranchName);
		System.out.println("조회 결과 : " + dto.toString());
		return dto;
	}

	//지점 이름 중복 체크 하는 함수
	public String checkBranch_Name(String branch_name){
		
		System.out.println("브런치 이름 : "+branch_name);
		
		BranchDAO branchDAO = sqlsession.getMapper(BranchDAO.class);
		String list=null;
		try{
		
			list = branchDAO.checkBranch_Name(branch_name);
	    	
		}catch (Exception e) {
			e.printStackTrace();
		}
	  return list;
	}
	
	// 지점 추가
	public int addBranch(Branch dto) {
		BranchDAO branchDAO = sqlsession.getMapper(BranchDAO.class);
		int result = branchDAO.addBranch(dto);
		return result;
	}

	// 지점 정보 수정
	public int branchModify(Branch dto, String notChange_branch_Name) {
		String branchModify_notChange_branch_Name = notChange_branch_Name;
		System.out.println("1. 정보 수정 : "+branchModify_notChange_branch_Name);
		
		BranchDAO branchDAO = sqlsession.getMapper(BranchDAO.class);
		int result = 0;
		Branch branch=null; 
		
		// 지점 정보 수정 1)
		result = branchDAO.branchModify(dto);

		// 지점 정보 수정된 경우
		if (result > 0) {

			// 수정한 지점 정보 가져오기
			branch = branchDAO.select_newBranch(dto.getBranch_no());
			System.out.println(" 수정한 지점 정보 ================" + branch.toString());

			// 수정 전 지점 his_check 0으로 update 2)
			result = 0;
			result = branchDAO.update_pre_dept(dto.getBranch_no());
			System.out.println("his update 2)=============" + result);

		} else {
			return result;
		}
		
		// 부서 update 3)
		if(result > 0){
			result = 0;
			result = update_new_dept(branch);
			System.out.println(" 부서 update 결과  3)======================="+result);
		}else{
			return result;
		}
		
		
		//하위부서 update 4)
		if(result >0){
			System.out.println("4번째 : "+branchModify_notChange_branch_Name+"/////////////////////////////////");
			result =0; 
			result = update_new_low_dept(branch, branchModify_notChange_branch_Name);
			System.out.println("  하위부서 update 결과 :------------------------- "+result);
		}else{
			return result;
		}

		return result;
	}

	// 부서 update
	public int update_new_dept(Branch branch) {
		BranchDAO branchDAO = sqlsession.getMapper(BranchDAO.class);
		int update_dept = 0;

		// 소속 부서 개수
		int dept_count = branchDAO.countDept(branch);
		System.out.println(" 소속 부서 개수=====================" + dept_count);

		if (dept_count > 0) {
			// 소속 부서 update
			update_dept = 0;
				update_dept = branchDAO.update_new_dept(branch);
				System.out.println(" 부서 update 결과 ============" + update_dept);

			
			return update_dept;
		} else {
			update_dept =1;
			return update_dept;
		}
		
	
	}
	
	//하위부서 update
	public int update_new_low_dept(Branch branch, String notChange_branch_Name){
		int result = 0;
		BranchDAO branchDAO = sqlsession.getMapper(BranchDAO.class);
		
		System.out.println(" 변경후 :============"+branch.getBranch_name() +"///////변경 전 : "+notChange_branch_Name);
		//하위부서 개수
		int low_count = branchDAO.countlow_dept(notChange_branch_Name);
		System.out.println(" 하위부서 개수:::::::::::::::::::::::::"+low_count);
		
		//하위부서 update
		if(low_count>0){
			for(int i=0; i<low_count; i++){
				result = branchDAO.update_pre_lowDept(branch.getBranch_name(), notChange_branch_Name);
				System.out.println(" 하위부서 update 결과================="+result);
			}
			return result;
		}else{
			result=1;
			return result;
		}
		
	}

	// 지점 삭제하기 전 부서 존재 여부 조회하기
	public List<Dept> select_dept_beforeDelete(String branch_no) {
		DeptDAO deptDAO = sqlsession.getMapper(DeptDAO.class);
		List<Dept> list = deptDAO.select_dept_beforeDelete(branch_no);
		return list;
	}

	// 지점 삭제하기
	public int delete_branch(String branch_no) {
		BranchDAO branchDAO = sqlsession.getMapper(BranchDAO.class);
		int result = branchDAO.delete_branch(branch_no);
		return result;
	}

	// 부서 페이지 사용 - 지점에 따른 부서 리스트 출력
	public List<Dept> listDept(String branch_name) {
		DeptDAO deptDAO = sqlsession.getMapper(DeptDAO.class);

		List<Dept> list = null;
		list = deptDAO.deptList(branch_name);

		return list;
	}

	// 부서관리 > 부서 조회하기
	public DeptJoinBonus selectChooseDept(String dept_no) {
		DeptDAO deptDAO = sqlsession.getMapper(DeptDAO.class);
		DeptJoinBonus dept = deptDAO.selectChooseDept(dept_no);
		return dept;
	}

	// 부서관리 > 부서 정보 수정
	public int insert_re_Dept(DeptJoinBonus dto) {

		DeptDAO deptDAO = sqlsession.getMapper(DeptDAO.class);
		int result = 0;
		String pre_dept_no = dto.getDept_no();
		// 수정한 부서 정보 insert 1)

		result = deptDAO.insert_re_Dept(dto);

		if (result > 0) {

			result = 0;
			// 이전 부서 update 2)
			result = deptDAO.update_pre_dept(dto);

			System.out.println(" 부서 정보 수정 첫번째 result ========================" + result);
		} else {
			System.out.println("부서 정보 수정 첫번째  else =========");
			return result;
		}

		// 수정된 dept_no 조회하기 3)
		String dept_no = deptDAO.search_new_dept_no(dto);

		// 상여금 update 4)
		dto.setDept_no(dept_no);
		dto.setPre_dept_no(pre_dept_no);
		System.out.println(" 상여금 후 dto=========================== " + dto.toString());
		if (result > 0) {

			System.out.println("=======================================상여금 업데이트 이프");
			result = 0;
			result = deptDAO.modifyset_bonus(dto);
			System.out.println("=======================================상여금 업데이트 이프 끝");
		} else {
			System.out.println("상여금 업데이트 첫번째  else =========");
			return result;
		}

		if (result > 0) {
			// 부서 소속 하위부서 조회하기
			int count = deptDAO.count_lowDept(dto);
			System.out.println(" 하위부서 개수=====================" + count);

			if (count > 0) {
					result = 0;
					result = deptDAO.update_lowDept(dto);
					System.out.println("===================================하위부서 update 끝"+result);
				return result;
			} else {
				return result;
			}

		} else {
			return result;
		}

	}
	
	//부서 등록전 유효성 검사
	public String checkDept_Name(String dept_name){
		String result =null;
		
		DeptDAO deptdao =sqlsession.getMapper(DeptDAO.class);
		result =deptdao.checkDept_name(dept_name);
		System.out.println(" 부서 이름 잇니?????????"+result);
		
		if(result==null|| result==""){
			result="성공";
		}else{
			result="실패";
		}
	   return result;
	}
	
	
	// 부서 등록하기
	public int addBranch(DeptJoinBonus dto) {
		// 우리가 입력한 지점 이름
		String branch_Name = dto.getBranch_name();
		System.out.println(" 지점이름 : "+branch_Name);
		DeptDAO deptDAO = sqlsession.getMapper(DeptDAO.class);

		// 지점 번호 뽑아옴
		String branch_No = deptDAO.selectBranchName_No(branch_Name);
		System.out.println(" 지점 번호 : "+branch_No);
		// DB 에서 읽어온 지점 번호 셋팅
		dto.setBranch_no(branch_No);
		int result = 0;
		// 부서 정보 인서트
		result = deptDAO.insertDept(dto);
		System.out.println(" 부서 인서트 결과  : "+result);

		// 부서번호 (dept_no -> next.val 된 것 뽑아야 함)
		String dept_No = deptDAO.selectDeptNo(dto.getBranch_name(), dto.getDept_name());
		System.out.println(" 등록된 부서번호   : "+dept_No);
		dto.setDept_no(dept_No);

		// 상여금 설정 인서트
		result += deptDAO.addDept_set_bonus(dto);
		System.out.println(" 상여금 insert 결과  : "+result);

		return result;
	}

	// 부서 삭제하기
	public int dept_delete(String dept_no) {

		DeptDAO deptDAO = sqlsession.getMapper(DeptDAO.class);
		int result = deptDAO.dept_delete(dept_no);
		System.out.println(" 부서 삭제한 결과 =======================" + result);
		return result;
	}

	// 하위부서 > 조회 > selectbox
	public List<Low_dept> select_lowdept_name(String dept_name) {
		Low_deptDAO lowdao = sqlsession.getMapper(Low_deptDAO.class);
		List<Low_dept> list = lowdao.select_lowdept_name(dept_name);
		return list;
	}

	// 하위 부서 > 조회하기
	public LowDeptJoin selectLow_dept_detail(String low_dept_no) {
		Low_deptDAO lowdao = sqlsession.getMapper(Low_deptDAO.class);
		LowDeptJoin low_dept = lowdao.selectLow_dept_detail(low_dept_no);
		Set_homepage home = lowdao.selectHomePage(low_dept_no);
		Set_time time = lowdao.selectTime(low_dept_no);

		low_dept.setOpen(home.getOpen());
		low_dept.setClose(home.getClose());
		low_dept.setIn_time(time.getIn_time());
		low_dept.setOut_time(time.getOut_time());
		return low_dept;
	}
	
	//하위 부서 등록 전 유효성 검사
	public String check_lowdept(String low_dept_name){
		String result =null;
		
		Low_deptDAO dao = sqlsession.getMapper(Low_deptDAO.class);
		result =dao.check_lowdept(low_dept_name);
		System.out.println(" 하위 부서 이름 잇니?????????"+result);
		
		if(result==null|| result==""){
			result="성공";
		}else{
			result="실패";
		}
	   return result;
	}

	// 하위 부서 > 등록하기
	public int insertLow_dept(LowDeptJoin lowDeptJoin) {
		Low_deptDAO lowdao = sqlsession.getMapper(Low_deptDAO.class);
		int result = 0;
		// 부서등록
		result = lowdao.insertLow_dept(lowDeptJoin);
		// 부서번호 조회
		String low_dept_no = lowdao.select_add_no(lowDeptJoin);
		lowDeptJoin.setLow_dept_no(low_dept_no);
		// 홈페이지 접근시간 등록
		result += lowdao.insert_homepage(lowDeptJoin);
		// 출퇴근시간 등록
		result += lowdao.insert_time(lowDeptJoin);
		return result;
	}

	// 하위부서 > 정보 수정하기
	public int updateLow_dept(LowDeptJoin LowDeptJoin) {
		int result = 0;
		System.out.println(" 수정전 dto :===============" + LowDeptJoin.toString());
		String pre_low_dept_no = LowDeptJoin.getLow_dept_no();
		// 하위부서 insert 1)
		Low_deptDAO lowdao = sqlsession.getMapper(Low_deptDAO.class);
		result = lowdao.updateLow_dept(LowDeptJoin);
		System.out.println(" 부서 수정 결과 1((((((((" + result);

		// 2) 수정전 하위부서 기록 변경 2)
		result += lowdao.updateLow_dept_his(LowDeptJoin);
		System.out.println("부서 수정 결과2))))))))))))))))" + result);

		// 3)변경된 하위부서번호 조회
		LowDeptJoin low = lowdao.select_low_dept_no(LowDeptJoin.getLow_dept_name());
		LowDeptJoin.setLow_dept_no(low.getLow_dept_no());
		LowDeptJoin.setPre_low_dept_no(pre_low_dept_no);
		System.out.println(
				" 받아온 pre   : " + pre_low_dept_no + "  /  새로 세팅한 pre    : " + LowDeptJoin.getPre_low_dept_no());

		// 4)홈페이지 설정 시간 변경
		result += lowdao.update_homepage(LowDeptJoin);
		System.out.println("부서 수정 결과3 ))))))))))))))))" + result);
		// 5)출퇴근 시간 변경
		result += lowdao.update_time(LowDeptJoin);
		System.out.println("부서 수정 결과4 최종*******************************8)" + result);

		return result;
	}

	// 하위 부서 삭제하기
	public int low_dept_delete(String low_dept_no) {
		Low_deptDAO lowdao = sqlsession.getMapper(Low_deptDAO.class);
		int result = lowdao.low_dept_delete(low_dept_no);
		return result;
	}

	// 직위 관리 페이지 사용 - 직위 리스트 읽어 오기
	public List<PositionJoin> listPosition() {
		PositionDAO positionDAO = sqlsession.getMapper(PositionDAO.class);
		List<PositionJoin> list = positionDAO.selectPosition();
		return list;
	}

	// 직위 관리 페이지 - select 박스 선택시 한 직위 관련 정보 읽어 오기
	public PositionJoin dtoPosition(String option) {
		System.out.println("서비스 옵션 : " + option);
		PositionDAO positionDAO = sqlsession.getMapper(PositionDAO.class);
		PositionJoin position = positionDAO.selectOptionJoin(option);
		return position;
	}

	// 직위 추가 insert 부분
	public int positionInsert(PositionJoin position) {
		int result = 0;
		PositionDAO positionDAO = sqlsession.getMapper(PositionDAO.class);
		
		
		result = positionDAO.insertPosition(position);
			
		String p_no = positionDAO.selectPosition_no(position);
		
		position.setPosition_no(p_no);
		
		if(result > 0){
			result = 0;
			result = positionDAO.insertSet_pay(position);
		
		}else{
			return result;
		}
		
		if(result > 0){
			result = 0;
			result = positionDAO.insertSet_add_Pay(position);
		}else{
			return result;
		}
			
		return result;
	}

	// 직위 정보 수정 관련 > selectbox 사용시
	public int positionUpdate(PositionJoin position) {

		int result = 0;
		PositionDAO positionDAO = sqlsession.getMapper(PositionDAO.class);
		Position positionDTO = new Position();
		positionDTO.setPosition_name(position.getPosition_name());
		positionDTO.setPosition_no(position.getPosition_no());
		result = positionDAO.updatePosition(positionDTO);

		if (result > 0) {
			result = positionDAO.updateset_pay(position);
		}
		int resultAddpay = positionDAO.updateset_add_pay(position);
		int total = 0;
		if (result != 0 && resultAddpay != 0) {
			total = 1;
		} else {
			total = 0;
		}
		return total;
	}

	// 직위 권한 관련 업데이트 !! 드래그앤 드랍
	public int positionUpdateDragAndDrop(List<Map<String, Object>> resultMap) {
		int result = 0;
		PositionDAO positionDAO = sqlsession.getMapper(PositionDAO.class);

		for (Map<String, Object> map : resultMap) {
			System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% : " + map.get("position_name") + " / "
					+ map.get("step"));
			String position_name = (String) map.get("position_name");
			int step = (int) map.get("step");
			result = positionDAO.updatePositionStep(position_name, step);
			System.out.println("서비스쪽 : " + result);
		}

		return result;
	}
   
	//직위 삭제전 
	public List<String> check_emp(String position_no){
		PositionDAO dao = sqlsession.getMapper(PositionDAO.class);
		List<String> list = dao.check_emp(position_no);
		return list;
	}
	
	
	//직위 삭제하기
	public int delete_position(String position_no){
		int result=0;
	    PositionDAO dao = sqlsession.getMapper(PositionDAO.class);
	    
	    //기본연봉 삭제
	    result=dao.delete_set_pay(position_no);
	    System.out.println(" 기본연봉 삭제 결과 ================"+result);
	    
	    //추가급여 삭제
	    result+=dao.delete_set_add_pay(position_no);
	    System.out.println(" 추가급여 삭제 결과 =============="+result);
	    if(result>1){
	    	result=0;
	    	result=dao.deletePosition(position_no);
	    	System.out.println(" 직위 삭제 최종 결과  :================="+result);
	     }else{
	    	 result=0;
	     }
	    
		
		return result;
	}
	
	// 급여지급일 있는지 여부 판단
	public String selectpay_date() {
		String pay_date = null;
		PayDAO paydao = sqlsession.getMapper(PayDAO.class);
		pay_date = paydao.selectpay_date();
		return pay_date;
	}

	// 급여지급일 insert
	public int insertpay_date(Set_pay_date date) {

		PayDAO paydao = sqlsession.getMapper(PayDAO.class);
		int result = paydao.insertpay_date(date);
		return result;
	}

	// 급여 지급일 update
	public int updatepay_date(Set_pay_date date) {
		PayDAO paydao = sqlsession.getMapper(PayDAO.class);
		int result = paydao.updatepay_date(date);
		return result;

	}

	// 기지급 급여 내역 리스트 페이지
	public List<Pay> total_paylist(String dTime) {
		PayDAO paydao = sqlsession.getMapper(PayDAO.class);

		List<Pay> paylist = paydao.selectPay_all();
		for (int i = 0; i < paylist.size(); i++) {
			paylist.get(i).setGive_date(paylist.get(i).getGive_date().substring(0, 7));
			System.out.println(
					"연도ㅡ 월별 : " + paylist.get(i).getTotal_pay() + "  /  날짜 : " + paylist.get(i).getGive_date());
		}

		return paylist;
	}

	// 급여 설정 관리 > 상여금 설정 리스트 출력
	public List<Dept> select_allDept() {
		DeptDAO dao = sqlsession.getMapper(DeptDAO.class);
		List<Dept> dept = dao.select_allDept();
		System.out.println(" 전체 부서 사이즈 --------------" + dept.size());
		return dept;
	}

	// 상여금 지급 여부 설정
	public int update_bonusCheck(String dept_no, String bonus_check) {
		DeptDAO dao = sqlsession.getMapper(DeptDAO.class);
		if (bonus_check.equals("지급")) {
			System.out.println("if 탐");
			bonus_check = "1";
		} else {
			System.out.println("엘스탐");
			bonus_check = "0";
		}
		System.out.println(" dept_no: " + dept_no + "/////////// bonus_check:    " + bonus_check);
		int result = dao.update_bonusCheck(dept_no, bonus_check);
		System.out.println(" 서비스ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 바뀐값 : " + bonus_check + " result :" + result);
		return result;

	}

}
