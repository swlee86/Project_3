package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.Emp;
import kr.or.epm.VO.MediaBoard;
import kr.or.epm.VO.MediaBoardReply;
import kr.or.epm.VO.Re_MediaBoard;

public interface MediaBoardDAO {
	
	//언론 게시물 개수
	public int selectCount(String field, String query);
	
	//언론 게시판 글 list을 불러오는 함수
	public List<MediaBoard> selectList(int cpage, int pagesize, String field, String query);
	
	//언론 게시판 글 상세 보기
	public MediaBoard selectDetail(int no);
	
	//언론 리플 list을 불러오는 함수
	public List<MediaBoardReply> selectReList(int no);	
	
	//이름,사번 회원 정보 가져오는 함수
	public Emp selectInfoSearch(String id);
	
	//언론게시글 추가
	public int insertRow(MediaBoard mediaBoard);
	
	//최대no값 구하는 함수
	public int selectMaxNo();
	
	//삭제하는 함수
	public int deleteRow(int no);
	
	//수정하는 함수
	public int updateRow(MediaBoard mediaBoard);
	
	//리플 등록하는 함수 
	public int insertRowReply(Re_MediaBoard re_MediaBoard);
	
	//리플 뽑는 함수
	public Re_MediaBoard selectRowReply(int no, int re_no);
	
	//리플 최대 no 구하는 함수
	public int selectMaxReNo();
	
	//조회수 증가하는 함수
	public int updateHit(int no);
	
	//리플 삭제
	public int deleteReply(int no);
}
