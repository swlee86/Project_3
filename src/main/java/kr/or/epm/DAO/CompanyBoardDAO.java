package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.Company;
import kr.or.epm.VO.Emp_detail;

/*
 * 작성자 : 박성준
 * 작성일 : 2016-11-18
 * 목적   : 회사 정보 게시판 관련 인터페이스
 */
public interface CompanyBoardDAO {

	//게시글 갯수 구하는 함수
	int selectBoardCount();

	// 검색한 글 개수
	int selectBoardCount_post(String field, String query);

	// 리스트 보기
	List<Company> selectCompanyList(int start, int end);

	// 검색한 리스트 보기
	List<Company> selectSeacrchCompanyList(int cpage, int pgsize, String field, String query);

	// 글 상세보기
	Company selectDetail(int no);

	// 게시글 쓰기
	int insertInfoBoard(Company company);

	// 시큐리티 통한 사원 정보 가져오기
	Emp_detail selectEmpUserInfo(String id);

	// 조회수 증가하는 함수
	public int updateHit(int no);

	// 수정하는 함수
	public int updateRow(Company company);

	// 삭제하는 함수
	public int deleteRow(int no);

}
