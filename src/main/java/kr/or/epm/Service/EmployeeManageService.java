package kr.or.epm.Service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.epm.DAO.EmployeeManageDAO;
import kr.or.epm.VO.EmployeeManage;

@Service
public class EmployeeManageService {
	
	@Autowired
	private SqlSession sqlSession;
	
	//관리자 > 사원 관리 접근시 해당 테이블에 필요한 데이터를 뽑는 서비스 함수
	public List<EmployeeManage> selectEmpManage(int cpage, int pgsize){
		int start = cpage * pgsize - (pgsize - 1);
		int end = cpage * pgsize;
		System.out.println(start + " / " + end);
		EmployeeManageDAO employeemanage = sqlSession.getMapper(EmployeeManageDAO.class);		
		List<EmployeeManage> list = employeemanage.selectEmpManage(start, end);
		return list;
	}
	
	//Emp 테이블의 열 갯수를 구하는 서비스 함수
	public int selectEmpCount(){
		EmployeeManageDAO employeemanage = sqlSession.getMapper(EmployeeManageDAO.class);
		int result = employeemanage.selectEmpCount();
		return result;
	}
}
