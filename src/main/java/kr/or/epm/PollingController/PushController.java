package kr.or.epm.PollingController;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import kr.or.epm.Service.PushService;
import kr.or.epm.VO.Emp_detail;
import kr.or.epm.VO.Push;

@Controller
public class PushController {

  @Autowired
  private PushService pushservice;

  @RequestMapping(value = "/pollingchk.do")
  public void pollingstart(HttpServletRequest request, HttpServletResponse response, Push push, String pushcount, String taskcount, String projectcount,String projectApproval, String taskApproval) {
	  System.out.println("Polling Data Start");
	  HttpSession session = request.getSession();
	  System.out.println("PushController > Pushcount : " + pushcount);
	  System.out.println("PushController > Taskcount : " + taskcount);
	  System.out.println("PushController > Projectcount : " + projectcount);
	  System.out.println("PushController > projectApproval : " + projectApproval);
	  System.out.println("PushController > taskApproval : " + taskApproval);
	  
	  String id = (String)session.getAttribute("customerId");
	  String emp_no = pushservice.selectEmp_no(id);
	  
	  //allData 를 받아서 session 을 최신화 시켜준다.
	  
	  session.setAttribute("sessiontaskcount", taskcount);
	  session.setAttribute("sessionprojectcount", projectcount);
	  session.setAttribute("sessionpushcount", pushcount);
	  session.setAttribute("sessionApprovalcount", projectApproval);
	  session.setAttribute("sessiontaskApprovalcount", taskApproval);
	  
  }

}