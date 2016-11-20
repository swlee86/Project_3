package kr.or.epm.Service;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import kr.or.epm.DAO.MediaBoardDAO;
import kr.or.epm.VO.Emp;
import kr.or.epm.VO.Emp_detail;
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
		return list;
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
		CommonsMultipartFile multipartfile = null;
		if (mediaBoard.getFile_name() != null) {
			String path = request.getRealPath("/media/upload");
			String fullpath = path + "\\" + mediaBoard.getFile_name();

			// 서버에 파일 쓰기 작업
			FileOutputStream fs;
			try {
				fs = new FileOutputStream(fullpath);
				fs.write(multipartfile.getBytes());
				fs.close();
			} catch (IOException e) {
				System.out.println("insertRow()의 파일 업로드 :"+e.getMessage());
			}
			
		}

	MediaBoardDAO mediaBoardDAO = sqlSession.getMapper(MediaBoardDAO.class);result=mediaBoardDAO.insertRow(mediaBoard);return result;
}

}
