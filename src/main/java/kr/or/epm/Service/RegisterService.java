package kr.or.epm.Service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.epm.DAO.EmployeeManageDAO;
import kr.or.epm.DAO.RegisterDAO;
import kr.or.epm.VO.Emp;
import kr.or.epm.VO.Emp_cg;
import kr.or.epm.VO.Emp_detail;
import kr.or.epm.VO.Emp_his_cg;
import kr.or.epm.VO.Low_dept;
import kr.or.epm.VO.Position;

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
		System.out.println("이엠피가 왜 ??? "+emp.toString());
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
	
	//회원 가입시 이메일을 emp table에 업데이트 시키는 함수
	public int updateEmail(Emp emp){
		RegisterDAO registerDao = sqlsession.getMapper(RegisterDAO.class);
		int result = registerDao.updateEmail(emp);
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
	
	//id를 사용해서 사번을 뽑아내는 서비스 함수
	public String selectUsedId(String id){
		RegisterDAO registerDao = sqlsession.getMapper(RegisterDAO.class);
		String resultemp = registerDao.selectUsedId(id);
		return resultemp;
	}
	
	//Role 리스트를 불러오는 서비스 함수
	public int insertEmpRoleList(String emp_no){
		RegisterDAO registerDao = sqlsession.getMapper(RegisterDAO.class);
		int result = registerDao.insertEmpRoleList(emp_no);
		return result;
	}
	
	//근무 정보를 불러오는 쿼리문
	public List<Emp_cg> selectEmpCgList(){
		RegisterDAO registerDao = sqlsession.getMapper(RegisterDAO.class);
		List<Emp_cg> list = registerDao.selectEmpCgList();
		return list;
	}
	
	//직위 정보를 모두 불러오는 테이블
	public List<Position> selectPositionList(){
		RegisterDAO registerDao = sqlsession.getMapper(RegisterDAO.class);
		List<Position> result = registerDao.selectPositionList();
		return result;
	}
	
}
