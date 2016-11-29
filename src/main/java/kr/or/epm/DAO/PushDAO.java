package kr.or.epm.DAO;



public interface PushDAO {
	//Emp_detail 에서 아이디를 토대로 사원번호 뽑아오기
	String selectEmp_no(String username);
	
	//업무 테이블에서 읽지 않은 리스트 가지고 오기
	int taskCount(String emp_no);
	
	
	
}
