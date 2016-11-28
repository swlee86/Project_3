package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.Pj;
import kr.or.epm.VO.Task;

/*
 * 작성일 : 2016-11-18
 * 작성자 : 백승아
 * 사용 목적 : 프로젝트에 대한 DAO interface
*/

public interface PjDAO {
	
	// 프로젝트 등록하기
	public int insertPj();
	
	// 프로젝트 승인 대기함 조회하기
	public List<Pj> selectPj_rec();
	
	// 프로젝트 승인 대기함 상세보기
	public Pj selectPj_detail();
	
	// 프로젝트 승인 대기함에서 삭제하기
	public int deletePj_rec();
	
	// 프로젝트 진행 단계 처리하기
	public int updatePj_step();
	
	// 프로젝트 승인 처리하기
	public int updatePj_approval();
	
	// 프로젝트 조회하기( 승인 O )
	public List<Pj> selectPj();
	
	// 내가 작성한 프로젝트 조회하기 ( 승인 O )
	public List<Pj> selectPj_write(String emp_no);
	
	// 내가 포함된 프로젝트 조회하기 ( 참여자 , 승인 O ) 
	public List<Pj> selectPj_include(String emp_no);
	
	
	// 프로젝트 내가 작성한것 and 내가 참여자인것 프로젝트 목록 가져오기
	public List<Pj> selectPj_callendar(String emp_no);
}
