package com.toinfra.Service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.toinfra.DAO.WithdrawalDAO;

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