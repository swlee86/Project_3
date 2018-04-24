package com.toinfra.TaskController;

import java.security.Principal;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.toinfra.Service.PushService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;
import com.toinfra.Service.CommonService;
import com.toinfra.Service.PushService;
import com.toinfra.Service.TaskService;
import com.toinfra.Service.Task_peopleService;
import com.toinfra.VO.Emp;
import com.toinfra.VO.Organization;
import com.toinfra.VO.Task;
import com.toinfra.VO.Task_people;
import com.toinfra.VO.Task_reply;

/*
 * 작성자 : 백승아
 * 작성일 : 2016-12-09
 * 목  적 : 업무 전용 controller 
 */

@Controller
public class TaskController {

	@Autowired
	private PushService pushservice;
	
	@Autowired
	private TaskService service;

	@Autowired
	private Task_peopleService peopleservice;

	@Autowired
	private View jsonview;

	@Autowired
	private CommonService commonservice;

	// 조직도
	// 1.업무 등록시 조직도 modal에 사용
	@RequestMapping("/taskWriteModal.do")
	public View deptTree(Model model) {
		List<Organization> list = null;
		list = service.selectDept();
		model.addAttribute("dept", list);
		return jsonview;
	}

	// 2.업무 등록시 조직도 지점 클릭시 부서 띄워줘야함
	@RequestMapping(value = "/taskDeptModal.do", method = RequestMethod.GET)
	public View downDeptTree(String branch_no, Model model) {
		List<Organization> list = null;
		list = service.selectdeptname(branch_no);
		model.addAttribute("deptname", list);
		return jsonview;
	}

	// 3.업무 등록시 조직도 부서 클릭시 하위부서 출력
	@RequestMapping("/tasklow_deptModal.do")
	public View downlowDeptTree(String dept_no, Model model) {
		List<Organization> list = null;
		list = service.selectlowDept(dept_no);
		model.addAttribute("low_dept", list);
		return jsonview;
	}

	// 4.업무 등록시 조직도 하위 부서 클릭시 사원 정보 출력
	@RequestMapping("/taskEmpModal.do")
	public View downEmpTree(String low_dept_no, Model model) {
		List<Organization> list = null;
		
		list = service.selectEmpInfo(low_dept_no);
		model.addAttribute("emp", list);
		return jsonview;
	}

	//조직도 모달에서 자신의 정보 제외시키는 부분   
	@RequestMapping("/taskEmpModal_exclude.do")
	public View downEmpTree(String low_dept_no, Model model,Principal principal) {
		List<Organization> list = null;
		
		String id= principal.getName();
		System.out.println("id : "+id);
		
		list = service.selectEmpInfo_exclude(low_dept_no,id);
		model.addAttribute("emp", list);
		return jsonview;
	}
	
	
	// 업무 등록 페이지 요청
	@RequestMapping(value = "/taskWrite.do", method = RequestMethod.GET)
	public String taskWrite(Model model) {
		return "task.taskWrite";
	}

	// 업무 > 업무 등록
	@RequestMapping(value = "/taskWrite.do", method = RequestMethod.POST)
	public String taskWriteOk(HttpSession session, Principal principal, Task task, String emp_no, Model model) {
		String link = "taskWrite.do";

		// 로그인 id
		String myemp_no = (String) session.getAttribute("emp_no");
		String id = principal.getName();
		String emp_name = "";
		String task_no = "";

		// 참여자 사번들 분리
		String[] people = emp_no.split(",");
		
		try {
			// 업무에 송신자 사번, 송신자 이름 담기
			task.setEmp_no(myemp_no);
			emp_name = commonservice.selectEmp_name(id);
			task.setEmp_name(emp_name);
			
			// 업무 등록하기
			service.insertTask(task);

			// 등록하는 업무 번호 가져오기
			task_no = service.selectTask_no();
			
			// 업무 참여자 등록하기
			service.insertTask_people(task_no, people);
			
		} catch (Exception e) {
			e.getMessage();
		}
		
		if(task.getCg_no().equals("1")){  //업무요청
			link = "taskRequest.do";
		}else if(task.getCg_no().equals("2")){ //업무보고
			link = "taskInform.do";
		}else if(task.getCg_no().equals("3")){  //업무일지
			link = "taskLog.do";
		}
		
		model.addAttribute("link", link);

		return "task.task_redirect";
	}

