package com.toinfra.DAO;

import java.util.List;

import com.toinfra.DTO.Set_pay_date;

/*
 * 작성일 : 2016-11-18
 * 작성자 : 백승아
 * 사용 목적 : 급여지급일에 대한 DAO interface
*/

public interface Set_pay_dateDAO {

	// 급여 지급일 조회하기
	public List<Set_pay_date> selectSet_pay_date();
	
	// 급여 지급일 등록하기
	public int insertSet_pay_date();
	
	// 급여 지급일 수정하기
	public int updateSet_pay_date();
	
}
