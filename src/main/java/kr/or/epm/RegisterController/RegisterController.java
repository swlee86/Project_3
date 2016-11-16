package kr.or.epm.RegisterController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import kr.or.epm.Service.RegisterService;
import kr.or.epm.VO.Emp;


/*
 * 작성일 : 2016-11-16
 * 작성자 : 이상원
 * 목  적 : 회원 가입  관련 처리 컨트롤러. 
 * 
 */

@Controller
public class RegisterController {

	@Autowired
	private RegisterService registerservice;
	
	@RequestMapping("/addMember.do")
	public String addMember(){
		System.out.println("회원 가입");
		return "register.addMember";
	}
	
	
	@RequestMapping("/adminAddMember.do")
	public String insertEmp(Emp emp, Model mv){
		System.out.println(emp.toString());
		int result = registerservice.insertEmp(emp);
		String answer = null;
		String data = null;
		if(result>0){
			System.out.println("반영 성공");
			answer = "admin/redirect";
			data = "사원정보 등록에 성공하였습니다.";
		}else{
			System.out.println("반영 실패");
			answer = "admin/redirect";
			data = "사원정보 등록에 실패 하였습니다.";
		}
		mv.addAttribute("data", data);
		System.out.println(data);
		return answer;
	}
	
	
}
