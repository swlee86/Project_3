package kr.or.epm.Service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.epm.DAO.RegisterDAO;
import kr.or.epm.VO.Emp;
import kr.or.epm.VO.Emp_detail;
import kr.or.epm.VO.Low_dept;

@Service
public class RegisterService {

	@Autowired
	private SqlSession sqlsession;
	
	//관리자 > 사원 등록 클릭시 하위부서 번호를 불러오는 함수
	public List<Low_dept> selectLowDeptNo(){
		RegisterDAO registerDao = sqlsession.getMapper(RegisterDAO.class);
		List<Low_dept> list = null;
		list= registerDao.selectLowDeptNo();
		System.out.println(list.size());
		System.out.println(list.get(0).getLow_dept_no());
		System.out.println(list.get(0).getLow_dept_name());
		return list;
	}
	
	
	//관리자 > 사원 등록시 등록을 처리하는 함수(Emp에 insert)
	public int insertEmp(Emp emp){
		RegisterDAO registerDao = sqlsession.getMapper(RegisterDAO.class);
		int result = registerDao.insertEmp(emp);
		return result;
	}
	
	//회원가입시 등록을 처리하는 함수(Emp_detail에 insert)
	public int insertEmp_detail(Emp_detail emp_detail){
		RegisterDAO registerDao = sqlsession.getMapper(RegisterDAO.class);
		int result = registerDao.insertEmp_detail(emp_detail);
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
