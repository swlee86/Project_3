package kr.or.epm.LoginController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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


	
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String loginview(){
		System.out.println("로그인");
		return "login.login";
	}
	
	/*@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String loginResult(String username){
		System.out.println("로그인 리절트 : "+username);
		if(username.equals("admin")){
			System.out.println("어드민 로그인");
			return "home.index";
		}else{
			return null;
		}
		
	}*/
		
	
	
}
