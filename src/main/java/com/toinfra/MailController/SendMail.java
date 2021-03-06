package com.toinfra.MailController;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.toinfra.Service.MailService;
import com.toinfra.DTO.Mail;

@Controller
public class SendMail {

	@Autowired
	private MailService mailservice;


	@RequestMapping("mailsend.do")
	public String sendmail(HttpSession session, String recipients, String subjects, String bodys)
			throws MessagingException {
		String mailid = (String) session.getAttribute("googlemail");
		String sessionchk = (String) session.getAttribute("mailusedata");
			// 메일 관련 정보
			String host = "smtp.gmail.com";
			String username = "publicepm@gmail.com";
			String password = "12349876";
			System.out.println(username + " / " + password);
			String result = null;
			Mail mail = new Mail();
			
			try{
				
				mail.setMail_content(bodys);
				mail.setTitle(subjects);
				mail.setRec_mail(recipients);
				mail.setSend_mail(mailid);
				
				System.out.println(mail.toString());
				result = mailservice.sendMail(recipients, subjects, bodys, username, password, host);
				System.out.println(result);
				mailservice.insertSendMail(mail);
				
				
			}catch(Exception e){
				e.printStackTrace();				
			}finally{
			}
			return result;
			
		}
	}

