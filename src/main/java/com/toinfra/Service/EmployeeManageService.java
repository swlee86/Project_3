package com.toinfra.Service;


import com.toinfra.DTO.UserDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.toinfra.DAO.EmpDAO;

@Service
public class EmployeeManageService {
	
	@Autowired
	private SqlSession sqlSession;
/*	
	//관리자 > 사원 관리 접근시 해당 테이블에 필요한 데이터를 뽑는 서비스 함수
	public List<EmployeeManage> selectEmpManage(int cpage, int pgsize){
		int start = cpage * pgsize - (pgsize - 1);
		int end = cpage * pgsize;
		System.out.println(start + " / " + end);
		EmployeeManageDAO employeemanage = sqlSession.getMapper(EmployeeManageDAO.class);		
		List<EmployeeManage> list = employeemanage.selectEmpManage(start, end);
		return list;
	}
	
	//UserDto 테이블의 열 갯수를 구하는 서비스 함수
	public int selectEmpCount(){
		EmployeeManageDAO employeemanage = sqlSession.getMapper(EmployeeManageDAO.class);
		int result = employeemanage.selectEmpCount();
		return result;
	}
	
	//상세 정보를 불러오는 쿼리문
	public EmployeeManage selectDetail(String emp_no){
		EmployeeManageDAO employeemanage = sqlSession.getMapper(EmployeeManageDAO.class);
		EmployeeManage result = employeemanage.selectDetail(emp_no);
		return result;
	}*/
	
	// 상세 정보
	public UserDto selectDetail2(String emp_no){
		
		
		EmpDAO dao = sqlSession.getMapper(EmpDAO.class);
		UserDto userDto = dao.selectEmp(emp_no);
				
		return userDto;
	}
	
	// 사원 정보 수정
	public int updateEmp(UserDto userDto) {
		
		
		// 사번이 중복으로 넘어오잖아
		String emp_no = userDto.getUser_id();
		String[] emp_no1 = emp_no.split(",");
		userDto.setUser_id(emp_no1[0]);
		
		EmpDAO dao = sqlSession.getMapper(EmpDAO.class);
		System.out.println(userDto.toString());
		
		int result = 0;
		result = dao.updateEmp(userDto);
		
		return result;
	}
	
	
}
