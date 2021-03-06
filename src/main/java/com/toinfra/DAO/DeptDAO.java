package com.toinfra.DAO;

import java.util.List;

import com.toinfra.DTO.Dept;
import com.toinfra.DTO.DeptJoinBonus;
import com.toinfra.DTO.Set_bonus;
import org.apache.ibatis.annotations.Param;

/*
 * 작성자 : 박성준
 * 작성일 : 2016-11-17
 * 목적 : 부서 관리 페이지
 */
public interface DeptDAO {

	//부서 리스트 selectbox
	List<Dept> deptList(String branch_name);
	
	//부서 조회하기
	DeptJoinBonus selectChooseDept(String dept_no);
	
	//지점번호로 부서 조회하기 > 지점 삭제시 사용
	List<Dept> select_dept_beforeDelete(String branch_no);
	
	//부서 번호만 뽑아오기
	String selectDeptNo(String branch_name, String dept_name);
	
	//부서 등록하기 1)
	int insertDept(DeptJoinBonus deptJoinBonus);
	
	//부서 등록전 부서명 유효성 검사
	String checkDept_name(String dept_name);
	
	//지점 번호 뽑아오기 2)
	String selectBranchName_No(String branch_name);
	
	//상여금 인서트 부분 3)
	int addDept_set_bonus(DeptJoinBonus deptJoinBonus);
	
	//부서 수정하기 > 1)
	int insert_re_Dept(DeptJoinBonus deptJoinBonus);
	
	//부서 수정하기 > 2)
	int update_pre_dept(DeptJoinBonus deptJoinBonus);
	
	//부서 수정 > 3)
	String search_new_dept_no(DeptJoinBonus deptJoinBonus);
	
	//부서 수정 > 상여금에서 update된 dept_no 가져오기 4)
    String selectDeptNo_bonus(DeptJoinBonus deptJoinBonus);
	
	//부서 수정 > 상여금 수정 5)
	int modifyset_bonus(DeptJoinBonus deptJoinBonus);
	
	//부서 수정 > 소속 하위부서 개수 구하기 6)
	int count_lowDept(DeptJoinBonus deptJoinBonus);
	
	//부서 수정 > 소속 하위부서 정보 update 7)
	int update_lowDept(DeptJoinBonus deptJoinBonus);
	
	//부서 삭제하기
	int dept_delete(String dept_no);
	
	//특정 부서 조회하기
	DeptJoinBonus selectDept(String dept_no);	
	
	//전체 부서 출력하기
	List<Dept> select_allDept();
	
	//상여금 지급 여부 설정
	int update_bonusCheck(@Param("dept_no") String dept_no, @Param("bonus_check") String bonus_check);
	
	//상여금 조회하기
	Set_bonus select_bonus_check(String dept_no);

}

