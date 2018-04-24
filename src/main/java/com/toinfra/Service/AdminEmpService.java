
package com.toinfra.Service;

import java.util.List;

import com.toinfra.DAO.AdminEmpDAO;
import com.toinfra.VO.*;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.toinfra.DAO.AdminEmpDAO;
import com.toinfra.VO.Branch;
import com.toinfra.VO.Dept;
import com.toinfra.VO.Emp;
import com.toinfra.VO.Emp_cg;
import com.toinfra.VO.Emp_role;
import com.toinfra.VO.Low_dept;
import com.toinfra.VO.Position;
import com.toinfra.VO.Role;

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
	public List<Emp> selectEmpList(int cpage, int pgsize, String field, String query) {
		AdminEmpDAO dao = sqlsession.getMapper(AdminEmpDAO.class);
		List<Emp> list = dao.selectEmp_list(cpage, pgsize,field,query);
		
		return list;
	}
	
	// 사원 등록을 위한 새로운 사번 가져오기
	public String selectNew_emp_no() {
		AdminEmpDAO dao = sqlsession.getMapper(AdminEmpDAO.class);
		String new_emp_no = dao.selectNew_emp_no();
		
		return new_emp_no;
	}
	
	// 사원 등록을 위한 근무상태 리스트 출력
	public List<Emp_cg> selectEmp_cg_list() {
		AdminEmpDAO dao = sqlsession.getMapper(AdminEmpDAO.class);
		List<Emp_cg> list = dao.selectEmp_cg_list();
		
		return list;
	}
	
	// 사원 등록을 위한 직위 리스트 출력
	// 권한 부여 페이지를 위한 직위 리스트 출력
	public List<Position> selectPostion_list() {
		AdminEmpDAO dao = sqlsession.getMapper(AdminEmpDAO.class);
		List<Position> list = dao.selectPosition_list();
		
		return list;
	}
	
	// 사원 등록을 위한 지점 리스트 출력
	public List<Branch> selectBranch_list() {
		AdminEmpDAO dao = sqlsession.getMapper(AdminEmpDAO.class);
		List<Branch> list = dao.selectBranch_list();
		
		return list;
	}
	
	// AJAX 사원 등록에서 지점을 선택했을 때
	public List<Dept> selectDept_list(String branch_no) {
		AdminEmpDAO dao = sqlsession.getMapper(AdminEmpDAO.class);
		List<Dept> list = dao.selectDept_list(branch_no);
		
		return list;
	}
	
	// AJAX 사원 등록에서 부서를 선택했을 때
	public List<Low_dept> selectLow_dept_list(String dept_no) {
		AdminEmpDAO dao = sqlsession.getMapper(AdminEmpDAO.class);
		List<Low_dept> list = dao.selectLow_dept_list(dept_no);
		
		return list;
	}
	
	// AJAX 사원 등록
	@Transactional
	public int insertEmp(Emp emp) {
		int result = 0;
		int result1 = 0;
		int result2 = 0;
		
		AdminEmpDAO dao = sqlsession.getMapper(AdminEmpDAO.class);
		
		// 이력에 '입사' 추가하기
		String emp_no = emp.getEmp_no();
		
		try {
			result1 = dao.insertEmp(emp);
			result2 = dao.insertEmp_his_in(emp_no);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
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
		AdminEmpDAO dao = sqlsession.getMapper(AdminEmpDAO.class);
		List<Emp> list = dao.selectEmp_his(emp_no);
		
		return list;
	}
	
	
	// 탈퇴를 요청한 사원 리스트 출력
	public List<Emp> selectEmp_withdrawal() {
		AdminEmpDAO dao = sqlsession.getMapper(AdminEmpDAO.class);
		List<Emp> list = dao.selectEmp_withdrawal();
		
		return list;
	}
	
	// AJAX 탈퇴를 요청한 사원의 상세 출력
	public Emp selectEmp_withdrawal_detail(String emp_no) {
		AdminEmpDAO dao = sqlsession.getMapper(AdminEmpDAO.class);
		Emp detail = dao.selectEmp_withdrawal_detail(emp_no);
		
		return detail;
	}
	
	// AJAX 사원 삭제
	@Transactional
	public int deleteEmp(String emp_no) {
		int result = 0;
		
		AdminEmpDAO dao = sqlsession.getMapper(AdminEmpDAO.class);
		int result2 = 0;
		int result3 = 0;
		int result1 = 0;
				
		try {
			// 권한을 none으로 변경
			result2 = dao.updateEmp_role_none(emp_no);
			// 이력을 퇴사로 변경
			result3 = dao.updateEmp_his_out(emp_no);
			// 사번의 년도를 0000으로 변경
			result1 = dao.updateEmp_no(emp_no);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		if(result1 > 0 && result2 > 0 && result3 > 0) {
			result = 1;
		}
		
		return result;
	}
	
	// 권한 부여 페이지를 위해 권한 리스트 불러오기
	public List<Role> selectRole() {
		AdminEmpDAO dao = sqlsession.getMapper(AdminEmpDAO.class);
		List<Role> list = dao.selectRole();
				
		return list;
	}
	
	// 권한 부여 페이지를 위해 부여되어 있는 권한 리스트 불러오기
	public List<String> selectRole_selected(String position_no) {
		AdminEmpDAO dao = sqlsession.getMapper(AdminEmpDAO.class);
		List<String> list = dao.selectRole_selected(position_no);
		
		return list;
	}
	
	// AJAX 사원에게 권한 부여
	public int insertEmp_role(String emp_no, String role_no) {
		AdminEmpDAO dao = sqlsession.getMapper(AdminEmpDAO.class);
		int result = dao.insertEmp_role(emp_no, role_no);
		
		return result;
	}
	
	// AJAX 사원에게 권한 부여를 위해 position_no에 해당하는 emp_no 뽑기
	public List<String> selectEmp_no(String position_no) {
		AdminEmpDAO dao = sqlsession.getMapper(AdminEmpDAO.class);
		List<String> list = dao.selectEmp_no(position_no);
		
		return list;
	}
	
	// 직위에 권한을 부여할 때 해당 사원이 가지고 있는 권한 전부 날리기
	public int deleteEmp_role(String emp_no) {
		AdminEmpDAO dao = sqlsession.getMapper(AdminEmpDAO.class);
		int result = dao.deleteEmp_role(emp_no);
		
		return result;
	}
	
	// 사원에 권한을 부여하기 위해 사원 리스트 불러오기
	public List<Emp> selectEmp_authority(String position_no) {
		AdminEmpDAO dao = sqlsession.getMapper(AdminEmpDAO.class);
		List<Emp> list = dao.selectEmp_authority(position_no);
		
		return list;
	}
	
	// 권한 부여 상세 페이지를 위해 해당 사원의 권한 불러오기
	public List<Emp_role> selecEmp_role(String emp_no) {
		AdminEmpDAO dao = sqlsession.getMapper(AdminEmpDAO.class);
		List<Emp_role> list = dao.selectEmp_role(emp_no);
		
		return list;
	}

	//전체갯수
	public int selectCount(String field, String query) {
		AdminEmpDAO dao = sqlsession.getMapper(AdminEmpDAO.class);
		int totalcount = 0;
		totalcount = dao.selectCount( field, query);
		
		return totalcount;
	}
	
	// 사원 정보 수정
	public Emp selectEmp_detail(String emp_no) {
		AdminEmpDAO dao = sqlsession.getMapper(AdminEmpDAO.class);
		Emp detail = dao.selectEmp_detail(emp_no);
				
		return detail;
	}
	
	// AJAX 사원 정보 수정
	public int updateEmp_detail(Emp emp) {
		System.out.println(emp.toString());
		AdminEmpDAO dao = sqlsession.getMapper(AdminEmpDAO.class);
		int result = dao.updateEmp_detail(emp);
				
		return result;
	}
}
