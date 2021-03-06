package com.toinfra.DAO;

import java.util.HashMap;
import java.util.List;

import com.toinfra.DTO.Commute;
import com.toinfra.DTO.UserDto;
import com.toinfra.DTO.PayList;
import com.toinfra.DTO.Set_time;

/*
 * 작성일 : 2016-11-18
 * 작성자 : 백승아
 * 사용 목적 : 근태에 대한 DAO interface
 * 
 * 작성일 : 2016-11-22
 * 작성자 : 김주희
 * 사용 목적 : 근태에 대한 DAO interface 추가수정
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
	public int updateCommute_addtime(HashMap<String,String> map);
	
	// 이번달 하루 전 내역 조회
	public Commute selectCommute_yesterday(String emp_no);
	
	// 누적시간 업데이트
	public int updateCommute_acctime(HashMap map);
	
	// 이번달 내역 조회
	public List<Commute> selectCommute_month(HashMap map);
	
	//회원정보가져오기
	public Commute selectempinfo(String emp_no);

	//아이디로 회원정보 가져오기
	public UserDto selectInfoSearch(String id);

	//관리자 > 근태 마감 페이지 리스트
	public List<PayList> selectCommute_all_Close(String dTime);
	
    //관리자 > 근태 마감 확정
	public int updateCommute_Close(String commute_no);
	
	//차트에 사용할 근무시간, 추가근무시간 가져오기 ( 최근 7일 )
	public List<Commute> selectChartCommute(String emp_no);
}
