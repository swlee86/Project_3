package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.Pjd_people;

/*
 * 작성자 : 백승아
 * 작성일 : 2016-11-18
 * 사용목적 : 상세 프로젝트에 대한 DAO interface
 * 
*/

public interface Pjd_peopleDAO {
	
	// 프로젝트 참여자 추가하기
	public int insertPjd_people();
	
	// 프로젝트 참여자 삭제하기
	public int deletePjd_people();
	
	// 프로젝트 참여자 조회하기
	public List<Pjd_people> selectPjd_people();
}
