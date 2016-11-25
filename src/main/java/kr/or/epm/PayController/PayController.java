package kr.or.epm.PayController;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import kr.or.epm.Service.LoginService;
import kr.or.epm.Service.PayService;
import kr.or.epm.VO.EmpJoinEmp_Detail;
import kr.or.epm.VO.Pay;

/*
 * 작성자 : 하재현
 * 작성일 : 2016-11-23
 * 목  적 : 급여 관리 메뉴 컨트롤러 
 * */
@Controller
public class PayController {

	@Autowired
	private PayService payservice;
	
	//로그인 정보 가져오기 위한 것.
    @Autowired 
    private LoginService loginservice;
    
    @Autowired
    private View jsonview;
	
	//급여 관리 > 급여 항목 설정
		@RequestMapping("/salarySetting.do")
		public String salrySetting(){
			return "salary.salarySetting";
		}
		
		//급여 관리> 급여 조회(개인) 
		@RequestMapping("/salarySearch.do")
		public String salarySearch(Principal principal, Model model){
			String id = principal.getName();
			System.out.println("아이디  : "+id);
		     
			//아이디 통해 사번 얻어옴
		    EmpJoinEmp_Detail emp = loginservice.modifyInfo(id);
		    List<Pay> list = payservice.selectPay_mine_all(emp.getEmp_no());
		    model.addAttribute("list", list);
			
			return "salary.salarySearch";
		}
	
		
		//급여 관리 > 퇴직금 계산
		@RequestMapping("/severancepay.do")
		public String severancepay(){
			return "salary.severancepay";
		}
}
