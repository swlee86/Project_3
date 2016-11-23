package kr.or.epm.AjaxController;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.View;

import com.fasterxml.jackson.core.JsonParser;

import kr.or.epm.Service.EmployeeRoleManageService;
import kr.or.epm.VO.Emp_role;
import net.sf.json.JSONArray;

/*
 * 작성자 : 백승아
 * 작성일 : 2016-11-22
 * 사용목적 : 관리자 권한부여 Ajax 컨트롤러
 * 
 */

@Controller
public class EmployeeRoleManageAjaxController {

	@Autowired
	private View jsonview;

	@Autowired
	private EmployeeRoleManageService employeeRoleManage;

	// 관리자 > 회원관리 > 사원 권한 부여 페이지 > 사원 권한 부여하기
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/give_authority.do", method=RequestMethod.POST)
	@ResponseBody
	public View adminEmployeeRoleGive(HttpServletRequest request) {
		String param = request.getParameter("param");
		System.out.println("########## 사원에게 권한을 부여합니다"+param.toString());
		
		JSONArray jsonArray = new JSONArray();
		jsonArray.add(param);
		
		for (Object object : jsonArray) {
			System.out.println(object.toString());
		}
		List<Emp_role> list = new ArrayList<Emp_role>();
		
		
		return jsonview;
	}
}
