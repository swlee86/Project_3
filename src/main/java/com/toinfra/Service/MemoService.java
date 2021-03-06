package com.toinfra.Service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.toinfra.DAO.MemoDAO;
import com.toinfra.DTO.Memo;
import com.toinfra.DTO.Memocolor;
/*
 * 작성일 : 2016-11-16
 * 작성자 : 이상원
 * 사용 목적 : 메모 기능 구현 서비스
 * 
 * 수정일 : 2016-11-30
 * 작성자 : 박지은
 */

@Service
public class MemoService {

	@Autowired
	private SqlSession sqlSession;
	
	//메모 화면에서 리스트를 불러오는 서비스 함수
	public List<Memo> selectMemo(int cpage, int pagesize, String emp_no, String query){
		MemoDAO memodao = sqlSession.getMapper(MemoDAO.class);
		List<Memo> list = memodao.selectMemo(cpage, pagesize, emp_no,query); 
		return list;
	};
	
	//사원 아이디를 토대로 사번 정보를 불러오는 서비스 함수
	public String selectMemoEmpno(String id){
		MemoDAO memodao = sqlSession.getMapper(MemoDAO.class);
		String memo = memodao.selectMemoEmpno(id);
		return memo;
	}
	
	//메모 detail 데이터를 불러오는 서비스 함수
	public Memo selectMemo_detail(String memo_no){
		MemoDAO memodao = sqlSession.getMapper(MemoDAO.class);
		Memo memo = memodao.selectMemo_detail(memo_no);
		return  memo;
	}
	
	//해당 사번이 가진 메모 가운데 가장 큰 메모 번호를 가져옴
	public String selectMaxNo(String emp_no){
		MemoDAO memodao = sqlSession.getMapper(MemoDAO.class);
		String max_no = memodao.selectMaxNo(emp_no);
		return max_no;
	}
	
	//메모를 인서트 하는 서비스 함수
	public int insertMemo(Memo dto){
		MemoDAO memodao = sqlSession.getMapper(MemoDAO.class);
		int result = memodao.insertMemo(dto);
		return result;
	}
	
	//메모 컬러 리스트를 모두 뽑아오는 서비스 함수
	public List<Memocolor> selectMemocolorList(){
		MemoDAO memodao = sqlSession.getMapper(MemoDAO.class);
		List<Memocolor> color = memodao.selectMemocolorList();
		return color;
	}
	
	//메모를 수정하는 서비스 함수
	public int updateMemo(String update_memo_no, String memo_content, String memo_title){
		MemoDAO memodao = sqlSession.getMapper(MemoDAO.class);
		int result = memodao.updateMemo(update_memo_no,memo_content,memo_title);
		return result;
	}
	
	//메모를 삭제하는 서비스 함수
	public int deleteMemo(String memo_no){
		MemoDAO memodao = sqlSession.getMapper(MemoDAO.class);
		int result = memodao.deleteMemo(memo_no);
		return result;
	}

	//총 글수
	public int selectCount(String emp_no, String query) {
		MemoDAO memodao = sqlSession.getMapper(MemoDAO.class);
		int total =  memodao.selectCount(emp_no,query);	
		return total;
	}
}
