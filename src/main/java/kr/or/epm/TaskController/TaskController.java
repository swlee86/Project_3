package kr.or.epm.TaskController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.epm.Service.TaskService;

/*
 * 작성자 : 박성준
 * 작성일 : 2016-11-21
 * 목   적 : 업무 관련 컨트롤러
 */

@Controller
public class TaskController {

	@Autowired
	private TaskService service;

	// 업무 > 업무 등록 페이지 이동
	@RequestMapping(value = "/taskWrite.do", method = RequestMethod.GET)
	public String taskWrite() {
		return "task.taskWrite";
	}

	// 업무 > 업무 등록 페이지
	@RequestMapping(value = "/taskWrite.do", method = RequestMethod.POST)
	public String taskWriteResult(){
		
		return null;
	}
	
	

	//업무 > 업무 요청 페이지 이동 
	@RequestMapping("/taskRequest.do")
	public String taskRequest(){
		return "task.taskRequest";
	}

	//업무요청 > 업무요청 수신 > 상세페이지
	@RequestMapping("/taskRequest_Receive_Detail.do")
	public String taskRequest_Receive_Detail(){
		return "task.taskRequest_Receive_Detail";
	}
	
	//업무 요청 > 업무요청 송신 > 상세페이지
	@RequestMapping("/taskRequest_Transmit_Detail.do")
	public String taskRequest_Transmit_Detail(){			
		return "task.taskRequest_Transmit_Detail";
	}
	
	//업무 요청 > 업무요청 참여 > 상세페이지
	@RequestMapping("/taskRequest_Participation_Detail.do")
	public String  taskRequest_Participation_Detail(){			
		return "task. taskRequest_Participation_Detail";
	}
	
	
	//업무 > 업무보고 페이지 이동
	@RequestMapping("/taskInform.do")
	public String taskInform(){
		return "task.taskInform";
	}
	
	//업무 보고 > 업무보고 수신 > 상세페이지
	@RequestMapping("/taskInform_Receive_Detail.do")
	public String taskInform_Receive_Detail(){
		return "task.taskInform_Receive_Detail";
	}
	
	

	//업무 보고 > 업무보고 송신 > 상세페이지
	@RequestMapping("/taskInform_Transmit_Detail.do")
	public String taskInform_Transmit_Detail(){			
		return "task.taskInform_Transmit_Detail";
	}	
	
	//업무  > 업무일지 페이지 이동
	@RequestMapping("/taskLog.do")
	public String taskLog(){
		return "task.taskLog";
	}
	
	//업무일지 > 업무 일지 수신 > 상세페이지
	@RequestMapping("/taskLog_Receive_Detail.do")
	public String taskLog_Receive_Detail(){			
		return "task.taskLog_Receive_Detail";
	}
	
	
	
	//업무일지 > 업무 일지 송신 > 상세페이지
	@RequestMapping("/taskLog_Transmit_Detail.do")
	public String taskLog_Transmit_Detail(){			
		return "task.taskLog_Transmit_Detail";
	}	
	
	
	
	
}
