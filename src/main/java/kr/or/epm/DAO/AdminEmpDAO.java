package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.Branch;
import kr.or.epm.VO.Dept;
import kr.or.epm.VO.Emp;
import kr.or.epm.VO.Emp_cg;
import kr.or.epm.VO.Emp_role;
import kr.or.epm.VO.Low_dept;
import kr.or.epm.VO.Position;
import kr.or.epm.VO.Role;

/*
 * 작성자 : 백승아
 * 작성일 : 2016-12-08
 * 목  적 : 사원관리 전용 DAO interface
 */

public interface AdminEmpDAO {
	
	// 사원 정보 리스트 출력
	public List<Emp> selectEmp_list(int cpage, int pgsize, String field, String query);
	
	// 사원 등록을 위한 새로운 사번 가져오기
	public String selectNew_emp_no();
	
	// 사원 등록을 위한 근무 상태 리스트 불러오기
	public List<Emp_cg> selectEmp_cg_list();
	
	// 사원 등록을 위한 직위 리스트 불러오기
	// 권한 부여 페이지를 위한 직위 리스트 불러오기
	public List<Position> selectPosition_list();
	
	// 사원 등록을 위한 지점 리스트 불러오기
	public List<Branch> selectBranch_list();
	
	// 사원 등록에서 부서 리스트 불러오기
	public List<Dept> selectDept_list(String branch_no);
	
	// 사원 등록에서 하위 부서 리스트 불러오기
	public List<Low_dept> selectLow_dept_list(String dept_no);
	
	// 사원 등록하기
	public int insertEmp(Emp emp);
	
	// 사원을 등록하면서 이력에 '입사' 추가하기
	public int insertEmp_his_in(String emp_no);
	
	// 사원 이력 불러오기
	public List<Emp> selectEmp_his(String emp_no);
	
	// 회원가입하면서 권한에 'none' 추가하기
	// 아직 미사용
	public int insertEmp_role_none(String emp_no);
	
	// 탈퇴를 요청한 사원 리스트 불러오기
	public List<Emp> selectEmp_withdrawal();
	
	// 탈퇴를 요청한 사원의 상세 불러오기
	public Emp selectEmp_withdrawal_detail(String emp_no);
	
	// 탈퇴시키기 위해 사번의 년도를 0000으로 변경하기
	public int updateEmp_no(String emp_no);
	
	// 탈퇴시키기 위해 사원의 권한을 none으로 변경하기
	public int updateEmp_role_none(String emp_no);
	
	// 탈퇴시키기 위해 사원의 이력을 '퇴사'로 변경하기
	public int updateEmp_his_out(String emp_no);
	
	// 권한 부여 페이지를 위해 권한 리스트 불러오기
	public List<Role> selectRole();
	
	// 권한 부여 페이지를 위해 부여되어 있는 권한 리스트 불러오기
	public List<String> selectRole_selected(String position_no);
	
	// 권한 부여
	public int insertEmp_role(String emp_no, String role_no);
	
	// 권한 부여를 위해 직위에 해당하는 사원 리스트 불러오기
	public List<String> selectEmp_no(String position_no);
	
	// 권한 부여를 위해 해당 사원의 권한 전부 삭제하기
	public int deleteEmp_role(String emp_no);
	
	// 권한 부여 상세 페이지를 위해 사원의 리스트 불러오기
	public List<Emp> selectEmp_authority(String position_no);
	
	// 권한 부여 상세 페이지를 위해 해당 사원의 권한 불러오기
	public List<Emp_role> selectEmp_role(String emp_no);

	// 리스트 개수
	public int selectCount(String field, String query);
	
	// 사원 정보 수정을 위해 정보 불러오기
	public Emp selectEmp_detail(String emp_no);
	
	// 사원 정보 수정
	public int updateEmp_detail(Emp emp);
	
	// 회원 탈퇴 요청하기
	public int updateWithdrawal(String emp_no);
	
	
}
