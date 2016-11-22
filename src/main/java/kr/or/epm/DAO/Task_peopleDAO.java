package kr.or.epm.DAO;

import java.util.List;
import kr.or.epm.VO.Task_people;

public interface Task_peopleDAO {
	
	// 업무 참여자 추가하기
	public int insertTask_people(List<Task_people> people);
	
	// 업무 참여자 삭제하기
	public int deleteTask_people();
	
	// 업무 참여자 조회하기
	public List<Task_people> selectTask_people();
	
	
	//업무 번호 조회하기
	public String selectTask_No();
	
}
