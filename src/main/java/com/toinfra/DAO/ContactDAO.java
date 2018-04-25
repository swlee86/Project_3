package com.toinfra.DAO;

import java.util.HashMap;
import java.util.List;

import com.toinfra.DTO.C_group;
import com.toinfra.DTO.Contact;
import com.toinfra.DTO.UserDto;
import com.toinfra.DTO.Emp_contact;

/*
 * 작성일 :	2016 - 11 - 18
 * 작성자 :	김주희
 * 사용 목적 :	주소록 DAO
 * 
 */

public interface ContactDAO {

	// 주소록 추가시 이름별,부서명별 검색
	public List<UserDto> contact_insert_search(HashMap<String, String> map);

	// 전체 그룹 조회
	public List<Contact> selectList(int cpage, int pagesize, String field, String query, String emp_no, String start,
									String end, String group);

	// 갯수 구하기
	public int selectCount(String emp_no, String field, String query, String start, String end, String group);

	// 등록인 정보 구하기
	public UserDto selectInfoSearch(String id);

	// 현재 로그인한 사원이 갖고있는 그룹 목록
	public List<C_group> selectEmpGroup_list(String emp_no);

	// 주소록테이블 등록
	public int insertContact(Contact contact);

	// 개인 주소록 테이블 등록
	public int insertEmpContact(Emp_contact emp_contact);

	// 현재 최고 글번호
	public int selectMaxContact_No(String name);

	// 사내 사원 정보 부르는 함수
	public UserDto selectEmpInfo(String emp_no);

	// 그룹 이름 수정시 , 주소록 그룹 번호 수정
	public int updateContact_GroupNo(String group_no, String pre_group_no, String emp_no);

	// 사원이 가지고 있는 주소록 갯수
	public int selectContact_count(String emp_no);

	// 그룹별 조회
	public List<Contact> selectContact_group(HashMap map);

	// 상세 조회
	public Contact selectContact_detail(String contact_no);

	// 주소록 상세조회 수정
	public int updateContact_detail(Contact contact);

	// 주소록 상세조회 삭제 / 트랜잭션 필요
	public int deleteEmpContact(String contact_no, String emp_no);

	// 주소록 삭제
	public int deleteContact(String contact_no);

	// 그룹에 작성한 이름의 그룹이 존재하는지 유효성 검사
	public int selectGroupCheck_name(String group_name);

	// 그룹 추가 ,생성 or 그룹명 수정했을때 selectGroupCheck_name의 유효성 검사결과값이 1일때
	public int insertGroup(String group_name);

	// 선택한 그룹에 포함된 사람들 뽑기=>ingroup_emp
	public List<String> selectInGroup_emp(String group_no);

	// 그룹수정될때 그 그룹에 포함된 사람들 그룹 번호 변경(selectInGroup_emp의 size만큼 for돌아야함)
	public int updateEmp_ingroup(String ingroup_emp);

	// 그룹삭제될때 그 그룹에 포함된 사람들 삭제(selectInGroup_emp의 size만큼 for돌아야함)
	public int deleteEmpContact_ingroup(String ingroup_emp);

	public int deleteContact_ingroup(String ingroup_emp);

	// 생성했던or삭제할or수정했던 그룹의 그룹번호 가져오기 (selectGroup_no)
	public String selectGroup_no(String group_name);

	// 가져온 그룹번호(selectGroup_no) groups에 추가하기 (그룹추가) - emp_no, selectGroup_no 필요
	public int updateGroups_insert(HashMap<String, String> map);

	// 가져온 그룹번호(selectGroup_no) group에서 삭제하기 (그룹삭제) - emp_no, selectGroup_no 필요
	public int updateGroups_delete(HashMap<String, String> map);

	// 그룹번호를 1(선택없음)로 바꿈
	public int updateGroups_delete_change(String emp_no, String group_no);

}
