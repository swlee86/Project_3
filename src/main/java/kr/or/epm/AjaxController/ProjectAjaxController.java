package kr.or.epm.AjaxController;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import kr.or.epm.Service.ProjectDetailService;
import kr.or.epm.Service.ProjectService;
import kr.or.epm.VO.Pj;
import kr.or.epm.VO.Pjd_people;

/*
 * 작성자 : 김주희
 * 작성일 : 2016-11-23
 * 사용목적 : Project 관련 ajax 컨트롤러
 * 
 */

@Controller
public class ProjectAjaxController {

	@Autowired
	private View jsonview;
	@Autowired
	private ProjectService projectservice;
	@Autowired
	private ProjectDetailService projectdetailservice;
	
	//리스트에서 선택한 옵션으로 view 동기화시키기
	@RequestMapping("/select_pjlist.do")
	public View select_pjlist(String select_ctg, String emp_no , Model model){	
		System.out.println("select_pjlist Start");
		emp_no="91001031"; // 임시로

		List<Pj> result = projectservice.selectPjlist_ctg(select_ctg, emp_no);
		model.addAttribute("project", result);
		
		return jsonview; 
	}
	
	//참여자 자세히 보기(modal)
	@RequestMapping("/pjd_people.do")
	public View pjd_people(String emp_no, Model model){
		System.out.println("pjd_people");
			
		Pjd_people result = projectdetailservice.pjd_people(emp_no);

		model.addAttribute("data",result);
		
		return jsonview; 
	}
}
