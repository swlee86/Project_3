package kr.or.epm.Service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.epm.DAO.RegisterDAO;
import kr.or.epm.VO.Emp;


@Service
public class RegisterService {

	@Autowired
	private SqlSession sqlsession;
	
	
	public int insertEmp(Emp emp){
		RegisterDAO registerDao = sqlsession.getMapper(RegisterDAO.class);
		int result = registerDao.insertEmp(emp);
		return result;
	}
	
	
	
	//회원가입시 사원번호 입력 후 체크를 누르면 사원 정보를 불러오는 함수
	public String selectEmpId(String emp_no){
		RegisterDAO registerDao = sqlsession.getMapper(RegisterDAO.class);
		String resultemp = registerDao.selectEmpno(emp_no);
		return resultemp;
	}
	
	//사원번호 체크 후 emp_detail에서 아이디가 가입되어 있는지 체크하는 함수
	public String selectUsedEmpno(String result){
		RegisterDAO registerDao = sqlsession.getMapper(RegisterDAO.class);
		String resultemp = registerDao.selectUsedEmpno(result);
		return resultemp;
	}
	
	public String selectUsedId(String id){
		RegisterDAO registerDao = sqlsession.getMapper(RegisterDAO.class);
		String resultemp = registerDao.selectUsedId(id);
		return resultemp;
	}
}
