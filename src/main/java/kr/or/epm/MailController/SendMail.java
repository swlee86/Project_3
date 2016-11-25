package kr.or.epm.MailController;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.epm.Util.Util;

@Controller
public class SendMail {

	@RequestMapping("mailsend.do")
	public String sendmail(HttpSession session, String recipients, String subjects, String bodys)
			throws MessagingException {
		String mailid = (String) session.getAttribute("googlemail");
		String sessionchk = (String) session.getAttribute("mailusedata");
		boolean test = Util.isEmpty(sessionchk);

		if (test == true) {
			return "redirect:maillogin.do";
		} else {

			// 메일 관련 정보
			String host = "smtp.gmail.com";
			String username = mailid;
			String password = sessionchk;
			System.out.println(username + " / " + password);

			// 메일 내용
			String recipient = recipients; // 수신자 메일 주소
			String subject = subjects; // 제목
			String body = bodys; // 본문

			// properties 설정
			Properties props = new Properties();
			props.put("mail.smtps.auth", "true");
			// 메일 세션
			Session session1 = Session.getDefaultInstance(props);
			MimeMessage msg = new MimeMessage(session1);

			// 메일 관련
			try {
				msg.setSubject(subject);
				msg.setText(body);
				msg.setFrom(new InternetAddress(username));
				msg.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));

			} catch (MessagingException e) {
				e.printStackTrace();
			}
			// 발송 처리
			Transport transport = session1.getTransport("smtps");
			transport.connect(host, username, password);
			transport.sendMessage(msg, msg.getAllRecipients());
			transport.close();
		}
		return "mail.mailbox_send";
	};
}
