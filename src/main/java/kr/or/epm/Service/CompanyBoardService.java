package kr.or.epm.Service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.epm.DAO.CompanyBoardDAO;
import kr.or.epm.VO.Company;
import kr.or.epm.VO.Emp;
import kr.or.epm.VO.Emp_detail;

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

	//Company 리스트 가져오기
	public List<Company> selectBoard(int cpage, int pgsize) {

		int start = cpage * pgsize - (pgsize - 1);
		int end = cpage * pgsize;
		System.out.println("서비스 셀렉트보드 : " + start + " / " + end);
		CompanyBoardDAO companyboarddao = sqlSession.getMapper(CompanyBoardDAO.class);
		List<Company> list = companyboarddao.selectCompanyList(start, end);
		System.out.println("서비스 부분 : " + list.size());

		return list;
	}
	
	//Company 글 상세 보기
	public Company selectDetailBoard(int no){
		CompanyBoardDAO companyboarddao = sqlSession.getMapper(CompanyBoardDAO.class);
		Company company = companyboarddao.selectDetail(no);
		return company;
	}
	

	// Company 테이블의 열 갯수를 구하는 서비스 함수
	public int selectBoardCount() {
		CompanyBoardDAO companyboarddao = sqlSession.getMapper(CompanyBoardDAO.class);
		int result = companyboarddao.selectBoardCount();
		return result;
	}
	
	
	//회사 정보게시판 글쓰기
	public int insertInfoBoard(String title, String content){
		System.out.println("제목 : "+title+ " / 내용 : "+content);
		CompanyBoardDAO companyboarddao = sqlSession.getMapper(CompanyBoardDAO.class);
		int result = companyboarddao.insertInfoBoard(title, content);
		
		return 0;
	}
	
	//글쓴이 정보 보기
	public Emp_detail WriterStatus(String id){
		System.out.println("넘어온 사번 : "+id);
		CompanyBoardDAO companyboarddao = sqlSession.getMapper(CompanyBoardDAO.class);
		Emp_detail emp = companyboarddao.selectEmpUserInfo(id);
		
		return emp;
	}
	
	
}
