package com.toinfra.DAO;

import java.util.List;

import com.toinfra.DTO.Set_homepage;

/*
 * 작성일 : 2016-11-18
 * 작성자 : 백승아
 * 사용 목적 : 홈페이지 접근 시간 설정에 대한 DAO interface
*/

public interface Set_homepageDAO {
	
	// 전체 홈페이지 접근 시간 조회하기
	public List<Set_homepage> selectSet_homepage();
	
	// 하위 부서별 홈페이지 접근 시간 조회하기
	public List<Set_homepage> selectSet_homepage_dept();
	
	// 홈페이지 접근 시간 수정하기
	public int updateSet_homepage();
	
	// 홈페이지 접근 시간 등록하기
	public int insertSet_homepage();
}
