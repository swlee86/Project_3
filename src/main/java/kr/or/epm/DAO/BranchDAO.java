package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.Branch;

public interface BranchDAO {

	//전체 지점 조회
	List<Branch> selectBranch();
	
	//지점 선택후 선택한 지점 정보 조회
	Branch selectChooseBranch(String selectBranchName);
	
	//지점 추가
	int addBranch(Branch dto);
	
	//지점 정보 새로 수정
	int branchModify(Branch dto);

}
