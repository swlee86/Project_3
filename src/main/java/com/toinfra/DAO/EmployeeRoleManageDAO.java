package com.toinfra.DAO;

import java.util.List;

import com.toinfra.VO.EmployeeRoleManage;
import com.toinfra.VO.Role;
import org.apache.ibatis.annotations.Param;

import kr.or.toinfra.VO.EmployeeRoleManage;
import kr.or.toinfra.VO.Role;

/*
 * 작성자 : 백승아
 * 작성일 : 2016-11-22
 * 사용목적 : 권한에 대한 DAO interface 추가 수정
 * 
*/

public interface EmployeeRoleManageDAO {
	List<EmployeeRoleManage> selectEmpRoleManage(int start, int end);
	int selectEmpRoleCount();
	List<Role> selectRoleList();
	
	// 백승아
	// 권한 부여
	public int updateEmpRole(@Param("emp_no") String emp_no, @Param("role_no") String role_no);
	// 권한 불러오기
	public String selectEmp_role_select(@Param("role_name") String role_name);
}
