package com.toinfra.Service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.toinfra.DAO.ContactDAO;
import com.toinfra.VO.C_group;
import com.toinfra.VO.Contact;
import com.toinfra.VO.Emp;
import com.toinfra.VO.Emp_contact;
/*
 * 작성자 : 박지은
 * 작성일 : 2016-11-21
 * 목  적 : 주소록 서비스
 */

@Service
public class ContactService {
	
	@Autowired
	private SqlSession sqlSession;
	
	//전체 주소록 리스트불러오는 함수
	public List<Contact> selectList(int cpage, int pagesize, String field, String query, String emp_no,String start, String end, String group) {
		ContactDAO contactDAO = sqlSession.getMapper(ContactDAO.class);
		List<Contact> list = contactDAO.selectList(cpage, pagesize, field, query, emp_no,start,end,group);
		return list;
	}

	
	//전체글 갯수 구하는 함수
	public int selectCount(String emp_no, String field, String query, String start, String end, String group) {
		ContactDAO contactDAO = sqlSession.getMapper(ContactDAO.class);
		int totalcount = 0;
		totalcount = contactDAO.selectCount(emp_no, field, query,start ,end, group);
		return totalcount;
	}
	

	//로그인한 사원정보 부르는 함수
	public Emp selectInfoSearch(String id) {
		ContactDAO contactDAO = sqlSession.getMapper(ContactDAO.class);
		Emp emp = contactDAO.selectInfoSearch(id);
		return emp;
	}


	//주소록 상세 정보 부르는 함수
	public Contact selectContact_detail(String contact_no){
		ContactDAO contactDAO = sqlSession.getMapper(ContactDAO.class);
		Contact contact = contactDAO.selectContact_detail(contact_no);
		return contact;
	}
	
	//개인이 가지는 주소록 그룹 리스트
	public List<C_group> selectEmpGroup_list(String emp_no){
		ContactDAO contactDAO = sqlSession.getMapper(ContactDAO.class);
		List<C_group> list = contactDAO.selectEmpGroup_list(emp_no);
		return list;
	}
	
	//주소록테이블에 추가하는 함수
	public int insertContact(Contact contact){
		ContactDAO contactDAO = sqlSession.getMapper(ContactDAO.class);
		int result = contactDAO.insertContact(contact);
		result = selectMaxContact_No(contact.getName());
		return result;
	}
	
	//현재 최고 글번호 구하는 함수
	public int selectMaxContact_No(String name){
		ContactDAO contactDAO = sqlSession.getMapper(ContactDAO.class);
		int result = contactDAO.selectMaxContact_No(name);
		return result;
	}
	
	
	//개인 주소록에 추가하는 함수
	public int insertEmpContact(Emp_contact emp_contact){
		ContactDAO contactDAO = sqlSession.getMapper(ContactDAO.class);
		int result = contactDAO.insertEmpContact(emp_contact);
		return result; 
	}


	//사내사원 정보 불러오는 함수
	public Emp selectEmpInfo(String emp_no) {
		ContactDAO contactDAO = sqlSession.getMapper(ContactDAO.class);
		Emp emp = contactDAO.selectEmpInfo(emp_no);
		return emp;
	}
	
	
	//주소록 그룹 추가 하는 함수(트랜잭션)
	//selectGroupCheck_name 주소록 그룹 추가(그룹명중복확인) 
	@Transactional
	public String selectGroupCheck_name(String group_name, String emp_no) throws Exception{
		
		ContactDAO contactDAO = sqlSession.getMapper(ContactDAO.class);
		String group_no= null;
		int result = -1;
		
		try{
			result = contactDAO.selectGroupCheck_name(group_name); //존재시 1이상 /없으면 0			
			if(result > 0){  //1:존재 ->그룹번호뽑기				
				group_no= selectGroup_no(group_name);
			}else if(result == 0){  //0:존재x->그룹추가
				insertGroup(group_name); //그룹추가
				group_no = selectGroup_no(group_name);//그룹번호	
			}
			
			//groups에 update 처리
			updateGroups_insert(emp_no, group_no);

		}catch(Exception e){
			System.out.println("selectGroupCheck_name() 트랜잭션 오류" + e.getMessage());
			throw e; //롤백
		}	
		return "redirect:contacts_group.do";
	}
	
	//->주소록 그룹 추가 > 그룹명 존재 안하면
	public int insertGroup(String group_name){
		ContactDAO contactDAO = sqlSession.getMapper(ContactDAO.class);
		int result = contactDAO.insertGroup(group_name);
		return result;
	}
	
