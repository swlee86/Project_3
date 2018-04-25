package com.toinfra.AjaxController;

import java.security.Principal;
import java.util.List;

import com.toinfra.Service.ProjectService;
import com.toinfra.DTO.Pj;
import com.toinfra.Util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

import com.toinfra.Service.CommonService;

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
	
	@RequestMapping(value={"/projectcalendarData.do"}, method=RequestMethod.GET)
	public View CalendarData(Principal principal, Model model){
		String id= principal.getName();
		if(Util.isEmpty(id)){

		}else{
			String user_id = commonservice.selectEmp_no(id);
			//내가 쓴것들만 뽑아냄
			List<Pj> result = projectservice.selectPj_callendar(user_id);

			model.addAttribute("wlist", result);
			//내가 참여자로 된 것.
			model.addAttribute("user_id", user_id);
			model.addAttribute("list",result);
		}

		return jsonview;
	}
	
}
