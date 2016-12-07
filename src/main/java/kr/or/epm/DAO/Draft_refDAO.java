package kr.or.epm.DAO;

import java.util.List;

import kr.or.epm.VO.Break;
import kr.or.epm.VO.Cooperation;
import kr.or.epm.VO.Draft;
import kr.or.epm.VO.Draft_line;
import kr.or.epm.VO.Office;

/*
 * 작성일 :	2016 - 11 - 29
 * 작성자 :	백승아
 * 사용 목적 :	전자결재 참조자 DAO
*/

public interface Draft_refDAO {
	
	// 결재 참조자 등록하기
	public int insertDraft_ref(String draft_no, String refList);
	
	// 참조된 결재 문서 번호 가져오기
	public List<String> selectDraft_ref_draft_no(String emp_no);
	
}
