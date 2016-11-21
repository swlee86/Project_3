package kr.or.epm.Service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.epm.DAO.EmployeeRoleManageDAO;
import kr.or.epm.VO.EmployeeRoleManage;
import kr.or.epm.VO.Role;

@Service
public class EmployeeRoleManageService {

	@Autowired
	private SqlSession sqlSession;

	// Emp_role 테이블의 열 갯수를 구하는 서비스 함수
	public int selectEmpRoleCount() {
		EmployeeRoleManageDAO employeerolemanage = sqlSession.getMapper(EmployeeRoleManageDAO.class);
		int result = employeerolemanage.selectEmpRoleCount();
		return result;
	}
	
	//Role 리스트 불러오는 서비스 함수
	public List<Role> selectRoleList(){
		EmployeeRoleManageDAO employeerolemanage = sqlSession.getMapper(EmployeeRoleManageDAO.class);
		List<Role> rolelist = employeerolemanage.selectRoleList();
		return rolelist;
	}

	// 관리자 > 사원 권한 관리 접근시 해당 테이블에 필요한 데이터를 뽑는 서비스 함수
	public List<EmployeeRoleManage> selectEmpRoleManage(int cpage, int pgsize) {
		int start = cpage * pgsize - (pgsize - 1);
		int end = cpage * pgsize;
		System.out.println(start + " / " + end);
		EmployeeRoleManageDAO employeerolemanage = sqlSession.getMapper(EmployeeRoleManageDAO.class);
		List<EmployeeRoleManage> list = employeerolemanage.selectEmpRoleManage(start, end);
		return list;
	}
}