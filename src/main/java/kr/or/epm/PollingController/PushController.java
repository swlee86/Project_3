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
  public void pollingstart(HttpServletRequest request, HttpServletResponse response, Push push, String pushcount, String taskcount, String projectcount) {
	  System.out.println("Polling Data Start");
	  HttpSession session = request.getSession();
	  System.out.println("PushController > Pushcount : " + pushcount);
	  System.out.println("PushController > Taskcount : " + taskcount);
	  System.out.println("PushController > Projectcount : " + projectcount);
	  
	  String id = (String)session.getAttribute("customerId");
	  String emp_no = pushservice.selectEmp_no(id);
	  
	  
	  session.setAttribute("taskcount", taskcount);
	  session.setAttribute("resultdata", taskcount);
	  session.setAttribute("pushcount", pushcount);
	  
	  
  }

}