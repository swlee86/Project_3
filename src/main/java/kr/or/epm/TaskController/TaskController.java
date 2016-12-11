package kr.or.epm.TaskController;

import java.security.Principal;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.View;

import com.google.api.client.http.HttpRequest;

import kr.or.epm.DAO.PushDAO;
import kr.or.epm.Service.CommonService;
import kr.or.epm.Service.LoginService;
import kr.or.epm.Service.PushService;
import kr.or.epm.Service.TaskService;
import kr.or.epm.Service.Task_peopleService;
import kr.or.epm.VO.EmpJoinEmp_Detail;
import kr.or.epm.VO.Organization;
import kr.or.epm.VO.Task;
import kr.or.epm.VO.Task_people;
import net.sf.json.JSON;

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
		System.out.println("CONTROLLER] 지점 클릭");
		System.out.println("branch_no : " + branch_no);
		List<Organization> list = null;
		list = service.selectdeptname(branch_no);
		model.addAttribute("deptname", list);
		return jsonview;
	}

	// 3.업무 등록시 조직도 부서 클릭시 하위부서 출력
	@RequestMapping("/tasklow_deptModal.do")
	public View downlowDeptTree(String dept_no, Model model) {
		System.out.println("CONTROLLER] 부서 클릭");
		List<Organization> list = null;
		list = service.selectlowDept(dept_no);
		model.addAttribute("low_dept", list);
		return jsonview;
	}

	// 4.업무 등록시 조직도 하위 부서 클릭시 사원 정보 출력
	@RequestMapping("/taskEmpModal.do")
	public View downEmpTree(String low_dept_no, Model model) {
		System.out.println("CONTROLLER] 하위부서 클릭");
		List<Organization> list = null;
		
		list = service.selectEmpInfo(low_dept_no);
		model.addAttribute("emp", list);
		return jsonview;
	}

	//조직도 모달에서 자신의 정보 제외시키는 부분   
	@RequestMapping("/taskEmpModal_exclude.do")
	public View downEmpTree(String low_dept_no, Model model,Principal principal) {
		System.out.println("CONTROLLER] 하위부서 클릭");
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
		
		System.out.println("CONTROLLER] 업무 등록 페이지");

		return "task.taskWrite";
	}

	// 업무 > 업무 등록
	@RequestMapping(value = "/taskWrite.do", method = RequestMethod.POST)
	public String taskWriteOk(Principal principal, Task task, String emp_no, Model model) {
		System.out.println("task: " + task.toString());
		System.out.println("CONTROLLER] 업무 등록");
		
		String link = "taskWrite.do";
		String msg = null;

		int result1 = 0;
		int result2 = 0;

		// 로그인 id
		String id = principal.getName();
		System.out.println("id : " + id);
		String myemp_no = commonservice.selectEmp_no(id);
		System.out.println("로그인한 사원의 emp_no : " + myemp_no);
		String emp_name = "";
		String task_no = "";

		// 참여자 사번들 분리
		String[] people = emp_no.split(",");
		for(int i =0 ; i < people.length ; i++){
			System.out.println("참여자 : " + people[i]);
		}
		
		System.out.println("선택된 참여자 인원 : " + people.length);
		
		try {
			// 업무에 송신자 사번, 송신자 이름 담기
			task.setEmp_no(myemp_no);
			emp_name = commonservice.selectEmp_name(id);
			task.setEmp_name(emp_name);
			
			// 업무 등록하기
			result1 = service.insertTask(task);

			// 등록하는 업무 번호 가져오기
			task_no = service.selectTask_no();
			System.out.println("등록하려고 하는 업무 번호는 : " + task_no);
			
			// 업무 참여자 등록하기
			result2 = service.insertTask_people(task_no, people);
			
		} catch (Exception e) {
			e.getMessage();
		} finally {
			if ((result1 > 0) && (result2 > 0)) {
				System.out.println("업무 등록에 성공하였습니다");
			} else {
				System.out.println(result1 + " || " + result2);
				System.out.println("업무 등록에 실패하였습니다");
			}
		}

		
		
		System.out.println("@@@@@@@@@@@@@@@@@업무 유형 : " +task.getCg_no() +"/ 요청:"+task.getCg_no().equals("1")+"/ 보고:"+task.getCg_no().equals("2")+"/ 일지: "+task.getCg_no().equals("3") );
		if(task.getCg_no().equals("1")){  //업무요청
			link = "taskRequest.do";
		}else if(task.getCg_no().equals("2")){ //업무보고
			link = "taskInform.do";
		}else if(task.getCg_no().equals("3")){  //업무일지
			link = "taskLog.do";
		}
		
		
		model.addAttribute("link", link);
		model.addAttribute("msg", msg);

		return "task.task_redirect";
	}

	// 업무 > 수신 > 삭제
	@RequestMapping(value = "/taskDelete_rec.do", method = RequestMethod.POST)
	public String taskDelete_rec(String task_no, Model model) {

		System.out.println("CONTROLLER] 업무 > 수신 > 삭제");
		System.out.println("선택한 업무 번호 : " + task_no);

		String RecSend = "Rec";

		// redirect
		String link = "taskRequest.do";
		String msg = null;

		int result = 0;
		try {
			result = service.deleteTask(task_no, RecSend);
		} catch (Exception e) {
			e.getMessage();
		} finally {
			if (result > 0) {
				msg = "수신 삭제에 성공하였습니다";
			} else {
				msg = "수신 삭제에 실패하였습니다";
			}
		}

		model.addAttribute("link", link);
		model.addAttribute("msg", msg);

		return "task.task_redirect";
	}

	// 업무 > 송신 > 삭제
	@RequestMapping(value = "/taskDelete.do", method = RequestMethod.POST)
	public String taskDelete(String task_no, Model model) {

		System.out.println("CONTROLLER] 업무 > 송신 > 삭제");
		System.out.println("선택한 업무 번호 : " + task_no);

		String RecSend = "Send";

		// redirect
		String link = "taskRequest.do";
		String msg = null;

		int result = 0;
		try {
			result = service.deleteTask(task_no, RecSend);
		} catch (Exception e) {
			e.getMessage();
		} finally {
			if (result > 0) {
				msg = "송신 삭제에 성공하였습니다";
			} else {
				msg = "송신 삭제에 실패하였습니다";
			}
		}

		model.addAttribute("link", link);
		model.addAttribute("msg", msg);

		return "task.task_redirect";
	}

	// 업무 요청 > 수신, 송신, 참여
	@RequestMapping("/taskRequest.do")
	public String taskRequest(HttpServletRequest request,String tab_char ,Model model, String pg_rec , String f_rec , String pg_song , String f_song ,String pg_parti, String f_parti ,String q_rec,String q_song,String q_parti) {

		System.out.println("CONTROLLER] 업무 요청 수신 페이지");

		// 로그인 id
		//String id = principal.getName();
		//System.out.println("id : " + id);
		//String emp_no = commonservice.selectEmp_no(id);
		//System.out.println("로그인한 사원의 emp_no : " + emp_no);
		HttpSession session = request.getSession();
		String emp_no = (String)session.getAttribute("emp_no");
		System.out.println("로그인한 사원의 emp_no : " + emp_no);
		
		int totalcount_rec = 0;
		int totalcount_song = 0;
		int totalcount_parti = 0;
		
		int cpage_rec = 1;
		int cpage_song = 1;
		int cpage_parti = 1;
		
		int pagecount_rec = 0;
		int pagecount_song = 0;
		int pagecount_parti = 0;
		
		int pagesize = 4;
		
		String field_rec = "task_no";
		String query_rec ="%%";
		
		String field_song = "task_no";
		String query_song ="%%";
		
		String field_parti = "task_no";
		String query_parti ="%%";
		
		int tab_char_result = 1;
		
		System.out.println("tab_char != null && !tab_char.equals('') : "+ (tab_char != null && !tab_char.equals("")));
		if(tab_char != null && !tab_char.equals("")){
			System.out.println("*********tab_char : " + Integer.parseInt(tab_char));
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
			cpage_parti = Integer.parseInt(pg_parti);   //pg다르게~~~~~~~~
		}
		if(f_parti != null && !f_parti.equals("")){
			field_parti = f_parti;
		}
		if(q_parti != null && !q_parti.equals("")){
			query_parti = q_parti;
		}
		
		// 업무 요청 구분
		String cg_no = "1";
		
		/////////////////////////////////////////////////////////////////////////////////////////
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		//@@@@@@@@@@@@@@@@@수신(보낸)
		//1. 수신함갯수
		totalcount_rec = service.selectCount_rec(emp_no, cg_no , field_rec, query_rec);  
		
		if(totalcount_rec % pagesize == 0){       
	    	pagecount_rec = totalcount_rec/pagesize;
        }else{
        	pagecount_rec = (totalcount_rec/pagesize) + 1;
        }
		System.out.println("=>totalcount_rec : " + totalcount_rec +"/pagecount_rec : " + pagecount_rec);
		
		//2. 수신함 목록
		List<Task> list_rec = service.selectTask_rec(emp_no, cg_no, field_rec, query_rec,cpage_rec ,pagesize);  
		model.addAttribute("list1", list_rec);
		model.addAttribute("count1", totalcount_rec);
		model.addAttribute("field_rec", field_rec);
		model.addAttribute("query_rec", query_rec);
		model.addAttribute("pagecount_rec", pagecount_rec);
		model.addAttribute("pg_rec", cpage_rec);
		
		// 목록 가져오기
		/*		
		List<Task> list = service.selectTask_rec(emp_no, cg_no);
		model.addAttribute("list1", list);
		// 글 개수 구하기
		int count = list.size();
		System.out.println("수신함 글 개수 : " + count);
		model.addAttribute("count1", count);
		 */
		
		
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		/////////////////////////////////////////////////////////////////////////////////////////
		//@@@@@@@@@@@@@@@@@송신(받는)
		//1. 송신함갯수
		totalcount_song = service.selectCount_song(emp_no, cg_no , field_song, query_song);  
				
		if(totalcount_song % pagesize == 0){       
			pagecount_song = totalcount_song/pagesize;
		}else{
		    pagecount_song = (totalcount_song/pagesize) + 1;
		}
		System.out.println("=>totalcount_song : " + totalcount_song +"/pagecount_song : " + pagecount_song);
				
		//2. 송신함 목록
		List<Task> list_song = service.selectTask(emp_no, cg_no, field_song, query_song,cpage_song ,pagesize);  
		model.addAttribute("list2", list_song);		
		model.addAttribute("field_song", field_song);
		model.addAttribute("query_song", query_song);
		model.addAttribute("pagecount_song", pagecount_song);
		model.addAttribute("pg_song", cpage_song);
		model.addAttribute("count2", totalcount_song);
		// 목록 가져오기
		/*
		List<Task> list2 = service.selectTask(emp_no, cg_no);
		model.addAttribute("list2", list2);
		// 글 개수 구하기
		int count2 = list2.size();
		System.out.println("송신함 글 개수 : " + count2);
		model.addAttribute("count2", count2);
		*/
		
		
		
		/////////////////////////////////////////////////////////////////////////////////////////
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		//@@@@@@@@@@@@@@@@@참여
		//1. 참여함갯수
		totalcount_parti = service.selectCount_parti(emp_no, field_parti, query_parti);  
						
		if(totalcount_parti % pagesize == 0){       
			pagecount_parti = totalcount_parti/pagesize;
		}else{
		    pagecount_parti = (totalcount_parti/pagesize) + 1;
		}
		System.out.println("=>totalcount_parti : " + totalcount_parti +"/pagecount_parti : " + pagecount_parti);
						
		//2. 참여함 목록
		List<Task> list_parti = service.selectTask_people(emp_no, field_parti, query_parti,cpage_parti ,pagesize);  
		model.addAttribute("list3", list_parti);			
		model.addAttribute("count3", totalcount_parti);
		model.addAttribute("field_parti", field_parti);
		model.addAttribute("query_parti", query_parti);
		model.addAttribute("pagecount_parti", pagecount_parti);
		model.addAttribute("pg_parti", cpage_parti);
		model.addAttribute("count3", totalcount_parti);
		// 목록 가져오기
		/*List<Task> list3 = service.selectTask_people(emp_no);
		model.addAttribute("list3", list3);
		// 글 개수 구하기
		int count3 = list3.size();
		System.out.println("참여함 글 개수 : " + count3);
		model.addAttribute("count3", count3);*/

		
		
		
		
		
		
		
		return "task.taskRequest";
	}

	// 업무 요청 > 수신 > 상세
	@RequestMapping("/taskRequest_rec_detail.do")
	public String taskRequest_rec_detail(String task_no, Model model, HttpServletRequest request, HttpServletResponse responsel) {

		System.out.println("CONTROLLER] 업무 요청 수신 상세 페이지");
		System.out.println("선택한 업무 번호 : " + task_no);

		//Push알림을 위한 Taskcount session 재생성
		HttpSession session = request.getSession();
		int resultdata = 0;
		String empno = (String)session.getAttribute("emp_no");
		
		// 업무 상세 가져오기
		Task detail = service.selectTask_detail(task_no,empno);
		model.addAttribute("detail", detail);
		
		
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
		
		return "task.taskRequest_rec_detail";
	}

	// 업무 요청 > 수신 > 상세 > 승인 처리
	@RequestMapping(value = "/request_approval.do", method = RequestMethod.POST)
	public String request_approval(String task_no, String step_no, Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int resultdata = 0;
		
		String empno = (String)session.getAttribute("emp_no");
		
		System.out.println("CONTROLLER] 업무 요청 수신 > 승인 처리");
		System.out.println("선택한 업무 번호 : " + task_no);
		System.out.println("선택한 승인 단계 : " + step_no);

		// redirect
		String link = "taskRequest.do";
		String msg = null;

		int result = 0;
		try {
			result = service.approval(step_no, task_no);
		} catch (Exception e) {
			e.getMessage();
		} finally {
			if (result > 0) {
				System.out.println("승인 처리에 성공하였습니다");
				String taskApproval = pushservice.taskApproval(empno);
				String taskcount = pushservice.taskCount(empno);
				String projectApproval = pushservice.projectApproval(empno);
				String projectcount = pushservice.myprojectCount(empno);
				
				resultdata = (Integer.parseInt(taskcount))+Integer.parseInt(projectcount)+Integer.parseInt(taskApproval)+Integer.parseInt(projectApproval);
				
				session.setAttribute("sessionpushcount", resultdata);
				session.setAttribute("sessiontaskApprovalcount", taskApproval);	
				
			} else {
				System.out.println("승인 처리에 실패하였습니다");
			}
		}

		model.addAttribute("link", link);
		model.addAttribute("msg", msg);

		return "task.task_redirect";
	}

	// 업무 요청 > 송신 > 상세
	@RequestMapping("/taskRequest_detail.do")
	public String taskRequest_detail(Principal principal, String task_no, Model model) {

		System.out.println("CONTROLLER] 업무 요청 송신 상세 페이지");
		System.out.println("선택한 업무 번호 : " + task_no);
		
		// 로그인 id
		String id = principal.getName();
		System.out.println("id : " + id);
		String emp_no = commonservice.selectEmp_no(id);
		System.out.println("로그인한 사원의 emp_no : " + emp_no);

		// 상세 가져오기
		Task detail = service.selectTask_detail(task_no,emp_no);
		model.addAttribute("detail", detail);

		// 업무 참여자 상세 가져오기
		List<Task_people> peopledetail = peopleservice.selectTask_peopleList(task_no);
		model.addAttribute("peopledetail", peopledetail);
		
		return "task.taskRequest_detail";
	}

	// 업무 요청 > 참여 > 상세
	@RequestMapping(value = "/taskRequest_participation_detail.do", method = RequestMethod.GET)
	public String taskRequest_participation_detail(Principal principal, String task_no, Model model) {

		System.out.println("CONTROLLER] 업무 요청 참여 상세 페이지");
		System.out.println("선택한 업무 번호 : " + task_no);
		
		// 로그인 id
		String id = principal.getName();
		System.out.println("id : " + id);
		String emp_no = commonservice.selectEmp_no(id);
		System.out.println("로그인한 사원의 emp_no : " + emp_no);

		// 상세 가져오기
		Task detail = service.selectTask_detail(task_no,emp_no);
		model.addAttribute("detail", detail);
		

		// 업무 참여자 상세 가져오기
		List<Task_people> peopledetail = peopleservice.selectTask_peopleList(task_no);
		model.addAttribute("peopledetail", peopledetail);

		return "task.taskRequest_participation_detail";
	}

	// 업무 요청 > 참여 > 상세 > 진행 처리
	@RequestMapping(value = "/taskRequest_participation_detail.do", method = RequestMethod.POST)
	public String taskRequest_participation_detail(String task_no, String task_step_no, Model model) {

		System.out.println("CONTROLLER] 업무 요청 참여 > 진행 처리");
		System.out.println("선택한 업무 번호 : " + task_no);
		System.out.println("선택한 진행 단계 번호 : " + task_step_no);

		// redirect
		String link = "taskRequest.do";
		String msg = null;

		int result = 0;
		try {
			result = service.updateTaskRequest_participation_step(task_no, task_step_no);
		} catch (Exception e) {
			e.getMessage();
		} finally {
			if (result > 0) {
				msg = "진행 처리에 성공하였습니다";
			} else {
				msg = "진행 처리에 실패하였습니다";
			}
		}

		model.addAttribute("link", link);
		model.addAttribute("msg", msg);

		return "task.task_redirect";
	}

	// 업무보고 > 수신, 송신
	@RequestMapping("/taskInform.do")
	public String taskInform(HttpServletRequest request,String tab_char, String pg_rec , String f_rec , String pg_song , String f_song ,String q_rec, String q_song,  Model model) {

		System.out.println("CONTROLLER] 업무 보고 수신 페이지");

		// 로그인 id
		/*String id = principal.getName();
		System.out.println("id : " + id);
		String emp_no = commonservice.selectEmp_no(id);*/
		HttpSession session = request.getSession();
		String emp_no = (String)session.getAttribute("emp_no");
		System.out.println("로그인한 사원의 emp_no : " + emp_no);

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
			System.out.println("*********tab_char : " + Integer.parseInt(tab_char));
			tab_char_result = Integer.parseInt(tab_char);
		}
		model.addAttribute("tab_char", tab_char_result);
		
		
		if(pg_rec != null && !pg_rec.equals("")){
			cpage_rec = Integer.parseInt(pg_rec);
		}
		if(f_rec != null && !f_rec.equals("")){
			field_rec = f_rec;
		}
		
		System.out.println("(((((((((((((q_rec : " + q_rec);
		System.out.println(q_rec != null && !q_rec.equals(""));
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

		
		/////////////////////////////////////////////////////////////////
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		System.out.println("field_rec : " + field_rec +"/ query_rec: "+query_rec);
		// 수신
		totalcount_rec = service.selectCount_rec(emp_no, cg_no , field_rec, query_rec);
		if(totalcount_rec % pagesize == 0){       
	    	pagecount_rec = totalcount_rec/pagesize;
        }else{
        	pagecount_rec = (totalcount_rec/pagesize) + 1;
        }
		System.out.println("=>totalcount_rec : " + totalcount_rec +"/pagecount_rec : " + pagecount_rec);
		
		//2. 수신함 목록
		List<Task> list_rec = service.selectTask_rec(emp_no, cg_no, field_rec, query_rec,cpage_rec ,pagesize);  
		model.addAttribute("list1", list_rec);
		model.addAttribute("count1", totalcount_rec);
		model.addAttribute("field_rec", field_rec);
		model.addAttribute("query_rec", query_rec);
		model.addAttribute("pagecount_rec", pagecount_rec);
		model.addAttribute("pg_rec", cpage_rec);
		
		// 목록 가져오기
		/*		
		List<Task> list = service.selectTask_rec(emp_no, cg_no);
		model.addAttribute("list1", list);
		// 글 개수 구하기
		int count = list.size();
		System.out.println("수신함 글 개수 : " + count);
		model.addAttribute("count1", count);
		 */
		

		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		////////////////////////////////////////////////////////////////////
		// 송신
		//1. 송신함갯수
				totalcount_song = service.selectCount_song(emp_no, cg_no , field_song, query_song);  
						
				if(totalcount_song % pagesize == 0){       
					pagecount_song = totalcount_song/pagesize;
				}else{
				    pagecount_song = (totalcount_song/pagesize) + 1;
				}
				System.out.println("=>totalcount_song : " + totalcount_song +"/pagecount_song : " + pagecount_song);
						
				//2. 송신함 목록
				List<Task> list_song = service.selectTask(emp_no, cg_no, field_song, query_song,cpage_song ,pagesize);  
				model.addAttribute("list2", list_song);		
				model.addAttribute("field_song", field_song);
				model.addAttribute("query_song", query_song);
				model.addAttribute("pagecount_song", pagecount_song);
				model.addAttribute("pg_song", cpage_song);
				model.addAttribute("count2", totalcount_song);
		// 목록 가져오기
		/*List<Task> list2 = service.selectTask(emp_no, cg_no);
		model.addAttribute("list2", list2);

		// 글 개수 구하기
		int count2 = list2.size();
		System.out.println("송신함 글 개수 : " + count2);
		model.addAttribute("count2", count2);
		*/

		
		
		
		
		
		
		
		
		
		return "task.taskInform";
	}

	// 업무 보고 > 수신 > 상세
	@RequestMapping("/taskInform_rec_detail.do")
	public String taskInform_rec_detail(Principal principal, String task_no, Model model) {

		System.out.println("Controller] 업무 보고 수신 상세페이지");
		System.out.println("선택한 업무 번호 : " + task_no);

		// 로그인 id
		String id = principal.getName();
		System.out.println("id : " + id);
		String emp_no = commonservice.selectEmp_no(id);
		System.out.println("로그인한 사원의 emp_no : " + emp_no);

		// 상세 가져오기
		Task task = service.selectTask_detail(task_no,emp_no);
		model.addAttribute("detail", task);

		// 업무 참여자 상세 가져오기
		List<Task_people> peopledetail = peopleservice.selectTask_peopleList(task_no);
		model.addAttribute("peopledetail", peopledetail);
		
		return "task.taskInform_rec_detail";
	}

	// 업무 보고 > 수신 > 상세 > 승인 처리
	@RequestMapping(value = "/inform_approval.do", method = RequestMethod.POST)
	public String inform_approval(String task_no, String step_no, Model model) {

		System.out.println("CONTROLLER] 업무 보고 수신 > 승인 처리");
		System.out.println("선택한 업무 번호 : " + task_no);
		System.out.println("선택한 승인 단계 : " + step_no);

		// redirect
		String link = "taskInform_rec.do";
		String msg = null;

		int result = 0;
		try {
			result = service.approval(step_no, task_no);
		} catch (Exception e) {
			e.getMessage();
		} finally {
			if (result > 0) {
				System.out.println("승인 처리에 성공하였습니다");
			} else {
				System.out.println("승인 처리에 실패하였습니다");
			}
		}


		model.addAttribute("link", link);
		model.addAttribute("msg", msg);

		return "task.task_redirect";
	}

	// 업무 보고 > 송신 > 상세
	@RequestMapping("/taskInform_Detail.do")
	public String taskInform_Transmit_Detail(Principal principal, String task_no, Model model) {

		System.out.println("Controller] 업무 보고 송신 상세페이지");
		System.out.println("선택한 업무 번호 : " + task_no);

		// 로그인 id
		String id = principal.getName();
		System.out.println("id : " + id);
		String emp_no = commonservice.selectEmp_no(id);
		System.out.println("로그인한 사원의 emp_no : " + emp_no);

		// 상세 가져오기
		Task task = service.selectTask_detail(task_no,emp_no);
		model.addAttribute("detail", task);

		// 업무 참여자 상세 가져오기
		List<Task_people> peopledetail = peopleservice.selectTask_peopleList(task_no);
		model.addAttribute("peopledetail", peopledetail);
		
		return "task.taskInform_detail";
	}

	// 업무일지 > 수신, 송신
