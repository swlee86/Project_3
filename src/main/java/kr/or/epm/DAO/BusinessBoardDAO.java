package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.BusinessBoard;
import kr.or.epm.VO.MediaBoard;
import kr.or.epm.VO.Re_BusinessBoard;

public interface BusinessBoardDAO {
	
	//BusinessBoard 들어갈 때 게시판 글 내용을 불러오는 함수
	List<BusinessBoard> selectList(int start, int end,String field, String query);
	int selectBoardCount(String field, String query);
	BusinessBoard selectDetail(int no);
	List<Re_BusinessBoard> selectReList(int no);
	Re_BusinessBoard selectWrite(String id);
	int selectRefer();
	int insertArticle(BusinessBoard dto);
	int insertReply(Re_BusinessBoard dto);
	void updateHit(int no);
	void updateStep(int refer, int step);
	
	//수정하는 함수
	public int updateRow(BusinessBoard businessBoard);
	
	//삭제하는 함수
	public int deleteRow(int no);
	
	//리플 삭제
	public int deleteReply(int no);
}
