package com.toinfra.DAO;

import java.util.List;

import com.toinfra.DTO.Set_time;

/*
 * 작성일 : 2016-11-18
 * 작성자 : 백승아
 * 사용 목적 : 출퇴근시간 설정에 대한 DAO interface
*/

public interface Set_timeDAO {
	
	// 전체 출,퇴근시간 조회하기
	public List<Set_time> selectSet_time();
	
	// 하위 부서별 출,퇴근시간 조회하기
	public List<Set_time> selectSet_time_dept();
	
	// 출,퇴근시간 수정하기
	public int updateSet_time();
	
	// 출,퇴근시간 등록하기
	public int insertSet_time();
	
}
