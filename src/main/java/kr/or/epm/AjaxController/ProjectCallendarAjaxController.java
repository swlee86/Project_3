package kr.or.epm.AjaxController;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import kr.or.epm.Service.CommonService;
import kr.or.epm.Service.ProjectService;
import kr.or.epm.VO.Pj;

@Controller
public class ProjectCallendarAjaxController {

	@Autowired
	private ProjectService projectservice;
	
	@Autowired
	private CommonService commonservice; 
	
	@Autowired
	private View jsonview;
	
	//프로젝트 > 일정보기 버튼 클릭 > db 받아오기
	@RequestMapping("/projectCalendarAll.do")
	public String Callendar(Principal principal,Model model){
		
		return "project.projectAllList_Callendar";
	}
	
	@RequestMapping("/projectcalendarData.do")
	public View CalendarData(Principal principal, Model model){
		String id= principal.getName();
		String emp_no = commonservice.selectEmp_no(id);
		//내가 쓴것들만 뽑아냄
		List<Pj> result = projectservice.selectPj_callendar(emp_no);
		
		model.addAttribute("wlist", result);
		//내가 참여자로 된 것.
		model.addAttribute("emp_no", emp_no);
		model.addAttribute("list",result);
		return jsonview;
	}
	
}
