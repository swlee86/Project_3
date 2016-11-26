package kr.or.epm.Service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.epm.DAO.ContactDAO;
import kr.or.epm.VO.C_group;
import kr.or.epm.VO.Contact;
import kr.or.epm.VO.Emp;
import kr.or.epm.VO.Emp_contact;

@Service
public class ContactService {
	
	@Autowired
	private SqlSession sqlSession;
	
	//전체 주소록 리스트불러오는 함수
	public List<Contact> selectList(int cpage, int pagesize, String field, String query, String emp_no,String start, String end, String group) {
		int pgstart = cpage * pagesize - (pagesize - 1);
		int pgend = cpage * pagesize;
		System.out.println("pgstart :"+pgstart + " /pgend:" + pgend);
		System.out.println("group : "+group);
		ContactDAO contactDAO = sqlSession.getMapper(ContactDAO.class);
		List<Contact> list = contactDAO.selectList(cpage, pagesize, field, query, emp_no,start,end,group);
		System.out.println("***********list 사이즈 : "+ list.size());
		return list;
	}


	
	//전체글 갯수 구하는 함수
	public int selectCount(String emp_no, String field, String query, String start, String end, String group) {
		System.out.println("selectCount() 서비스");
		System.out.println("group : "+group);
		ContactDAO contactDAO = sqlSession.getMapper(ContactDAO.class);
		int totalcount = 0;
		totalcount = contactDAO.selectCount(emp_no, field, query,start ,end, group);
		System.out.println("탭별 totalcount : "+ totalcount +"찾는 키워드("+start+"~"+end+")");
		return totalcount;
	}
	

	//로그인한 사원정보 부르는 함수
	public Emp selectInfoSearch(String id) {
		System.out.println("selectInfoSearch() 서비스");
		ContactDAO contactDAO = sqlSession.getMapper(ContactDAO.class);
		Emp emp = contactDAO.selectInfoSearch(id);
		System.out.println("emp 사번 : "+ emp.getEmp_no());
		return emp;
	}


	//주소록 상세 정보 부르는 함수
	public Contact selectContact_detail(String contact_no){
		System.out.println("selectContact_detail() 서비스");
		ContactDAO contactDAO = sqlSession.getMapper(ContactDAO.class);
		Contact contact = contactDAO.selectContact_detail(contact_no);
		System.out.println(contact.toString());
		return contact;
	}
	
	//개인이 가지는 주소록 그룹 리스트
	public List<C_group> selectEmpGroup_list(String emp_no){
		System.out.println("selectEmpGroup_list() 서비스");
		ContactDAO contactDAO = sqlSession.getMapper(ContactDAO.class);
		List<C_group> list = contactDAO.selectEmpGroup_list(emp_no);
		System.out.println("주소록 그룹 list size : "+ list.size());
		return list;
	}
	
	//주소록테이블에 추가하는 함수
	public int insertContact(Contact contact){
		System.out.println("insertContact() 서비스 ");
		ContactDAO contactDAO = sqlSession.getMapper(ContactDAO.class);
		System.out.println("Service Contact 데이터 : " + contact.toString());
		int result = contactDAO.insertContact(contact);
		System.out.println("insert문 결과 restult : "+ result);
		result = selectMaxContact_No(contact.getName());
		return result;
	}
	
	//현재 최고 글번호 구하는 함수
	public int selectMaxContact_No(String name){
		System.out.println("selectMaxContact_No() 서비스");
		System.out.println("name : " + name);
		ContactDAO contactDAO = sqlSession.getMapper(ContactDAO.class);
		int result = contactDAO.selectMaxContact_No(name);
		System.out.println("최고 글 번호 result : "+ result);
		return result;
	}
	
	
	
	//개인 주소록에 추가하는 함수
	public int insertEmpContact(Emp_contact emp_contact){
		System.out.println("insertEmpContact() 서비스");
		ContactDAO contactDAO = sqlSession.getMapper(ContactDAO.class);
		int result = contactDAO.insertEmpContact(emp_contact);
		System.out.println("개인 주소록 추가 결과 result : "+ result);
		return result; 
	}


