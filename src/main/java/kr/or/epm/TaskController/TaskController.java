package kr.or.epm.TaskController;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

import kr.or.epm.Service.TaskService;
import kr.or.epm.VO.Organization;

/*
 * 작성자 : 박성준
 * 작성일 : 2016-11-21
 * 목   적 : 업무 관련 컨트롤러
 */

@Controller
public class TaskController {

	@Autowired
	private TaskService service;

	@Autowired
	private View jsonview;
	
	// 업무 > 업무 등록 페이지 이동
	@RequestMapping(value = "/taskWrite.do", method = RequestMethod.GET)
	public String taskWrite() {
		return "task.taskWrite";
	}

	//1.업무 등록시 조직도 modal에 사용
	@RequestMapping("/taskWriteModal.do")
	public View deptTree(Model model){
		List<Organization> list = null;
		list = service.selectDept();
		model.addAttribute("dept", list);
		return jsonview;
	}
	
	//2.업무 등록시 조직도 지점 클릭시 부서 띄워줘야함
	@RequestMapping(value="/taskDeptModal.do", method=RequestMethod.GET)
	public View downDeptTree(String branch_name, Model model){
		System.out.println("컨트롤러 ");
		List<Organization> list = null;
		list=service.selectdeptname(branch_name);
		model.addAttribute("deptname", list);
		return jsonview;
	}
	//3.업무 등록시 조직도 부서 클릭시 하위부서 출력
	@RequestMapping("/tasklow_deptModal.do")
	public View downlowDeptTree(String dept_name, Model model){
		List<Organization> list = null;
		list = service.selectlowDept(dept_name);
		for(int i =0; i < list.size(); i++){
			System.out.println("하위 부서 : " +list.get(i).getLow_dept_name());
		}
		model.addAttribute("low_dept", list);
		return jsonview;
	}
	
	//4.업무 등록시 조직도 하위 부서 클릭시 사원 정보 출력
	@RequestMapping("/taskEmpModal.do")
	public View downEmpTree(String low_dept_name, Model model){
		System.out.println("이엠피 정보 컨트롤러");
		List<Organization> list = null;
		list = service.selectEmpInfo(low_dept_name);
		for(int i =0; i < list.size(); i++){
			System.out.println("사원정보: " +list.get(i).getEmp_name()+"/ 사번: "+list.get(i).getEmp_no());
		}
		model.addAttribute("emp", list);
		return jsonview;
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
