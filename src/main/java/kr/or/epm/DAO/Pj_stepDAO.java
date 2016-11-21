package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.Pj_step;

public interface Pj_stepDAO {

	// 프로젝트 진행 단계 조회하기
	public List<Pj_step> selectPj_step();
	
	// 프로젝트 진행 단계 등록하기
	public int insertPj_step();
	
	// 프로젝트 진행 단계 삭제하기
	public int deletePj_step();
	
	// 프로젝트 진행 단계 수정하기
	public int updatePj_step();
}
