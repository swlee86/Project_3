package kr.or.epm.ScheduleController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ScheduleController {

	@RequestMapping("/listSchedule.do")
	public String listSchedule(){
		return "schedule.list_schedule";
	}
	
}
