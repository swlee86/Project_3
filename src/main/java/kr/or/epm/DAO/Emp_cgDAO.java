package kr.or.epm.DAO;
import java.util.List;

import kr.or.epm.VO.Approval;

/*
 * 작성일 : 2016-11-25
 * 작성자 : 백승아
 * 사용 목적 : 사원 구분에 대한 DAO interface
*/

public interface Emp_cgDAO {

	// cg_name으로 cg_no를 불러오기
	public String selectCg_no(String cg_name);
}
