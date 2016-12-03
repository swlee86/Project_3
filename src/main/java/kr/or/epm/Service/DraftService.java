package kr.or.epm.Service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.epm.DAO.CommonDAO;
import kr.or.epm.DAO.DraftDAO;
import kr.or.epm.DAO.Draft_lineDAO;
import kr.or.epm.VO.Break;
import kr.or.epm.VO.Cooperation;
import kr.or.epm.VO.Draft_line;
import kr.or.epm.VO.Draft_ref;
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
	
	// 대외발신공문 수신 리스트 불러오기
	public List<Office> selectOffice_rec(String emp_no) {

		System.out.println("SERVICE] 대외발신공문 수신 리스트를 불러옵니다");
		System.out.println("넘겨진 emp_no : " + emp_no);

		DraftDAO dao = sqlsession.getMapper(DraftDAO.class);
		// cg_no = "1" 은 대외발신공문
		String cg_no = "1";
		
		// 결재 번호 가져오기
		List<String> draft_no_list = dao.selectDraft_noList();

		// 내 차례인 결재의 결재번호
		String draft_line_no = null;
		// 내 차례인 결재번호들 저장
		List<String> draft_line_list = new ArrayList<String>();
		
		for(String draft_no : draft_no_list) {
			// 결재라인 차례 확인하기
			draft_line_no = dao.selectDraft_line(draft_no, emp_no, cg_no);
			if(draft_line_no != null) {
				draft_line_list.add(draft_line_no);
			}
		}
		
		// 출력할 대외발신공문 정보
		Office office = null;
		// 출력할 대외발신공문 리스트들 저장
		List<Office> officelist = new ArrayList<Office>();
		
		for(String draft_no : draft_line_list) {
			office = dao.selectOffice_rec(draft_no, emp_no);
			officelist.add(office);
		}
		
		return officelist;
	}
	
	// 협조문 수신 리스트 불러오기
	public List<Cooperation> selectCooperation_rec(String emp_no) {
		
		System.out.println("SERVICE] 협조문 수신 리스트를 불러옵니다");
		System.out.println("넘겨진 emp_no : " + emp_no);

		DraftDAO dao = sqlsession.getMapper(DraftDAO.class);
		// cg_no = "2" 은 협조문
		String cg_no = "2";

		// 결재 번호 가져오기
		List<String> draft_no_list = dao.selectDraft_noList();

		// 내 차례인 결재의 결재번호
		String draft_line_no = null;
		// 내 차례인 결재번호들 저장
		List<String> draft_line_list = new ArrayList<String>();

		for (String draft_no : draft_no_list) {
			// 결재라인 차례 확인하기
			draft_line_no = dao.selectDraft_line(draft_no, emp_no, cg_no);
			if (draft_line_no != null) {
				draft_line_list.add(draft_line_no);
			}
		}
		
		// 출력할 협조문 정보
		Cooperation cooperation = null;
		// 출력할 협조문 리스트들 저장
		List<Cooperation> cooperationlist = new ArrayList<Cooperation>();

		for (String draft_no : draft_line_list) {
			cooperation = dao.selectCooperation_rec(draft_no, emp_no);
			cooperationlist.add(cooperation);
		}
		
		return cooperationlist;
	}
	
	// 휴가 신청서 리스트 불러오기
	public List<Break> selectBreak_rec(String emp_no) {
		
		System.out.println("SERVICE] 휴가 신청서 수신 리스트를 불러옵니다");
		System.out.println("넘겨진 emp_no : " + emp_no);
		
		DraftDAO dao = sqlsession.getMapper(DraftDAO.class);
		// cg_no = "3" 은 휴가신청서
		String cg_no = "3";

		// 결재 번호 가져오기
		List<String> draft_no_list = dao.selectDraft_noList();

		// 내 차례인 결재의 결재번호
		String draft_line_no = null;
		// 내 차례인 결재번호들 저장
		List<String> draft_line_list = new ArrayList<String>();

		for (String draft_no : draft_no_list) {
			// 결재라인 차례 확인하기
			draft_line_no = dao.selectDraft_line(draft_no, emp_no, cg_no);
			if (draft_line_no != null) {
			draft_line_list.add(draft_line_no);
			}
		}
			
		// 출력할 휴가신청서 정보
		Break br = null;
		// 출력할 휴가신청서 리스트들 저장
		List<Break> breaklist = new ArrayList<Break>();

		for (String draft_no : draft_line_list) {
			br = dao.selectBreak_rec(draft_no, emp_no);
			breaklist.add(br);
		}
		
		return breaklist;
	}
	
	// 대외발신공문 송신함 리스트 불러오기
	public List<Office> selectOffice(String emp_no) {
		
		System.out.println("SERVICE] 대외발신공문 송신 리스트를 불러옵니다");
		System.out.println("넘겨진 emp_no : " + emp_no);

		DraftDAO dao = sqlsession.getMapper(DraftDAO.class);
		
		// 출력할 대외발신공문 리스트들 저장
		List<Office> officelist = new ArrayList<Office>();
		officelist = dao.selectOffice(emp_no);
		
		return officelist;
	}
	
	// 협조문 송신함 리스트 불러오기
	public List<Cooperation> selectCooperation(String emp_no) {
		
		System.out.println("SERVICE] 협조문 송신 리스트를 불러옵니다");
		System.out.println("넘겨진 emp_no : " + emp_no);

		DraftDAO dao = sqlsession.getMapper(DraftDAO.class);
		
		// 출력할 협조문 리스트들 저장
		List<Cooperation> cooperationlist = new ArrayList<Cooperation>();
		cooperationlist = dao.selectCooperation(emp_no);
		
		return cooperationlist;
	}
	
	// 휴가신청서 송신함 리스트 불러오기
	public List<Break> selectBreak(String emp_no) {
		
		System.out.println("SERVICE] 휴가신청서 송신 리스트 불러옵니다");
		System.out.println("넘겨진 emp_no : " + emp_no);

		DraftDAO dao = sqlsession.getMapper(DraftDAO.class);
		
		// 출력할 휴가신청서 리스트들 저장
		List<Break> breaklist = new ArrayList<Break>();
		breaklist = dao.selectBreak(emp_no);
		
		return breaklist;
	}
	
	// 대외발신공문 상세
	public Office selectOffice_detail(String draft_no) {
		
		System.out.println("SERVICE] 대외발신공문 상세 정보를 가져옵니다");
		System.out.println("넘겨진 draft_no : " + draft_no);
		
		DraftDAO dao = sqlsession.getMapper(DraftDAO.class);
		Office office = dao.selectOffice_detail(draft_no);
		
		return office;
	}
	
	// 협조문 상세
	public Cooperation selectCooperation_detail(String draft_no) {
		
		System.out.println("SERVICE] 협조문 상세 정보를 가져옵니다");
		System.out.println("넘겨진 draft_no : " + draft_no);
		
		DraftDAO dao = sqlsession.getMapper(DraftDAO.class);
		Cooperation cooper = dao.selectCooperation_detail(draft_no);
		
		return cooper;
	}
	
	// 휴가 신청서 상세
	public Break selectBreak_detail(String draft_no) {
		
		System.out.println("SERVICE] 휴가 신청서 정보를 가져옵니다");
		System.out.println("넘겨진 draft_no : " + draft_no);
		
		DraftDAO dao = sqlsession.getMapper(DraftDAO.class);
		Break break2 = dao.selectBreak_detail(draft_no);
		
		return break2;
	}
	
	// 상세 > 결재라인
	public List<Draft_line> selectDraft_line(String draft_no) {
		
		System.out.println("SERVICE] 결재라인 정보를 가져옵니다");
		System.out.println("넘겨진 draft_no : " + draft_no);
		
		DraftDAO dao = sqlsession.getMapper(DraftDAO.class);
		List<Draft_line> linelist = dao.selectDraft_line_data(draft_no);
		
		return linelist;
	}
	
	// 상세 > 참조자
	public List<Draft_ref> selectDraft_ref(String draft_no){
		
		System.out.println("SERVICE] 참조자 정보를 가져옵니다");
		System.out.println("넘겨진 draft_no : " + draft_no);
		
		DraftDAO dao = sqlsession.getMapper(DraftDAO.class);
		List<Draft_ref> reflist = dao.selectDraft_ref_data(draft_no);
				
		return reflist;
	}
}
