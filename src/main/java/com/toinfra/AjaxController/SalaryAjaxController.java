package com.toinfra.AjaxController;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import com.toinfra.Service.LoginService;
import com.toinfra.VO.EmpJoinEmp_Detail;
import com.toinfra.VO.Pay;
import org.springframework.beans.factory.annotation.Autowired;
/*
 *급여 페이지 ajax controller 
 * 
 * 
 * */
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

import com.toinfra.Service.LoginService;
import com.toinfra.Service.PayService;
import com.toinfra.VO.EmpJoinEmp_Detail;
import com.toinfra.VO.Pay;

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

	//급여관리 > 당월 예상 지급 급여 조회(개인)
	@RequestMapping("/salary_Re_allSearch.do")
	public View salary_Re_allSearch(Principal principal, Model model){
		
		SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM", Locale.KOREA );
		Date currentTime = new Date( );
		String dTime = formatter.format ( currentTime );
		
		String id = principal.getName();
	     
		//아이디 통해 사번 얻어옴
	    EmpJoinEmp_Detail emp = loginservice.modifyInfo(id);
	    Pay list = payservice.selectPay_mine(emp.getEmp_no(), dTime);
	    model.addAttribute("list", list);
	    model.addAttribute("date", dTime);
		
		return jsonview;
	}
	
	
	//급여 관리> 전체 급여 조회(개인) 
	@RequestMapping("/salary_allSearch.do")
	public View salary_allSearch(Principal principal, Model model){
		String id = principal.getName();
	     
		//아이디 통해 사번 얻어옴
	    EmpJoinEmp_Detail emp = loginservice.modifyInfo(id);
	    List<Pay> list = payservice.selectPay_mine_all(emp.getEmp_no());
	    model.addAttribute("list", list);
		
		return jsonview;
	}
	
	// 급여 관리> 월별 조회
	@RequestMapping("/MonthlysalSearch.do")
	public View MonthlySalary(Principal principal, Model model, String date) {

		String id = principal.getName();

		EmpJoinEmp_Detail emp = loginservice.modifyInfo(id);
		Pay monthly_pay = null;

		try {
			monthly_pay = payservice.selectPay_mine_Monthly(emp.getEmp_no(), date);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			model.addAttribute("payDTO", monthly_pay);
		}


		return jsonview;
	}

	// 연도별 급여 조회
	@RequestMapping("/YearlysalSearch.do")
	public View YearlysalarySearch(Principal principal, String date, Model model) {
		
		String id = principal.getName();
		EmpJoinEmp_Detail emp = loginservice.modifyInfo(id);
		
		List<Pay> Yearly_pay = null;
		
		try {
			Yearly_pay = payservice.selectPay_mine_Yearly(emp.getEmp_no(), date);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			model.addAttribute("YearlyPay", Yearly_pay);
		}
	 
		return jsonview;
	}
	
	//급여 관리 > 급여 마감 확정
			@RequestMapping(value="/SalaryCloseCheck.do", method=RequestMethod.POST)
			public String salaryCloseCheck(Model model, String pay_no2, String give_date){
				 
				SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM", Locale.KOREA );
				Date currentTime = new Date( );
				String dTime2 = formatter.format ( currentTime );
				
				String resultdate = dTime2+"-"+give_date;
				 String[] pay_no= pay_no2.split(",");
				 for(int i=0; i<pay_no.length; i++){
				 }
				
				int result=0;
				String link = null;
				String msg = null;
				try{
					for(int i=0; i<pay_no.length; i++){
					result = payservice.updatePay(pay_no[i], resultdate);
			
					}
					
				}catch (Exception e) {
					e.getMessage();
				}finally{
					if(result>0){
						link = "adminSalary.do";
						msg = "급여 마감이 완료되었습니다.";
					}else{
						link = "adminSalary.do";
						msg = "급여 마감에 실패하였습니다.";
					}
					model.addAttribute("link", link);
					model.addAttribute("msg", msg);
				}
				 
				return "salary.salaryClose_redirect";
			}
	
	
	
	
	// 퇴직금 조회
	@RequestMapping("/sevSearch.do")
	public View sevSearch(String select, String date, Principal principal, Model model, String minusDate) {
		System.out.println("select :" + select + "/date: " + date + " / 3개월 뺀 것 : "+minusDate);
		
		int year =0;
		int month=0;
		List<Pay> list = new ArrayList<Pay>();
		long diffDays=0;
		int sev=0;
		 
		String id = principal.getName();
		EmpJoinEmp_Detail emp = loginservice.modifyInfo(id);
		
		try{
		String[] selectdate =date.split("-");
		
		   month = Integer.parseInt(selectdate[1]);
		   String zeroDate = "";
					
		   if(month-3>0){
			  	for(int i=1; i<4; i++){
			   		
			  		int currentdate = month-i;
			   	
			  		if(currentdate < 10){
			   		 zeroDate = String.format("%02d", currentdate);
			   		}else{
			   			zeroDate = String.valueOf(currentdate);
			   		}
			   		
			   		String give_date=selectdate[0]+"-"+zeroDate;
			   		//최근 3개월 월별 급여 조회
			   		Pay pay = payservice.selectPay_mine_Monthly(emp.getEmp_no(), give_date);
			   		list.add(pay);
			   		
			   }
		    }
		   //재직일수
		   String regdate = payservice.selectRegdate(emp.getEmp_no());
		  
		   SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		   
		    Date beginDate = formatter.parse(regdate);
		    Date endDate = formatter.parse(date);
		 
		    long diff = endDate.getTime() - beginDate.getTime();
		    diffDays = diff / (24 * 60 * 60 * 1000);
	
		    //
		    int total_pay = 0;
			 for(int j=0; j<list.size(); j++){
				 total_pay +=list.get(j).getTotal_pay();
		     }
			 String minus = "";
			 minus = minusDate;
			 //3개월 뺀 것
			 int pyung = Integer.parseInt(minusDate);
			 //1일 평균 급여
			 int pyungMoney = (total_pay / pyung);
			 
			 //퇴직금
			 sev = (int) (pyungMoney*30*diffDays/365);
		
		}catch (Exception e) {
			e.getMessage();
		}finally {
			
			 
			 //퇴직금
			 model.addAttribute("dayMoney",sev);
			 //총근무일수
			 model.addAttribute("day", diffDays);
			 //선택한 정산일자
			 model.addAttribute("date", date);
			
		}
		
		return jsonview;
	}

}
