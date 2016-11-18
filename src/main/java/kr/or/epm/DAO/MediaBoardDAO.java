package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.MediaBoard;
import kr.or.epm.VO.MediaBoardReply;

public interface MediaBoardDAO {
	
	//언론 게시물 개수
	public int selectCount(String field, String query);
	
	//언론 게시판 글 list을 불러오는 함수
	public List<MediaBoard> selectList(int cpage, int pagesize, String field, String query);
	
	//언론 게시판 글 상세 보기
	public MediaBoard selectDetail(int no);
	
	//언론 리플 list을 불러오는 함수
	public List<MediaBoardReply> selectReList(int no);	
}
