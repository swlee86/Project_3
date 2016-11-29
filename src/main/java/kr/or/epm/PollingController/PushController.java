package kr.or.epm.PollingController;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.api.client.http.HttpResponse;

import kr.or.epm.Service.PushService;

@Controller
public class PushController {

  @Autowired
  private PushService pushservice;

  @RequestMapping(value = "/pollingchk.do")
  public void pollingstart(HttpServletRequest request, HttpServletResponse response) {
	  HttpSession session = request.getSession();
	  
	  String id = (String)session.getAttribute("customerId");
	  String emp_no = pushservice.selectEmp_no(id);
	  String taskcount = pushservice.taskCount(emp_no);
	  
	  session.setAttribute("taskcount", taskcount);
	  
	  
	  
  }

}