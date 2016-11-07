package kr.or.epm.AjaxController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

@Controller
public class AjaxController {
	
	@Autowired
	private View jsonview;
	
	@RequestMapping("/idchk.do")
	public View jsonkosta(String command , String userid , Model model){
		System.out.println("command : " + command);
		System.out.println("name : " + userid);
		String result = null;
		if(userid.equals("test")||userid.equals("admin")){
			result="이미 존재하는 아이디입니다";
		}else{
			result="사용하실 수 있는 아이디입니다";
		}
		
		model.addAttribute("idcheck", result);
		
		return jsonview;  //private View jsonview 타입으로 리턴
	}

}
