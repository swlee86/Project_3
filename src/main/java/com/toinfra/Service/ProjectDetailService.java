package com.toinfra.Service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.toinfra.DAO.PjdDAO;
import com.toinfra.VO.Contact;
import com.toinfra.VO.Emp;
import com.toinfra.VO.Emp_contact;
import com.toinfra.VO.Pjd;
import com.toinfra.VO.Pjd_people;
import com.toinfra.VO.Pjdd;
/*
 * 작성일 : 2016-11-23
 * 작성자 : 김주희
 * 사용 목적 : 프로젝트 관련 서비스
 */

@Service
public class ProjectDetailService {

	@Autowired
	private SqlSession sqlsession;
	
	// 선택한 프로젝트의 프로젝트 상세 보기
	public List<Pjd> selectPjdlist(String pj_no){
		PjdDAO dao = sqlsession.getMapper(PjdDAO.class);
		List<Pjd> list = null;	
		list= dao.selectPjd(pj_no);
		for(int i = 0; i < list.size(); i++){
			String content = list.get(i).getPjd_content();
			if(content.length() > 40){
				content = content.substring(0, 40) + " ...... ";
				list.get(i).setPjd_content(content);
			}
		}
		return list;
	}
	
	
	public List<List<Pjd_people>> selectPjdPeople(List<Pjd> list){
		
		PjdDAO dao = sqlsession.getMapper(PjdDAO.class);
		
		List<List<Pjd_people>> result = new ArrayList();
		
		for(int i = 0; i < list.size(); i++){
			List<Pjd_people> peoplelist  =null;
			peoplelist = dao.selectPeople(list.get(i).getPjd_no());
			if(peoplelist != null){
				result.add(peoplelist);
			}else{
				result.add(null);
			}
		}
			return result;
	}
	
	// 참여자 자세히 보기
	public Pjd_people pjd_people(String emp_no){
		PjdDAO dao = sqlsession.getMapper(PjdDAO.class);
		
		Pjd_people people = null;
		people = dao.selectPeople_info(emp_no);
	
		return people;
	}
	
	//상세내역가져오기(단일)
	public Pjd selectPjd_detail(String pjd_no){
		PjdDAO dao = sqlsession.getMapper(PjdDAO.class);
		
		Pjd result = null;
		result = dao.selectPjd_Detail(pjd_no);
		
		return result;
	}
	//로그인한 사원정보 부르는 함수
	public Emp selectInfoSearchEmp(String id) {
		PjdDAO dao = sqlsession.getMapper(PjdDAO.class);
		Emp emp = dao.selectInfoSearch(id);
		return emp;
	}
		
	
	//주소록테이블에 추가하는 함수
	public int insertContactFromPjd(Contact contact){
		PjdDAO dao = sqlsession.getMapper(PjdDAO.class);
		int result = dao.insertContact(contact);
		result = selectMax_No(contact.getName());
		return result;
	}
	//현재 주소록의 최고 높은 번호를 구하는 함수
	public int selectMax_No(String name){
		PjdDAO dao = sqlsession.getMapper(PjdDAO.class);
		int result = dao.selectMaxContact_No(name);
		return result;
	}	
	//개인 주소록에 추가하는 함수
	public int insertPrivateContact(Emp_contact emp_contact){
		PjdDAO dao = sqlsession.getMapper(PjdDAO.class);
		int result = dao.insertEmpContact(emp_contact);
		return result; 
	}
	
	//선택한 상세프로젝트의 참여자 정보 가져오기
	public List<Pjd_people> selectPjdPeopleList(String pjd_no){
		PjdDAO dao = sqlsession.getMapper(PjdDAO.class);
		List<Pjd_people> result = null;
		result = dao.selectPeople(pjd_no);
		return result;
	}
	
	// 선택한 상세프로젝트의 상세내역들
	public List<Pjdd> selectPjddList(String pjd_no){
		PjdDAO dao = sqlsession.getMapper(PjdDAO.class);
		List<Pjdd> result = null;
		result = dao.selectPjdd(pjd_no);
		return result;	
	}
	
	//상세의 상세내역 추가하기
	public int insertPjdd(Pjdd pjdd){
		PjdDAO dao = sqlsession.getMapper(PjdDAO.class);
		int result = 0;
		result = dao.insertPjdd(pjdd);
		return result;
	}
	
	//상세의 상세 업데이트하기
	public int updatePjdd(String pjdd_no,String pjdd_content,String fin_check){
		PjdDAO dao = sqlsession.getMapper(PjdDAO.class);
		int result = 0;
		HashMap map = new HashMap();
		map.put("pjdd_no", pjdd_no);
		map.put("pjdd_content", pjdd_content);
		map.put("fin_check", fin_check);
		result = dao.updatePjdd(map);
		
		return result;
	}
	
	//상세의 진행률 업데이트
	public int updatePjdProgress(String pjd_no, String pjd_progress){
		PjdDAO dao = sqlsession.getMapper(PjdDAO.class);
		int result = 0;
		HashMap map = new HashMap();
		map.put("pjd_no", pjd_no);
		map.put("pjd_progress", pjd_progress);
		result = dao.updatePjdProgress(map);
		return result;
	}
	
	//프로젝트의 진행률
	public int updatePjProgress(String pjd_no){
		PjdDAO dao = sqlsession.getMapper(PjdDAO.class);
		int result = 0 ;
		result = dao.updatePjProgress(pjd_no);
		return result;
	}
	
	//프로젝트의 진행단계 업데이트
	public int updatePjdPjstepno(String pjd_no,String pj_step_no){
		PjdDAO dao = sqlsession.getMapper(PjdDAO.class);
		int result = 0;
		HashMap map = new HashMap();
		map.put("pjd_no", pjd_no);
		map.put("pj_step_no", pj_step_no);
		result = dao.updatePjd_step(map);
		return result;
	}
	
	//프로젝트 상세 내용 수정하기
	public int updatePjd(String pjd_no, String pjd_title, String pjd_content, String pj_step_no, String pjd_start, String pjd_end){
		PjdDAO dao = sqlsession.getMapper(PjdDAO.class);
		int result= 0;
		
		HashMap map = new HashMap();
		map.put("pjd_no", pjd_no);
		map.put("pjd_title", pjd_title);
		map.put("pjd_content", pjd_content);
		map.put("pj_step_no", pj_step_no);
		map.put("pjd_start", pjd_start);
		map.put("pjd_end", pjd_end);
		
		result = dao.updatePjd(map);
		
		return result;
	}
}
	