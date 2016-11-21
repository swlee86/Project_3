package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.BusinessBoard;
import kr.or.epm.VO.FreeBoard;
import kr.or.epm.VO.Re_BusinessBoard;
import kr.or.epm.VO.Re_FreeBoard;

public interface FreeBoardDAO {
	
	//FreeBoard 들어갈 때 게시판 글 내용을 불러오는 함수
	List<FreeBoard> selectList(int start, int end);
	int selectBoardCount();
	FreeBoard selectDetail(int no);
	List<Re_FreeBoard> selectReList(int no);
	Re_FreeBoard selectWrite(String id);
	int selectRefer();
	int insertArticle(FreeBoard dto);
	int insertReply(Re_FreeBoard dto);
	void updateHit(int no);
	void updateStep(int refer, int step);
}
