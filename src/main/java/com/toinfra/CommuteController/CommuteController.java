package com.toinfra.CommuteController;


import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.toinfra.Service.CommuteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.toinfra.Service.CommuteService;
import com.toinfra.Service.PayService;
import com.toinfra.VO.Commute;
/*
 * 작성자 : 김주희
 * 작성일 : 2016-11-21
 * 목  적 : Commute 컨트롤러 (근태)
 */
import net.sf.json.JSONObject;

@Controller
public class CommuteController {
	
	@Autowired
	private CommuteService commuteservice;
	
	@Autowired
	private PayService payservice;
	
	//일일 근태 등록 페이지로 이동
	@RequestMapping("/Commute.do")
	public String Commute(HttpServletRequest request, Model model){
	
		Commute commute =null;
		
		HttpSession session = request.getSession();
	    String emp_no = (String)session.getAttribute("emp_no");
	    
		commute =  commuteservice.selectCommute_today(emp_no);
		if(commute == null){
			commute = commuteservice.selectempinfo(emp_no);			
		}else{
		}
		
		//근태 chart : 최근 7일의 정상근무시간, 추가근무시간
		JSONObject chartcommute = null;
		chartcommute = commuteservice.selectChartCommute(emp_no);
		
		model.addAttribute("chartcommute",chartcommute);
		model.addAttribute("commute",commute);
		
		return "commute.TimeCommuteMainView";
	}
		
	//월별 근태 보기(월별 근태 조회페이지)
	@RequestMapping("/CommuteMonth.do")
	public String CommuteMonth(HttpServletRequest request, String select_date, Model model){
		HttpSession session = request.getSession();
	    String emp_no = (String)session.getAttribute("emp_no");
	    		
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
