

package com.toinfra.DAO;

import com.toinfra.VO.Emp;
import com.toinfra.VO.Emp;

/*
 * 작성일 : 2016-11-25
 * 작성자 : 백승아
 * 사용 목적 : 사원에 대한 DAO interface
*/

public interface EmpDAO {

	// emp_no로 사원 데이터 불러오기
	public Emp selectEmp(String emp_no);
	
	// 사원 정보 수정
	int updateEmp(Emp emp);
}