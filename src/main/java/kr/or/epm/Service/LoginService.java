package kr.or.epm.Service;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.epm.DAO.LoginDAO;
import kr.or.epm.VO.EmpJoinEmp_Detail;
import kr.or.epm.VO.Emp_detail;

/*
 * 작성자 : 박성준
 * 작성일 : 2016-11-19
 * 목   적 : 로그인 후 개인정보 수정 및 회원정보 관리시 사용하는 서비스
 */
@Service
public class LoginService {
	
	@Autowired
	private SqlSession sqlSession;
	
	//사용자 개인 정보 수정할 때 사용하는 메ㅓ드
	public EmpJoinEmp_Detail modifyInfo(String id){
		
		LoginDAO dao = sqlSession.getMapper(LoginDAO.class);
		
		//첫번째 사번을 뽑아줌.
		Emp_detail emp_detail = dao.selectEmp_no(id);
		System.out.println("서비스 사번뽑기 : " +emp_detail.getEmp_no());
		
		//두번째
		//EmpJoinEmp_Detail emp = dao.selectEmpInfo();
		//System.out.println(emp.toString());
		return null;
	}
	
	
}
