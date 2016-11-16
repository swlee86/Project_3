package kr.or.epm.AjaxController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import kr.or.epm.Service.RegisterService;

@Controller
public class RegisterAjaxController {
	
	@Autowired
	private View jsonview;
	
	@Autowired
	private RegisterService regiseterservice;
	
	
	//회원 가입에서 번호 체크시 작동
	@RequestMapping("/numchk.do")
	public View numchk(String emp_no , Model model){	
		System.out.println("numchk Ajax Start");
		System.out.println(emp_no);
		String result = regiseterservice.selectEmpId(emp_no);
		String answer= null;
		System.out.println("사원번호 : " + result);
		if(!emp_no.equals(result)){
			answer="존재하지 않는 사번입니다.";
		}else{
			String numchk = regiseterservice.selectUsedEmpno(result);
			if(numchk!=null){
				answer="이미 가입된 사번입니다.";
			}else{
				answer="가입 가능한 사번입니다. 이후 가입을 진행해 주세요.";
			}
		}
		
		model.addAttribute("numcheck", answer);
		
		//private View jsonview 타입으로 리턴
		return jsonview; 
	}
	
	//회원 가입에서 아이디 체크 버튼시 작동
	@RequestMapping("/idchk.do")
	public View idchk(String id , Model model){	
		System.out.println("idchk Ajax Start");
		System.out.println(id);
		String idcheck = regiseterservice.selectUsedId(id);
		String answer= null;
		System.out.println("idchkdata : " + idcheck);
		if(idcheck!=null){
			answer="존재하는 아이디입니다. 다른 아이디를 선택해 주세요.";
		}else{
			answer="사용 가능한 아이디입니다. 계속 진행해 주세요";
		}
		model.addAttribute("idcheck", answer);
		
		//private View jsonview 타입으로 리턴
		return jsonview; 
	}
	
}
