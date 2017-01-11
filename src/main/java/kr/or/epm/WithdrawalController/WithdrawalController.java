package kr.or.epm.WithdrawalController;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.epm.Service.CommonService;
import kr.or.epm.Service.WithdrawalService;

@Controller
public class WithdrawalController {

	@Autowired
	private CommonService commonservice;
	
	@Autowired
	private WithdrawalService service;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	// 탈퇴 페이지
	@RequestMapping(value="/withdrawal.do", method=RequestMethod.GET)
	public String withdrawal(Principal principal, Model model) {
		
		// 로그인 id
		String id = principal.getName();
		String emp_no = commonservice.selectEmp_no(id);
		
		model.addAttribute("id", id);
		model.addAttribute("emp_no", emp_no);

		return "withdrawal.withdrawal";
	}
	
	// 탈퇴
	@RequestMapping(value="/withdrawal.do", method=RequestMethod.POST)
	public String withdrawalOk(HttpServletRequest request,  String pwd, Model model) {
		
		HttpSession session = request.getSession();
	    String emp_no = (String)session.getAttribute("emp_no");
	      
		
		String bPwd = this.bCryptPasswordEncoder.encode(pwd);

		String link = "index.do";
		String msg = "";
		int result = 0;
		
		String pw = service.getPw(emp_no);
		
		boolean bresult = bCryptPasswordEncoder.matches(pwd, pw);
		
		System.out.println("bresult : "+ bresult);
				
		
		
		if(bresult == true ){
			result = service.updateWithdrawal(emp_no);
			link = "index.html";
			msg ="탈퇴요청되었습니다";
		}else{
			link = "withdrawal.do";
			msg ="탈퇴요청 실패하였습니다";
		}
		model.addAttribute("link", link);
		model.addAttribute("msg",msg);
		
		
		return "withdrawal.withdrawal_redirect";
	}
}
