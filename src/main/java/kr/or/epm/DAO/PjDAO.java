package kr.or.epm.DAO;

import java.util.HashMap;
import java.util.List;

import kr.or.epm.VO.Emp;
import kr.or.epm.VO.Pj;
import kr.or.epm.VO.Pjd;
import kr.or.epm.VO.Task;

/*
 * 작성일 : 2016-11-18
 * 작성자 : 백승아
 * 사용 목적 : 프로젝트에 대한 DAO interface
*/

public interface PjDAO {
	
	//프로젝트 승인 처리하기
	public int updatePj_approval(String pj_no, String step_no);
	
	//프로젝트 승인처리 상세의 상세 프로젝트보기 
	public List<Pjd> selectPjd_detail(String pj_no);
	
	// 프로젝트 등록하기
	public int insertPj(Pj pj);
	
	//프로젝트 상세 등록하기
	public int insertPjd(Pjd pjd);
	
	// 프로젝트 승인 대기함 조회하기
	public List<Pj> selectPj_rec(int cpage, int pagesize, String field, String query, String rec_emp_no);
	
	// 프로젝트 승인 대기함 상세보기
	public Pj selectPj_detail(String pj_no);
	
	// 프로젝트 승인 대기함에서 삭제하기
	public int deletePj_rec();
	
	// 프로젝트 진행 단계 처리하기
	public int updatePj_step();
	
	// 프로젝트 조회하기( 승인 O )
	public List<Pj> selectPj();
	
	// 내가 작성한 프로젝트 조회하기 ( 승인 O )
	public List<Pj> selectPj_write(String emp_no);
	
	// 내가 포함된 프로젝트 조회하기 ( 참여자 , 승인 O ) 
	public List<Pj> selectPj_include(String emp_no);
	
	
	// 프로젝트 내가 작성한것 and 내가 참여자인것 프로젝트 목록 가져오기
	public List<Pj> selectPj_callendar(String emp_no);

	//회원정보 가져오기
	public Emp selectInfoSearch(String id);
	
	public int selectMaxPj_no();
	
	//프로젝트 상세 참여자 추가하기
	public int insertPjd_people(String num_no, String emp_no);
	
	
	public List<String> selectMaxPjd_no(int numrow);

	//승인처리 글 갯수
	public int selectApprovalCount(String rec_emp_no, String field, String query);
	
	//승인처리 이름가져오기
	public String selectStepName(String query);
	
	//프로젝트 작성자의 emp_no 가져오기
	public String selectPj_writeempno(String pjd_no);

	//프로젝트 검색
	public List<Pj> searchPj(String key, String value);

	//현재 상세프로젝트가 포함된 프로젝트의 모든 상세 프로젝트들의 진행상황 가져오기 ( = pj_no가 같은 pjd들의 진행상황 )
	public List<String> selectPjstepno_Of_includePjdno(String pjd_no);
	
	//프로젝트의 진행단계 업데이트
	public int updatePjstepno(HashMap map);

	
}
