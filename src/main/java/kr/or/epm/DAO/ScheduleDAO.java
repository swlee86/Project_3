package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.Emp;
import kr.or.epm.VO.Sch_people;
import kr.or.epm.VO.Schedule;

/**
작성일 :	2016 - 11 - 17
작성자 :	김주희
사용 목적 :	일정 DAO
**/
public interface ScheduleDAO {
	
	//로그인한 사원의 전체 일정 조회
	public List<Schedule> selectSchedule(String emp_no);
	
	//일정 상세 조회
	public Schedule selectSchedule_detail(String sch_no);
	
	//일정 참여자들의 사원 정보
	public List<Emp> selectSchedule_people(String emp_no);
	
	//일정 삭제
	public int deleteSchedule(String sch_no);
	
	//일정 수정
	public int updateSchedule(Schedule dto);
	
	//일정 - 진행 단계 수정
	public int updateSchedule_step(Schedule dto);
	
	//일정 등록,추가
	public void insertSchedule(Schedule dto);
	
	//일정 참여자 추가
	public void insertSchPeople(Sch_people dto);
	
	//일정 참여자 삭제
	public void deleteSchPeople(Sch_people dto);

	
}
