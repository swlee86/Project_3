package kr.or.epm.Service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		
		return list;
	}

	// 부서 이름 트리 구조
	public List<Organization> selectChartdeptname(String branch_no) {
		List<Organization> list = null;
		OrganizationDAO organizationDAO = sqlsession.getMapper(OrganizationDAO.class);
		list = organizationDAO.selectDept(branch_no);
		return list;
	}

	// 하위 부서 이름 트리 구조
	public List<Organization> selectChartlowDept(String dept_no) {
		List<Organization> list = null;
		OrganizationDAO organizationDAO = sqlsession.getMapper(OrganizationDAO.class);
		list = organizationDAO.selectlowDept(dept_no);
		return list;
	}

	// 사원 정보 이름 트리 구조
	public List<Organization> selectEmpInfo(String low_dept_no) {
		List<Organization> list = null;
		OrganizationDAO organizationDAO = sqlsession.getMapper(OrganizationDAO.class);
		
		try{
			list = organizationDAO.selectEmpInfo(low_dept_no);
		}catch(Exception e){
			e.getMessage();
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
		OrganizationDAO organizationDAO = sqlsession.getMapper(OrganizationDAO.class);
		Emp emp = organizationDAO.selectInfoSearch(id);
		return emp;
	}

	//주소록테이블에 추가하는 함수
	public int insertContactFromOrganization(Contact contact){
		OrganizationDAO organizationDAO = sqlsession.getMapper(OrganizationDAO.class);
		int result = organizationDAO.insertContact(contact);
		result = selectMax_No(contact.getName());
		return result;
	}
	
	//현재 주소록의 최고 높은 번호를 구하는 함수
	public int selectMax_No(String name){
		OrganizationDAO organizationDAO = sqlsession.getMapper(OrganizationDAO.class);
		int result = organizationDAO.selectMaxContact_No(name);
		return result;
	}
	

	//개인 주소록에 추가하는 함수
	public int insertPrivateContact(Emp_contact emp_contact){
		OrganizationDAO organizationDAO = sqlsession.getMapper(OrganizationDAO.class);
		int result = organizationDAO.insertEmpContact(emp_contact);
		return result; 
	}
}
