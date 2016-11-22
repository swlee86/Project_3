package kr.or.epm.DAO;

import java.util.HashMap;
import java.util.List;

import kr.or.epm.VO.Commute;
import kr.or.epm.VO.Set_time;

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
	// 수정 2016-11-21 김주희
	public int insertCommute_in(HashMap map);
	
	// 누적 근무시간, 누적 추가근무시간 계산하기
	public int updateCommute_acc();
	
	// 퇴근하기 : 근무 시간, 추가근무시간 저장
	public int updateCommute_out2(HashMap map);
	
	
	//추가 2016-11-21 김주희
	// 오늘 출근 내역 있는지 확인
	public String selectMyCommute_no(String emp_no);
	
	// 퇴근하기버튼
	public int updateCommute_out(HashMap map);
	
	// commute_no에 따른 정보 조회(단일)
	public Commute selectCommute_commuteno(String commute_no);
	
	// 당일 하루 근무시간 업데이트
	public int updateCommute_time(HashMap map);
	
	// 부서별 출퇴근시간(최신) 
	public Set_time selectSetTime(String emp_no);
	
	// 추가근무시간 업데이트
	public int updateCommute_addtime(HashMap map);
	
	// 이번달 하루 전 내역 조회
	public Commute selectCommute_yesterday(String emp_no);
	
	// 누적시간 업데이트
	public int updateCommute_acctime(HashMap map);
	
}
