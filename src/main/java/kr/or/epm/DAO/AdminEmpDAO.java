package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.Branch;
import kr.or.epm.VO.Emp;
import kr.or.epm.VO.Emp_cg;
import kr.or.epm.VO.Position;

/*
 * 작성자 : 백승아
 * 작성일 : 2016-12-08
 * 목  적 : 사원관리 전용 dao
 */

public interface AdminEmpDAO {
	
	// 사원 정보 리스트 출력
	public List<Emp> selectEmp_list(int start, int end);
	
	// 사원 등록을 위한 새로운 사번 가져오기
	public String selectNew_emp_no();
	
	// 사원 등록을 위한 근무 상태 리스트 불러오기
	public List<Emp_cg> selectEmp_cg_list();
	
	// 사원 등록을 위한 직위 리스트 불러오기
	public List<Position> selectPosition_list();
	
	// 사원 등록을 위한 지점 리스트 불러오기
	public List<Branch> selectBranch_list();
}
