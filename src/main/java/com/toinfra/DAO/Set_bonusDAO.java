package com.toinfra.DAO;

import java.util.List;

import com.toinfra.VO.Set_bonus;
import kr.or.toinfra.VO.Set_bonus;

/*
 * 작성일 : 2016-11-18
 * 작성자 : 백승아
 * 사용 목적 : 상여금 설정에 대한 DAO interface
*/

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
