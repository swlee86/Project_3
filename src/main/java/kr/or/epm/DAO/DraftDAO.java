package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.Break;
import kr.or.epm.VO.Cooperation;
import kr.or.epm.VO.Draft;
import kr.or.epm.VO.Draft_line;
import kr.or.epm.VO.Office;

/**
작성일 :	2016 - 11 - 17
작성자 :	김주희
사용 목적 :	전자결재 DAO
**/

public interface DraftDAO {
	
	//사번을통해 부서, 이름을 추출하는건 공통 dao에서
	
	//현재 로그인한 사원에게 온 전자결재 조회 ( 수신결재함 조회 )
	public List<Draft> selectDraft_rec(String emp_no);
	
	//결재 라인 별 승인 처리
	public int approveDraftLine(Draft dto);
	
	//결재 문서 별 승인 처리(------수정중-------)
	public int approveDraft(Draft dto);
	
	//수신된 전자결재문서 상세보기(대외발신공문)
	public Office selectOffice(String draft_no);
	
	//수신된 전자결재문서 상세보기(휴가신청)
	public Break selectBreak(String draft_no);
	
	//수신된 전자결재문서 상세보기(협조문)
	public Cooperation selectCooperation(String draft_no);
	
	//수신결재함에서 삭제
	public int deleteDraft_rec(Draft dto);
	
	//수신결재함에서 삭제
	public int deleteDraft(Draft dto);
	
	//송신결재함 조회
	public List<Draft> selectDraft(String emp_no); 
	
	//결재라인 진행 현황 
	public Draft_line selectDraftLine(String draft_no);
	
	//결재라인에서  내가 포함된 미승인 결제들의 draft_no 목록 불러오기(내 차례인것만)
	public List<String> selectDraftLine_myturn(String emp_no);
	
	
	// 결재 등록하기
	// 기본 전자 결재 등록하기
	public int insertDraft(Office office);
	
	// 대외발신공문 등록하기
	public int insertOffice(Office office);
	
	
	// 수신 리스트 확인하기
	// 결재 번호 가져오기
	public List<String> selectDraft_noList();
	
	// 결재라인 차례 확인하기
	public String selectDraft_line(String draft_no, String emp_no, String cg_no);
	
	// 대외발신공문 수신 리스트
	public Office selectOffice_rec(String draft_no);
	
	// 협조문 수신 리스트
	public Cooperation selectCooperation_rec(String draft_no);
	
	// 휴가신청서 수신 리스트
	public Break selectBreak_rec(String draft_no);
	
}
