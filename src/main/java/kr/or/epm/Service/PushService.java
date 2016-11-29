package kr.or.epm.Service;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.epm.DAO.PushDAO;

@Service
public class PushService {
	
	@Autowired
	private SqlSession sqlsession;
	
	//업무 리스트 푸쉬 알림 불러오기
	public int taskCount(String emp_no){
		PushDAO pushdao = sqlsession.getMapper(PushDAO.class);
		int result = pushdao.taskCount(emp_no);
		return result;
	}
	
	//EmpNo 데이터 호출
	public String selectEmp_no(String username){
		System.out.println("유저 사원번호를 뽑아볼까?");
		System.out.println("EmpSelectro : " + username );
		PushDAO pushdao = sqlsession.getMapper(PushDAO.class);
		System.out.println("Push DAO 세팅 완료");
		String result = pushdao.selectEmp_no(username);
		System.out.println("뽑은 데이터는? " + result);
		return result;
	}
	
}
