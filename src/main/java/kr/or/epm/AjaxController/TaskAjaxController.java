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

	// 업무 삭제하기
	@RequestMapping(value = "/task_remove.do", method = RequestMethod.POST)
	public View task_remove(String[] arr) {

		System.out.println("업무를 삭제합니다");
		String str = request.getParameter("arr");
		System.out.println("str : " + str);
		
		for(String task_no : str) {
			service.deleteTask(task_no);
		}
		
		return jsonview;
	}
	
}
