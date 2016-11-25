package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.Task;
import kr.or.epm.VO.Task_people;

/*
 * 작성일 : 2016-11-18
 * 작성자 : 백승아
 * 사용 목적 : 업무에 대한 DAO interface
*/

public interface TaskDAO {
	
	// 업무 등록하기
	// 사용
	public int insertTask(Task task);
	
	// 업무 중요설정
	// 사용
	public int updateTask_sign(String task_no, String sign);
	
	// 수신함 확인하기
	// 사용
	public List<Task> selectTask_rec(String emp_no, String cg_no);
	
	// 업무 상세보기
	// 사용
	public Task selectTask_detail(String task_no);
	
	// 수신함에서 읽었을 때 수신일 데이터 삽입하기
	// 사용
	public int updateTask_recDate(String task_no);
	
	// 업무 승인 처리하기
	// 사용
	public int updateTask_approval(String task_no, String step_no);
	
	// 수신함에서 삭제하기
	// 사용
	public int deleteTask_rec(String task_no);
	
	// 송신함 확인하기
	// 사용
	public List<Task> selectTask(String emp_no, String cg_no);
	
	// 탭 메뉴 > 참여 리스트 보고
	public List<Task_people> selectTask_people_ForMe(String emp_no);
	
	// 송신함에서 삭제하기
	// 사용
	public int deleteTask(String task_no);
	
	// 참여 업무 조회하기
	// 사용
	public List<Task> selectTask_people(String emp_no);
	
	// 참여 업무 진행 처리하기
	// 사용
	public int updateTask_step(String task_no, String task_step_no);
	
	// 수신함에서 검색하기 (따로)
	// 사용
	public List<Task> searchTask(String emp_no, String cg_no, String key, String value);
	
	// 수신함에서 검색한 글의 개수 구하기 (따로)
	public int countTask_search();
	
}
