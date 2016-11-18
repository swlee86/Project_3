package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.BusinessBoard;
import kr.or.epm.VO.MediaBoard;

public interface MediaBoardDAO {
	
	//언론 게시물 개수
	public int selectCount(String field, String query);
	
	//언론 게시판 글 list을 불러오는 함수
	public List<MediaBoard> selectList(int page, String field, String query);
}
