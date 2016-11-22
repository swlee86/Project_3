package kr.or.epm.Service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public List<Contact> selectList(int cpage, int pagesize, String field, String query, String emp_no,String start, String end) {
		int pgstart = cpage * pagesize - (pagesize - 1);
		int pgend = cpage * pagesize;
		System.out.println("pgstart :"+pgstart + " /pgend:" + pgend);

		ContactDAO contactDAO = sqlSession.getMapper(ContactDAO.class);
		List<Contact> list = contactDAO.selectList(cpage, pagesize, field, query, emp_no,start,end);
		System.out.println("***********list 사이즈 : "+ list.size());
		return list;
	}


	
	//전체글 갯수 구하는 함수
	public int selectCount(String emp_no, String field, String query, String start, String end) {
		System.out.println("selectCount() 서비스");
		ContactDAO contactDAO = sqlSession.getMapper(ContactDAO.class);
		int totalcount = 0;
		totalcount = contactDAO.selectCount(emp_no, field, query,start ,end);
		System.out.println("탭별 totalcount : "+ totalcount +"찾는 키워드("+start+"~"+end+")");
		return totalcount;
	}
	

	
	
	//사원정보 부르는 함수
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
	
	//사원이 가지는 주소록 그룹 리스트
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

	
}
