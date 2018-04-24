package com.toinfra.Service;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.toinfra.DAO.LoginDAO;
import com.toinfra.VO.EmpJoinEmp_Detail;
import com.toinfra.VO.Emp_detail;

/*
 * 작성자 : 박성준
 * 작성일 : 2016-11-19
 * 목   적 : 로그인 후 개인정보 수정 및 회원정보 관리시 사용하는 서비스
 */
@Service
public class LoginService {

	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	//사용자 이름 구하는것 - web socket 채팅할때 사용할 것
	public String selectUserName(String id){
		
		LoginDAO dao = sqlSession.getMapper(LoginDAO.class);
		//사번 
		EmpJoinEmp_Detail emp = dao.selectEmp_Name(id);
		EmpJoinEmp_Detail emp_name = dao.selectEmp_Name_Emp(emp.getEmp_no());
		
		return emp_name.getEmp_name();
	}
	
	
	//사용자 개인 정보 수정할 때 사용하는 메서드 (데이터 뿌려줌)
	public EmpJoinEmp_Detail modifyInfo(String id){
		
		LoginDAO dao = sqlSession.getMapper(LoginDAO.class);
		
		//첫번째 사번을 뽑아줌.
		Emp_detail emp_detail = dao.selectEmp_no(id);
		//두번째
		String emp_no = emp_detail.getEmp_no();
		EmpJoinEmp_Detail emp = dao.selectEmpInfo(emp_no, id);
		
		return emp;
	}
	
	//form 이용 데이터 업데이트 할 때 사용하는 메서드 (데이터 입력)
	public int updateInfo(EmpJoinEmp_Detail emp){
		LoginDAO dao = sqlSession.getMapper(LoginDAO.class);
		
		//사원 상세 정보 바꿀때 사용
		int result = dao.updateEmpInfo(emp);
		//Emp 테이블에 이메일 수정시 사용
		String email = emp.getEmail();
		String emp_no = emp.getEmp_no();
		String cell_phone = emp.getCell_phone();
		int result2 = dao.updateEmp_Email(email, emp_no , cell_phone);
		
	
		int update;
		if(result != 0 && result2 != 0){
			update = 1;
		}else{
			update = 0;
		}
		
		return update;
	}
	
	//구글 로그인 id 데이터를 db에서 비교해오는 서비스 함수
	public String selectGoogleLoginData(String id){
		LoginDAO dao = sqlSession.getMapper(LoginDAO.class);
		String iddata = dao.selectGoogleLoginData(id);
		return iddata;			
		
	}
	
	//아이디 찾기 아작스 구동시 사용
	public String selectFindId(EmpJoinEmp_Detail emp){
		LoginDAO dao = sqlSession.getMapper(LoginDAO.class);
		String id = dao.selectEmp_FindId(emp);
		return id;
	}
	
	//비밀번호 찾기 아작스 구동시
	public String selectFindPw(EmpJoinEmp_Detail emp){
		LoginDAO dao = sqlSession.getMapper(LoginDAO.class);
		String pw = dao.selectEmp_FindPw(emp);
		pw = emp.getId()+"1";
		emp.setPwd(this.bCryptPasswordEncoder.encode(pw));
		int result = dao.updateEmp_TempPw(emp.getEmp_no(), emp.getPwd());
		if(result > 0){
			return pw;
		}else{
			return "실패";
		}
	}
}
