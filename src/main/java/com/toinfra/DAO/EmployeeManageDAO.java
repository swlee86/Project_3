package com.toinfra.DAO;

import java.util.List;

import com.toinfra.DTO.EmployeeManage;

public interface EmployeeManageDAO {
	List<EmployeeManage> selectEmpManage(int start, int end);
	int selectEmpCount();
	
	//선택한 사원의 세부 정보를 보여주는 함수
	EmployeeManage selectDetail(String emp_no);
	
}
