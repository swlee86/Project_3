package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.EmployeeManage;

public interface EmployeeManageDAO {
	List<EmployeeManage> selectEmpManage(int start, int end);
	int selectEmpCount();
}
