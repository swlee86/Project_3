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
import kr.or.epm.VO.Dept;
import kr.or.epm.VO.Emp;
import kr.or.epm.VO.Emp_cg;
import kr.or.epm.VO.Emp_his_cg;
import kr.or.epm.VO.EmployeeManage;
import kr.or.epm.VO.Low_dept;
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
	
	// AJAX 사원 등록에서 지점을 선택했을 때
	public List<Dept> selectDept_list(String branch_no) {
		System.out.println("SERVICE] 부서 리스트를 불러옵니다");
		
		AdminEmpDAO dao = sqlsession.getMapper(AdminEmpDAO.class);
		List<Dept> list = dao.selectDept_list(branch_no);
		
		return list;
	}
	
	// AJAX 사원 등록에서 부서를 선택했을 때
	public List<Low_dept> selectLow_dept_list(String dept_no) {
		System.out.println("SERVICE] 하위 부서 리스트를 불러옵니다");

		AdminEmpDAO dao = sqlsession.getMapper(AdminEmpDAO.class);
		List<Low_dept> list = dao.selectLow_dept_list(dept_no);
		
		return list;
	}
	
	// AJAX 사원 등록
	public int insertEmp(Emp emp) {
		System.out.println("SERVICE] 사원을 등록합니다");
		int result = 0;
		
		AdminEmpDAO dao = sqlsession.getMapper(AdminEmpDAO.class);
		int result1 = dao.insertEmp(emp);
		
		// 이력에 '입사' 추가하기
		String emp_no = emp.getEmp_no();
		int result2 = dao.insertEmp_his_in(emp_no);
		
		
		// 'none' 권한 부여하기
		// 회원가입이 완료되었을 때 적용하는 걸로 변경
		// int result3 = dao.insertEmp_role_none(emp_no);
		
		if(result1 > 0 && result2 > 0) {
			result = 1;
		}
		
		return result;
	}
	
	// AJAX 사원 이력 불러오기
	public List<Emp> selectEmp_his(String emp_no) {
		System.out.println("SERVICE] 사원 이력을 불러옵니다");
		
		AdminEmpDAO dao = sqlsession.getMapper(AdminEmpDAO.class);
		List<Emp> list = dao.selectEmp_his(emp_no);
		
		System.out.println("dao 후의 결과를 확인하자 : " + list.toString());
		
		return list;
	}
	
	
	// 탈퇴를 요청한 사원 리스트 출력
	public List<Emp> selectEmp_withdrawal() {
		System.out.println("SERVICE] 탈퇴를 요청한 사원의 리스트를 출력합니다");
		
		AdminEmpDAO dao = sqlsession.getMapper(AdminEmpDAO.class);
		List<Emp> list = dao.selectEmp_withdrawal();
		
		return list;
	}
	
	// AJAX 탈퇴를 요청한 사원의 상세 출력
	public Emp selectEmp_withdrawal_detail(String emp_no) {
		System.out.println("SERVICE] 탈퇴를 요청한 사원의 상세를 출력합니다");
		
		AdminEmpDAO dao = sqlsession.getMapper(AdminEmpDAO.class);
		Emp detail = dao.selectEmp_withdrawal_detail(emp_no);
		
		return detail;
	}
	
	// AJAX 사원 삭제
	public int deleteEmp(String emp_no) {
		System.out.println("SERVICE] 사원을 삭제합니다");
		int result = 0;
		
		AdminEmpDAO dao = sqlsession.getMapper(AdminEmpDAO.class);
		
		// 권한을 none으로 변경
		int result2 = dao.updateEmp_role_none(emp_no);
		// 이력을 퇴사로 변경
		int result3 = dao.updateEmp_his_out(emp_no);
		// 사번의 년도를 0000으로 변경
		int result1 = dao.updateEmp_no(emp_no);
		
		if(result1 > 0 && result2 > 0 && result3 > 0) {
			result = 1;
		}
		
		return result;
	}
}
