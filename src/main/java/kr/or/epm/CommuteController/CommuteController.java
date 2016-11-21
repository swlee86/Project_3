package kr.or.epm.CommuteController;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.epm.Service.CommuteService;

import kr.or.epm.VO.Commute;
/*
 * 작성자 : 김주희
 * 작성일 : 2016-11-21
 * 목  적 : Commute 컨트롤러 (근태)
 */

@Controller
public class CommuteController {
	
	@Autowired
	private CommuteService commuteservice;
	
	//일일 근태 등록 페이지로 이동
	@RequestMapping("/Commute.do")
	public String Commute(HttpServletRequest request, Model model){
		String ip =request.getRemoteAddr();
		System.out.println("나의 아이피 : "+ip);
		
		Commute commute =null;
		
		String emp_no = "91001050";
		commute =  commuteservice.selectCommute_today(emp_no); // 임시로 emp_no를 91001050로 테스트
		
		model.addAttribute("commute",commute);
		model.addAttribute("ip",ip);
		
		return "commute.TimeCommuteMainView";
	}
		
	//월별 근태 보기(월별 근태 조회페이지)
	@RequestMapping("/CommuteMonth.do")
	public String CommuteMonth(){
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
