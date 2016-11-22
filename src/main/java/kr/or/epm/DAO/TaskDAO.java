package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.Task;

public interface TaskDAO {
	
	// 업무 등록하기
	public int insertTask(Task task);
	
	// 업무 중요설정
	public int updateTask_sign();
	
	// 수신함 확인하기
	public List<Task> selectTask_rec();
	
	// 업무 상세보기
	public Task selectTask_detail();
	
	// 수신함에서 읽었을 때 수신일 데이터 삽입하기
	public int updateTask_recDate();
	
	// 업무 승인 처리하기
	public int updateTask_approval();
	
	// 수신함에서 삭제하기
	public int deleteTask_rec();
	
	// 송신함 확인하기
	public List<Task> selectTask();
	
	// 송신함에서 삭제하기
	public int deleteTask();
	
	// 참여 업무 조회하기
	public List<Task> selectTask_people();
	
	// 참여 업무 진행 처리하기
	public int updateTask_step();
}
