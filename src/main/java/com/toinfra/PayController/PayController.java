package com.toinfra.PayController;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import com.toinfra.Service.LoginService;
import com.toinfra.VO.EmpJoinEmp_Detail;
import com.toinfra.VO.Pay;
import com.toinfra.VO.PayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import com.toinfra.Service.LoginService;
import com.toinfra.Service.PayService;
import com.toinfra.VO.EmpJoinEmp_Detail;
import com.toinfra.VO.Pay;
import com.toinfra.VO.PayList;

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
		
		//급여 관리> 예상 급여 조회(개인) 
		@RequestMapping("/salarySearch.do")
		public String salarySearch(Principal principal, Model model){
			
			SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM", Locale.KOREA );
			Date currentTime = new Date( );
			String dTime = formatter.format ( currentTime );
			
			String id = principal.getName();
			 
			//아이디 통해 사번 얻어옴
		    EmpJoinEmp_Detail emp = loginservice.modifyInfo(id);
		    Pay list = payservice.selectPay_mine(emp.getEmp_no(), dTime);
		    model.addAttribute("list", list);
		    model.addAttribute("date", dTime);
		   
			return "salary.salarySearch";
		}
		
	    //급여 관리 > 급여 마감 관리
		@RequestMapping("/salaryClose.do")
		public String salaryClose(Model model){
			
			SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM", Locale.KOREA );
			Date currentTime = new Date( );
			String dTime = formatter.format ( currentTime );
			
			List<PayList> list = payservice.selectPay_all_Close(dTime);
			model.addAttribute("date", dTime);
			model.addAttribute("list", list);
			return "salary.salaryClose";
		}
	
		
		
		//급여 관리 > 퇴직금 계산
		@RequestMapping("/severancepay.do")
		public String severancepay(){
			return "salary.severancepay";
		}
}
