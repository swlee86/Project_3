package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.Mail;

public interface MailDAO {
	
	// 메일 작성하기
	public int insertMail();
	
	// 메일 중요설정
	public int updateMail_sign();
	
	// 메일 상세보기
	public Mail selectMail_detail();
	
	// 수신 메일 조회하기
	public List<Mail> selectMail_rec();
	
	// 메일 읽었을 때 수신일 데이터와 확인 여부데이터 삽입하기
	public int updateMail_rec();
	
	// 수신함에서 삭제하기
	public int deleteMail_rec();
	
	// 송신 메일 조회하기
	public List<Mail> selectMail();
	
	// 송신함에서 삭제하기
	public int deleteMail();
	
	// 휴지통 조회하기
	public List<Mail> selectMail_delete();
	
	// 휴지통 비우기
	public int deleteMail_delete();
	
	// 휴지통에서 복원하기
	public int updateMail_re();

}
