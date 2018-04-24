package com.toinfra.DAO;

import java.util.List;

import com.toinfra.VO.*;
import com.toinfra.VO.Break;
import com.toinfra.VO.Cooperation;
import com.toinfra.VO.Draft;
import com.toinfra.VO.Draft_line;
import com.toinfra.VO.Draft_ref;
import com.toinfra.VO.Office;

/*
 * 작성일 :	2016-11-24
 * 작성자 :	백승아
 * 사용 목적 :	전자결재 참조자 DAO interface
*/

public interface DraftDAO {
	
	// 결재 등록하기
	// draft_대외발신공문 등록하기
	public int insertDraft_office(Office office);
	// 대외발신공문 등록하기
	public int insertOffice(Office office);
	
	// draft_협조문 등록하기
	public int insertDraft_cooperation(Cooperation cooperation);
	// 협조문 등록하기
	public int insertCooperation(Cooperation cooperation);
	
	// draft_휴가신청서 등록하기
	public int insertDraft_break(Break break2);
	// 휴가신청서 등록하기
	public int insertBreak(Break break2);
	
	// 결재 등록을 위해 기본정보 가져오기
	public Draft selectDraft_basic(String emp_no);

	// 결재 등록을 위해 전자결재 문서 번호 가져오기
	public String selectDraft_no();
	
	// 수신 리스트 확인하기
	// 결재 번호 가져오기
	public List<String> selectDraft_noList();
	
	// 결재라인 차례 확인하기
	public String selectDraft_line(String draft_no, String emp_no, String cg_no);
	
	// 참조당한 대외발신공문 결재 문서 리스트 가져오기
	public List<Office> selectDraft_ref_Office(String emp_no);
	
	// 참조당한 협조문 결재 문서 리스트 가져오기
	public List<Cooperation> selectDraft_ref_Cooperaion(String emp_no);
	
	// 참조당한 휴가신청서 결재 문서 리스트 가져오기
	public List<Break> selectDraft_ref_Break(String emp_no);
	
	// 대외발신공문 수신 리스트
	public Office selectOffice_rec(String draft_no, String emp_no);
	
	// 협조문 수신 리스트
	public Cooperation selectCooperation_rec(String draft_no, String emp_no);
	
	// 휴가신청서 수신 리스트
	public Break selectBreak_rec(String draft_no, String emp_no);
	
	// 대외발신공문 송신 리스트
	public List<Office> selectOffice(String emp_no);
	
	// 협조문 송신 리스트
	public List<Cooperation> selectCooperation(String emp_no);
	
	// 휴가신청서 송신 리스트
	public List<Break> selectBreak(String emp_no);
	
	// 대외발신공문 상세
	public Office selectOffice_detail(String draft_no);
	
	// 협조문 상세
	public Cooperation selectCooperation_detail(String draft_no);
	
	// 휴가신청서 상세
	public Break selectBreak_detail(String draft_no);
	
	// 결재라인 정보 가져오기
	public List<Draft_line> selectDraft_line_data(String draft_no);
	
	// 참조자 정보 가져오기
	public List<Draft_ref> selectDraft_ref_data(String draft_no);
	
	// 상세처리 > 결재라인 수신여부(rec_check) 삽입
	public int updateDraft_line(String draft_no);
	
	// 상세 처리 > 결재문서 수신일(rec_date) 삽입
	public int updateDraft(String draft_no);
	
	// 수신함에서 삭제하기
	public int rec_deleteDraft(String draft_no);
	
	// 송신함에서 삭제하기
	public int deleteDraft(String draft_no);
	
	// 최종 승인처리하기
	public int updateDraft_step_no(String step_no, String draft_no);
}
