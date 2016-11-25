package kr.or.epm.TaskController;

import java.security.Principal;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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

import kr.or.epm.Service.CommonService;
import kr.or.epm.Service.LoginService;
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
		System.out.println("지점 클릭 시작함");
		System.out.println("컨트롤러 ");
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
		for (int i = 0; i < list.size(); i++) {
			System.out.println("하위 부서 : " + list.get(i).getLow_dept_name());
		}
		model.addAttribute("low_dept", list);
		return jsonview;
	}

	// 4.업무 등록시 조직도 하위 부서 클릭시 사원 정보 출력
	@RequestMapping("/taskEmpModal.do")
	public View downEmpTree(String low_dept_no, Model model) {
		System.out.println("이엠피 정보 컨트롤러");
		List<Organization> list = null;
		list = service.selectEmpInfo(low_dept_no);
		for (int i = 0; i < list.size(); i++) {
			System.out.println("사원정보: " + list.get(i).getEmp_name() + "/ 사번: " + list.get(i).getEmp_no());
		}
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
	public String taskWriteOk(Principal principal, Task_people people, Task task, Model model) {

		System.out.println("CONTROLLER] 업무 등록");

		String link = "taskRequest.do";
		String msg = null;

		int result1 = 0;
		int result2 = 0;

		// 로그인 id
		String id = principal.getName();
		System.out.println("id : " + id);
		String emp_no = commonservice.selectEmp_no(id);
		System.out.println("로그인한 사원의 emp_no : " + emp_no);
		String emp_name = "";
		String task_no = "";

		List<Task_people> peopleList = new ArrayList<Task_people>();
		peopleList.add(people);
		
		try {
			// 업무에 송신자 사번, 송신자 이름 담기
			task.setEmp_no(emp_no);
			emp_name = commonservice.selectEmp_name(id);
			task.setEmp_name(emp_name);
			
			// 업무 등록하기
			result1 = service.insertTask(task);
			
			if(result1 > 0) {
				System.out.println("업무 등록에 성공했습니다");
				task_no = service.selectTask_no();
			}
			
			// 업무 참여자 등록하기
			result2 = service.insertTask_people(task_no, peopleList);
		} catch (Exception e) {
			e.getMessage();
		} finally {
			if ((result1 > 0) && (result2 > 0)) {
				msg = "업무 등록에 성공하였습니다";
			} else {
				msg = "업무 등록에 실패하였습니다";
			}
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

	// 업무 요청 > 수신
	@RequestMapping("/taskRequest_rec.do")
	public String taskRequest_rec(Principal principal, Model model) {

		System.out.println("CONTROLLER] 업무 요청 수신 페이지");

		// 로그인 id
		String id = principal.getName();
		System.out.println("id : " + id);
		String emp_no = commonservice.selectEmp_no(id);
		System.out.println("로그인한 사원의 emp_no : " + emp_no);

		// 업무 요청 구분
		String cg_no = "1";

		// 목록 가져오기
		List<Task> list = service.selectTask_rec(emp_no, cg_no);
		model.addAttribute("list", list);

		// 글 개수 구하기
		int count = list.size();
		System.out.println("수신함 글 개수 : " + count);
		model.addAttribute("count", count);

		return "task.taskRequest";
	}

	// 업무 요청 > 수신 > 상세
	@RequestMapping("/taskRequest_rec_detail.do")
	public String taskRequest_rec_detail(String task_no, Model model) {

		System.out.println("CONTROLLER] 업무 요청 수신 상세 페이지");
		System.out.println("선택한 업무 번호 : " + task_no);

		// 업무 상세 가져오기
		Task detail = service.selectTask_detail(task_no);
		model.addAttribute("detail", detail);

		// 업무 참여자 상세 가져오기
		List<Task_people> peopledetail = peopleservice.selectTask_peopleList(task_no);
		model.addAttribute("peopledetail", peopledetail);

		return "task.taskRequest_rec_detail";
	}

	// 업무 요청 > 수신 > 상세 > 승인 처리
	@RequestMapping(value = "/request_approval.do", method = RequestMethod.POST)
	public String request_approval(String task_no, String step_no, Model model) {

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
				msg = "승인 처리에 성공하였습니다";
			} else {
				msg = "승인 처리에 실패하였습니다";
			}
		}

		model.addAttribute("link", link);
		model.addAttribute("msg", msg);

		return "task.task_redirect";
	}

	// 업무요청 > 송신
	@RequestMapping("/taskRequest.do")
	public View taskRequest(Model model, Principal principal) {

		System.out.println("CONTROLLER] 업무 요청 송신 페이지");

		// 로그인 id
		String id = principal.getName();
		System.out.println("id : " + id);
		String emp_no = commonservice.selectEmp_no(id);
		System.out.println("로그인한 사원의 emp_no : " + emp_no);

		// 업무 요청 구분
		String cg_no = "1";

		// 목록 가져오기
		List<Task> list = service.selectTask(emp_no, cg_no);
		model.addAttribute("list", list);

		// 글 개수 구하기
		int count = list.size();
		System.out.println("송신함 글 개수 : " + count);
		model.addAttribute("count", count);

		return jsonview;
	}

	// 업무 요청 > 송신 > 상세
	@RequestMapping("/taskRequest_detail.do")
	public String taskRequest_detail(String task_no, Model model) {

		System.out.println("CONTROLLER] 업무 요청 송신 상세 페이지");
		System.out.println("선택한 업무 번호 : " + task_no);

		// 상세 가져오기
		Task detail = service.selectTask_detail(task_no);
		model.addAttribute("detail", detail);

		return "task.taskRequest_detail";
	}

	// 업무 요청 > 참여
	@RequestMapping("/taskRequest_participation.do")
	public View taskRequest_participation(Principal principal, Model model) {

		System.out.println("CONTROLLER] 업무 요청 참여 페이지");

		// 로그인 id
		String id = principal.getName();
		System.out.println("id : " + id);
		String emp_no = commonservice.selectEmp_no(id);
		System.out.println("로그인한 사원의 emp_no : " + emp_no);

		// 목록 가져오기
		List<Task> list = service.selectTask_people(emp_no);
		model.addAttribute("list", list);

		// 글 개수 구하기
		int count = list.size();
		System.out.println("참여함 글 개수 : " + count);
		model.addAttribute("count", count);

		return jsonview;
	}

	// 업무 요청 > 참여 > 상세
	@RequestMapping(value = "/taskRequest_participation_detail.do", method = RequestMethod.GET)
	public String taskRequest_participation_detail(String task_no, Model model) {

		System.out.println("CONTROLLER] 업무 요청 참여 상세 페이지");
		System.out.println("선택한 업무 번호 : " + task_no);

		// 상세 가져오기
		Task detail = service.selectTask_detail(task_no);
		model.addAttribute("detail", detail);

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

	// 업무보고 > 수신
	@RequestMapping("/taskInform_rec.do")
	public String taskInform_rec(Principal principal, Model model) {

		System.out.println("CONTROLLER] 업무 보고 수신 페이지");

		// 로그인 id
		String id = principal.getName();
		System.out.println("id : " + id);
		String emp_no = commonservice.selectEmp_no(id);
		System.out.println("로그인한 사원의 emp_no : " + emp_no);

		// 업무 요청 구분
		String cg_no = "2";

		// 목록 가져오기
		List<Task> list = service.selectTask_rec(emp_no, cg_no);
		model.addAttribute("list", list);

		// 글 개수 구하기
		int count = list.size();
		System.out.println("수신함 글 개수 : " + count);
		model.addAttribute("count", count);

		return "task.taskInform";
	}

	// 업무 보고 > 수신 > 상세
	@RequestMapping("/taskInform_rec_detail.do")
	public String taskInform_rec_detail(String task_no, Model model) {

		System.out.println("Controller] 업무 보고 수신 상세페이지");
		System.out.println("선택한 업무 번호 : " + task_no);

		// 상세 가져오기
		Task task = service.selectTask_detail(task_no);
		model.addAttribute("detail", task);

		return "task.taskInform_rec_detail";
	}

	// 업무 보고 > 수신 > 상세 > 승인 처리
	@RequestMapping(value = "/inform_approval.do", method = RequestMethod.POST)
	public String inform_approval(String task_no, String step_no, Model model) {

		System.out.println("CONTROLLER] 업무 보고 수신 > 승인 처리");
		System.out.println("선택한 업무 번호 : " + task_no);
		System.out.println("선택한 승인 단계 : " + step_no);

		// redirect
		String link = "taskInform.do";
		String msg = null;

		int result = 0;
		try {
			result = service.approval(step_no, task_no);
		} catch (Exception e) {
			e.getMessage();
		} finally {
			if (result > 0) {
				msg = "승인 처리에 성공하였습니다";
			} else {
				msg = "승인 처리에 실패하였습니다";
			}
		}

		model.addAttribute("link", link);
		model.addAttribute("msg", msg);

		return "task.task_redirect";
	}

	// 업무보고 > 송신
	@RequestMapping("/taskInform.do")
	public View taskInform(Principal principal, Model model) {

		System.out.println("CONTROLLER] 업무 보고 송신 페이지");

		// 로그인 id
		String id = principal.getName();
		System.out.println("id : " + id);
		String emp_no = commonservice.selectEmp_no(id);
		System.out.println("로그인한 사원의 emp_no : " + emp_no);

		// 업무 요청 구분
		String cg_no = "2";

		// 목록 가져오기
		List<Task> list = service.selectTask(emp_no, cg_no);
		model.addAttribute("list", list);

		// 글 개수 구하기
		int count = list.size();
		System.out.println("송신함 글 개수 : " + count);
		model.addAttribute("count", count);

		return jsonview;
	}

	// 업무 보고 > 송신 > 상세
	@RequestMapping("/taskInform_Detail.do")
	public String taskInform_Transmit_Detail(String task_no, Model model) {

		System.out.println("Controller] 업무 보고 송신 상세페이지");
		System.out.println("선택한 업무 번호 : " + task_no);

		// 상세 가져오기
		Task task = service.selectTask_detail(task_no);
		model.addAttribute("detail", task);

		return "task.taskInform_detail";
	}

	// 업무일지 > 수신
	@RequestMapping("/taskLog_rec.do")
	public String taskLog_rec(Principal principal, Model model) {

		System.out.println("CONTROLLER] 업무 일지 수신 페이지");

		// 로그인 id
		String id = principal.getName();
		System.out.println("id : " + id);
		String emp_no = commonservice.selectEmp_no(id);
		System.out.println("로그인한 사원의 emp_no : " + emp_no);

		// 업무 요청 구분
		String cg_no = "1";

		// 목록 가져오기
		List<Task> list = service.selectTask_rec(emp_no, cg_no);
		model.addAttribute("list", list);

		// 글 개수 구하기
		int count = list.size();
		System.out.println("수신함 글 개수 : " + count);
		model.addAttribute("count", count);

		return "task.taskLog";
	}

	// 업무 일지 > 수신 > 상세
	@RequestMapping("/taskLog_rec_detail.do")
	public String taskLog_rec_detail(String task_no, Model model) {

		System.out.println("Controller] 업무 일지 수신 상세페이지");
		System.out.println("선택한 업무 번호 : " + task_no);

		// 상세 가져오기
		Task task = service.selectTask_detail(task_no);
		model.addAttribute("detail", task);

		return "task.taskLog_rec_detail";
	}

	// 업무일지 > 송신
	@RequestMapping("/taskLog.do")
	public View taskLog(Principal principal, Model model) {

		System.out.println("CONTROLLER] 업무 일지 송신 페이지");

		// 로그인 id
		String id = principal.getName();
		System.out.println("id : " + id);
		String emp_no = commonservice.selectEmp_no(id);
		System.out.println("로그인한 사원의 emp_no : " + emp_no);

		// 업무 요청 구분
		String cg_no = "1";

		// 목록 가져오기
		List<Task> list = service.selectTask(emp_no, cg_no);
		model.addAttribute("list", list);

		// 글 개수 구하기
		int count = list.size();
		System.out.println("수신함 글 개수 : " + count);
		model.addAttribute("count", count);

		return jsonview;
	}

	// 업무 일지 > 송신 > 상세
	@RequestMapping("/taskLog_detail.do")
	public String taskLog_detail(String task_no, Model model) {

		System.out.println("Controller] 업무 일지 송신 상세페이지");
		System.out.println("선택한 업무 번호 : " + task_no);

		// 상세 가져오기
		Task task = service.selectTask_detail(task_no);
		model.addAttribute("detail", task);

		return "task.taskLog_detail";
	}

	// 검색하기
	@RequestMapping(value = "/taskLog_search.do", method = RequestMethod.GET)
	public String taskLog_search(HttpServletRequest request, Principal principal, Model model) {

		System.out.println("검색을 시작합니다");

		String cg_no = "3";

		String id = principal.getName();
		String emp_no = commonservice.selectEmp_no(id);
		System.out.println("emp_no : " + emp_no);

		String key = request.getParameter("selectSearch");
		String value = request.getParameter("input");

		System.out.println("key값 : " + key + " // value값 : " + value);

		// 목록 가져오기
		List<Task> list = service.searchTask(emp_no, cg_no, key, value);

		model.addAttribute("list", list);

		return "task.taskLog";
	}
}