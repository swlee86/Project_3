package com.toinfra.DAO;

import com.toinfra.VO.Common;
import com.toinfra.VO.Emp;
import kr.or.toinfra.VO.Common;
import kr.or.toinfra.VO.Emp;

/*
 * 작성일 : 2016-11-22
 * 작성자 : 백승아
 * 사용 목적 : 공통적으로 사용되는 dao interface
*/

public interface CommonDAO {
	
	// 사원번호로 기본 사원정보 가져오기
	public Emp selectEmp(String emp_no);
	
	// 사원번호로 사원이름 가져오기
	public String selectEmp_name_for_emp_no(String emp_no);
	
	// 사원번호로 지점명, 부서명, 하위부서명 가져오기
	public Common selectAttach_for_emp_no(String emp_no);
	
	// 하위부서번호로 지점명, 부서명, 하위부서명 가져오기
	public Common selectAttach_for_low_dept_no(String low_dept_no);
	
	// 로그인한 id로 사원 emp_no 가져오기
	public String selectEmp_no(String id);
	
	// 로그인한 id로 사원 emp_name 가져오기
	public String selectEmp_name(String id);
	
}
