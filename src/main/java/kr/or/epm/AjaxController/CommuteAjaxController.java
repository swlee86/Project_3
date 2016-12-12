package kr.or.epm.AjaxController;


import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import kr.or.epm.Service.CommuteService;
import kr.or.epm.VO.Emp;


/*
 * 작성자 : 김주희
 * 작성일 : 2016-11-21
 * 사용목적 : 근태 ajax 컨트롤러
 * 
 */

@Controller
public class CommuteAjaxController {

	@Autowired
	private View jsonview;
	
	@Autowired
	private CommuteService commuteservice;
	
	//출근시간insert
	@RequestMapping("/insertCommute_in.do")
	public View InsertCommute_in(Principal principal, String in_time,Model model){
		String id= principal.getName();
		Emp emp = commuteservice.selectInfoSearch(id);  
		
		int result = commuteservice.insertCommute_in(in_time,emp.getEmp_no());
		
		model.addAttribute("emp",emp);
		model.addAttribute("result",result);
		return jsonview;
	}
	
	//퇴근시간update
	@RequestMapping("/updateCommute_out.do")
	public View UpdateCommute_out(HttpServletRequest request, String out_time,String emp_no){
		HttpSession session = request.getSession();
	    String emp_no_b = (String)session.getAttribute("emp_no");
		int result = commuteservice.updateCommute_out(out_time,emp_no_b);
		return jsonview;
	}
	
	//근무시간update
	@RequestMapping("/updateCommute_commutetime.do")
	public View UpdateCommute_commutetime(HttpServletRequest request,String commute_time,String emp_no,Model model){
		HttpSession session = request.getSession();
	    String emp_no_b = (String)session.getAttribute("emp_no");
		
		int result = commuteservice.updateCommute_time(commute_time,emp_no_b);
		model.addAttribute("emp_no",emp_no_b);
		return jsonview;
	}
	
	//추가시간update
	@RequestMapping("/updateCommute_add.do")
	public View UpdateCommute_add(String emp_no){
		int result = commuteservice.updateCommute_add(emp_no);
		return jsonview;
	}
	
	//누적시간update
	@RequestMapping("/updateCommute_acc.do")
	public View UpdateCommute_acc(String emp_no){
		int result = commuteservice.updateCommute_acc(emp_no);
		return jsonview;
	}
}
