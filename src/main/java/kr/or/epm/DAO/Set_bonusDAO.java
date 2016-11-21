package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.Set_bonus;

public interface Set_bonusDAO {

	// 전체 상여금 조회하기
	public List<Set_bonus> selectSet_bonus();
	
	// 부서별 상여금 조회하기
	public List<Set_bonus> selectSet_bonus_dept();
	
	// 상여금 지급 비율 및 지급 여부 수정하기
	public int updateSet_bonus();
	
	// 상여금 지급 비율 및 지급 여부 등록하기
	public int insertSet_bonus();
}