package kr.or.epm.AjaxController;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

import kr.or.epm.Service.TaskService;
import kr.or.epm.VO.Task;

/*
 * 작성자 : 백승아
 * 작성일 : 2016-11-23
 * 사용목적 : 업무 ajax 컨트롤러
*/

@Controller
public class TaskAjaxController {

	@Autowired
	private View jsonview;

	@Autowired
	private TaskService service;
	
	// 업무 > 수신 > 중요 설정하기
	@RequestMapping("/taskSign")
	public View taskSign(String task_no, String sign, Model model) {
		// redirect
		String link = "taskRequest.do";
		
		try {
			// 중요 설정
			service.updateTask_sign(task_no, sign);
		} catch (Exception e) {
			e.getMessage();
		}

		model.addAttribute("link", link);
		
		return jsonview;
	}

	// 검색하기
	@RequestMapping(value = "/task_search.do", method = RequestMethod.POST)
	public View taskLog_search(HttpSession session, HttpServletRequest request, Principal principal, Model model) {
		// 로그인 id
		String emp_no = (String) session.getAttribute("emp_no");
		
		String key = request.getParameter("selectSearch");
		String value = request.getParameter("input");
		String cg_no = request.getParameter("cg_no");
		
		// 목록 가져오기
		List<Task> list = service.searchTask(emp_no, cg_no, key, value);

		model.addAttribute("searchList", list);

		return jsonview;
	}
}
