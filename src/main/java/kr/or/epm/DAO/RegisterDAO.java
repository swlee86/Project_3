package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.Emp;
import kr.or.epm.VO.Emp_cg;
import kr.or.epm.VO.Emp_detail;
import kr.or.epm.VO.Low_dept;
import kr.or.epm.VO.Position;

public interface RegisterDAO {
	//회원가입시에 insert 함수
	int insertEmp_detail(Emp_detail emp_detail);
	
	//관리자 > 사원정보 등록 페이지에서 기본 사원정보를 등록하는 함수 
	int insertEmp(Emp emp);
	
	//회원가입 > 사원번호 중복체크시 처음 구동되는 함수
	String selectEmpno(String Emp_no);
	
	//사원 번호 중복체크 후 바로 이어서 아이디까지 중복 체크하여 사용 가능한 사번인지 확인하는 함수
	String selectUsedEmpno(String Emp_no);
	
	//회원가입 > 아이디 중복 체크하는 함수
	String selectUsedId(String id);
	
	//사원정보 등록페이지 접근시 하위 부서번호를 읽어와서 뿌려주는 함수
	List<Low_dept> selectLowDeptNo();
	
	//RoleList를 뽑아내는 함수
	void insertEmpRoleList(String id);

	//근무상태 코드 테이블에서 해당 정보들을 모두 불러오는 함수
	List<Emp_cg> selectEmpCgList();
	
	//직위번호 및 이름을 가져와서 뿌려주는 함수
	List<Position> selectPositionList();

}
