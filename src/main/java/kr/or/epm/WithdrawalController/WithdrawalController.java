package kr.or.epm.WithdrawalController;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
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

	// 탈퇴 페이지
	@RequestMapping(value="/withdrawal.do", method=RequestMethod.GET)
	public String withdrawal(Principal principal, Model model) {
		System.out.println("CONTROLLER] 회원 탈퇴 페이지를 불러옵니다");

		// 로그인 id
		String id = principal.getName();
		System.out.println("id : " + id);
		String emp_no = commonservice.selectEmp_no(id);
		System.out.println("로그인한 사원의 emp_no : " + emp_no);

		model.addAttribute("id", id);
		model.addAttribute("emp_no", emp_no);

		return "withdrawal.withdrawal";
	}
	
	// 탈퇴
	@RequestMapping(value="/withdrawal.do", method=RequestMethod.POST)
	public String withdrawalOk(String emp_no, Model model) {
		System.out.println("CONTROLLER] 회원 탈퇴 요청 처리");
		System.out.println("받아온 emp_no : " + emp_no);
		String link = "index.do";
		
		int result = 0;
		result = service.updateWithdrawal(emp_no);
		
		return "withdrawal.withdrawal_redirect";
	}
}
