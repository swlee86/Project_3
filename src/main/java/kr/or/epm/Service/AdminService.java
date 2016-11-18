package kr.or.epm.Service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.epm.DAO.BranchDAO;
import kr.or.epm.DAO.DeptDAO;
import kr.or.epm.VO.Branch;
import kr.or.epm.VO.Dept;

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
	
	//부서 페이지 사용 - 지점에 따른 부서 리스트 출력
	public List<Dept> listDept(String branch_name){
		DeptDAO deptDAO =  sqlsession.getMapper(DeptDAO.class);
		System.out.println("서비스 파라미터 : "+branch_name);
		List<Dept> list = null;
		list = deptDAO.deptList(branch_name);
		System.out.println("서비스 돌려주기 전 : "+list.size());
		return list; 
	}
	
}