package com.toinfra.Service;

import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.toinfra.DAO.MailDAO;
import com.toinfra.VO.Mail;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.toinfra.DAO.MailDAO;
import com.toinfra.VO.Mail;

@Service
public class MailService {

	@Autowired
	private SqlSession sqlsession; 	
	
	public int insertSendMail(Mail mail){
		MailDAO maildao = sqlsession.getMapper(MailDAO.class);
		int result = maildao.insertSendMail(mail);
		return result;
	}
	
	public String sendMail(String recipients, String subjects, String bodys, String mailid, String pwd, String host) throws MessagingException{
		// 메일 내용
		String recipient = recipients; // 수신자 메일 주소
		String subject = subjects; // 제목
		String body = bodys; // 본문
		
		
		
		// properties 설정
		Properties props = new Properties();
		props.put("mail.smtps.auth", "true");
		/*props.put("mail.smtp.user", mailid);
		props.put("mail.smtp.password", pwd);*/
		
		// 메일 세션
		Session session1 = Session.getDefaultInstance(props);
		MimeMessage msg = new MimeMessage(session1);
		
		// 메일 관련
		try {
			
			msg.setSubject(subject);
			msg.setText(body);
			msg.setFrom(new InternetAddress(mailid));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));

			
		} catch (MessagingException e) {
			e.printStackTrace();
		} finally {
			// 발송 처리
			Transport transport = session1.getTransport("smtps");
			transport.connect(host, mailid, pwd);
			transport.sendMessage(msg, msg.getAllRecipients());

			transport.close();
		}

		return "redirect:mailbox_send.do";
	}
	
	
	public List<Mail> mailsendlist(String email){
		MailDAO maildao = sqlsession.getMapper(MailDAO.class);
		List<Mail> list = maildao.selectMail(email);
		return list;
	}
}
