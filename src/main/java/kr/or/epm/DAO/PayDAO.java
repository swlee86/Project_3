package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.Pay;

public interface PayDAO {
	
	// 급여 지급일 이후 급여 등록하기
	public int insertPay();
	
	// 본인의 급여 내역 조회하기
	public List<Pay> selectPay_mine_all();
	
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
