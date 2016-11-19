package kr.or.epm.DAO;

import org.apache.ibatis.annotations.Param;

import kr.or.epm.VO.EmpJoinEmp_Detail;
import kr.or.epm.VO.Emp_detail;

/*
 * 작성자 : 박성준
 * 작성일 : 2016-11-19
 * 목  적 : 개인정보 수정 및 로그인 관련 DAO 인터페이스
 */
public interface LoginDAO {

	//사번 얻어오는 메서드 	
	Emp_detail selectEmp_no(String id);
	
	//view 에 넘어온 사번 에 맞춰 정보 뿌려줌.
	EmpJoinEmp_Detail selectEmpInfo(@Param("emp_no") String emp_no, @Param("id") String id);
	
}
