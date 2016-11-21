package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.Set_time;

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
