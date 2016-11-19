package kr.or.epm.DAO;

import java.util.HashMap;
import java.util.List;

import kr.or.epm.VO.Contact;

/**
작성일 :	2016 - 11 - 18
작성자 :	김주희
사용 목적 :	주소록 DAO
**/
public interface ContactDAO {

	//그룹별 조회
	public List<Contact> selectContact_group(HashMap map);
			
	//상세 조회
	public Contact selectContact_detail(String contact_no);
	
	//주소록 상세조회 수정
	public int updateContact_detail(Contact dto);
	
	//주소록 상세조회 삭제  / 트랜잭션 필요
	public int deleteEmpContact(String contact_no);	
	public int deleteContact(String contact_no);
	
	//그룹에 작성한 이름의 그룹이 존재하는지 유효성 검사
	public int selectGroupCheck_name(String group_name);
	
	//그룹목록불러오기  / 위의 유효성 검사 결과가 0이면 작업진행
	public int insertGroup(String group_name);
	
	
	
}
