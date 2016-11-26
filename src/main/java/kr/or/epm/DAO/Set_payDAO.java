package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.Set_pay;

/*
 * 작성일 : 2016-11-18
 * 작성자 : 백승아
 * 사용 목적 : 급여 설정에 대한 DAO interface
*/

public interface Set_payDAO {
	
	// 전체 기본 연봉 조회하기
	public List<Set_pay> selectSet_pay();
	
	// 직위별 기본 연봉 조회하기
	public List<Set_pay> selectSet_pay_position();
	
	// 기본 연봉 수정하기
	public int updateSet_pay();
	
	// 기본 연봉 등록하기
	public int insertSet_pay();
}
