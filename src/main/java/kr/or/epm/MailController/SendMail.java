package kr.or.epm.MailController;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.epm.Service.MailService;
import kr.or.epm.VO.Mail;

@Controller
public class SendMail {

	@Autowired
	private MailService mailservice;

	@RequestMapping("mailsend.do")
	public String sendmail(HttpSession session, String recipients, String subjects, String bodys)
			throws MessagingException {
		System.out.println("메일 발송 시작");
		String mailid = (String) session.getAttribute("googlemail");
		String sessionchk = (String) session.getAttribute("mailusedata");

			// 메일 관련 정보
			String host = "smtp.gmail.com";
			String username = mailid;
			String password = sessionchk;
			System.out.println(username + " / " + password);

			// 메일 내용
			String recipient = recipients; // 수신자 메일 주소
			String subject = subjects; // 제목
			String body = bodys; // 본문
			System.out.println("수신자 : " + recipient);
			System.out.println("제목 : " + subject);
			System.out.println("본문 : " + body);
			System.out.println("발송자 : " + mailid);
			
			
			
			// properties 설정
			Properties props = new Properties();
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.starttls.enable","true");
			props.put("mail.smtp.debug", "true");
			props.put("mail.smtp.socketFactory.port", "465"); 
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory"); 
			props.put("mail.smtp.socketFactory.fallback", "false");
			
			
			// 메일 세션
			Session session1 = Session.getDefaultInstance(props);
			MimeMessage msg = new MimeMessage(session1);
			Mail mail = new Mail();
			// 메일 관련
			try {
				msg.setSubject(subject);
				msg.setText(body);
				msg.setFrom(new InternetAddress(username));
				msg.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));

				
				mail.setMail_content(bodys);
				mail.setTitle(subjects);
				mail.setRec_mail(recipients);
				mail.setSend_mail(mailid);
				
				
			} catch (MessagingException e) {
				e.printStackTrace();
			} finally {
				// 발송 처리
				Transport transport = session1.getTransport("smtps");
				transport.connect(host, username, password);
				transport.sendMessage(msg, msg.getAllRecipients());

				
				System.out.println(mail.toString());
				mailservice.insertSendMail(mail);

				transport.close();
			}

			return "mail.mailbox_send";
		}
	}

