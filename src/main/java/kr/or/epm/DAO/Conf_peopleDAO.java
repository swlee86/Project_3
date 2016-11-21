package kr.or.epm.DAO;

import java.util.List;
import kr.or.epm.VO.Conf_people;

public interface Conf_peopleDAO {
	
	// 회의 참여자 등록하기
	public int insertConf_people();
	
	// 회의 참여자 삭제하기
	public int deleteConf_people();
	
	// 회의 참여자 조회하기
	public List<Conf_people> selectConf_people();
}
