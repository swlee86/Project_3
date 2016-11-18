package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.BusinessBoard;
import kr.or.epm.VO.Re_BusinessBoard;

public interface BusinessBoardDAO {
	
	//BusinessBoard 들어갈 때 게시판 글 내용을 불러오는 함수
	List<BusinessBoard> selectList(int start, int end);
	int selectBoardCount();
	BusinessBoard selectDetail(int no);
	List<Re_BusinessBoard> selectReList(int no);
	Re_BusinessBoard selectWrite(String id);
	int selectRefer();
	int insertArticle(BusinessBoard dto);
	int insertReply(Re_BusinessBoard dto);
}
