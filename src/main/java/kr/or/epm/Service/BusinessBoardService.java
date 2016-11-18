package kr.or.epm.Service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.epm.DAO.BusinessBoardDAO;
import kr.or.epm.VO.BusinessBoard;

@Service
public class BusinessBoardService {

	@Autowired
	private SqlSession sqlSession;
	
	public List<BusinessBoard> selectBoard(int cpage, int pgsize){
		int start = cpage * pgsize - (pgsize - 1);
		int end = cpage * pgsize;
		System.out.println(start + " / " + end);
		BusinessBoardDAO businessboarddao = sqlSession.getMapper(BusinessBoardDAO.class);		
		List<BusinessBoard> list = businessboarddao.selectList(start, end);
		return list;
	}
	
	//Emp 테이블의 열 갯수를 구하는 서비스 함수
	public int selectBoardCount(){
		BusinessBoardDAO businessboarddao = sqlSession.getMapper(BusinessBoardDAO.class);
		int result = businessboarddao.selectBoardCount();
		return result;
	}
}
