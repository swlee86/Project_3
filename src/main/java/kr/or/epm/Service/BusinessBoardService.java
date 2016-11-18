package kr.or.epm.Service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.epm.DAO.BusinessBoardDAO;
import kr.or.epm.VO.BusinessBoard;
import kr.or.epm.VO.Re_BusinessBoard;

@Service
public class BusinessBoardService {

	@Autowired
	private SqlSession sqlSession;
	
	//BusinessBoard의 리스트를 불러오는 함수(페이징 처리 포함)
	public List<BusinessBoard> selectBoard(int cpage, int pgsize){
		int start = cpage * pgsize - (pgsize - 1);
		int end = cpage * pgsize;
		System.out.println(start + " / " + end);
		BusinessBoardDAO businessboarddao = sqlSession.getMapper(BusinessBoardDAO.class);		
		List<BusinessBoard> list = businessboarddao.selectList(start, end);
		return list;
	}
	
	//Business 테이블의 열 갯수를 구하는 서비스 함수
	public int selectBoardCount(){
		BusinessBoardDAO businessboarddao = sqlSession.getMapper(BusinessBoardDAO.class);
		int result = businessboarddao.selectBoardCount();
		return result;
	}
	
	//글번호를 가지고 상세 내역을 불러오는 서비스 함수
	public BusinessBoard selectDetail(int no){
		BusinessBoardDAO businessboarddao = sqlSession.getMapper(BusinessBoardDAO.class);
		BusinessBoard businessboard = businessboarddao.selectDetail(no);
		return businessboard;
	}
	
	//글을 조회할 때 딸려 있는 댓글 리스트를 함께 불러오는 서비스 함수
	public List<Re_BusinessBoard> selectReList(int no){
		BusinessBoardDAO businessboarddao = sqlSession.getMapper(BusinessBoardDAO.class);
		List<Re_BusinessBoard> list = businessboarddao.selectReList(no);
		return list;
	}
	
	//BusinessBoard에 글을 쓰기 위해서 미리 필요한 데이터를 불러와서 BusinessDTO에 저장하는 서비스 함수
	public Re_BusinessBoard selectWrite(String id){
		BusinessBoardDAO businessboarddao = sqlSession.getMapper(BusinessBoardDAO.class);
		Re_BusinessBoard businessboard = businessboarddao.selectWrite(id);
		return businessboard;
	}
	
	//최대 Refer 값을 불러오는 함수
	public int selectRefer(){
		BusinessBoardDAO businessboarddao = sqlSession.getMapper(BusinessBoardDAO.class);
		int refer = businessboarddao.selectRefer();
		return refer;
	}
	
	//최초 글쓰기시 적용되는 서비스 함수(refer+1)
	public int insertArticle(BusinessBoard dto){
		BusinessBoardDAO businessboarddao = sqlSession.getMapper(BusinessBoardDAO.class);
		int result = businessboarddao.insertArticle(dto);
		return result;
	}
}
