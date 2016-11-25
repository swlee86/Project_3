package kr.or.epm.AjaxController;

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
import kr.or.epm.Service.EmployeeRoleManageService;
import kr.or.epm.Service.TaskService;
import kr.or.epm.VO.Emp_role;
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
}
