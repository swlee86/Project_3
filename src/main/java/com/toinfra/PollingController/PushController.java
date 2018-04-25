package com.toinfra.PollingController;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.toinfra.Service.PushService;
import com.toinfra.DTO.Push;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PushController {

  @Autowired
  private PushService pushservice;

  @RequestMapping(value = "/pollingchk.do")
  public void pollingstart(HttpServletRequest request, HttpServletResponse response, Push push, String pushcount, String taskcount, String projectcount, String projectApproval, String taskApproval) {
	  HttpSession session = request.getSession();
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