package com.toinfra.Service;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.toinfra.DAO.CompanyBoardDAO;
import com.toinfra.VO.Company;
import com.toinfra.VO.Emp_detail;

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

	
	//Company 제목 검색 리스트 가져오기
	public List<Company> selectChooseBoard(String query, int cpage, int pgsize, String field){
		int start = cpage * pgsize - (pgsize - 1);
		int end = cpage * pgsize;
		CompanyBoardDAO companyboarddao = sqlSession.getMapper(CompanyBoardDAO.class);

		List<Company> list = companyboarddao.selectSeacrchCompanyList(cpage, pgsize,field,query);	
		
		for(int i = 0; i < list.size(); i++){
		}
		
		return list;
	}
	
	//Company 리스트 가져오기
	public List<Company> selectBoard(int cpage, int pgsize) {
		int start = cpage * pgsize - (pgsize - 1);
		int end = cpage * pgsize;
		CompanyBoardDAO companyboarddao = sqlSession.getMapper(CompanyBoardDAO.class);
		List<Company> list = companyboarddao.selectCompanyList(start, end);
		return list;
	}
	
	//Company 글 상세 보기
	public Company selectDetailBoard(int no){
		CompanyBoardDAO companyboarddao = sqlSession.getMapper(CompanyBoardDAO.class);
		Company company = companyboarddao.selectDetail(no);
		updateHit(no);

		return company;
	}
	
	//조회수 증가하는 함수
	public void updateHit(int no) {
		CompanyBoardDAO companyboarddao = sqlSession.getMapper(CompanyBoardDAO.class);
		int result = companyboarddao.updateHit(no);
	}

	// Company 테이블의 열 갯수를 구하는 서비스 함수
	public int selectBoardCount() {
		CompanyBoardDAO companyboarddao = sqlSession.getMapper(CompanyBoardDAO.class);
		int result = companyboarddao.selectBoardCount();
		return result;
	}
	
	// Company 테이블의 열 갯수를 구하는 서비스 함수-post 로 검색할때
	public int selectBoardCount_post(String field, String query) {
		CompanyBoardDAO companyboarddao = sqlSession.getMapper(CompanyBoardDAO.class);
		int result = companyboarddao.selectBoardCount_post(field,query);
		return result;
	}
	
	//회사 정보게시판 글쓰기
	public int insertInfoBoard(Company company){
		CompanyBoardDAO companyboarddao = sqlSession.getMapper(CompanyBoardDAO.class);
		int result = companyboarddao.insertInfoBoard(company);	
		return result;
	}
	
	//글쓴이 정보 보기
	public Emp_detail WriterStatus(String id){
		CompanyBoardDAO companyboarddao = sqlSession.getMapper(CompanyBoardDAO.class);
		Emp_detail emp = companyboarddao.selectEmpUserInfo(id);	
		return emp;
	}
	
	// 게시판 상세글 불러오는 함수
	public Company selectDetail(int no) {
		CompanyBoardDAO companyboarddao = sqlSession.getMapper(CompanyBoardDAO.class);
		Company list = companyboarddao.selectDetail(no);
		updateHit(no);
		return list;
	}
	
	//글 수정하는 함수
	public int updateRow(Company company) {
		CompanyBoardDAO companyboarddao = sqlSession.getMapper(CompanyBoardDAO.class);
		int result = companyboarddao.updateRow(company);
		return result;
	}
	
	//삭제하는 함수
	public int deleteRow(int no){
		CompanyBoardDAO companyboarddao = sqlSession.getMapper(CompanyBoardDAO.class);
		int result = companyboarddao.deleteRow(no); 
		return result;
	}
	
	
}
