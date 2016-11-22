package kr.or.epm.AjaxController;

import java.util.ArrayList;
import java.util.List;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.View;

import kr.or.epm.Service.EmployeeRoleManageService;
import kr.or.epm.VO.Emp_role;

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
	@RequestMapping(value="/give_authority.do", method=RequestMethod.POST)
	public View adminEmployeeRoleGive(@RequestParam(value="data") List<Emp_role> params, Model model) {
		System.out.println("########## 사원에게 권한을 부여합니다");
		System.out.println(params.toString());
		
		//List<Emp_role> list = new ArrayList<Emp_role>();
		//list.add(checkboxValues);
		
		//for (Emp_role emp_role : list) {
		//	System.out.println("emp_name : " +emp_role.getRole_name());
		//	System.out.println("emp_role : " +emp_role.getRole_no());
		//	System.out.println("emp_no : " +emp_role.getEmp_no());
		//}
		
		/*
		int result = 0;

		System.out.println("찍어보자" + checkboxValues[0].toString());

		for (int i = 0; i < checkboxValues.length; i++) {
			try {
				result = employeeRoleManage.updateEmpRole();
			} catch (Exception e) {
				e.getMessage();
			} finally {
				if (result > 0) {
					System.out.println("########## 사원에게 권한 부여 성공");
				} else {
					System.out.println("########## ERROR");
				}
			}
		}

		model.addAttribute("result",result);*/
		return jsonview;
	}
}