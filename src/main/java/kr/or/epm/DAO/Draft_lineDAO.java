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
 * 사용 목적 :	전자결재라인 DAO
*/

public interface Draft_lineDAO {
	
	// 결재 라인 등록하기
	public int insertDraft_line(String draft_no, String lineList);
	
	// 승인 처리하기
	public int updateDraft_line_app(String draft_no, String emp_no, String app_check);
	
	// 기존 승인 정보 가져오기
	public String selectApp_check(String draft_no, String emp_no);
	
	// 결재 문서에 대한 승인 정보 전부 가져오기
	public List<String> selectApp_check_all(String draft_no);
}
