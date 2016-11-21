package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.Task_step;

public interface Task_stepDAO {

	// 업무 진행 단계 조회하기
	public List<Task_step> selectTask_step();
	
	// 업무 진행 단계 등록하기
	public int insertTask_step();
	
	// 업무 진행 단계 삭제하기
	public int deleteTask_step();
	
	// 업무 진행 단계 수정하기
	public int updateTask_step();
}