	//->주소록 그룹 추가 > 그룹명 존재시
	public String selectGroup_no(String group_name){
		ContactDAO contactDAO = sqlSession.getMapper(ContactDAO.class);
		String result = contactDAO.selectGroup_no(group_name);
		return result;
	}
	
	// 개인주소록테이블 update(그룹번호 추가 + 전체 )
	public int updateGroups_insert(String emp_no, String group_no){
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("emp_no", emp_no);
		map.put("group_no", group_no);
	
		ContactDAO contactDAO = sqlSession.getMapper(ContactDAO.class);
		int result = 0;
		result = contactDAO.updateGroups_insert(map);

		return result;
	}


	//개인 주소록 테이블 추가
	@Transactional
	public String selectGroupCheck_name(String group_name, String emp_no, String pre_group_no) throws Exception{
		ContactDAO contactDAO = sqlSession.getMapper(ContactDAO.class);
	
		String group_no= null;
		int result = -1;
		
		try{
			result = contactDAO.selectGroupCheck_name(group_name); //존재시 1이상 /없으면 0
			
			if(result > 0){  //1:존재 ->그룹번호뽑기
				group_no= selectGroup_no(group_name);
			}else if(result == 0){  //0:존재x->그룹추가
				insertGroup(group_name); //그룹추가
				group_no = selectGroup_no(group_name);//그룹번호	
			}
			
			//pre_group_no>group_no 로 바꿔야대
			contactDAO.updateContact_GroupNo(group_no, pre_group_no,emp_no);
			
			//내 groups에 수정 전 그룹 번호 삭제(emp_contact) -> 예전 그룹번호 삭제
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("emp_no", emp_no);
			map.put("pre_group_no", pre_group_no);
			contactDAO.updateGroups_delete(map);		
			
			//groups에  새 그룹번호 추가 -> update 처리
			updateGroups_insert(emp_no, group_no);

		}catch(Exception e){
			System.out.println("selectGroupCheck_name(group_name,emp_no,pre_group_no) 트랜잭션 오류" + e.getMessage());
			throw e; //롤백
		}
		
		return "redirect:contacts_group.do";
	}
	
	//주소록 그룹  번호 1(선택없음)로변경
	@Transactional
	public String updateGroups_delete_change(String emp_no,String group_no) throws Exception{
		ContactDAO contactDAO = sqlSession.getMapper(ContactDAO.class);
	
		try{
			contactDAO.updateGroups_delete_change(emp_no, group_no);
			
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("emp_no", emp_no);
			map.put("pre_group_no", group_no);
		    contactDAO.updateGroups_delete(map);
		}catch(Exception e){
			System.out.println("updateGroups_delete_change 트랜잭션 오류" + e.getMessage());
			throw e; //롤백
		}
		
		return "redirect:contacts_group.do";
	}

	//주소록 상세 삭제
	@Transactional
	public String deleteEmpContact(String contact_no, String emp_no) throws Exception{
		ContactDAO contactDAO = sqlSession.getMapper(ContactDAO.class);
		
		try{
			 contactDAO.deleteEmpContact(contact_no, emp_no);
			 contactDAO.deleteContact(contact_no);
		}catch(Exception e){
			System.out.println("deleteEmpContact 트랜잭션 오류" + e.getMessage());
			throw e; //롤백
		}
		return "redirect:contacts.do";
	}


	
	//주소록 수정
	public int updateContact(Contact contact) {
		ContactDAO contactDAO = sqlSession.getMapper(ContactDAO.class);
		int result = contactDAO.updateContact_detail(contact);
		return result;
	}
	
	//주소록 갯수
	public int selectContact_count(String emp_no){
		ContactDAO contactDAO = sqlSession.getMapper(ContactDAO.class);
		int result = contactDAO.selectContact_count(emp_no);
		return result;
	}


	//주소록 추가시 검색해서 사원 뽑아오는 함수
	public List<Emp>  contact_insert_search(String field, String query, String id) {
		ContactDAO contactDAO = sqlSession.getMapper(ContactDAO.class);
		String field2 = "emp_name";
		String query2 = "%%";		
		
		if(field != null && !field.equals("")){
			field2 = field;
		}
		
		if(query != null && !query.equals("")){	
			query2 = query;		
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("field", field2);
		map.put("query", query2);
		map.put("id", id);
			
		List<Emp> emp = contactDAO.contact_insert_search(map);
		
		return emp;
	}
	
}

