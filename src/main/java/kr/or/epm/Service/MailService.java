package kr.or.epm.Service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.epm.DAO.MailDAO;
import kr.or.epm.VO.Mail;

@Service
public class MailService {

	@Autowired
	private SqlSession sqlsession; 	
	
	//메일 리스트를 불러오는 서비스 함수
	public List<Mail> selectMail(){
		MailDAO maildao = sqlsession.getMapper(MailDAO.class);
		List<Mail> list = maildao.selectMail();
		return list;
	}
}
