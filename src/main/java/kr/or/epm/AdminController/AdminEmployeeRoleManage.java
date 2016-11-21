package kr.or.epm.AdminController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminEmployeeRoleManage {
	
	//관리자 > 회원관리 > 사원 권한 부여 페이지
	@RequestMapping("/adminEmployeeRoleManage.do")
	public String adminEmployeeRoleManage(){			
		return "admin.adminEmployeeRoleManage";
	}	
}
