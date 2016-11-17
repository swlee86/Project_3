package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.Memo;

/**
작성일 :	2016 - 11 - 17
작성자 :	김주희
사용 목적 :	메모 DAO
**/
public interface MemoDAO {
	//현재 로그인한 사원에게 온 전자결재 조회 ( 수신결재함 조회 )
		public List<Memo> selectMemo();
}
