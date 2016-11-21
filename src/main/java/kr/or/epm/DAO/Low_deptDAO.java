package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.Low_dept;

public interface Low_deptDAO {

	// 하위 부서 조회하기
	public List<Low_dept> selectLow_dept();
	
	// 하위 부서 상세 조회하기
	public Low_dept selectLow_dept_detail();
	
	// 하위 부서 등록하기
	public int insertLow_dept();
	
	// 하위 부서 수정하기
	public int updateLow_dept();
	
	// 하위 부서 수정되면 최종 여부 0으로 변경하기 / 이전 하위 부서번호 등록하기
	public int updateLow_dept_his();
}
