package kr.or.epm.DAO;

import java.util.List;
import kr.or.epm.VO.Conf_people;

/*
 * 작성일 : 2016-11-18
 * 작성자 : 백승아
 * 사용 목적 : 회의 참여자에 대한 DAO interface
*/

public interface Conf_peopleDAO {
	
	// 회의 참여자 등록하기
	public int insertConf_people();
	
	// 회의 참여자 삭제하기
	public int deleteConf_people();
	
	// 회의 참여자 조회하기
	public List<Conf_people> selectConf_people();
}
