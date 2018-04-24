package com.toinfra.DAO;

import java.util.List;

import com.toinfra.VO.Pj_step;
import com.toinfra.VO.Pj_step;

/*
 * 작성일 : 2016-11-18
 * 작성자 : 백승아
 * 사용 목적 : 프로젝트 단계에 대한 DAO interface
*/

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
