package kr.or.epm.Service;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.epm.DAO.PjDAO;
import kr.or.epm.DAO.Pj_stepDAO;
import kr.or.epm.VO.Emp;
import kr.or.epm.VO.Pj;
import kr.or.epm.VO.Pj_step;
import kr.or.epm.VO.Pjd;
import kr.or.epm.VO.Pjd_Command;

/*
 * 작성일 : 2016-11-23
 * 작성자 : 김주희
 * 사용 목적 : 프로젝트 관련 컨트롤러
 * 
 * 수정일 : 2016-11-25
 * 작성자 : 박지은
 */

@Service
public class ProjectService {

	@Autowired
	private SqlSession sqlsession;
	
	
	//승인처리 
	public void project_approve_try(String pj_no, String step_no) {
		PjDAO dao = sqlsession.getMapper(PjDAO.class);
		dao.updatePj_approval(pj_no,step_no);
	}

	//승인 처리 상세 의 상세프로젝트 보기
	public List<Pjd> selectPjd_detail(String pj_no){
		PjDAO dao = sqlsession.getMapper(PjDAO.class);
		List<Pjd> list = dao.selectPjd_detail(pj_no);
		return list;
	}
	
	//승인 처리 전체 상세보기
	public Pj selectPj_detail(String pj_no){
		PjDAO dao = sqlsession.getMapper(PjDAO.class);
		Pj pj = dao.selectPj_detail(pj_no);
		return pj;
	}
	
	//승인 처리 할 목록 가져오기 
	public List<Pj> selectPj_rec(int cpage, int pagesize, String field, String query, String rec_emp_no) {
		PjDAO dao = sqlsession.getMapper(PjDAO.class);
		List<Pj> list = dao.selectPj_rec(cpage,pagesize,field,query,rec_emp_no);
		return list;
	}
	
	//승인 처리 갯수 가져오기
	public int selectApprovalCount(String rec_emp_no, String field, String query) {
		PjDAO dao = sqlsession.getMapper(PjDAO.class);
		int totalcount =  dao.selectApprovalCount(rec_emp_no,field,query);
		return totalcount;
	}
	
	//승인번호 가져오기
	public void selectStepName(String query){
		PjDAO dao = sqlsession.getMapper(PjDAO.class);
		dao.selectStepName(query);
	}
	
	//자신의 정보 가져오기 
	public Emp selectInfoSearch(String id) {
		PjDAO dao = sqlsession.getMapper(PjDAO.class);
		Emp emp = dao.selectInfoSearch(id);
		return emp;
	}
		
	//큰 프로젝트 작성
	public String insertPj(Pj pj, Pjd_Command pjd_Command){
		PjDAO dao = sqlsession.getMapper(PjDAO.class);
		int result = 0;
		result = dao.insertPj(pj);
		if(result > 0){	
			int numrow = insertPjd(pjd_Command);
			List<String> rowlist = selectMaxPjd_no(numrow);
			insertPjd_people(rowlist,pjd_Command);
		}
			
		return "redirect:projectApprove.do";
	}
		
	private List<String> selectMaxPjd_no(int numrow) {
		PjDAO dao = sqlsession.getMapper(PjDAO.class);
		List<String> rowlist = dao.selectMaxPjd_no(numrow);
		return rowlist;
	}

	//상세 프로젝트 작성
	public int insertPjd(Pjd_Command pjd_Command){
		PjDAO dao = sqlsession.getMapper(PjDAO.class);
	
		List<Pjd> list = pjd_Command.getPjd();
		int max_no = selectMaxPj_no();
		String pj_no = String.valueOf(max_no);
			
		for(Pjd pjd : list){
			pjd.setPj_no(pj_no);
			dao.insertPjd(pjd);
		}
		int row = list.size();
		return row;	
	}
		
		
	//상세프로젝트 참여자 작성
	public int insertPjd_people(List<String> rowlist, Pjd_Command pjd_Command){
		PjDAO dao = sqlsession.getMapper(PjDAO.class);
		List<Pjd> list = pjd_Command.getPjd();
		
		int result = 0;
		int row = 0;
			
		for(Pjd pjd : list){		
			String[] rec_people = pjd.getRec_emp_no().split(",");
				
			for(int i = 0; i<rec_people.length ; i++){
				result = 0;
				result = dao.insertPjd_people(rowlist.get(row), rec_people[i]);
			}
			row = +1;
		}	
		return result;	
	}
		
	public int selectMaxPj_no(){
		int result = 0;
		PjDAO dao = sqlsession.getMapper(PjDAO.class);
		result = dao.selectMaxPj_no();
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

	
	//프로젝트 작성한 사람의 사번가져오기
	public String selectPjwriteempno(String pjd_no){
		PjDAO dao = sqlsession.getMapper(PjDAO.class);
		
		String pj_emp_no = "";
		pj_emp_no = dao.selectPj_writeempno(pjd_no);
		return pj_emp_no;
	}
	
	//승인처리 목록 가져오기
	public List<Pj_step> selectPjStepList(){
		Pj_stepDAO dao = sqlsession.getMapper(Pj_stepDAO.class);		
		List<Pj_step> pjstep = null;		
		pjstep = dao.selectPj_step();
		return pjstep;
	}


	//프로젝트 리스트 검색
	public List<Pj> searchPj(String key, String value){
		PjDAO dao = sqlsession.getMapper(PjDAO.class);		
		List<Pj> pjlist = null;		
		pjlist = dao.searchPj(key,value);
		return pjlist;
	}

	//현재 상세프로젝트랑 같은 프로젝트에 포함된 모든 상세 프로젝트들의 상태 가져오기
	public List<String> selectPjstepno_Of_includePjdno(String pjd_no){
		PjDAO dao = sqlsession.getMapper(PjDAO.class);	
		List<String> pjstepnolist = null;	
		pjstepnolist = dao.selectPjstepno_Of_includePjdno(pjd_no);		
		return pjstepnolist;
		
	}
	
	//PJ의 Pj_step_no 업데이트
	public int updatePjstepno(String pjd_no, String pj_step_no){
		PjDAO dao = sqlsession.getMapper(PjDAO.class);
		int result = 0;
		HashMap map = new HashMap();
		map.put("pjd_no", pjd_no);
		map.put("pj_step_no", pj_step_no);
		result = dao.updatePjstepno(map);
		return result;
	}
	
	//pjd_no로 PJ의 시작일 종료일 가져오기
	public Pj selectPjDate(String pjd_no){
		PjDAO dao = sqlsession.getMapper(PjDAO.class);
		Pj pjdate = null;
		pjdate = dao.selectPjDate(pjd_no);
		return pjdate;
	}

	//프로젝트 송신 대기함
	public int selectSendCount(String emp_no, String field, String query) {
		PjDAO dao = sqlsession.getMapper(PjDAO.class);
		int totalcount =  dao.selectSendCount(emp_no,field,query);
		return totalcount;
	}
	
	//프로젝트 송신 리스트 뽑기
	public List<Pj> select_Send_Pj_rec(String field, String query, String emp_no) {
		PjDAO dao = sqlsession.getMapper(PjDAO.class);
		List<Pj> list = dao.select_Send_Pj_rec(emp_no,field,query);
		return list;
	}

}
