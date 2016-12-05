package kr.or.epm.Service;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.annotation.JsonView;

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
	
	//사용자 이름 구하는것 - web socket 채팅할때 사용할 것
	public EmpJoinEmp_Detail selectUserName(String id){
		
		LoginDAO dao = sqlSession.getMapper(LoginDAO.class);
		//사번 
		EmpJoinEmp_Detail emp = dao.selectEmp_Name(id);
		System.out.println(" 사번 :===================== "+emp.getEmp_no());
		EmpJoinEmp_Detail emp_name = dao.selectEmp_Name_Emp(emp.getEmp_no());
		System.out.println(" 사원 이름 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+emp_name.getEmp_name());
		
		return null;
	}
	
	
	//사용자 개인 정보 수정할 때 사용하는 메서드 (데이터 뿌려줌)
	public EmpJoinEmp_Detail modifyInfo(String id){
		
		LoginDAO dao = sqlSession.getMapper(LoginDAO.class);
		
		//첫번째 사번을 뽑아줌.
		Emp_detail emp_detail = dao.selectEmp_no(id);
		System.out.println("서비스 사번뽑기 : " +emp_detail.getEmp_no());
		
		System.out.println("사번 과 id : " +emp_detail.getEmp_no()+ " / "+id);
		//두번째
		String emp_no = emp_detail.getEmp_no();
		EmpJoinEmp_Detail emp = dao.selectEmpInfo(emp_no, id);
		
		System.out.println("조인 최종 : " +emp.toString());
		return emp;
	}
	
	//form 이용 데이터 업데이트 할 때 사용하는 메서드 (데이터 입력)
	public int updateInfo(EmpJoinEmp_Detail emp){
		System.out.println("LoginService - : "+emp.toString());
		LoginDAO dao = sqlSession.getMapper(LoginDAO.class);
		
		//사원 상세 정보 바꿀때 사용
		int result = dao.updateEmpInfo(emp);
		//Emp 테이블에 이메일 수정시 사용
		String email = emp.getEmail();
		String emp_no = emp.getEmp_no();
		String cell_phone = emp.getCell_phone();
		int result2 = dao.updateEmp_Email(email, emp_no , cell_phone);
		
		System.out.println("디테일 업데이트 : "+result  + "  /  emp 테이블 업데이트 : "+result2);
	
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
		System.out.println(iddata);
		return iddata;			
		
	}
	
	
	
}
