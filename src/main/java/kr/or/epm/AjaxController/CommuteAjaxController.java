package kr.or.epm.AjaxController;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import kr.or.epm.Service.CommuteService;
import kr.or.epm.VO.Commute;
import kr.or.epm.VO.Set_time;


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
	public View InsertCommute_in(String in_time,String emp_no){
		int result = commuteservice.insertCommute_in(in_time,emp_no);
		System.out.println("결과 : "+result);
		return jsonview;
	}
	
	//퇴근시간update
	@RequestMapping("/updateCommute_out.do")
	public View UpdateCommute_out(String out_time,String emp_no){
		int result = commuteservice.updateCommute_out(out_time,emp_no);
		System.out.println("결과 : "+result);
		return jsonview;
	}
	
	//근무시간update
	@RequestMapping("/updateCommute_commutetime.do")
	public View UpdateCommute_commutetime(String commute_time,String emp_no){
		int result = commuteservice.updateCommute_time(commute_time,emp_no);
		System.out.println("결과 : "+result);
		return jsonview;
	}
	
	//추가시간update
	@RequestMapping("/updateCommute_add.do")
	public View UpdateCommute_add(String emp_no){
		int i = commuteservice.updateCommute_add(emp_no);
		//System.out.println("결과 : "+result);
		return jsonview;
	}
	
	//누적시간update
	@RequestMapping("/updateCommute_acc.do")
	public View UpdateCommute_acc(String emp_no){
		int i = commuteservice.updateCommute_acc(emp_no);
		//System.out.println("결과 : "+result);
		return jsonview;
	}
}
