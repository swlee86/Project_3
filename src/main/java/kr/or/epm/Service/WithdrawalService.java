package kr.or.epm.Service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.epm.DAO.ApprovalDAO;
import kr.or.epm.DAO.OrganizationDAO;
import kr.or.epm.DAO.TaskDAO;
import kr.or.epm.DAO.Task_peopleDAO;
import kr.or.epm.DAO.WithdrawalDAO;
import kr.or.epm.VO.Emp;
import kr.or.epm.VO.Organization;
import kr.or.epm.VO.Task;
import kr.or.epm.VO.Task_people;

@Service
public class WithdrawalService {

	@Autowired
	private SqlSession sqlsession;
	
	// 회원 탈퇴 요청하기
	public int updateWithdrawal(String emp_no) {
		int result = 0;
	
		
		WithdrawalDAO dao = sqlsession.getMapper(WithdrawalDAO.class);
	
		result = dao.updateWithdrawal(emp_no);			
		return result;
	}
	
	//비밀번호 가져오기
	public String getPw(String emp_no){
		
		String pw = "";
		
		WithdrawalDAO dao = sqlsession.getMapper(WithdrawalDAO.class);
		pw = dao.selectPwd(emp_no);
	
		return pw;
	}
}