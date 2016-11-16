package kr.or.epm.DAO;

import kr.or.epm.VO.Emp;
import kr.or.epm.VO.Emp_detail;

public interface RegisterDAO {
	//회원가입시에 insert 함수
	int insertEmp_detail(Emp_detail emp_detail);
	
	//회원가입 > 사원번호 중복체크시 처음 구동되는 함수
	String selectEmpno(String Emp_no);
	
	//사원 번호 중복체크 후 바로 이어서 아이디까지 중복 체크하여 사용 가능한 사번인지 확인하는 함수
	String selectUsedEmpno(String Emp_no);
	
	//관리자 > 사원정보 등록 페이지에서 기본 사원정보를 등록하는 함수 
	int insertEmp(Emp emp);
}