	// 업무 > 수신 > 삭제
	@RequestMapping(value = "/taskDelete_rec.do", method = RequestMethod.POST)
	public String taskDelete_rec(String task_no, Model model) {
		String RecSend = "Rec";

		// redirect
		String link = "taskRequest.do";

		try {
			service.deleteTask(task_no, RecSend);
		} catch (Exception e) {
			e.getMessage();
		}
		
		model.addAttribute("link", link);
		
		return "task.task_redirect";
	}

	// 업무 > 송신 > 삭제
	@RequestMapping(value = "/taskDelete.do", method = RequestMethod.GET)
	public String taskDelete(String task_no, Model model) {
		String RecSend = "Send";

		// redirect
		String link = "taskRequest.do#tab-2";

		try {
			service.deleteTask(task_no, RecSend);
		} catch (Exception e) {
			e.getMessage();
		}
		
		model.addAttribute("link", link);
		
		return "task.task_redirect";
	}

	// 업무 요청 > 수신, 송신, 참여
	@RequestMapping("/taskRequest.do")
	public String taskRequest(HttpSession session, String tab_char, Model model, String pg_rec , String f_rec , String pg_song , String f_song ,String pg_parti, String f_parti ,String q_rec,String q_song,String q_parti) {
		// 로그인 id
		String emp_no = (String) session.getAttribute("emp_no");
		
		int totalcount_rec = 0;
		int totalcount_song = 0;
		int totalcount_parti = 0;
		
		int cpage_rec = 1;
		int cpage_song = 1;
		int cpage_parti = 1;
		
		int pagecount_rec = 0;
		int pagecount_song = 0;
		int pagecount_parti = 0;
		
		int pagesize = 10;
		
		String field_rec = "task_no";
		String query_rec ="%%";
		
		String field_song = "task_no";
		String query_song ="%%";
		
		String field_parti = "task_no";
		String query_parti ="%%";
		
		int tab_char_result = 1;
		
		if(tab_char != null && !tab_char.equals("")){
			tab_char_result = Integer.parseInt(tab_char);
		}
		model.addAttribute("tab_char", tab_char_result);
		
		if(pg_rec != null && !pg_rec.equals("")){
			cpage_rec = Integer.parseInt(pg_rec);
		}
		if(f_rec != null && !f_rec.equals("")){
			field_rec = f_rec;
		}
		if(q_rec != null && !q_rec.equals("")){
			query_rec = q_rec;
		}
		
		if(pg_song != null && !pg_song.equals("")){
			cpage_song = Integer.parseInt(pg_song);
		}
		if(f_song != null && !f_song.equals("")){
			field_song = f_song;
		}
		if(q_song != null && !q_song.equals("")){
			query_song = q_song;
		}
		
		if(pg_parti != null && !pg_parti.equals("")){
			cpage_parti = Integer.parseInt(pg_parti);
		}
		if(f_parti != null && !f_parti.equals("")){
			field_parti = f_parti;
		}
		if(q_parti != null && !q_parti.equals("")){
			query_parti = q_parti;
		}
		
		// 업무 요청 구분
		String cg_no = "1";
		
		// 1. 수신함갯수
		totalcount_rec = service.selectCount_rec(emp_no, cg_no , field_rec, query_rec);  
		
		if(totalcount_rec % pagesize == 0){       
	    	pagecount_rec = totalcount_rec/pagesize;
        }else{
        	pagecount_rec = (totalcount_rec/pagesize) + 1;
        }
		
		// 2. 수신함 목록
		List<Task> list_rec = service.selectTask_rec(emp_no, cg_no, field_rec, query_rec,cpage_rec ,pagesize);  
		model.addAttribute("list1", list_rec);
		model.addAttribute("count1", totalcount_rec);
		model.addAttribute("field_rec", field_rec);
		model.addAttribute("query_rec", query_rec);
		model.addAttribute("pagecount_rec", pagecount_rec);
		model.addAttribute("pg_rec", cpage_rec);
		
		// 1. 송신함갯수
		totalcount_song = service.selectCount_song(emp_no, cg_no , field_song, query_song);  
				
		if(totalcount_song % pagesize == 0){       
			pagecount_song = totalcount_song/pagesize;
		}else{
		    pagecount_song = (totalcount_song/pagesize) + 1;
		}
		
		// 2. 송신함 목록
		List<Task> list_song = service.selectTask(emp_no, cg_no, field_song, query_song, cpage_song ,pagesize);  
		model.addAttribute("list2", list_song);		
		model.addAttribute("field_song", field_song);
		model.addAttribute("query_song", query_song);
		model.addAttribute("pagecount_song", pagecount_song);
		model.addAttribute("pg_song", cpage_song);
		model.addAttribute("count2", totalcount_song);
		
		// 1. 참여함갯수
		totalcount_parti = service.selectCount_parti(emp_no, field_parti, query_parti);  
						
		if(totalcount_parti % pagesize == 0){       
			pagecount_parti = totalcount_parti/pagesize;
		}else{
		    pagecount_parti = (totalcount_parti/pagesize) + 1;
		}
						
		// 2. 참여함 목록
		List<Task> list_parti = service.selectTask_people(emp_no, field_parti, query_parti,cpage_parti ,pagesize);  
		model.addAttribute("list3", list_parti);			
		model.addAttribute("count3", totalcount_parti);
		model.addAttribute("field_parti", field_parti);
		model.addAttribute("query_parti", query_parti);
		model.addAttribute("pagecount_parti", pagecount_parti);
		model.addAttribute("pg_parti", cpage_parti);
		model.addAttribute("count3", totalcount_parti);
		
		
		// 2. 완료함 목록
		List<Task> list_end = service.selectTask_people_end(emp_no, field_parti, query_parti,cpage_parti ,pagesize);  
		model.addAttribute("list4", list_end);			
		model.addAttribute("count4", totalcount_parti);
		model.addAttribute("field_parti", field_parti);
		model.addAttribute("query_parti", query_parti);
		model.addAttribute("pagecount_parti", pagecount_parti);
		model.addAttribute("pg_parti", cpage_parti);
		model.addAttribute("count4", totalcount_parti);
		
			
		return "task.taskRequest";
	}

