package kr.or.epm.AjaxController;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.json.JsonArray;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.View;

import jdk.nashorn.internal.runtime.JSONFunctions;
import kr.or.epm.Service.CommonService;
import kr.or.epm.Service.EmployeeRoleManageService;
import kr.or.epm.Service.TaskService;
import kr.or.epm.VO.Emp_role;
import kr.or.epm.VO.Task;
import net.sf.json.JSONArray;

/*
 * 작성자 : 백승아
 * 작성일 : 2016-11-23
 * 사용목적 : 업무 Ajax 컨트롤러
 * 
*/

@Controller
public class TaskAjaxController {

	@Autowired
	private View jsonview;

	@Autowired
	private TaskService service;
	
	@Autowired
	private CommonService commonservice;

	// 업무 > 수신 > 중요 설정하기
	@RequestMapping("/taskSign")
	public View taskSign(String task_no, String sign, Model model) {

		System.out.println("CONTROLLER] 업무 요청 수신 > 중요 설정하기");
		System.out.println("선택한 업무 번호 : " + task_no);
		System.out.println("선택한 중요설정 : " + sign);

		// redirect
		String link = "taskRequest.do";
		String msg = null;

		int result = 0;
		try {
			result = service.updateTask_sign(task_no, sign);
		} catch (Exception e) {
			e.getMessage();
		} finally {
			if (result > 0) {
				msg = "중요 설정 처리에 성공하였습니다";
			} else {
				msg = "중요 설정 처리에 실패하였습니다";
			}
		}

		model.addAttribute("link", link);
		model.addAttribute("msg", msg);

		return jsonview;
	}

	// 검색하기
	@RequestMapping(value = "/task_search.do", method = RequestMethod.POST)
	public View taskLog_search(HttpServletRequest request, Principal principal, Model model) {

		System.out.println("CONTROLLER] 검색을 시작합니다");

		// 로그인 id
		String id = principal.getName();
		System.out.println("id : " + id);
		String emp_no = commonservice.selectEmp_no(id);
		System.out.println("로그인한 사원의 emp_no : " + emp_no);

		String key = request.getParameter("selectSearch");
		String value = request.getParameter("input");
		String cg_no = request.getParameter("cg_no");

		System.out.println("cg_no : " + cg_no);

		System.out.println("검색  기준 : " + key + " // 검색 값 : " + value);

		// 목록 가져오기
		List<Task> list = service.searchTask(emp_no, cg_no, key, value);

		model.addAttribute("searchList", list);

		return jsonview;
	}
}
