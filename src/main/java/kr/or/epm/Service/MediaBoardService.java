package kr.or.epm.Service;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.epm.DAO.MediaBoardDAO;
import kr.or.epm.VO.Emp;
import kr.or.epm.VO.MediaBoard;
import kr.or.epm.VO.MediaBoardReply;
import kr.or.epm.VO.Re_MediaBoard;
/*
 * 작성자 : 박지은
 * 작성일 : 2016-11-18
 * 목  적 : 언론게시판 기능 구현을 위한 서비스 
 */

@Service
public class MediaBoardService {
	@Autowired
	private SqlSession sqlSession;

	// MediaBoard의 리스트를 불러오는 함수
	public List<MediaBoard> selectList(int cpage, int pagesize, String field, String query) {
		int start = cpage * pagesize - (pagesize - 1);
		int end = cpage * pagesize;
		System.out.println(start + " / " + end);

		MediaBoardDAO mediaBoardDAO = sqlSession.getMapper(MediaBoardDAO.class);
		List<MediaBoard> list = mediaBoardDAO.selectList(cpage, pagesize, field, query);
		return list;
	}

	// 전체 게시글 수 구하는 함수
	public int selectCount(String field, String query) {
		int totalcount = 0;
		MediaBoardDAO mediaBoardDAO = sqlSession.getMapper(MediaBoardDAO.class);
		totalcount = mediaBoardDAO.selectCount(field, query);
		System.out.println("=>  게시글 총 수 : " + totalcount);
		return totalcount;
	}

	// 게시판 상세글 불러오는 함수
	public MediaBoard selectDetail(int no) {
		MediaBoardDAO mediaBoardDAO = sqlSession.getMapper(MediaBoardDAO.class);
		MediaBoard list = mediaBoardDAO.selectDetail(no);
		updateHit(no);
		return list;
	}
	
	//조회수 증가하는 함수
	public void updateHit(int no) {
		System.out.println("updateHit() 서비스");
		MediaBoardDAO mediaBoardDAO = sqlSession.getMapper(MediaBoardDAO.class);
		int result = mediaBoardDAO.updateHit(no);
		System.out.println("조회수 restult : "+result);
	}

	// 게시판 상세글 리플 불러오는 함수
	public List<MediaBoardReply> selectReList(int no) {
		MediaBoardDAO mediaBoardDAO = sqlSession.getMapper(MediaBoardDAO.class);
		List<MediaBoardReply> relist = mediaBoardDAO.selectReList(no);
		return relist;
	}

	// id로 이름, 사번 가져오는 함수
	public Emp selectInfoSearch(String id) {
		System.out.println("selectInfoSearch() service");
		MediaBoardDAO mediaBoardDAO = sqlSession.getMapper(MediaBoardDAO.class);
		Emp info = mediaBoardDAO.selectInfoSearch(id);
		System.out.println("이름 :" + info.getEmp_name() + "/ 사번:" + info.getEmp_no());
		return info;
	}

	// 게시글 추가하는 함수
	public int insertRow(MediaBoard mediaBoard, HttpServletRequest request) {
		int result = 0;
	
	/*	if(mediaBoard.getFile_name() == null){
			mediaBoard.setFile_name("null");
		}*/
		
		MediaBoardDAO mediaBoardDAO = sqlSession.getMapper(MediaBoardDAO.class);
		result=mediaBoardDAO.insertRow(mediaBoard);
		
		if(result > 0){ //글쓰기 성공시
			result = selectMaxNo();
		}
		return result;
	}
	
	//현재글 번호 구하는 함수
	public int selectMaxNo(){
		int result = 0;
		MediaBoardDAO mediaBoardDAO = sqlSession.getMapper(MediaBoardDAO.class);
		result = mediaBoardDAO.selectMaxNo(); //현재 글번호
		System.out.println("현재 최고 글번호 : "+result);
		return result;
	}
	
	//삭제하는 함수
	public int deleteRow(int no){
		MediaBoardDAO mediaBoardDAO = sqlSession.getMapper(MediaBoardDAO.class);
		int result = mediaBoardDAO.deleteRow(no); 
		return result;
	}

	//글 수정하는 함수
	public int updateRow(MediaBoard mediaBoard) {
		MediaBoardDAO mediaBoardDAO = sqlSession.getMapper(MediaBoardDAO.class);
		int result = mediaBoardDAO.updateRow(mediaBoard);
		System.out.println("=> 처리결과 result : "+result);
		return result;
	}
	
	//댓글 다는 함수 
	public int insertRowReply(Re_MediaBoard re_MediaBoard){
		System.out.println("insertRowReply() 서비스 탐");
		System.out.println("서비스 리플 : "+re_MediaBoard.toString());
		MediaBoardDAO mediaBoardDAO = sqlSession.getMapper(MediaBoardDAO.class);
		int result = mediaBoardDAO.insertRowReply(re_MediaBoard);
		System.out.println("=> 리플 처리결과 result : "+result);
		return result;
	}
	
	//댓글 뽑는 함수
	public Re_MediaBoard selectRowReply(int no){
		System.out.println("selectRowReply() 서비스 탐");
		MediaBoardDAO mediaBoardDAO = sqlSession.getMapper(MediaBoardDAO.class);
		int re_no = selectMaxReNo();
		Re_MediaBoard re_MediaBoard = new Re_MediaBoard();
		System.out.println("no : "+no+"/ re_no:"+re_no);
		re_MediaBoard = mediaBoardDAO.selectRowReply(no, re_no);
		System.out.println("댓글 리턴 tostring" + re_MediaBoard.toString());
		return re_MediaBoard;
	}
	
	//현재 리플 번호 구하는 함수
	public int selectMaxReNo(){
		int result = 0;
		MediaBoardDAO mediaBoardDAO = sqlSession.getMapper(MediaBoardDAO.class);
		result = mediaBoardDAO.selectMaxReNo(); //현재리플번호
		System.out.println("현재 최고 리플번호 : "+result);
		return result;
	}
	
}
