package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.Task_step;

/*
 * 작성일 : 2016-11-29
 * 작성자 : 백승아
 * 사용 목적 : 회원 탈퇴에 대한 DAO interface
*/

public interface WithdrawalDAO {

	//비밀번호 가져오기
	public String selectPwd(String emp_no);
	// 회원 탈퇴 요청하기
	public int updateWithdrawal(String emp_no);
	
}
