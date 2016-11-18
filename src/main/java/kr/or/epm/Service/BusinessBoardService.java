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
	
	public List<Re_BusinessBoard> selectReList(int no){
		BusinessBoardDAO businessboarddao = sqlSession.getMapper(BusinessBoardDAO.class);
		List<Re_BusinessBoard> list = businessboarddao.selectReList(no);
		return list;
	}
}
