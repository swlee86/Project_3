
package com.toinfra.DAO;

import java.util.List;

import com.toinfra.VO.Branch;
import kr.or.toinfra.VO.Branch;

public interface BranchDAO {

	//전체 지점 조회
	List<Branch> selectBranch();
	
	//지점 선택후 선택한 지점 정보 조회
	Branch selectChooseBranch(String selectBranchName);
	
	//지점 이름 중복 체크 유효성 
	String checkBranch_Name(String branch_name);
	
	//지점 추가
	int addBranch(Branch dto);
	
	//지점 정보 새로 수정 1)
	int branchModify(Branch dto);
	
	//수정한 지점 정보 조회 2)
	Branch select_newBranch(String branch_no);
	
	//소속 부서 개수 구하기 3)
	int countDept(Branch branch);
	
	//수정한 지점 소속 부서 update 4)
	int update_new_dept(Branch branch);
	
	//이전 지점 his_check='0'   5)
	int update_pre_dept(String branch_no);
	
	//지점의 소속 하위부서 개수 구하기    6) 
	int countlow_dept(String pre_branch_name);
	
	//하위부서 업데이트 7)
	int update_pre_lowDept(String branch_name, String pre_branch_name);
	
    //지점 삭제하기
	int delete_branch(String branch_no);
	
}
