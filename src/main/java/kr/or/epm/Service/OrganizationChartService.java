package kr.or.epm.Service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

import kr.or.epm.DAO.ContactDAO;
import kr.or.epm.DAO.OrganizationDAO;
import kr.or.epm.VO.Contact;
import kr.or.epm.VO.Emp;
import kr.or.epm.VO.Emp_contact;
import kr.or.epm.VO.Organization;

/*
 * 작성자 : 이상원
 * 작성일 : 2016-11-22
 * 목   적 : 조직도 관련 서비스 페이지
 */

@Service
public class OrganizationChartService {

	@Autowired
	private SqlSession sqlsession;

	// 지점 이름 트리 구조
	public List<Organization> selectChartDept() {
		List<Organization> list = null;
		OrganizationDAO organizationDAO = sqlsession.getMapper(OrganizationDAO.class);
		list = organizationDAO.selectBranch();

		for (int i = 0; i < list.size(); i++) {
			System.out.println("지점 번호 : " + list.get(i).getBranch_no());
			System.out.println("부서 이름 : " + list.get(i).getDept_name());
			System.out.println("하위부서  이름 : " + list.get(i).getLow_dept_name());
			System.out.println("지점 이름 : " + list.get(i).getBranch_name());
		}
		return list;
	}

	// 부서 이름 트리 구조
	public List<Organization> selectChartdeptname(String branch_no) {
		System.out.println("부서 이름 뽑으러 서비스 타러 왔음");
		System.out.println("입력된 branch_name : " + branch_no);
		List<Organization> list = null;
		OrganizationDAO organizationDAO = sqlsession.getMapper(OrganizationDAO.class);
		list = organizationDAO.selectDept(branch_no);
		System.out.println("서비스단에서 나온 데이터 : " + list.size());
		return list;
	}

	// 하위 부서 이름 트리 구조
	public List<Organization> selectChartlowDept(String dept_no) {
		List<Organization> list = null;
		OrganizationDAO organizationDAO = sqlsession.getMapper(OrganizationDAO.class);
		System.out.println("서비스 : " + dept_no);
		list = organizationDAO.selectlowDept(dept_no);
		return list;
	}

	// 사원 정보 이름 트리 구조
	public List<Organization> selectEmpInfo(String low_dept_no) {
		System.out.println("서비스 selectEmpInfo : " + low_dept_no);
		List<Organization> list = null;
		OrganizationDAO organizationDAO = sqlsession.getMapper(OrganizationDAO.class);
		
		try{
			list = organizationDAO.selectEmpInfo(low_dept_no);
			
		}catch(Exception e){
			e.getMessage();
		}finally{
			for (int i = 0; i < list.size(); i++) {
				System.out.println("이름 : " + list.get(i).getEmp_name() + " / 사번 : " + list.get(i).getEmp_no());
			}			
		}
		return list;
	}
	
	//하위 부서 대표 뽑기 > 조직도에서 사용
	public Organization selectEmpMaster(String low_dept_no){
		OrganizationDAO organizationDAO = sqlsession.getMapper(OrganizationDAO.class);
		Organization Daepyo = null;
		try{
			Daepyo = organizationDAO.selectMasterEmpInfo(low_dept_no);
		}catch(Exception e){
			e.getMessage();
		}
		
		return Daepyo;
	}
	
	
	// 사원 정보 전부 불러오는 서비스 함수
	public List<Organization> selectEmpInfoAll() {
		List<Organization> list = null;
		OrganizationDAO organizationDAO = sqlsession.getMapper(OrganizationDAO.class);		
		try{
			list= organizationDAO.selectEmpInfoAll();
		}catch(Exception e){
			e.getMessage();
		}
		return list;
	}
	
	//로그인한 사원정보 부르는 함수
	public Emp selectInfoSearchEmp(String id) {
		System.out.println("selectInfoSearch() 서비스");
		OrganizationDAO organizationDAO = sqlsession.getMapper(OrganizationDAO.class);
		Emp emp = organizationDAO.selectInfoSearch(id);
		System.out.println("emp 사번 : "+ emp.getEmp_no());
		return emp;
	}

	//주소록테이블에 추가하는 함수
	public int insertContactFromOrganization(Contact contact){
		System.out.println("insertContact() 서비스 ");
		OrganizationDAO organizationDAO = sqlsession.getMapper(OrganizationDAO.class);
		System.out.println("Service Contact 데이터 : " + contact.toString());
		System.out.println("이름 데이터 : " + contact.getName());
		int result = organizationDAO.insertContact(contact);
		System.out.println("insert문 결과 restult : "+ result);
		result = selectMax_No(contact.getName());
		return result;
	}
	
	//현재 주소록의 최고 높은 번호를 구하는 함수
	public int selectMax_No(String name){
		System.out.println("selectMaxContact_No() 서비스");
		System.out.println("name : " + name);
		OrganizationDAO organizationDAO = sqlsession.getMapper(OrganizationDAO.class);
		int result = organizationDAO.selectMaxContact_No(name);
		System.out.println("최고 글 번호 result : "+ result);
		return result;
	}
	

	//개인 주소록에 추가하는 함수
	public int insertPrivateContact(Emp_contact emp_contact){
		System.out.println("insertEmpContact() 서비스");
		OrganizationDAO organizationDAO = sqlsession.getMapper(OrganizationDAO.class);
		int result = organizationDAO.insertEmpContact(emp_contact);
		System.out.println("개인 주소록 추가 결과 result : "+ result);
		return result; 
	}
	

}
