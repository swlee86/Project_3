package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.Break;
import kr.or.epm.VO.Cooperation;
import kr.or.epm.VO.Draft;
import kr.or.epm.VO.Office;

/**
작성일 :	2016 - 11 - 17
작성자 :	김주희
사용 목적 :	전자결재 DAO
**/
public interface DraftDAO {
	
	//사번을통해 부서, 이름을 추출하는건 공통 dao에서
	
	
	
	//현재 로그인한 사원에게 온 전자결재 조회 ( 수신결재함 조회 )
	public List<Draft> selectDraft_rec();
	
	//승인 처리
	public void approveDraft(Draft dto);
	
	//수신된 전자결재문서 상세보기(대외발신공문)
	public Office selectOffice(String draft_no);
	
	//수신된 전자결재문서 상세보기(휴가신청)
	public Break selectBreak(String draft_no);
	
	//수신된 전자결재문서 상세보기(협조문)
	public Cooperation selectCooperation(String draft_no);
	
	//수신결재함에서 삭제
	public void deleteDraft_rec(Draft dto);
	
	//수신결재함에서 삭제
	public void deleteDraft(Draft dto);
	
	//결재라인
	
	//송신결재함 조회
	public List<Draft> selectDraft(); 
}
