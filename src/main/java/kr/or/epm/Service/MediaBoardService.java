package kr.or.epm.Service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.epm.DAO.MediaBoardDAO;
import kr.or.epm.VO.MediaBoard;

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

	//전체 게시글 수
	public int selectCount(String field, String query) {
		int totalcount = 0;
		MediaBoardDAO mediaBoardDAO = sqlSession.getMapper(MediaBoardDAO.class);
		totalcount = mediaBoardDAO.selectCount(field, query);
		System.out.println("=>  게시글 총 수 : "+ totalcount);
		return totalcount;
	}
}
