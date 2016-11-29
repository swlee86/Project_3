package kr.or.epm.Service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.epm.DAO.BranchDAO;
import kr.or.epm.DAO.DeptDAO;
import kr.or.epm.DAO.PositionDAO;
import kr.or.epm.VO.Branch;
import kr.or.epm.VO.Dept;
import kr.or.epm.VO.Position;
import kr.or.epm.VO.PositionJoin;

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
		System.out.println("서비스 파라미터 : "+branch_name);
		List<Dept> list = null;
		list = deptDAO.deptList(branch_name);
		System.out.println("서비스 돌려주기 전 : "+list.size());
		return list; 
	}
	
	
	
	
	
	//직위 관리 페이지 사용 - 직위 리스트 읽어 오기
	public List<Position> listPosition(){
		PositionDAO positionDAO = sqlsession.getMapper(PositionDAO.class);
		List<Position> list = positionDAO.selectPosition();
		return list;
	}
	
	//직위 관리 페이지 - select 박스 선택시 한 직위 관련 정보 읽어 오기
	public PositionJoin dtoPosition(String option){
		System.out.println("서비스 옵션 : "+option);
		PositionDAO positionDAO = sqlsession.getMapper(PositionDAO.class);
		PositionJoin position = positionDAO.selectOptionJoin(option);
		return position;
	}
	
	//직위 정보 수정 관련
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
	
}
