package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.EmployeeRoleManage;
import kr.or.epm.VO.Role;

public interface EmployeeRoleManageDAO {
	List<EmployeeRoleManage> selectEmpRoleManage(int start, int end);
	int selectEmpRoleCount();
	List<Role> selectRoleList();
}
