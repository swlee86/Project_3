package kr.or.epm.DAO;

import java.util.List;
import kr.or.epm.VO.Conf;

/*
 * 작성일 : 2016-11-18
 * 작성자 : 백승아
 * 사용 목적 : 회의에 대한 DAO interface
*/

public interface ConfDAO {
	
	
	// 회의 등록하기
	public int insertConf();
	
	// 회의 수정하기
	public int updateConf();
	
	// 회의 삭제하기
	public int deleteConf();
	
	// 회의 조회하기
	public List<Conf> selectConf();
}
