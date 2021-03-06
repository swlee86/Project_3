package com.toinfra.Service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.toinfra.DAO.FreeBoardDAO;
import com.toinfra.DTO.FreeBoard;
import com.toinfra.DTO.Re_FreeBoard;
/*
 * 작성자 : 이상원
 * 작성일 : 2016-11-21
 * 목  적 : 자유게시판 기능 구현을 위한 서비스 
 */
@Service
public class FreeBoardService {

	@Autowired
	private SqlSession sqlSession;
	
	//Business 테이블의 열 갯수를 구하는 서비스 함수
	public int selectBoardCount(String field, String query){
		FreeBoardDAO freeboarddao = sqlSession.getMapper(FreeBoardDAO.class);
		int result = 0;
		result = freeboarddao.selectBoardCount(field, query);
		return result;
	}
	
	//FreeBoard의 리스트를 불러오는 함수(페이징 처리 포함)
		public List<FreeBoard> selectBoard(int cpage, int pgsize, String field, String query){
			int start = cpage * pgsize - (pgsize - 1);
			int end = cpage * pgsize;
			FreeBoardDAO freeboarddao = sqlSession.getMapper(FreeBoardDAO.class);
			List<FreeBoard> list = freeboarddao.selectList(start, end, field, query);
			return list;
		}
		
		//FreeBoard에 글을 쓰기 위해서 미리 필요한 데이터를 불러와서 FreeDTO에 저장하는 서비스 함수
		public Re_FreeBoard selectWrite(String id){
			FreeBoardDAO freeboarddao = sqlSession.getMapper(FreeBoardDAO.class);
			Re_FreeBoard freeboard = freeboarddao.selectWrite(id);
			return freeboard;
		}
		
		//최대 Refer 값을 불러오는 함수
		public int selectRefer(){
			FreeBoardDAO freeboarddao = sqlSession.getMapper(FreeBoardDAO.class);
			int refer = freeboarddao.selectRefer();
			return refer;
		}
		
		//최초 글쓰기시 적용되는 서비스 함수(refer+1)
		public int insertArticle(FreeBoard dto){
			FreeBoardDAO freeboarddao = sqlSession.getMapper(FreeBoardDAO.class);
			int result = freeboarddao.insertArticle(dto);
			return result;
		}
		
		//글번호를 가지고 상세 내역을 불러오는 서비스 함수
		public FreeBoard selectDetail(int no){
			FreeBoardDAO freeboarddao = sqlSession.getMapper(FreeBoardDAO.class);
			FreeBoard freeboard = freeboarddao.selectDetail(no);
			return freeboard;
		}
		
		//글을 조회할 때 딸려 있는 댓글 리스트를 함께 불러오는 서비스 함수
		public List<Re_FreeBoard> selectReList(int no){
			FreeBoardDAO freeboarddao = sqlSession.getMapper(FreeBoardDAO.class);
			List<Re_FreeBoard> list = freeboarddao.selectReList(no);
			return list;
		}
		
		//조회수가 올라가는 서비스 함수
		public void updateHit(int no){
			FreeBoardDAO freeboarddao = sqlSession.getMapper(FreeBoardDAO.class);
			freeboarddao.updateHit(no);
		}
		

		//덧글 insert 서비스 함수
		public int insertReply(Re_FreeBoard dto){
			FreeBoardDAO freeboarddao = sqlSession.getMapper(FreeBoardDAO.class);
			int result = freeboarddao.insertReply(dto);
			return result;
		}
		
		//답글 이후의 글들의 step, depth가 1씩 증가하는 서비스 함수
		public void updateStep(int refer, int step){
			FreeBoardDAO freeboarddao = sqlSession.getMapper(FreeBoardDAO.class);
			freeboarddao.updateStep(refer, step);
		}
		
		//글 수정하는 함수
		public int updateRow(FreeBoard freeBoard) {
			FreeBoardDAO freeBoardDAO = sqlSession.getMapper(FreeBoardDAO.class);
			int result = freeBoardDAO.updateRow(freeBoard);
			System.out.println("=> 처리결과 result : "+result);
			return result;
		}
		
		//삭제하는 함수
		public int deleteRow(int no){
			FreeBoardDAO freeBoardDAO = sqlSession.getMapper(FreeBoardDAO.class);
			int result = freeBoardDAO.deleteRow(no); 
			return result;
		}
		
		//리플 삭제
		public int deleteReply(int no){
			FreeBoardDAO freeBoardDAO = sqlSession.getMapper(FreeBoardDAO.class);
			int result = freeBoardDAO.deleteReply(no); 
			return result;
		}
}
