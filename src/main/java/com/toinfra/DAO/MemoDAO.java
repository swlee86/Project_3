
package com.toinfra.DAO;

import java.util.List;

import com.toinfra.VO.Memo;
import com.toinfra.VO.Memocolor;
import kr.or.toinfra.VO.Memo;
import kr.or.toinfra.VO.Memocolor;

/**
작성일 :	2016 - 11 - 17
작성자 :	김주희
사용 목적 :	메모 DAO
**/
public interface MemoDAO {
	
	//로그인한 아이디(사원번호)의 최고 글 넘버를 구함
	String selectMaxNo(String emp_no);
	
	//현재 로그인한 아이디를 토대로 사번 조회
	String  selectMemoEmpno(String id);
	
	//현재 로그인한 사원에게 온 전자결재 조회 ( 수신결재함 조회 )
	public List<Memo> selectMemo(int cpage, int pagesize, String emp_no, String query);
		
	//선택한 메모 상세 조회
	public Memo selectMemo_detail(String memo_no);
	
	//메모 색상 목록
	List<Memocolor> selectMemocolorList();
	
	//색상 선택
	public Memocolor selectMemocolor(String color_name);
	
	//메모 삭제
	public int deleteMemo(String memo_no);
	
	//메모 수정(제목, 내용, 색상)
	//public int updateMemo(Memo dto);
	
	//메모 생성,추가
	int insertMemo(Memo dto);
	
	//총 글수
	public int selectCount(String emp_no, String query);

	int updateMemo(String update_memo_no, String memo_content, String memo_title);
}
