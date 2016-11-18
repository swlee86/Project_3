package kr.or.epm.Service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.epm.DAO.MediaBoardDAO;
import kr.or.epm.VO.MediaBoard;
import kr.or.epm.VO.MediaBoardReply;

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

	//전체 게시글 수 구하는 함수
	public int selectCount(String field, String query) {
		int totalcount = 0;
		MediaBoardDAO mediaBoardDAO = sqlSession.getMapper(MediaBoardDAO.class);
		totalcount = mediaBoardDAO.selectCount(field, query);
		System.out.println("=>  게시글 총 수 : "+ totalcount);
		return totalcount;
	}
	
	//게시판 상세글 불러오는 함수
	public MediaBoard selectDetail(int no){
		MediaBoardDAO mediaBoardDAO = sqlSession.getMapper(MediaBoardDAO.class);
		MediaBoard list = mediaBoardDAO.selectDetail(no);
		return list;
	}
	
	//게시판 상세글 리플 불러오는 함수
	public List<MediaBoardReply> selectReList(int no){
		MediaBoardDAO mediaBoardDAO = sqlSession.getMapper(MediaBoardDAO.class);
		List<MediaBoardReply> relist = mediaBoardDAO.selectReList(no);
		return relist;
	}
	
}