	//사내사원 정보 불러오는 함수
	public Emp selectEmpInfo(String emp_no) {
		System.out.println("selectEmpInfo() 서비스");
		ContactDAO contactDAO = sqlSession.getMapper(ContactDAO.class);
		Emp emp = contactDAO.selectEmpInfo(emp_no);
		System.out.println("emp : "+emp.toString());
		return emp;
	}
	
	
	//주소록 그룹 추가 하는 함수(트랜잭션)
	//selectGroupCheck_name 주소록 그룹 추가(그룹명중복확인) 
	@Transactional
	public String selectGroupCheck_name(String group_name, String emp_no) throws Exception{
		System.out.println("selectGroupCheck_name() 서비스");
		System.out.println("group_name : "+group_name+"/ emp_no: "+emp_no);
		
		ContactDAO contactDAO = sqlSession.getMapper(ContactDAO.class);
		String group_no= null;
		int result = -1;
		
		try{
			result = contactDAO.selectGroupCheck_name(group_name); //존재시 1이상 /없으면 0
			System.out.println("존재여부 result : "+result);
			
			if(result > 0){  //1:존재 ->그룹번호뽑기
				
				group_no= selectGroup_no(group_name);
				System.out.println("그룹번호찾기 : " + group_no);
			}else if(result == 0){  //0:존재x->그룹추가
				System.out.println("그룹추가");
				insertGroup(group_name); //그룹추가
				group_no = selectGroup_no(group_name);//그룹번호	
				System.out.println("그룹번호찾기 : " + group_no);
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
		System.out.println("selectGroup_no() 서비스");
		ContactDAO contactDAO = sqlSession.getMapper(ContactDAO.class);
		int result = contactDAO.insertGroup(group_name);
		System.out.println("추가 result : "+result);
		return result;
	}
	///->주소록 그룹 추가 > 그룹명 존재시'
	public String selectGroup_no(String group_name){
		System.out.println("selectGroup_no() 서비스");
		ContactDAO contactDAO = sqlSession.getMapper(ContactDAO.class);
		String result = contactDAO.selectGroup_no(group_name);
		System.out.println("존재 번호 result : "+result);
		return result;
	}
	
	// 개인주소록테이블 update(그룹번호 추가 + 전체 )
	public int updateGroups_insert(String emp_no, String group_no){
		System.out.println("updateGroups_insert() 서비스");
		System.out.println("emp_no : "+emp_no+"/ group_no : "+group_no);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("emp_no", emp_no);
		map.put("group_no", group_no);
	
		ContactDAO contactDAO = sqlSession.getMapper(ContactDAO.class);
		int result = 0;
		System.out.println("hashmap : " + map.toString());
		result = contactDAO.updateGroups_insert(map);
		
		System.out.println("처리 result : "+result);
		return result;
	}


	//개인 주소록 테이블 추가
	@Transactional
	public String selectGroupCheck_name(String group_name, String emp_no, String pre_group_no) throws Exception{
		System.out.println("selectGroupCheck_name() 서비스");
		System.out.println("group_name : "+group_name+"/ emp_no: "+emp_no + "/pre_group_no: "+pre_group_no);
		
		ContactDAO contactDAO = sqlSession.getMapper(ContactDAO.class);
	
		String group_no= null;
		int result = -1;
		
		try{
			result = contactDAO.selectGroupCheck_name(group_name); //존재시 1이상 /없으면 0
			System.out.println("존재여부 result : "+result);
			
			if(result > 0){  //1:존재 ->그룹번호뽑기
				group_no= selectGroup_no(group_name);
				System.out.println("그룹번호찾기 : " + group_no);
			}else if(result == 0){  //0:존재x->그룹추가
				System.out.println("그룹추가");
				insertGroup(group_name); //그룹추가
				group_no = selectGroup_no(group_name);//그룹번호	
				System.out.println("그룹번호찾기 : " + group_no);
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
		System.out.println("updateGroups_delete_change 서비스 탐");
		System.out.println("emp_no:"+emp_no+"/ group_no:"+group_no);
		ContactDAO contactDAO = sqlSession.getMapper(ContactDAO.class);
		
		int result = -1;
		int result2 = 0;
		
		try{
			result = contactDAO.updateGroups_delete_change(emp_no, group_no);
			System.out.println("1로 변경 result : "+result);
			
			
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("emp_no", emp_no);
			map.put("pre_group_no", group_no);
			result2 = contactDAO.updateGroups_delete(map);
			System.out.println("그룹 삭제 result2 : "+result2);
		}catch(Exception e){
			System.out.println("updateGroups_delete_change 트랜잭션 오류" + e.getMessage());
			throw e; //롤백
		}
		
		return "redirect:contacts_group.do";
	}

	//주소록 상세 삭제
	@Transactional
	public String deleteEmpContact(String contact_no, String emp_no) throws Exception{
		System.out.println("deleteEmpContact 서비스 탐");
		System.out.println("contact_no:"+contact_no +"/ emp_no:"+emp_no);
		ContactDAO contactDAO = sqlSession.getMapper(ContactDAO.class);
		
		try{
			int result = contactDAO.deleteEmpContact(contact_no, emp_no);
			System.out.println("deleteEmpContact(emp_contact 삭제) : " + result);
			int result2 = contactDAO.deleteContact(contact_no);
			System.out.println("deleteContact(contacts 삭제) : "+result2);
		}catch(Exception e){
			System.out.println("deleteEmpContact 트랜잭션 오류" + e.getMessage());
			throw e; //롤백
		}
		return "redirect:contacts.do";
	}


	
	//주소록 수정
	public int updateContact(Contact contact) {
		System.out.println("updateContact 서비스탐");
		System.out.println("contact tostring : "+contact.toString());
		ContactDAO contactDAO = sqlSession.getMapper(ContactDAO.class);
		int result = contactDAO.updateContact_detail(contact);
		System.out.println("restult :" + result);
		return result;
	}
	
	//주소록 갯수
	public int selectContact_count(String emp_no){
		System.out.println("selectContact_count 서비스탐");
		ContactDAO contactDAO = sqlSession.getMapper(ContactDAO.class);
		int result = contactDAO.selectContact_count(emp_no);
		System.out.println("result : "+result );
		return result;
	}
	
}

