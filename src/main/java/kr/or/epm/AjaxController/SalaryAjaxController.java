package kr.or.epm.AjaxController;

import java.security.Principal;
import java.util.ArrayList;
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

	// 로그인 정보 가져오기 위한 것.
	@Autowired
	private LoginService loginservice;

	@Autowired
	private View jsonview;

	// 급여 관리> 월별 조회
	@RequestMapping("/MonthlysalSearch.do")
	public View MonthlySalary(Principal principal, Model model, String date) {

		String id = principal.getName();
		System.out.println(" ajax controller 아이디  : " + id);

		EmpJoinEmp_Detail emp = loginservice.modifyInfo(id);
		System.out.println("서비스 전 : " + emp.getEmp_no());
		Pay monthly_pay = null;

		try {
			monthly_pay = payservice.selectPay_mine_Monthly(emp.getEmp_no(), date);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			model.addAttribute("payDTO", monthly_pay);
		}

		System.out.println("결과 ajax controller: " + monthly_pay.toString());

		return jsonview;
	}

	// 연도별 급여 조회
	@RequestMapping("/YearlysalSearch.do")
	public View YearlysalarySearch(Principal principal, String date, Model model) {
		System.out.println("연도별 date :" + date);
		
		String id = principal.getName();
		EmpJoinEmp_Detail emp = loginservice.modifyInfo(id);
		
		List<Pay> Yearly_pay = null;
		
		try {
			Yearly_pay = payservice.selectPay_mine_Yearly(emp.getEmp_no(), date);
			System.out.println("연도별 급여 조회 list: "+Yearly_pay.size());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			model.addAttribute("YearlyPay", Yearly_pay);
		}
	 
		return jsonview;
	}

	// 퇴직금 조회
	@RequestMapping("/sevSearch.do")
	public View sevSearch(String select, String date, Principal principal, Model model, String minusDate) {
		System.out.println("select :" + select + "/date: " + date + " / 3개월 뺀 것 : "+minusDate);
		
		int year =0;
		int month=0;
		List<Pay> list = new ArrayList<Pay>();
		
		String id = principal.getName();
		EmpJoinEmp_Detail emp = loginservice.modifyInfo(id);
		
		try{
		String[] selectdate =date.split("-");
		
		
		//System.out.println("split : "+selectdate[i]);
		   month = Integer.parseInt(selectdate[1]);
		   System.out.println("선택한 월 : "+month);
		   String zeroDate = "";
					
		   if(month-3>0){
			  	for(int i=1; i<4; i++){
			   		
			  		int currentdate = month-i;
			   	
			  		if(currentdate < 10){
			   		 zeroDate = String.format("%02d", currentdate);
			   		//System.out.println("0붙었나??"+zeroDate);
			   		}else{
			   			zeroDate = String.valueOf(currentdate);
			   		}
			   		
			   		String give_date=selectdate[0]+"-"+zeroDate;
			   		//System.out.println("give_date: "+give_date);
			   		Pay pay = payservice.selectPay_mine_Monthly(emp.getEmp_no(), give_date);
			   		list.add(pay);
			   		
			   }
		    }
		    
		
		
		}catch (Exception e) {
			e.getMessage();
		}finally {
			int total_pay = 0;
			 for(int j=0; j<list.size(); j++){
				 total_pay +=list.get(j).getTotal_pay();
		    	 System.out.println("list size: "+list.size());
		    	 System.out.println("3개월 총급여: "+total_pay);
		     }
			 String minus = "";
			 minus = minusDate;
			 //3개월 뺀 것
			 int pyung = Integer.parseInt(minusDate);
			 System.out.println("finally$#@ : "+pyung);
			 int pyungMoney = (total_pay / pyung);
			 System.out.println("하루 평균 급여 "+pyungMoney+" 만원");
			//model.addAttribute("list", list);
			//model.addAttribute("date", date);
			//System.out.println("list size: "+list.size());
		}
		
		return jsonview;
	}

}
