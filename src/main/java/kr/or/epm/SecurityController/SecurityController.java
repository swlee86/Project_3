package kr.or.epm.SecurityController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SecurityController {

	//로그인시 로그인이 필요한 메뉴 접근시
	@RequestMapping("secure_Login.do")
	public String indexview() {
		System.out.println("컨트롤러 확인");
		return "login/login_secure";
	}
}
