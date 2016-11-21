package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.Organization;

public interface OrganizationDAO {

	// 조직도 출력하기
	public List<Organization> selectOrganization();
	
	//부서 출력하기
	public List<Organization> selectDept(String branch_name);
	
	//하위 부서 출력하기
	public List<Organization> selectlowDept(String dept_name);
	
	//사원정보 출력하기
	public List<Organization> selectEmpInfo(String low_dept_name);
}
