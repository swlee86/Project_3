package kr.or.epm.Service;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.epm.DAO.CommuteDAO;
import kr.or.epm.DAO.PjDAO;
import kr.or.epm.VO.Commute;
import kr.or.epm.VO.Pj;
import kr.or.epm.VO.Pjd_people;


@Service
public class ProjectService {

	@Autowired
	private SqlSession sqlsession;
	
	// 모든 프로젝트 목록 출력
	public List<Pj> selectPjlist_all(){
		PjDAO dao = sqlsession.getMapper(PjDAO.class);
		List<Pj> list = null;	
		list= dao.selectPj();		
		return list;
	}
	
	// 카테고리별 프로젝트 목록 출력 (승인된 것만 )
	public List<Pj> selectPjlist_ctg(String select_ctg,String emp_no){
		
		PjDAO dao = sqlsession.getMapper(PjDAO.class);
		List<Pj> list =null;
		
		if(select_ctg.equals("all")){
			list = dao.selectPj();
		}else if(select_ctg.equals("write")){
			list = dao.selectPj_write(emp_no);
		}else if(select_ctg.equals("include")){
			list = dao.selectPj_include(emp_no);
		}
		return list;
	}
	
	// 내가 작성한 프로젝트 , 내가 참여자인 프로젝트 목록 가져오기 (캘린더)
	public List<Pj> selectPj_callendar(String emp_no){
		PjDAO dao = sqlsession.getMapper(PjDAO.class);
		List<Pj> list=null;
		
		list = dao.selectPj_callendar(emp_no);
		
		return list;
	}
	
}
