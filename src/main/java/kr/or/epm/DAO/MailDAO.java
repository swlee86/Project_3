package kr.or.epm.DAO;

import java.util.List;
import kr.or.epm.VO.Mail;

public interface MailDAO {
	
	// 수신 메일 조회하기
	public List<Mail> selectMail();
}
