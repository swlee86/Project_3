package kr.or.epm.LoginController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/*
 * 작성일 : 2016-10-27
 * 작성자 : 박성준
 * 목  적 : 로그인 관련 컨트롤러. 
 * 
 */


@Controller
public class LoginController {

	@RequestMapping("/AddMember.do")
	public String AddMember(){
		System.out.println("회원 가입");
		return "AddMember";
	}
	
	
}
