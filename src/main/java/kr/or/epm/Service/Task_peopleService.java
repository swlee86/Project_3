package kr.or.epm.Service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.epm.DAO.ApprovalDAO;
import kr.or.epm.DAO.OrganizationDAO;
import kr.or.epm.DAO.TaskDAO;
import kr.or.epm.DAO.Task_peopleDAO;
import kr.or.epm.VO.Emp;
import kr.or.epm.VO.Organization;
import kr.or.epm.VO.Task;
import kr.or.epm.VO.Task_people;

@Service
public class Task_peopleService {

	@Autowired
	private SqlSession sqlsession;
	
	// 업무 상세볼 때 참여자 정보 불러오기
	public List<Task_people> selectTask_peopleList(String task_no) {
		Task_peopleDAO taskpeopledao = sqlsession.getMapper(Task_peopleDAO.class);
		List<Task_people> list = taskpeopledao.selectTask_people(task_no);
		return list;
	}
}



