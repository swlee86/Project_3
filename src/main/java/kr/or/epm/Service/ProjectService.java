package kr.or.epm.Service;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.epm.DAO.CommuteDAO;
import kr.or.epm.DAO.ContactDAO;
import kr.or.epm.DAO.PjDAO;
import kr.or.epm.VO.Commute;
import kr.or.epm.VO.Emp;
import kr.or.epm.VO.Pj;
import kr.or.epm.VO.Pjd;
import kr.or.epm.VO.Pjd_Command;
import kr.or.epm.VO.Pjd_people;


@Service
public class ProjectService {

	@Autowired
	private SqlSession sqlsession;
	
	//자신의 정보 가져오기 
	public Emp selectInfoSearch(String id) {
		System.out.println("selectInfoSearch() 서비스");
		PjDAO contactDAO = sqlsession.getMapper(PjDAO.class);
		Emp emp = contactDAO.selectInfoSearch(id);
		System.out.println("emp 사번 : "+ emp.getEmp_no());
		return emp;
	}
	
	//큰 프로젝트 작성
	@Transactional
	public String insertPj(Pj pj, Pjd_Command pjd_Command) throws Exception{
		System.out.println("insertPj() 서비스 ");
		
		PjDAO dao = sqlsession.getMapper(PjDAO.class);
		
		try{
			int result = dao.insertPj(pj);
			if(result > 0){
				insertPjd(pjd_Command);
			}
		}catch(Exception e){
			System.out.println("insertPj 트랜잭션 오류" + e.getMessage());
			throw e; //롤백
		}
		
		
		return "redirect:project_list.do";
	}
	
	//상세 프로젝트 작성
	public int insertPjd(Pjd_Command pjd_Command){
		PjDAO dao = sqlsession.getMapper(PjDAO.class);
		int result = 0;
		List<Pjd> list = pjd_Command.getPjd();
		
		String pj_no = String.valueOf(selectMaxPj_no());
		
		for(Pjd pjd : list){
			result = 0;
			System.out.println("pjd : "+pjd.toString());
			pjd.setPj_no(pj_no);
			result = dao.insertPjd(pjd);
			System.out.println("상세 프로젝트 추가 결과  : "+result);
		}
		return result;	
	}
	
	//상세프로젝트 참여자 작성
/*	public int insertPjd_people(Pjd_Command pjd_Command){
		PjDAO dao = sqlsession.getMapper(PjDAO.class);
		int result = 0;
		List<Pjd> list = pjd_Command.getPjd();
		
		String pj_no = String.valueOf(selectMaxPj_no());
		
		for(Pjd pjd : list){
			result = 0;
			System.out.println("pjd : "+pjd.toString());
			pjd.setPj_no(pj_no);
			result = dao.insertPjd(pjd);
			System.out.println("상세 프로젝트 추가 결과  : "+result);
		}
		return result;	
	}*/
	
	public int selectMaxPj_no(){
		int result = 0;
		PjDAO dao = sqlsession.getMapper(PjDAO.class);
		result = dao.selectMaxPj_no();
		System.out.println("최고글 번호 : "+result);
		return result;
	}
	
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
