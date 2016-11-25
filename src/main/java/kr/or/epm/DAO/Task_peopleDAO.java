package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.Emp;
import kr.or.epm.VO.Task_people;

public interface Task_peopleDAO {
	
	// 업무 참여자 추가하기
	public int insertTask_people(String task_no, String emp_no);
	
	// 업무 참여자 삭제하기
	public int deleteTask_people();
	
	// 업무 참여자 조회하기
	public List<Task_people> selectTask_people(String task_no);
	
	//실제 업무 참여자 이름, 사번
	public String selectEmp_name(String emp_no);
	
	//업무 번호 조회하기
	public String selectTask_No();
	
}
