package kr.or.epm.Service;


import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.epm.DAO.CommuteDAO;
import kr.or.epm.DAO.PjDAO;
import kr.or.epm.DAO.PjdDAO;
import kr.or.epm.VO.Commute;
import kr.or.epm.VO.Pj;
import kr.or.epm.VO.Pjd;
import kr.or.epm.VO.Pjd_people;


@Service
public class ProjectDetailService {

	@Autowired
	private SqlSession sqlsession;
	
	// 선택한 프로젝트의 프로젝트 상세 보기
	public List<Pjd> selectPjdlist(String pj_no){
		System.out.println("들어는옴");
		PjdDAO dao = sqlsession.getMapper(PjdDAO.class);
		List<Pjd> list = null;	
		list= dao.selectPjd(pj_no);
		for(int i = 0; i < list.size(); i++){
		System.out.println(list.get(i).toString());
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
			System.out.println("Pjd_no : " + list.get(i).getPjd_no());
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
}
	