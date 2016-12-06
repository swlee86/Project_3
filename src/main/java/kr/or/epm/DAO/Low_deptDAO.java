package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.LowDeptJoin;
import kr.or.epm.VO.Low_dept;
import kr.or.epm.VO.Set_homepage;
import kr.or.epm.VO.Set_time;

/*
 * 작성일 : 2016-11-18
 * 작성자 : 백승아
 * 사용 목적 : 하위부서에 대한 DAO interface
*/

public interface Low_deptDAO {

	List<Low_dept> select_lowdept_name(String dept_name);
	
	// 하위 부서 조회하기
	public List<Low_dept> selectLow_dept();
	
	// 하위 부서 상세 조회하기 1)
	public LowDeptJoin selectLow_dept_detail(String low_dept_no);
	
	//하위 부서 조회하기2)
	public Set_homepage selectHomePage(String low_dept_no);
	
	//하위 부서 조회하기 3)
	public Set_time selectTime(String low_dept_no);
	
	// 하위 부서 등록하기 1)
	public int insertLow_dept(LowDeptJoin lowDeptJoin);
	
	//하위 부서 등록하기 2) > 부서번호 조회
	public String select_add_no(LowDeptJoin lowDeptJoin);
	
	//하위 부서 등록 > 3) 홈페이지 시간 등록
	public int insert_homepage(LowDeptJoin lowDeptJoin);
	
	//하위 부서 등록 > 4) 출퇴근시간 등록
	public int insert_time(LowDeptJoin lowDeptJoin);
	
	// 하위 부서 수정하기 1)
	public int updateLow_dept(LowDeptJoin lowDeptJoin);
	
	// 하위 부서 수정되면 최종 여부 0으로 변경하기 / 이전 하위 부서번호 등록하기 2)
	public int updateLow_dept_his(LowDeptJoin lowDeptJoin);
	
	//변경된 하위부서번호 조회 3)
	public LowDeptJoin select_low_dept_no(String low_dept_name);

	//홈페이지 접근 시간 변경 4)
	public int update_homepage(LowDeptJoin lowDeptJoin);
	
	//출퇴근 시간 변경 5)
	public int update_time(LowDeptJoin lowDeptJoin);
	
	//하위부서 삭제하기
	public int low_dept_delete(String low_dept_no);
}
