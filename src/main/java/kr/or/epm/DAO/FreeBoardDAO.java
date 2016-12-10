package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.BusinessBoard;
import kr.or.epm.VO.FreeBoard;
import kr.or.epm.VO.Re_BusinessBoard;
import kr.or.epm.VO.Re_FreeBoard;

public interface FreeBoardDAO {
	
	//FreeBoard 들어갈 때 게시판 글 내용을 불러오는 함수
	List<FreeBoard> selectList(int start, int end, String field, String query);
	int selectBoardCount(String field, String query);
	FreeBoard selectDetail(int no);
	List<Re_FreeBoard> selectReList(int no);
	Re_FreeBoard selectWrite(String id);
	int selectRefer();
	int insertArticle(FreeBoard dto);
	int insertReply(Re_FreeBoard dto);
	void updateHit(int no);
	void updateStep(int refer, int step);
	
	//수정하는 함수
	public int updateRow(FreeBoard freeBoard);
	
	//삭제하는 함수
	public int deleteRow(int no);

	//리플 삭제
	public int deleteReply(int no);

}
