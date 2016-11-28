package kr.or.epm.AjaxController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProjectCallendarAjaxController {

	@RequestMapping("/projectCalendarAll.do")
	public String Callendar(){
		return "project.projectAllList_Callendar";
	}
	
}
