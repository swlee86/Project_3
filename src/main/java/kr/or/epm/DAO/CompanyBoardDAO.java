package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.Company;

/*
 * 작성자 : 박성준
 * 작성일 : 2016-11-18
 * 목적   : 회사 정보 게시판 관련 인터페이스
 */
public interface CompanyBoardDAO {
	
	int selectBoardCount();
	//리스트 보기
	List<Company> selectCompanyList(int start, int end);
	
	//글 상세보기
	Company selectDetail(int no);
	
	
}
