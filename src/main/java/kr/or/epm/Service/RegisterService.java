package kr.or.epm.Service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.epm.DAO.RegisterDAO;


@Service
public class RegisterService {

	@Autowired
	private SqlSession sqlsession;
	
	//회원가입시 사원번호 입력 후 체크를 누르면 사원 정보를 불러오는 함수
	public String selectEmpId(String emp_no){
		RegisterDAO registerDao = sqlsession.getMapper(RegisterDAO.class);
		String resultemp = registerDao.selectEmpno(emp_no);
		return resultemp;
	}
	
	public String selectUsedEmpno(String result){
		RegisterDAO registerDao = sqlsession.getMapper(RegisterDAO.class);
		String resultemp = registerDao.selectUsedEmpno(result);
		return resultemp;
	}
}
