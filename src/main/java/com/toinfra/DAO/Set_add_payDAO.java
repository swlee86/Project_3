package com.toinfra.DAO;

import java.util.List;

import com.toinfra.DTO.Set_add_pay;
import com.toinfra.DTO.Set_pay;

/*
 * 작성일 : 2016-11-18
 * 작성자 : 백승아
 * 사용 목적 : 추가 급여 설정에 대한 DAO interface
*/

public interface Set_add_payDAO {
	
	// 전체 추가 급여 조회하기
	public List<Set_add_pay> selectSetadd_pay();
	
	// 직위별 추가 급여 조회하기
	public List<Set_pay> selectSet_add_pay_position();
	
	// 추가 급여 수정하기
	public int updateSet_add_pay();
	
	// 추가 급여 등록하기
	public int insertSet_add_pay();
}
