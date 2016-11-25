package kr.or.epm.AjaxController;
import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
/*
 *급여 페이지 ajax controller 
 * 
 * 
 * */
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
 * 작성일 : 2016-11-16
 * 목  적 : 급여 관리 메뉴 컨트롤러 
 * */
@Controller
public class SalaryAjaxController {

	@Autowired
	private PayService payservice;
	
	//로그인 정보 가져오기 위한 것.
    @Autowired 
    private LoginService loginservice;
	
	@Autowired
	private View jsonview;
	
	//급여 관리> 월별 조회
	@RequestMapping("/MonthlysalSearch.do")
	public View MonthlySalary(Principal principal, Model model, String date){
		
		String id = principal.getName();
		System.out.println(" ajax controller 아이디  : "+id);
	     
		//아이디 통해 사번 얻어옴
	    EmpJoinEmp_Detail emp = loginservice.modifyInfo(id);
	    List<String> give_date = payservice.selectGive_date(emp.getEmp_no());
	    System.out.println(give_date.get(0));
		//Pay monthly_pay = payservice.selectPay_mine_Monthly(emp.getEmp_no(), give_date);
		//model.addAttribute("list", monthly_pay);
		//System.out.println("월별 조회: "+monthly_pay.toString());
		return jsonview;
	}
		//연도별 급여 조회
		@RequestMapping("/YearlysalSearch.do")
		public View YearlysalarySearch(String date, String option, Model model){
			System.out.println("연도별 date :"+date+ "/ select: "+option );
			model.addAttribute("date", date);
			return jsonview;
		}
		
		//퇴직금 조회
		@RequestMapping("/sevSearch.do")
		public View sevSearch(String select, String date, Model model){
			System.out.println("select :"+select +"/date: "+date);
			model.addAttribute("select", select);
			return jsonview;
		}
	
	
}
