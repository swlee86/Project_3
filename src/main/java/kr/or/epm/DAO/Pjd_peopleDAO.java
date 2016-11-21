package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.Pjd_people;

public interface Pjd_peopleDAO {
	
	// 프로젝트 참여자 추가하기
	public int insertPjd_people();
	
	// 프로젝트 참여자 삭제하기
	public int deletePjd_people();
	
	// 프로젝트 참여자 조회하기
	public List<Pjd_people> selectPjd_people();
}
