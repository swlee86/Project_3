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
	
}
