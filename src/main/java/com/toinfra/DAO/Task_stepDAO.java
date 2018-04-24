package com.toinfra.DAO;

import java.util.List;

import com.toinfra.VO.Task_step;
import com.toinfra.VO.Task_step;

/*
 * 작성일 : 2016-11-18
 * 작성자 : 백승아
 * 사용 목적 : 업무 진행 단계에 대한 DAO interface
*/

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
