package kr.or.epm.Service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.epm.DAO.DraftDAO;
import kr.or.epm.DAO.Draft_lineDAO;
import kr.or.epm.VO.Office;

@Service
public class DraftService {

	@Autowired
	private SqlSession sqlsession;
	
	// 대외발신공문 등록하기
	public int insertOffice(Office office) {
		System.out.println("SERVICE] 대외발신공문을 등록합니다");
		int resultDraft = 0;
		int resultOffice = 0;
		int result = 0;
		
		DraftDAO dao = sqlsession.getMapper(DraftDAO.class);
		
		resultDraft = dao.insertDraft(office);
		resultOffice = dao.insertOffice(office);
		
		if(resultDraft > 0 && resultOffice > 0) {
			result = 1;
		}
		
		return result;
	}
	
	// 결재라인 등록하기
	public int insertDraft_line(String draft_no, String[] lineList) {
		System.out.println("SERVICE] 결재 라인을 등록합니다");
		System.out.println("넘겨진 draft_no : " + draft_no);
		System.out.println("넘겨진 결재라인 인원 수 : " + lineList.length);

		Draft_lineDAO dao = sqlsession.getMapper(Draft_lineDAO.class);
				
		int result = 0;
		for(int i=0; i<lineList.length; i++) {
			result = dao.insertDraft_line(draft_no, lineList[i]);
		}
		
		return result;
	}
	
	// 결재 참조자 등록하기
	public int insertDraft_ref(String draft_no, String[] refList) {
		System.out.println("SERVICE] 결재 참조자를 등록합니다");
		System.out.println("넘겨진 draft_no : " + draft_no);
		System.out.println("넘겨진 결재 참조자를 인원 수 : " + refList.length);
		
		int result = 0;
		
		return result;
	}
}
