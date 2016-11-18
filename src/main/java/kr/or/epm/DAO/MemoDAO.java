package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.Memo;
import kr.or.epm.VO.Memocolor;

/**
작성일 :	2016 - 11 - 17
작성자 :	김주희
사용 목적 :	메모 DAO
**/
public interface MemoDAO {
	
	//현재 로그인한 사원에게 온 전자결재 조회 ( 수신결재함 조회 )
	public List<Memo> selectMemo();
		
	//선택한 메모 상세 조회
	public Memo selectMemo_detail(String memo_no);
	
	//메모 색상 목록
	public Memocolor selectMemocolorList();
	
	//색상 선택
	public Memocolor selectMemocolor();
	
	//메모 삭제
	public int deleteMemo(String memo_no);
	
	//메모 수정(제목, 내용, 색상)
	public int updateMemo(Memo dto);
	
	//메모 생성,추가
	public void insertMemo(Memo dto);
	
}
