package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.Task_people;

/*
 * 작성일 : 2016-11-18
 * 작성자 : 백승아
 * 사용 목적 : 업무 참여자에 대한 DAO interface
*/

public interface Task_peopleDAO {
	
	// 업무 참여자 추가하기
	public int insertTask_people(String task_no, String emp_no);
	
	// 업무 참여자 삭제하기
	public int deleteTask_people();
	
	// 업무 참여자 조회하기
	public List<Task_people> selectTask_people(String task_no);
	
	// 업무 참여자 이름 불
	public String selectEmp_name(String emp_no);
	
	//업무 번호 조회하기
	public String selectTask_No();
	
}
