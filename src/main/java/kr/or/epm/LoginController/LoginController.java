package kr.or.epm.LoginController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/*
 * 작성일 : 2016-10-27
 * 작성자 : 박성준
 * 목  적 : 로그인 관련 컨트롤러. 
 * 
 */


@Controller
public class LoginController {

	@RequestMapping(value="/Login.do", method=RequestMethod.GET)
	public String Login(){
		System.out.println("로그인");
		return "login/Login";
	}
	
	@RequestMapping(value="/Login.do", method=RequestMethod.POST)
	public String LoginResult(String username){
		System.out.println("로그인 리절트 : "+username);
		if(username.equals("admin")){
			return "index";
		}else{
			return null;
		}
		
	}
		
	@RequestMapping("/AddMember.do")
	public String AddMember(){
		System.out.println("회원 가입");
		return "AddMember";
	}
	
	
}
