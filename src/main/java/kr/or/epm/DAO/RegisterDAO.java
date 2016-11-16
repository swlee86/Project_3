package kr.or.epm.DAO;

import kr.or.epm.VO.Emp_detail;

public interface RegisterDAO {
	int insertEmp_detail(Emp_detail emp_detail);
	String selectEmpno(String Emp_no);
	String selectUsedEmpno(String Emp_no);
}