	// 업무 요청 > 수신 > 상세
	@RequestMapping("/taskRequest_rec_detail.do")
	public String taskRequest_rec_detail(String task_no, Model model, HttpServletRequest request, HttpServletResponse responsel) {
		// Push알림을 위한 Taskcount session 재생성
		HttpSession session = request.getSession();
		int resultdata = 0;
		String empno = (String)session.getAttribute("emp_no");
		
		// 업무 상세 가져오기
		Task detail = service.selectTask_detail(task_no,empno);
		model.addAttribute("detail", detail);
		
		// 권한 확인을 위해
		// session emp_no랑 db의 수신자랑 동일한지 확인
		model.addAttribute("session_emp_no", empno);
		model.addAttribute("db_rec_emp_no", detail.getRec_emp_no());
		
		String taskcount = pushservice.taskCount(empno);
		String projectcount = pushservice.myprojectCount(empno);
		String projectApproval = pushservice.projectApproval(empno);
		String taskApproval = pushservice.taskApproval(empno);
		resultdata = (Integer.parseInt(taskcount))+Integer.parseInt(projectcount)+Integer.parseInt(taskApproval)+Integer.parseInt(projectApproval);	
		session.setAttribute("sessiontaskcount", taskcount);
		session.setAttribute("sessionpushcount", resultdata);
		
		// 업무 참여자 상세 가져오기
		List<Task_people> peopledetail = peopleservice.selectTask_peopleList(task_no);
		model.addAttribute("peopledetail", peopledetail);
		
		//리플 리스트 구해오기
		List<Task_reply> re_list = null;
		
		
		
		return "task.taskRequest_rec_detail";
	}

