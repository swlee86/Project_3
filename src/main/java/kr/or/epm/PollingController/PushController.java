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
  public void pollingstart(HttpServletRequest request, HttpServletResponse response, Push push) {
	  System.out.println("Polling Data Start");
	  HttpSession session = request.getSession();
	  
	  String id = (String)session.getAttribute("customerId");
	  String emp_no = pushservice.selectEmp_no(id);
	  String taskcount = pushservice.taskCount(emp_no);
	  System.out.println("폴링 taskcount 데이타 : " + taskcount);
	  session.setAttribute("taskcount", taskcount);
	  
	  
	  
  }

}