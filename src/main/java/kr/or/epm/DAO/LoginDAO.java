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
	
	//업데이트 Emp (detail 테이블에 업데이트 시 사용)
	int updateEmpInfo(EmpJoinEmp_Detail detail);
	
	//emp 테이블에  정보수정시 email 변경함.
	int updateEmp_Email(@Param("email") String email, @Param("emp_no") String emp_no, @Param("cell_phone") String cell_phone);
	
	//구글 로그인 id로 아이디 비밀번호 데이터 받아오기
	String selectGoogleLoginData(String id);
	
	//아이디로 사번 조회하기
	EmpJoinEmp_Detail selectEmp_Name(String id);
	
	//사번으로 이름 조회하기
	EmpJoinEmp_Detail selectEmp_Name_Emp(String emp_no);
	
	//
	
}