	// 업무 요청 > 수신 > 상세 > 승인 처리
	@RequestMapping(value = "/request_approval.do", method = RequestMethod.POST)
	public String request_approval(String task_no, String step_no, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		int resultdata = 0;
		
		String empno = (String)session.getAttribute("emp_no");
		
		// redirect
		String link = "taskRequest.do";

		int result = 0;
		try {
			result = service.approval(step_no, task_no);
		} catch (Exception e) {
			e.getMessage();
		} finally {
			if (result > 0) {
				String taskApproval = pushservice.taskApproval(empno);
				String taskcount = pushservice.taskCount(empno);
				String projectApproval = pushservice.projectApproval(empno);
				String projectcount = pushservice.myprojectCount(empno);
				
				resultdata = (Integer.parseInt(taskcount))+Integer.parseInt(projectcount)+Integer.parseInt(taskApproval)+Integer.parseInt(projectApproval);
				
				session.setAttribute("sessionpushcount", resultdata);
				session.setAttribute("sessiontaskApprovalcount", taskApproval);	
			}
		}

		model.addAttribute("link", link);
		
		return "task.task_redirect";
	}

	// 업무 요청 > 송신 > 상세
	@RequestMapping("/taskRequest_detail.do")
	public String taskRequest_detail(HttpSession session, String task_no, Model model) {
		// 로그인 id
		String emp_no = (String)session.getAttribute("emp_no");
		
		// 상세 가져오기
		Task detail = service.selectTask_detail(task_no,emp_no);
		model.addAttribute("detail", detail);
		
		// 업무 참여자 상세 가져오기
		List<Task_people> peopledetail = peopleservice.selectTask_peopleList(task_no);
		model.addAttribute("peopledetail", peopledetail);
		
		List<Task_reply> re_list = service.re_list(task_no);
		model.addAttribute("re_list", re_list);
		
		return "task.taskRequest_detail";
	}

	// 업무 요청 > 참여 > 상세
	@RequestMapping(value = "/taskRequest_participation_detail.do", method = RequestMethod.GET)
	public String taskRequest_participation_detail(HttpSession session, String task_no, Model model) {
		// 로그인 id
		String emp_no = (String)session.getAttribute("emp_no");

		// 상세 가져오기
		Task detail = service.selectTask_detail(task_no,emp_no);
		model.addAttribute("detail", detail);

		// 권한 확인을 위해
		// session emp_no랑 db의 수신자랑 동일한지 확인
		model.addAttribute("session_emp_no", emp_no);
		model.addAttribute("db_rec_emp_no", detail.getRec_emp_no());

		// 업무 참여자 상세 가져오기
		List<Task_people> peopledetail = peopleservice.selectTask_peopleList(task_no);
		model.addAttribute("peopledetail", peopledetail);
		
		List<Task_reply> re_list = service.re_list(task_no);
		model.addAttribute("re_list", re_list);
		
		return "task.taskRequest_participation_detail";
	}

	// 업무 요청 > 참여 > 상세 > 진행 처리
	@RequestMapping(value = "/taskRequest_participation_detail.do", method = RequestMethod.POST)
	public String taskRequest_participation_detail(String task_no, String task_step_no, Model model) {
		// redirect
		String link = "taskRequest.do";

		try {
			service.updateTaskRequest_participation_step(task_no, task_step_no);
		} catch (Exception e) {
			e.getMessage();
		}
		
		model.addAttribute("link", link);
		
		return "task.task_redirect";
	}

