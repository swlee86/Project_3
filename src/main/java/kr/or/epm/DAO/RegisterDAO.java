package kr.or.epm.DAO;

import kr.or.epm.VO.Emp;
import kr.or.epm.VO.Emp_detail;

public interface RegisterDAO {
	public int insertEmp_detail(Emp_detail emp_detail);
	public Emp selectEmpId(int Emp_no);
	
}
