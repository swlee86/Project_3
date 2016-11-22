package kr.or.epm.DAO;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.epm.VO.EmployeeRoleManage;
import kr.or.epm.VO.Role;

public interface EmployeeRoleManageDAO {
	List<EmployeeRoleManage> selectEmpRoleManage(int start, int end);
	int selectEmpRoleCount();
	List<Role> selectRoleList();
	
	public int updateEmpRole(@Param("emp_no") String emp_no, @Param("role_no") String role_no);
	public String selectEmp_role_select(@Param("role_name") String role_name);
	
	/*
	public int insertEmpRole();
	public int deleteEmpRole();
	*/
}