	// 업무보고 > 수신, 송신
	@RequestMapping("/taskInform.do")
	public String taskInform(HttpSession session, String tab_char, String pg_rec , String f_rec , String pg_song , String f_song ,String q_rec, String q_song,  Model model) {
		String emp_no = (String)session.getAttribute("emp_no");
		
		int totalcount_rec = 0;
		int totalcount_song = 0;
		
		int cpage_rec = 1;
		int cpage_song = 1;
		
		int pagecount_rec = 0;
		int pagecount_song = 0;
		
		int pagesize = 4;
		
		String field_rec = "task_no";
		String query_rec ="%%";
		
		String field_song = "task_no";
		String query_song ="%%";
		
		int tab_char_result = 1;
		
		System.out.println("tab_char != null && !tab_char.equals('') : "+ (tab_char != null && !tab_char.equals("")));
		if(tab_char != null && !tab_char.equals("")){
			tab_char_result = Integer.parseInt(tab_char);
		}
		model.addAttribute("tab_char", tab_char_result);
		
		if(pg_rec != null && !pg_rec.equals("")){
			cpage_rec = Integer.parseInt(pg_rec);
		}
		if(f_rec != null && !f_rec.equals("")){
			field_rec = f_rec;
		}
		if(q_rec != null && !q_rec.equals("")){
			query_rec = q_rec;
		}
		
		if(pg_song != null && !pg_song.equals("")){
			cpage_song = Integer.parseInt(pg_song);
		}
		if(f_song != null && !f_song.equals("")){
			field_song = f_song;
		}
		if(q_song != null && !q_song.equals("")){
			query_song = q_song;
		}
		
		// 업무 요청 구분
		String cg_no = "2";
		// 수신
		totalcount_rec = service.selectCount_rec(emp_no, cg_no , field_rec, query_rec);
		if(totalcount_rec % pagesize == 0){       
	    	pagecount_rec = totalcount_rec/pagesize;
        }else{
        	pagecount_rec = (totalcount_rec/pagesize) + 1;
        }
		
		//2. 수신함 목록
		List<Task> list_rec = service.selectTask_rec(emp_no, cg_no, field_rec, query_rec,cpage_rec ,pagesize);  
		model.addAttribute("list1", list_rec);
		model.addAttribute("count1", totalcount_rec);
		model.addAttribute("field_rec", field_rec);
		model.addAttribute("query_rec", query_rec);
		model.addAttribute("pagecount_rec", pagecount_rec);
		model.addAttribute("pg_rec", cpage_rec);

		// 송신
		// 1. 송신함갯수
		totalcount_song = service.selectCount_song(emp_no, cg_no , field_song, query_song);  
						
		if(totalcount_song % pagesize == 0){       
			pagecount_song = totalcount_song/pagesize;			
		} else{
			pagecount_song = (totalcount_song/pagesize) + 1;
		}
		
		//2. 송신함 목록
		List<Task> list_song = service.selectTask(emp_no, cg_no, field_song, query_song,cpage_song ,pagesize);  
		model.addAttribute("list2", list_song);		
		model.addAttribute("field_song", field_song);
		model.addAttribute("query_song", query_song);
		model.addAttribute("pagecount_song", pagecount_song);
		model.addAttribute("pg_song", cpage_song);
		model.addAttribute("count2", totalcount_song);

		return "task.taskInform";
	}

	// 업무 보고 > 수신 > 상세
	@RequestMapping("/taskInform_rec_detail.do")
	public String taskInform_rec_detail(HttpSession session, String task_no, Model model) {
		// 로그인 id
		String emp_no = (String)session.getAttribute("emp_no");

		// 상세 가져오기
		Task task = service.selectTask_detail(task_no,emp_no);
		model.addAttribute("detail", task);

		// 권한 확인을 위해
		// session emp_no랑 db의 수신자랑 동일한지 확인
		model.addAttribute("session_emp_no", emp_no);
		model.addAttribute("db_rec_emp_no", task.getRec_emp_no());

		// 업무 참여자 상세 가져오기
		List<Task_people> peopledetail = peopleservice.selectTask_peopleList(task_no);
		model.addAttribute("peopledetail", peopledetail);
		
		return "task.taskInform_rec_detail";
	}

