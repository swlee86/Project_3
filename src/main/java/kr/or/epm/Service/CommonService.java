package kr.or.epm.Service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.epm.DAO.BranchDAO;
import kr.or.epm.DAO.CommonDAO;
import kr.or.epm.DAO.DeptDAO;
import kr.or.epm.VO.Branch;
import kr.or.epm.VO.Common;
import kr.or.epm.VO.Dept;

@Service
public class CommonService {

	@Autowired
	private SqlSession sqlsession;
	
	// 로그인 id로 emp_no 출력
	public String selectEmp_no(String id){
		CommonDAO dao = sqlsession.getMapper(CommonDAO.class);
		String emp_no = null;
		emp_no = dao.selectEmp_no(id);
		
		return emp_no;
	}
	
	// 로그인 id로 emp_name 출력
	public String selectEmp_name(String id) {
		CommonDAO dao = sqlsession.getMapper(CommonDAO.class);
		String emp_name = null;
		emp_name = dao.selectEmp_name(id);
		
		return emp_name;
	}
	
	// 하위부서번호로 지점명, 부서명, 하위부서명 출력
	public Common selectAttach(String low_dept_no) {
		
		CommonDAO dao = sqlsession.getMapper(CommonDAO.class);
		Common common = dao.selectAttach_for_low_dept_no(low_dept_no);
		
		return common;
	}
	
}
