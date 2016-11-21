package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.Commute;

/*
 * 작성일 : 2016-11-18
 * 작성자 : 백승아
 * 사용 목적 : 근태에 대한 DAO interface
*/

public interface CommuteDAO {
	
	// 본인의 근태 내역 조회하기
	public List<Commute> selectCommute();
	
	// 금월 추가근무 확정 처리 조회하기
	public List<Commute> selectCommute_mgr();
	
	// 확정 처리하기 : 월누적근무시간, 월누적추가근무시간 저장
	public int updateCommute_mgr();
	
	// 출근하기 : 일시 저장
	public int insertCommute_in();
	
	// 누적 근무시간, 누적 추가근무시간 계산하기
	public int updateCommute_acc();
	
	// 퇴근하기 : 근무 시간, 추가근무시간 저장
	public int updateCommute_out();
	
}