/*	@RequestMapping("/taskLog.do")
	public String taskLog(Principal principal, Model model) {

		System.out.println("CONTROLLER] 업무 일지 수신 페이지");

		// 로그인 id
		String id = principal.getName();
		System.out.println("id : " + id);
		String emp_no = commonservice.selectEmp_no(id);
		System.out.println("로그인한 사원의 emp_no : " + emp_no);

		// 업무 요청 구분
		String cg_no = "3";

		// 수신
		// 목록 가져오기
		List<Task> list = service.selectTask_rec(emp_no, cg_no);
		model.addAttribute("list1", list);

		// 글 개수 구하기
		int count = list.size();
		System.out.println("수신함 글 개수 : " + count);
		model.addAttribute("count1", count);
		
		// 송신
		// 목록 가져오기
		List<Task> list2 = service.selectTask(emp_no, cg_no);
		model.addAttribute("list2", list2);

		// 글 개수 구하기
		int count2 = list2.size();
		System.out.println("수신함 글 개수 : " + count2);
		model.addAttribute("count2", count2);

		return "task.taskLog";
	}*/

	// 업무 일지 > 수신 > 상세
	@RequestMapping("/taskLog_rec_detail.do")
	public String taskLog_rec_detail(Principal principal, String task_no, Model model) {

		System.out.println("CONTROLLER] 업무 일지 수신 상세페이지");
		System.out.println("선택한 업무 번호 : " + task_no);

		// 로그인 id
		String id = principal.getName();
		System.out.println("id : " + id);
		String emp_no = commonservice.selectEmp_no(id);
		System.out.println("로그인한 사원의 emp_no : " + emp_no);

		// 상세 가져오기
		Task task = service.selectTask_detail(task_no,emp_no);
		model.addAttribute("detail", task);

		// 업무 참여자 상세 가져오기
		List<Task_people> peopledetail = peopleservice.selectTask_peopleList(task_no);
		model.addAttribute("peopledetail", peopledetail);
		
		return "task.taskLog_rec_detail";
	}

	// 업무 일지 > 송신 > 상세
	@RequestMapping("/taskLog_detail.do")
	public String taskLog_detail(Principal principal, String task_no, Model model) {

		System.out.println("Controller] 업무 일지 송신 상세페이지");
		System.out.println("선택한 업무 번호 : " + task_no);

		// 로그인 id
		String id = principal.getName();
		System.out.println("id : " + id);
		String emp_no = commonservice.selectEmp_no(id);
		System.out.println("로그인한 사원의 emp_no : " + emp_no);

		// 상세 가져오기
		Task task = service.selectTask_detail(task_no,emp_no);
		model.addAttribute("detail", task);

		// 업무 참여자 상세 가져오기
		List<Task_people> peopledetail = peopleservice.selectTask_peopleList(task_no);
		model.addAttribute("peopledetail", peopledetail);
		
		return "task.taskLog_detail";
	}
}