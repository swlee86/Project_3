
package com.toinfra.DAO;

import java.util.List;

import com.toinfra.DTO.FreeBoard;
import com.toinfra.DTO.Re_FreeBoard;

/*
 * 작성자 : 이상원
 * 작성일 : 2016-11-18
 * 목적   : 자유게시판 관련 인터페이스
 */
public interface FreeBoardDAO {

	// FreeBoard 들어갈 때 게시판 글 내용을 불러오는 함수
	List<FreeBoard> selectList(int start, int end, String field, String query);

	//게시판 글 갯수 구하는 함수
	int selectBoardCount(String field, String query);

	//게시글 상세보는 함수
	FreeBoard selectDetail(int no);

	//리플 리스트 구하는 함수
	List<Re_FreeBoard> selectReList(int no);

	//리플 쓰기위해  필요한 정보 구하는 함수
	Re_FreeBoard selectWrite(String id);

	//refer구하는 함수
	int selectRefer();

	//글작성 함수
	int insertArticle(FreeBoard dto);

	//리플 추가하는 함수
	int insertReply(Re_FreeBoard dto);

	//조회수 수정하는 함수
	void updateHit(int no);

	//답글시 step update 하는 함수
	void updateStep(int refer, int step);

	// 수정하는 함수
	public int updateRow(FreeBoard freeBoard);

	// 삭제하는 함수
	public int deleteRow(int no);

	// 리플 삭제
	public int deleteReply(int no);

}
