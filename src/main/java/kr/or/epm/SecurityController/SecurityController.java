package kr.or.epm.SecurityController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SecurityController {

	//로그인시 로그인이 필요한 메뉴 접근시
	@RequestMapping("/login.htm")
	public String loginView(){
		System.out.println("login_secure 작동");
		return "login/login_secure";
	}
	
}