	// 업무 보고 > 수신 > 상세 > 승인 처리
	@RequestMapping(value = "/inform_approval.do", method = RequestMethod.POST)
	public String inform_approval(String task_no, String step_no, Model model) {
		// redirect
		//String link = "taskInform_rec.do";
		String link = "taskInform.do";

		try {
			service.approval(step_no, task_no);
		} catch (Exception e) {
			e.getMessage();
		}

		model.addAttribute("link", link);
		
		return "task.task_redirect";
	}

	// 업무 보고 > 송신 > 상세
	@RequestMapping("/taskInform_Detail.do")
	public String taskInform_Transmit_Detail(HttpSession session, String task_no, Model model) {
		// 로그인 id
		String emp_no = (String)session.getAttribute("emp_no");

		// 상세 가져오기
		Task task = service.selectTask_detail(task_no,emp_no);
		model.addAttribute("detail", task);

		// 업무 참여자 상세 가져오기
		List<Task_people> peopledetail = peopleservice.selectTask_peopleList(task_no);
		model.addAttribute("peopledetail", peopledetail);
		
		return "task.taskInform_detail";
	}

	// 업무일지 > 수신, 송신
	@RequestMapping("/taskLog.do")
	public String taskLog(HttpSession session,String tab_char,String pg_rec , String f_rec , String pg_song , String f_song ,String q_rec, String q_song,  Model model) {		
		String emp_no = (String)session.getAttribute("emp_no");
		
		int totalcount_rec = 0;
		int totalcount_song = 0;
		
		int cpage_rec = 1;
		int cpage_song = 1;
		
		int pagecount_rec = 0;
		int pagecount_song = 0;
		
		int pagesize = 4;
		
		String field_rec = "task_no";
		String query_rec ="%%";
		
		String field_song = "task_no";
		String query_song ="%%";
		
		int tab_char_result = 1;
		
		if(tab_char != null && !tab_char.equals("")){
			tab_char_result = Integer.parseInt(tab_char);
		}
		model.addAttribute("tab_char", tab_char_result);
		
		if(pg_rec != null && !pg_rec.equals("")){
			cpage_rec = Integer.parseInt(pg_rec);
		}
		if(f_rec != null && !f_rec.equals("")){
			field_rec = f_rec;
		}
		if(q_rec != null && !q_rec.equals("")){
			query_rec = q_rec;
		}
		if(pg_song != null && !pg_song.equals("")){
			cpage_song = Integer.parseInt(pg_song);
		}
		if(f_song != null && !f_song.equals("")){
			field_song = f_song;
		}
		if(q_song != null && !q_song.equals("")){
			query_song = q_song;
		}
		
		// 업무 요청 구분
		String cg_no = "3";

		// 수신
		totalcount_rec = service.selectCount_rec(emp_no, cg_no , field_rec, query_rec);
		if(totalcount_rec % pagesize == 0){       
	    	pagecount_rec = totalcount_rec/pagesize;
        }else{
        	pagecount_rec = (totalcount_rec/pagesize) + 1;
        }
		
		//2. 수신함 목록
		List<Task> list_rec = service.selectTask_rec(emp_no, cg_no, field_rec, query_rec, cpage_rec ,pagesize);  
		model.addAttribute("list1", list_rec);
		model.addAttribute("count1", totalcount_rec);
		model.addAttribute("field_rec", field_rec);
		model.addAttribute("query_rec", query_rec);
		model.addAttribute("pagecount_rec", pagecount_rec);
		model.addAttribute("pg_rec", cpage_rec);
		
		// 송신
		// 1. 송신함갯수
		totalcount_song = service.selectCount_song(emp_no, cg_no , field_song, query_song);  
				
		if(totalcount_song % pagesize == 0){       
			pagecount_song = totalcount_song/pagesize;
		}else{
		    pagecount_song = (totalcount_song/pagesize) + 1;
		}
				
		// 2. 송신함 목록
		List<Task> list_song = service.selectTask(emp_no, cg_no, field_song, query_song,cpage_song ,pagesize);  
		model.addAttribute("list2", list_song);		
		model.addAttribute("field_song", field_song);
		model.addAttribute("query_song", query_song);
		model.addAttribute("pagecount_song", pagecount_song);
		model.addAttribute("pg_song", cpage_song);
		model.addAttribute("count2", totalcount_song);

		return "task.taskLog";
	}

