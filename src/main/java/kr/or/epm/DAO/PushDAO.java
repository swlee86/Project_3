package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.Commute;
import kr.or.epm.VO.Emp_detail;
import kr.or.epm.VO.Pj;
import kr.or.epm.VO.Push;
import kr.or.epm.VO.Task;

public interface PushDAO {
	//Emp_detail 에서 아이디를 토대로 사원번호 뽑아오기
	String selectEmp_no(String username);
	
	//업무 테이블에서 읽지 않은 리스트 가지고 오기
	String taskCount(String emp_no);
	
	List<Task> selecttasklist(String emp_no, int start, int end);
	
	List<Task> selectmytasklist(String emp_no);
	
	List<Pj> selectPj_rec(String emp_no, int start, int end);
	
	String myprojectCount(String emp_no);
	
	List<Commute> commutelist(String emp_no, int start, int end);
	
}
