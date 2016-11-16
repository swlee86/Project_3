package kr.or.epm.RegisterController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
	public String insertEmp(Emp emp, ModelAndView mv){
		System.out.println(emp.toString());
		int result = registerservice.insertEmp(emp);
		String answer = null;
		String data = null;
		if(result>0){
			answer="admin/redirect";
			data = "사원 기본정보 등록이 완료 되었습니다";
		}else{
			answer="admin/redirect";
			data= "사원 기본정보 등록에 실패하였습니다.";
			
		}
		mv.addObject("data", data);
		return answer;
	}
	
	
}
