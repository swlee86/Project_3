package kr.or.epm.Service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

import kr.or.epm.DAO.OrganizationDAO;
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

}
