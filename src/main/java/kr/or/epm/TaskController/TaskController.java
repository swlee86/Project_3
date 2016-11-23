package kr.or.epm.TaskController;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

import kr.or.epm.Service.CommonService;
import kr.or.epm.Service.LoginService;
import kr.or.epm.Service.TaskService;
import kr.or.epm.VO.EmpJoinEmp_Detail;
import kr.or.epm.VO.Organization;
import kr.or.epm.VO.Task;
import kr.or.epm.VO.Task_people;

/*
 * 작성자 : 박성준
 * 작성일 : 2016-11-21
 * 목   적 : 업무 관련 컨트롤러
 */

@Controller
public class TaskController {

   @Autowired
   private TaskService service;
   
   //로그인 정보 가져오기 위한 것.
   @Autowired 
   private LoginService loginservice;
   
   @Autowired
   private View jsonview;
   
   @Autowired
   private CommonService commonservice;
   
   
   // 업무 > 업무 등록 페이지 이동
   @RequestMapping(value = "/taskWrite.do", method = RequestMethod.GET)
   public String taskWrite(Model model) {
      //업무 번호
      String task_No = service.selectTask_No();
      model.addAttribute("task_No", task_No);
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
   public View downDeptTree(String branch_no, Model model){
	  System.out.println("지점 클릭 시작함");
      System.out.println("컨트롤러 ");
      List<Organization> list = null;
      list=service.selectdeptname(branch_no);
      model.addAttribute("deptname", list);
      return jsonview;
   }
   
   //3.업무 등록시 조직도 부서 클릭시 하위부서 출력
   @RequestMapping("/tasklow_deptModal.do")
   public View downlowDeptTree(String dept_no, Model model){
      List<Organization> list = null;
      list = service.selectlowDept(dept_no);
      for(int i =0; i < list.size(); i++){
         System.out.println("하위 부서 : " +list.get(i).getLow_dept_no());
      }
      model.addAttribute("low_dept", list);
      return jsonview;
   }
   
   //4.업무 등록시 조직도 하위 부서 클릭시 사원 정보 출력
   @RequestMapping("/taskEmpModal.do")
   public View downEmpTree(String low_dept_no, Model model){
      System.out.println("이엠피 정보 컨트롤러");
      List<Organization> list = null;
      list = service.selectEmpInfo(low_dept_no);
      for(int i =0; i < list.size(); i++){
         System.out.println("사원정보: " +list.get(i).getEmp_name()+"/ 사번: "+list.get(i).getEmp_no());
      }
      model.addAttribute("emp", list);
      return jsonview;
   }

   
   // 업무 > 업무 등록 페이지
   @RequestMapping(value = "/taskWrite.do", method = RequestMethod.POST)
   public String taskWriteResult(Principal principal,Task_people people, String task_name,String cg_no,String cg_name, String rec_emp_no, String rec_name, String deadline, String content, String sign, Model model){
      
      System.out.println("업무 등록 폼");
      
      //1.먼저 아이디 뽑아와야함.
      String id = principal.getName();
      System.out.println("아이디  : "+id);
      //아이디 통해 사번 얻어옴
      EmpJoinEmp_Detail emp = loginservice.modifyInfo(id);
      
      //날짜
      SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat("yyyy.MM.dd");
      Date currentTime = new Date( );
      String mTime = mSimpleDateFormat.format( currentTime );
      
      
      //System.out.println("업무명 : "+task_name + " / 구분번호 : "+cg_no + " / 업무명 : "+cg_name + " / 수신자 사번 : "+rec_emp_no + " / 수신자 명 : "+rec_name + " / 기한 : "+deadline + " / 내용 : "+content);
      List<Task_people> tlist = new ArrayList<Task_people>();
      tlist.add(people);
      
      Task task = new Task();
      task.setEmp_no(emp.getEmp_no());
      task.setEmp_name(emp.getEmp_name());
      task.setTask_name(task_name);
      task.setCg_no(cg_no);
      task.setCg_name(cg_name);
      task.setRec_emp_no(rec_emp_no);
      task.setRec_name(rec_name);
      task.setDeadline(deadline);
      task.setContent(content);
      task.setTask_no(tlist.get(0).getTask_no());
      task.setRec_date(mTime);
      task.setSend_date(mTime);
      task.setTask_step_no("0");
      task.setStep_no("0");
      task.setSign(sign);

      //task 등록
      int taskresult = service.TaskInsert(task);
      System.out.println("컨트롤러 task 업무 등록 : "+taskresult);
      
      //tast_people 등록
      
      int task_peopleresult = service.insertTask_people(tlist);
      System.out.println("컨트롤러 업무참여자 등록 결과 "+ task_peopleresult);
      
      
      for(int i = 0; i < tlist.size(); i++){
         System.out.println("task_no : "+tlist.get(i).getTask_no());
         System.out.println("사번 : " +tlist.get(i).getEmp_no());
      }
      
      String link = null;
	  String msg = null;
	  link = "taskRequest.do";
	  msg = "업무 등록에 성공하였습니다.";
      
	  model.addAttribute("link", link);
	  model.addAttribute("msg",msg);
	  return "task.taskRequest_redirect";
   }
   
   


	//업무 > 업무 요청 페이지 이동 > 수신탭
	@RequestMapping("/taskRequest.do")
	public String taskRequest(Principal principal, Model model){
		
		//로그인한 아이디 뽑아오기
		String id = principal.getName();
		EmpJoinEmp_Detail emp = loginservice.modifyInfo(id);
		System.out.println("업무 요청 페이지 이동 : " +emp.toString());
		/////////////////////////////
		String emp_no = emp.getEmp_no();
		String cg_no = "1";
	
	    List<Task> list = service.selectTask_rec(emp_no, cg_no);
		model.addAttribute("tasklist", list);
		System.out.println("업무 요청 페이지> 수신탭");
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
   
   // 2016-11-22
   // 백승아
   // 업무  > 업무일지 수신 페이지 이동
   @RequestMapping("/taskLog.do")
   public String taskLog(Principal principal, Model model){
	   
	   System.out.println("업무 일지 수신페이지를 요청합니다");
	   String cg_no = "3";
	   String RecSend = "Rec";
	   
	 // 로그인 id
	 String id = principal.getName();
	 System.out.println("id : " + id);
	 String emp_no = commonservice.selectEmp_no(id);
	 System.out.println("로그인한 사원의 emp_no : " + emp_no);
	 
	 // 글 개수 구하기
	 int count = service.countTask(cg_no, emp_no, RecSend);
	 System.out.println("수신함 글 개수 : " + count);
	 model.addAttribute("count", count);
	 
	 // 목록 가져오기
	 List<Task> list = service.selectTask_rec(emp_no, cg_no);
	 model.addAttribute("list", list);
	 		
	 
	 // 여기부터는 송신에 들어갈 부분
	 
	 // cg_no = "3"; 
	 // 로그인 id 받아오기
	 
	 // 송신함 글 개수 구하기
	 RecSend = "Rec";
	 int count2 = service.countTask(cg_no, emp_no, RecSend);
	 System.out.println("송신함 글 개수 : " + count2);
	 model.addAttribute("count2", count2);
	 
	 // 송신 목록 가져오기
	 List<Task> list2 = service.selectTask(emp_no, cg_no);
	 model.addAttribute("list2", list2);
	 
      return "task.taskLog";
   }
   

   // 업무  > 업무일지 송신 페이지 이동
   @RequestMapping("/taskLog_send.do")
   public String taskLog_send(Principal principal, Model model){
	   // 일단 보류
	   
	   System.out.println("업무 일지 송신페이지를 요청합니다");
	   String cg_no = "3";
	   
      return null;
   }
   
   // 검색하기
   @RequestMapping(value="/taskLog_search.do", method=RequestMethod.GET)
   public String taskLog_search(HttpServletRequest request, Principal principal, Model model) {
	   
	   System.out.println("검색을 시작합니다");
	   
	   String cg_no = "3";
	   
	   String id = principal.getName();
	   String emp_no = commonservice.selectEmp_no(id);
	   System.out.println("emp_no : " + emp_no);
	   
	   String key = request.getParameter("selectSearch");
	   String value = request.getParameter("input");
	   
	   System.out.println("key값 : " + key + " // value값 : " + value);
	 
	   // 목록 가져오기
	   List<Task> list = service.searchTask(emp_no, cg_no, key, value);
			   
	   model.addAttribute("list", list);
	   
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