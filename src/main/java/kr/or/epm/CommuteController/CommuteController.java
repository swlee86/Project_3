package kr.or.epm.CommuteController;


import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import kr.or.epm.Service.CommuteService;

import kr.or.epm.VO.Commute;
/*
 * 작성자 : 김주희
 * 작성일 : 2016-11-21
 * 목  적 : Commute 컨트롤러 (근태)
 */
import kr.or.epm.VO.Emp;

@Controller
public class CommuteController {
	
	@Autowired
	private CommuteService commuteservice;
	
	//일일 근태 등록 페이지로 이동
	@RequestMapping("/Commute.do")
	public String Commute(Principal principal, HttpServletRequest request, Model model){
		String ip =request.getRemoteAddr();

		System.out.println("나의 아이피 : "+ip);
		
		Commute commute =null;
		
		String id= principal.getName();
		System.out.println("id : "+id);
		Emp emp = commuteservice.selectInfoSearch(id);
		
		String emp_no = emp.getEmp_no();
		commute =  commuteservice.selectCommute_today(emp_no); // 임시로 emp_no를 91001050로 테스트
		if(commute == null){
			System.out.println("null임");
			commute = commuteservice.selectempinfo(emp_no);			
		}else{
			System.out.println("null아님");
		}
		
		model.addAttribute("commute",commute);
		model.addAttribute("ip",ip);
		
		return "commute.TimeCommuteMainView";
	}
		
	//월별 근태 보기(월별 근태 조회페이지)
	@RequestMapping("/CommuteMonth.do")
	public String CommuteMonth(Principal principal, HttpServletRequest request, String select_date, Model model){
		
		String id= principal.getName();
		System.out.println("id : "+id);
		Emp emp = commuteservice.selectInfoSearch(id);
		
		String emp_no = emp.getEmp_no(); // 테스트용

		
		String ip =request.getRemoteAddr();
	
		
		String select_year=null; 
		String select_month=null;
		if(select_date!=null){
			String arrtemp[] = select_date.split("-");	
			select_year =arrtemp[0];
			select_month =arrtemp[1];
		}else{
			if(select_year ==null){
				Calendar cal = Calendar.getInstance();
				SimpleDateFormat format = new SimpleDateFormat("yyyy");
				select_year = format.format(cal.getTime()); 
			}
			if(select_month ==null){
				Calendar cal = Calendar.getInstance();
				SimpleDateFormat format = new SimpleDateFormat("MM");
				select_month = format.format(cal.getTime()); 
			}
		}
		
		List<Commute> CommuteList =null;
		
		CommuteList =  commuteservice.selectCommute_month(emp_no, select_month, select_year); 
		
		model.addAttribute("select_year",select_year);
		model.addAttribute("select_month",select_month);
		model.addAttribute("CommuteList",CommuteList);
		model.addAttribute("ip",ip);
		
		return "commute.MonthCommuteView";
	}
		
	//근태 신청서 쓰기
	@RequestMapping("/CommuteWrite.do")
	public String CommuteWrite(){
		return "commute.CommuteWriteView";
	}
		
	//각기 다른 근태 보기
	@RequestMapping("/CommuteOther.do")
	public String CommuteOther(){
		return "commute.CommuteOtherView";
	}
	

}
