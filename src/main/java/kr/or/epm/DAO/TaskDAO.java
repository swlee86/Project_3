package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.Task;

public interface TaskDAO {
	
	// 업무 요청 수신함 확인하기
	public List<Task> selectTask();
	
	// 업무 상세보기
	public Task selectTask_detail();
	
	// 승인
}
