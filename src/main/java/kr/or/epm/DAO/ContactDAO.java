package kr.or.epm.DAO;

import java.util.HashMap;
import java.util.List;

import kr.or.epm.VO.C_group;
import kr.or.epm.VO.Contact;
import kr.or.epm.VO.Emp;
import kr.or.epm.VO.Emp_contact;

/**
작성일 :	2016 - 11 - 18
작성자 :	김주희
사용 목적 :	주소록 DAO
**/
public interface ContactDAO {
	
	//전체 그룹 조회
	public List<Contact> selectList(int cpage, int pagesize, String field, String query, String emp_no, String start, String end);
	
	//갯수 구하기
	public int selectCount(String emp_no, String field, String query, String start, String end);

	//등록인 정보 구하기
	public Emp selectInfoSearch(String id);
	
	
	//현재 로그인한 사원이 갖고있는 그룹 목록
	public List<C_group> selectEmpGroup_list(String emp_no);
		
	//주소록테이블 등록
	public int insertContact(Contact contact);
	
	//개인 주소록 테이블 등록
	public int insertEmpContact(Emp_contact emp_contact);
	
	//현재 최고 글번호
	public int selectMaxContact_No(String name);
	
	
	//사내 사원 정보 부르는 함수
	public Emp selectEmpInfo(String emp_no);
	
	
	
	
	
	
	
	
	
	
	//그룹별 조회
	public List<Contact> selectContact_group(HashMap map);
			

	
	//상세 조회
	public Contact selectContact_detail(String contact_no);
	
	//주소록 상세조회 수정
	public int updateContact_detail(Contact dto);
	
	//주소록 상세조회 삭제  / 트랜잭션 필요
	public int deleteEmpContact(String contact_no);	
	public int deleteContact(String contact_no);



		
		
	/*--------------그룹관리------------------------*/

	
	//그룹생성 / 트랜잭션 필요
	//1. selectGroupCheck_name
	//2-1. 1의 결과가 0이면 insertGroup
	//	   selectGroup_no으로 방금 insertGroup한 그룹명의 번호를 가져옴
	//	      위에서 가져온 그룹번호를 updateGroups_insert 를 통해 groups에 추가
	//2-2. 1읠 결과가 not 0이면 
	//	   selectGroup_no으로 방금 검색한 그룹명의 번호를 가져옴
	//	      위에서 가져온 그룹번호를 updateGroups_insert를 통해 groups에 추가
	
	//그룹삭제 / 트랜잭션 필요
	//1. 삭제하려는 groupname으로 selectGroup_no에 대입 후 그룹명의 번호를 가져옴
	//2. 위에서 가져온 그룹번호를 updateGroups_delete를 통해 groups에서 제거
	//3. 위의 그룹에 포함된 사원들 삭제위해 selectGroup_no에서 가져온 번호로 그룹에 포함된 사원목록 조회 (selectInGroup_emp)
	//4. 위에서 구한 목록을 이용해 deleteEmpContact_ingroup  , deleteContact_ingroup  를 통해 제거
	
	//그룹수정 / 트랜잭션 필요
	//1. 수정하려는 그룹이름으로 selectGroupCheck_name 확인
	//2-1. 1의 결과가 0이면 insertGroup
	//		selectGroup_no으로 방금 insertGroup한 그룹의 번호를 가져옴(수정후그룹번호)
	//2-2. 1의 결과가 not 0이면
	//		selectGroup_no으로 방금 검색한 그룹명의 번호를 가져옴(수정후그룹번호)		
	//3. 수정전의 그룹 이름으로 selectGroup_no해서 그룹의 번호를 가져옴(수정전그룹번호)
	//		수정전그룹번호를 updateGroups_delete를 통해 groups에서 제거
	//		수정후그룹번호를 updateGroups_insert를 통해 groups에 추가 
	//4. 수정한 그룹에 포함된 사람들의 group_no를 수정하기 위해 수정전그룹번호에 포함된 사원목록 조회 (selectInGroup_emp)
	//5. 4결과에서 포함된 사원들의 그룹번호를 변경 updateEmp_ingroup    - selectInGroup_emp의 결과는 list로 나올것 , updateEmp_ingroup list의 size만큼 돌아야함

	//그룹에 작성한 이름의 그룹이 존재하는지 유효성 검사
	public int selectGroupCheck_name(String group_name);
	
	//그룹 추가 ,생성       or  그룹명 수정했을때 selectGroupCheck_name의 유효성 검사결과값이 1일때 
	public int insertGroup(String group_name);
	
	//선택한 그룹에 포함된 사람들 뽑기=>ingroup_emp
	public List<String> selectInGroup_emp(String group_no);
	
	//그룹수정될때 그 그룹에 포함된 사람들 그룹 번호 변경(selectInGroup_emp의 size만큼 for돌아야함)
	public int updateEmp_ingroup(String ingroup_emp);
	
	//그룹삭제될때 그 그룹에 포함된 사람들 삭제(selectInGroup_emp의 size만큼 for돌아야함)
	public int deleteEmpContact_ingroup(String ingroup_emp);
	public int deleteContact_ingroup(String ingroup_emp);
	
	//생성했던or삭제할or수정했던 그룹의 그룹번호 가져오기 (selectGroup_no)
	public String selectGroup_no(String group_name);
	
	//가져온 그룹번호(selectGroup_no) groups에 추가하기 (그룹추가) - emp_no, selectGroup_no 필요
	public int updateGroups_insert(HashMap<String, String> map);
	
	//가져온 그룹번호(selectGroup_no) group에서 삭제하기 (그룹삭제) - emp_no, selectGroup_no 필요
	public int updateGroups_delete(HashMap map);




}
