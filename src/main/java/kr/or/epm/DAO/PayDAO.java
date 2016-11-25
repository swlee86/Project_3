package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.Pay;

/*
 * 작성일 : 2016-11-18
 * 작성자 : 백승아
 * 사용 목적 : 급여에 대한 DAO interface
*/

public interface PayDAO {
	
	// 급여 지급일 이후 급여 등록하기
	public int insertPay();
	
	// 본인의 급여 내역 조회하기
	public List<Pay> selectPay_mine_all(String emp_no);
	
	//본인 급여 월별 조회하기
	public Pay selectPay_mine_Monthly(String emp_no, String give_date);
	//급여 지급일 조회하기
	public List<String> selectGive_date(String emp_no);
	
	// 예상 퇴직금 조회하기
	
	// 본인의 금월 예상 급여 조회하기
	public Pay selectPay_mine();
	
	// 전체 급여 내역 조회하기
	public List<Pay> selectPay_all();
	
	// 전체 금월 예상 급여 조회하기
	public List<Pay> selectPay();
	
	// 관리자] 급여 확정하기
	public int updatePay();
}
