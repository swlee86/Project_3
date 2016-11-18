package kr.or.epm.Service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.epm.DAO.BusinessBoardDAO;
import kr.or.epm.DAO.CompanyBoardDAO;
import kr.or.epm.VO.Company;

/*
 * 작성자 : 박성준
 * 작성일 : 2016-11-18
 * 목  적 : 회사 정보 게시판
 * 
 */

@Service
public class CompanyBoardService {

	@Autowired
	private SqlSession sqlSession;

	
	 public List<Company> selectBoard(int cpage, int pgsize){ 
	  int start = cpage * pgsize -(pgsize - 1); 
	  int end = cpage * pgsize; 
	  System.out.println(start + " / "+ end); 
	  CompanyBoardDAO companyboarddao = sqlSession.getMapper(CompanyBoardDAO.class);	
	  List<Company> list = companyboarddao.selectCompanyList(start, end);
	  
	  for(int i = 0; i < list.size(); i++){
		  System.out.println("리스트 이름 : " +list.get(i).getEmp_name());
	  }
	  
	  return list; 
	  }
	

	// Emp 테이블의 열 갯수를 구하는 서비스 함수
	public int selectBoardCount() {
		CompanyBoardDAO companyboarddao = sqlSession.getMapper(CompanyBoardDAO.class);
		int result = companyboarddao.selectBoardCount();
		return result;
	}
}
