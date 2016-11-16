package kr.or.epm.AjaxController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import kr.or.epm.Service.RegisterService;

@Controller
public class AjaxController {
	
	@Autowired
	private View jsonview;
	
	@Autowired
	private RegisterService regiseterservice;
	
	
	
	@RequestMapping("/numchk.do")
	public View jsonkosta(String command , String emp_no , Model model){	
		System.out.println("Ajax Start");
		System.out.println(emp_no);
		String result = regiseterservice.selectEmpId(emp_no);
		String answer= null;
		System.out.println("사원번호 : " + result);
		if(!emp_no.equals(result)){
			answer="존재하지 않는 사번입니다.";
		}else{
			String idcheck = regiseterservice.selectUsedEmpno(result);
			if(idcheck!=null){
				answer="이미 가입된 사번입니다.";
			}else{
				answer="가입 가능한 사번입니다. 이후 가입을 진행해 주세요.";
			}
		}
		
		model.addAttribute("numcheck", answer);
		
		//private View jsonview 타입으로 리턴
		return jsonview; 
	}
	
}
