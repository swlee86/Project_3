package kr.or.epm.Service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.epm.DAO.AdminEmpDAO;
import kr.or.epm.DAO.EmpDAO;
import kr.or.epm.DAO.Emp_cgDAO;
import kr.or.epm.DAO.EmployeeManageDAO;
import kr.or.epm.VO.Branch;
import kr.or.epm.VO.Emp;
import kr.or.epm.VO.Emp_cg;
import kr.or.epm.VO.Emp_his_cg;
import kr.or.epm.VO.EmployeeManage;
import kr.or.epm.VO.Position;

/*
 * 작성자 : 백승아
 * 작성일 : 2016-12-08
 * 목  적 : 사원관리 전용 service 
 */

@Service
public class AdminEmpService {
	
	@Autowired
	private SqlSession sqlsession;
	
	// 사원 정보 리스트 출력
	public List<Emp> selectEmpList(int cpage, int pgsize) {
		System.out.println("SERVICE] 사원 정보 리스트 출력합니다");
		int start = cpage * pgsize - (pgsize - 1);
		int end = cpage * pgsize;
		
		AdminEmpDAO dao = sqlsession.getMapper(AdminEmpDAO.class);
		List<Emp> list = dao.selectEmp_list(start, end);
		
		return list;
	}
	
	// 사원 등록을 위한 새로운 사번 가져오기
	public String selectNew_emp_no() {
		System.out.println("SERVICE] 새로운 사번을 불러옵니다");
		
		AdminEmpDAO dao = sqlsession.getMapper(AdminEmpDAO.class);
		String new_emp_no = dao.selectNew_emp_no();
		
		return new_emp_no;
	}
	
	// 사원 등록을 위한 근무상태 리스트 출력
	public List<Emp_cg> selectEmp_cg_list() {
		System.out.println("SERVICE] 근무 상태 리스트를 불러옵니다");
		
		AdminEmpDAO dao = sqlsession.getMapper(AdminEmpDAO.class);
		List<Emp_cg> list = dao.selectEmp_cg_list();
		
		return list;
	}
	
	// 사원 등록을 위한 직위 리스트 출력
	public List<Position> selectPostion_list() {
		System.out.println("SERVICE] 직위 리스트를 불러옵니다");
		
		AdminEmpDAO dao = sqlsession.getMapper(AdminEmpDAO.class);
		List<Position> list = dao.selectPosition_list();
		
		return list;
	}
	
	// 사원 등록을 위한 지점 리스트 출력
	public List<Branch> selectBranch_list() {
		System.out.println("SERVICE] 지점 리스트를 불러옵니다");
		
		AdminEmpDAO dao = sqlsession.getMapper(AdminEmpDAO.class);
		List<Branch> list = dao.selectBranch_list();
		
		return list;
	}
}
