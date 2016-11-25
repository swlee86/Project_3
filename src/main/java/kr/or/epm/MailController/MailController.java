package kr.or.epm.MailController;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.epm.Service.MailService;
import kr.or.epm.Util.Util;
import kr.or.epm.VO.Mail;

@Controller
public class MailController {

	@Autowired
	private MailService mailservice;
	
	@RequestMapping(value="maillogin.do", method=RequestMethod.GET)
	public String maillogin(HttpSession session, Model model){
		String email = (String)session.getAttribute("googlemail");
		System.out.println("email데이터 확인 : " + email);
		
		model.addAttribute("email", email);
		return "mail.maillogin";
	}
	
	@RequestMapping(value="maillogin.do", method=RequestMethod.POST)
	public String mailloginOk(HttpSession session, String password, Model model){
		String pwd = password;
		session.setAttribute("mailusedata", pwd);
		return "redirect:mailbox.do";
	}

	// SideBar(aside.jsp) 메일 서비스 > 메일함 클릭시 구동
	@RequestMapping("/mailbox.do")
	public String mailboxview(Model mv, HttpSession session, HttpServletRequest request, HttpServletResponse response, String pagesize, String currentpage) {
       int totalcount = 0;
       String mailid = (String)session.getAttribute("googlemail");
	   String sessionchk=(String)session.getAttribute("mailusedata");
       boolean test = Util.isEmpty(sessionchk);
       
		if(test==true){
    	   return "redirect:maillogin.do";

		
		}else{
    	    totalcount = ReceiveMailImap.countMail(mailid, sessionchk);
    	    int pagecount = 0;
    	    
    	    if(pagesize == null || pagesize.trim().equals("")){
                pagesize = "10"; 			// default 10건씩 
            }
            
            if(currentpage == null || currentpage.trim().equals("")){
                currentpage = "1";        //default 1 page
            }
            
            int pgsize = Integer.parseInt(pagesize);  		// 10
            int cpage = Integer.parseInt(currentpage);     //1
	        

            if(totalcount % pgsize==0){        //전체 건수 , pagesize 
                pagecount = totalcount/pgsize;
            }else{
                pagecount = (totalcount/pgsize) + 1;
            }
    		
             
    	   String saveFolder="/mail/data";
    	   String filePath = request.getRealPath(saveFolder); 
    	   System.out.println("경로 : " + filePath);
    	       	   System.out.println("메일함 메일 정보 : " + mailid);
    	   List<Mail> mail =  null;
    	   try{

    			mail =  ReceiveMailImap.doit(mailid, sessionchk, filePath, pgsize, cpage);
    		   
    		   System.out.println("메일 사이즈 : " + mail.size());
    		   System.out.println("메일 데이터 : " +mail.get(0));
    	   }catch(Exception e){
    		   e.printStackTrace();
    	   }finally{
    		   mv.addAttribute("maillist", mail);
    		   mv.addAttribute("cpage", cpage);
   			  mv.addAttribute("psize", pgsize);
   			  mv.addAttribute("pagecount", pagecount);
   			  mv.addAttribute("totalcount", totalcount);
    	   }
    	   return "mail.mailbox";
    	   
       }
		
		
		
	}

	// SideBar(aside.jsp) 메일 서비스 > 메일쓰기 // 메일함 > sent 클릭시 구동
	@RequestMapping("/mailbox_compose.do")
	public String mailbox_composeview() {
		return "mail.mailbox_compose";
	}

	//메일 > 보낸메일함 페이지이동 
	@RequestMapping("/mailbox_send.do")
	public String mailbox_send() {
		return "mail.mailbox_send";
	}
	
	//메일 > 휴지통 페이지이동 
	@RequestMapping("/mailbox_trash.do")
	public String mailbox_trash() {
		return "mail.mailbox_trash";
	}

	
	
}