	// 업무 일지 > 수신 > 상세
	@RequestMapping("/taskLog_rec_detail.do")
	public String taskLog_rec_detail(HttpSession session, String task_no, Model model) {
		// 로그인 id
		String emp_no = (String)session.getAttribute("emp_no");

		// 상세 가져오기
		Task task = service.selectTask_detail(task_no,emp_no);
		model.addAttribute("detail", task);

		// 권한 확인을 위해
		// session emp_no랑 db의 수신자랑 동일한지 확인
		model.addAttribute("session_emp_no", emp_no);
		model.addAttribute("db_rec_emp_no", task.getRec_emp_no());

				
		// 업무 참여자 상세 가져오기
		List<Task_people> peopledetail = peopleservice.selectTask_peopleList(task_no);
		model.addAttribute("peopledetail", peopledetail);
		
		return "task.taskLog_rec_detail";
	}

	// 업무 일지 > 송신 > 상세
	@RequestMapping("/taskLog_detail.do")
	public String taskLog_detail(HttpSession session, String task_no, Model model) {
		// 로그인 id
		String emp_no = (String)session.getAttribute("emp_no");

		// 상세 가져오기
		Task task = service.selectTask_detail(task_no,emp_no);
		model.addAttribute("detail", task);

		// 업무 참여자 상세 가져오기
		List<Task_people> peopledetail = peopleservice.selectTask_peopleList(task_no);
		model.addAttribute("peopledetail", peopledetail);
		
		return "task.taskLog_detail";
	}
	
	
	
	@RequestMapping("/task_reply_insert_song.do")
	public String task_reply_insert_song(HttpSession session, String task_no, String contents, Model model){
		String url = "taskRequest_detail.do"+"?task_no="+task_no;
		System.out.println("Task_no 넘어옴 : " + task_no);
		Emp emp_data = null;
		String emp_no = (String)session.getAttribute("emp_no");
		emp_data = service.emp_list(emp_no);
		try{
			String dept = emp_data.getBranch_name()+ " "+emp_data.getDept_name()+" "+emp_data.getLow_dept_name();
			emp_data.setLow_dept_name(dept);
			System.out.println(emp_data);
			System.out.println(task_no);
			System.out.println(contents);
			service.insert_reply(emp_data, task_no, contents);			
		}catch(Exception e){
			System.err.println(e.getMessage());
		}finally{
			model.addAttribute("link", url);
		}
		return "task.task_redirect";
	}
	
	
		
	
	@RequestMapping("/task_reply_insert.do")
	public String task_reply_insert(HttpSession session, String task_no, String contents, Model model){
		String url = "taskRequest_participation_detail.do"+"?task_no="+task_no;
		System.out.println("Task_no 넘어옴 : " + task_no);
		Emp emp_data = null;
		String emp_no = (String)session.getAttribute("emp_no");
		emp_data = service.emp_list(emp_no);
		try{
			String dept = emp_data.getBranch_name()+ " "+emp_data.getDept_name()+" "+emp_data.getLow_dept_name();
			emp_data.setLow_dept_name(dept);
			System.out.println(emp_data);
			System.out.println(task_no);
			System.out.println(contents);
			service.insert_reply(emp_data, task_no, contents);			
		}catch(Exception e){
			System.err.println(e.getMessage());
		}finally{
			model.addAttribute("link", url);
		}
		return "task.task_redirect";
	}
	
	
	
	
	
	
	
	
	
}