package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.Task;

public interface TaskDAO {
	
	// 업무 등록하기
	public int insertTask(Task task);
	
	// 업무 중요설정
	public int updateTask_sign();
	
	// 수신함 확인하기
	public List<Task> selectTask_rec(String emp_no, String cg_no);
	
	// 업무 상세보기
	public Task selectTask_detail(String task_no);
	
	//업무 요청 수신 상세 보기
	public Task selectTask_receive_detail(String task_no);
	
	
	// 수신함에서 읽었을 때 수신일 데이터 삽입하기
	public int updateTask_recDate();
	
	// 업무 승인 처리하기
	public int updateTask_approval();
	
	// 수신함에서 삭제하기
	public int deleteTask_rec(String task_no);
	
	// 송신함 확인하기
	public List<Task> selectTask(String emp_no, String cg_no);
	
	// 송신함에서 삭제하기
	public int deleteTask();
	
	// 참여 업무 조회하기
	public List<Task> selectTask_people();
	
	// 참여 업무 진행 처리하기
	public int updateTask_step();
	
	// 수신함에서 글 개수 구하기
	public int countTask_rec(String emp_no, String cg_no);
	
	// 송신함에서 글 개수 구하기
	public int countTask(String emp_no, String cg_no);
	
	// 수신함에서 검색하기 (따로)
	public List<Task> searchTask(String emp_no, String cg_no, String key, String value);
	
	// 수신함에서 검색한 글의 개수 구하기 (따로)
	public int countTask_search();
	
}
