package kr.or.epm.Service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.epm.DAO.BusinessBoardDAO;
import kr.or.epm.DAO.FreeBoardDAO;
import kr.or.epm.VO.BusinessBoard;
import kr.or.epm.VO.FreeBoard;
import kr.or.epm.VO.Re_BusinessBoard;
import kr.or.epm.VO.Re_FreeBoard;

@Service
public class FreeBoardService {

	@Autowired
	private SqlSession sqlSession;
	
	//Business 테이블의 열 갯수를 구하는 서비스 함수
	public int selectBoardCount(){
		FreeBoardDAO freeboarddao = sqlSession.getMapper(FreeBoardDAO.class);
		int result = freeboarddao.selectBoardCount();
		return result;
	}
	
	//FreeBoard의 리스트를 불러오는 함수(페이징 처리 포함)
		public List<FreeBoard> selectBoard(int cpage, int pgsize){
			int start = cpage * pgsize - (pgsize - 1);
			int end = cpage * pgsize;
			System.out.println(start + " / " + end);
			FreeBoardDAO freeboarddao = sqlSession.getMapper(FreeBoardDAO.class);
			List<FreeBoard> list = freeboarddao.selectList(start, end);
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
}
