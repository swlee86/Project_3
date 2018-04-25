package com.toinfra.Service;

import java.util.List;

import com.toinfra.DAO.Task_peopleDAO;
import com.toinfra.DTO.Task_people;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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



