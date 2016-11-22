package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.Organization;

public interface OrganizationDAO {
	
	// 지점 출력하기
	public List<Organization> selectBranch();

	// 조직도 출력하기
	public List<Organization> selectOrganization();
	
	// 부서를 출력하기 위해 부서번호 가져오기
	public String selectOrganization_dept_no(String branch_no, String dept_name);
	
	// 하위부서를 출력하기 위해 하위부서번호 가져오기
	public String selectOrganization_low_dept_no(String dept_no, String low_dept_name);
	
	// 사원을 출력하기 위해 사번 가져오기
	public String selectOrganization_emp_no(String low_dept_no);
		
	// 부서 출력하기
	public List<Organization> selectDept(String branch_no);
	
	// 하위 부서 출력하기
	public List<Organization> selectlowDept(String dept_no);
	
	// 사원정보 출력하기
	public List<Organization> selectEmpInfo(String low_dept_no);
}
