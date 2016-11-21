package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.Organization;

public interface OrganizationDAO {

	// 조직도 출력하기
	public List<Organization> selectOrganization();
}
