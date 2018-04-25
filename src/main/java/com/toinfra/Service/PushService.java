package com.toinfra.Service;

import java.util.Calendar;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.toinfra.DAO.PushDAO;
import com.toinfra.DTO.Commute;
import com.toinfra.DTO.Pj;
import com.toinfra.DTO.Task;

@Service
public class PushService {

	@Autowired
	private SqlSession sqlsession;

	// 업무 리스트 푸쉬 알림 불러오기
	public String taskCount(String emp_no) {
		PushDAO pushdao = sqlsession.getMapper(PushDAO.class);
		String result = pushdao.taskCount(emp_no);
		return result;
	}

	// EmpNo 데이터 호출
	public String selectEmp_no(String username) {
		PushDAO pushdao = sqlsession.getMapper(PushDAO.class);
		String result = pushdao.selectEmp_no(username);
		return result;
	}

	// index에서 사용될 Task 미확인 데이터를 끌고 옴
	public List<Task> tasklist(String emp_no, int cpage, int pgsize) {
		PushDAO pushdao = sqlsession.getMapper(PushDAO.class);
		int start = 1 ;//+ (cpage * pgsize - 5);//(pgsize - 1);
		int end = 5;//(cpage * pgsize);//  5개 까지 - 2; // 최대 3개까지만
		List<Task> tasklist = pushdao.selecttasklist(emp_no, start, end);
		return tasklist;
	}

	// index에서 사용될 진행중인 Task 데이터를 끌고 옴
	public List<Task> mytasklist(String emp_no, int cpage, int pgsize) {
		PushDAO pushdao = sqlsession.getMapper(PushDAO.class);
		int start = 1 ; //+ (cpage * pgsize - 5);//(pgsize - 1);
		int end = 5 ; //(cpage * pgsize);//  5개 까지 - 2; // 최대 3개까지만
		List<Task> tasklist = pushdao.selectmytasklist(emp_no);
		
		return tasklist;
	}

	// 미승인된 프로젝트 리스트를 뽑는 함수
	public List<Pj> selectPj_rec(String emp_no, int cpage, int pgsize) {
		PushDAO pushdao = sqlsession.getMapper(PushDAO.class);
		int start = 1 + (cpage * pgsize - 5);//(pgsize - 1);
		int end = (cpage * pgsize);//  5개 까지 - 2; // 최대 3개까지만
		List<Pj> projectlist = pushdao.selectPj_rec(emp_no, start, end);
		return projectlist;
	}

	// 진행 중인 프로젝트 리스트 확인 하는 함수
	public String myprojectCount(String emp_no) {
		PushDAO pushdao = sqlsession.getMapper(PushDAO.class);
		String result = pushdao.myprojectCount(emp_no);
		return result;
	}

	// 근태 차트에 뽑아 줄 데이터를 받아오는 함수
	public List<Commute> commutelist(String emp_no) {
		PushDAO pushdao = sqlsession.getMapper(PushDAO.class);
		Calendar calendar = Calendar.getInstance();
		int year = calendar.get(Calendar.YEAR);
		int month = calendar.get(Calendar.MONTH) + 1;
		int date = calendar.get(Calendar.DAY_OF_MONTH);

		Calendar cal = Calendar.getInstance();
		cal.set(year, month - 1, Integer.parseInt("1"));
		String years = Integer.toString(cal.get(cal.YEAR));
		int months = cal.get(cal.MONTH) + 1;
		int startDays = cal.get(cal.DAY_OF_MONTH);
		int endDays = cal.getActualMaximum(cal.DAY_OF_MONTH);
		String fromYMD = years + months + "01";
		String toYMD = years + months + endDays;

		List<Commute> commutelist = null;
		try {

		} catch (Exception e) {
			System.err.println(e.getMessage());
		} finally {
			commutelist = pushdao.commutelist(emp_no, fromYMD, toYMD);
		}

		return commutelist;
	}

	
	//근태 평균 근무시간 차트 데이터 가져오는  - 부서 평균
	public String avgcommute_dept(String emp_no){
		PushDAO dao =sqlsession.getMapper(PushDAO.class);
		String avgdept = dao.selectavgcommute_dept(emp_no);
		return avgdept;
	}
	
	//근태 평균 근무시간 차트 데이터 가져오는 함수 - 나의 평균
	public String avgcommute_my(String emp_no){
		PushDAO dao =sqlsession.getMapper(PushDAO.class);
		String avgmy = dao.selectavgcommute_my(emp_no);
		return avgmy;
	}
	
	////// >> 2016-12-10 업무 >> 승인해야할 업무 개수 가져오는 것.
	public String taskApproval(String emp_no){
		PushDAO dao = sqlsession.getMapper(PushDAO.class);
		String result = dao.taskApproval(emp_no);
		return result;
	}
	
	///// >> 2016-12-10 프로젝트 >> 승인해야 할 프로젝트
	public String projectApproval(String emp_no){
		PushDAO dao = sqlsession.getMapper(PushDAO.class);
		String result = dao.projectApproval(emp_no);
		return result;
	}
	
	
}
