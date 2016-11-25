package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.Task_cg;

/*
 * 작성일 : 2016-11-18
 * 작성자 : 백승아
 * 사용 목적 : 업무 구분에 대한 DAO interface
*/

public interface Task_cgDAO {
	
	// 업무 구분 단계 조회하기
	public List<Task_cg> selectTask_cg();
	
	// 업무 구분 단계 등록하기
	public int insertTask_cg();
	
	// 업무 구분 단계 삭제하기
	public int deleteTask_cg();
	
	// 업무 구분 단계 수정하기
	public int updateTask_cg();
}
