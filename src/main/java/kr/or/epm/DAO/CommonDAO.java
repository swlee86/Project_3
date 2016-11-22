package kr.or.epm.DAO;
import java.util.List;

import kr.or.epm.VO.Approval;
import kr.or.epm.VO.Common;
import kr.or.epm.VO.Emp;

/*
 * 작성일 : 2016-11-22
 * 작성자 : 백승아
 * 사용 목적 : 공통적으로 사용되는 dao interface
*/

public interface CommonDAO {
	
	// 사원번호로 기본 사원정보 가져오기
	public Emp selectEmp();
	
	// 하위부서번호로 지점명, 부서명, 하위부서명 가져오기
	public Common selectAttach();
	
	// 로그인한 id로 사원 emp_no 가져오기
	public String selectEmp_no(String id);
	
}
