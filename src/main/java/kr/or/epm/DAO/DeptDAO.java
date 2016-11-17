package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.Dept;

/*
 * 작성자 : 박성준
 * 작성일 : 2016-11-17
 * 목적 : 부서 관리 페이지
 */
public interface DeptDAO {

	List<Dept> deptList(String branch_name);
	
}
