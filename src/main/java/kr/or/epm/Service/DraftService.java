package kr.or.epm.Service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.epm.DAO.DraftDAO;
import kr.or.epm.DAO.Draft_lineDAO;
import kr.or.epm.DAO.Draft_refDAO;
import kr.or.epm.VO.Break;
import kr.or.epm.VO.Cooperation;
import kr.or.epm.VO.Draft;
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
		
		resultDraft = dao.insertDraft_office(office);
		resultOffice = dao.insertOffice(office);
		
		if(resultDraft > 0 && resultOffice > 0) {
			result = 1;
		}
		
		return result;
	}
	
	// 협조문 등록하기
	public int insertCooperation(Cooperation cooperation) {
		System.out.println("SERVICE] 협조문을 등록합니다");

		System.out.println("sfds : " + cooperation.toString());
		
		int resultDraft = 0;
		int resultOffice = 0;
		int result = 0;
		
		DraftDAO dao = sqlsession.getMapper(DraftDAO.class);
		
		resultDraft = dao.insertDraft_cooperation(cooperation);
		System.out.println("1111");
		resultOffice = dao.insertCooperation(cooperation);
		System.out.println("2222");
		
		if(resultDraft > 0 && resultOffice > 0) {
			result = 1;
		}
		
		return result;
	}
	
	// 협조문 등록하기
	public int insertBreak(Break break2) {
		System.out.println("SERVICE] 휴가신청서를 등록합니다");

		System.out.println("sfds : " + break2.toString());
			
		int resultDraft = 0;
		int resultOffice = 0;
		int result = 0;
			
		DraftDAO dao = sqlsession.getMapper(DraftDAO.class);
			
		resultDraft = dao.insertDraft_break(break2);
		System.out.println("1111");
		resultOffice = dao.insertBreak(break2);
		System.out.println("2222");
			
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
		System.out.println("넘겨진 결재 참조자들 인원 수 : " + refList.length);
		
		Draft_refDAO dao = sqlsession.getMapper(Draft_refDAO.class);
		
		int result = 0;
		for(int i=0; i<refList.length; i++) {
			result = dao.insertDraft_ref(draft_no, refList[i]);
		}
		
		return result;
	}
	
	// 등록하기 위한 전자결재 번호 가져오기
	public String selectDraft_no() {
		System.out.println("SERVICE] 등록을 위해 결재 번호를 가져옵니다");
		
		DraftDAO dao = sqlsession.getMapper(DraftDAO.class);
		String draft_no = dao.selectDraft_no();
		
		return draft_no; 
	}
	
	// 등록하기 위한 기본정보 가져오기
	public Draft selectDraft_basic(String emp_no) {
		System.out.println("SERVICE] 등록을 위해 기본 정보를 가져옵니다");
		
		DraftDAO dao = sqlsession.getMapper(DraftDAO.class);
		Draft draft = dao.selectDraft_basic(emp_no);
		
		return draft;
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
		System.out.println("결재 번호를 가져왔습니다 : " + draft_no_list.toString());
		
		// 여기가 오래 걸리는 범인이야!!!!!!!!!!!!!!!!!!!!!
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
		System.out.println("내 차례의 결재 번호 가져왔습니다 : " + draft_line_list.toString());
		
		// 출력할 대외발신공문 정보
		Office office = null;
		// 출력할 대외발신공문 리스트들 저장
		List<Office> officelist = new ArrayList<Office>();
		
		for(String draft_no : draft_line_list) {
			office = dao.selectOffice_rec(draft_no, emp_no);
			officelist.add(office);
		}
		System.out.println("출력할 대외발신공문 리스트들 저장합니다 : " + officelist.toString());
		
		// 참조당한 대외발신공문 결재 문서 리스트 불러오기
		List<Office> office_reflist = dao.selectDraft_ref_Office(emp_no);
		System.out.println("확인 중 : " + office_reflist.toString());
		for(Office office2 : office_reflist) {
			System.out.println("여기타니/?");
			// 이미 리스트에 add되어 있으면 add하지 않겠다
			if(officelist.size()>0) {
				for (int i = 0; i < officelist.size(); i++) {
					if (!office2.getDraft_no().equals(officelist.get(i).getDraft_no())) {
						officelist.add(office2);
					}
				}
			}
			else {
				officelist.add(office2);
			}
		}
		System.out.println("참조당한 대외발신 공문 리스트들 저장합니다 : " + officelist.toString());
		
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
		System.out.println("전체 결재 번호들 : " + draft_no_list.toString());

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
		
		System.out.println("내 차례의 결재번호들 : " + draft_line_list.toString());
		
		// 출력할 협조문 정보
		Cooperation cooperation = null;
		// 출력할 협조문 리스트들 저장
		List<Cooperation> cooperationlist = new ArrayList<Cooperation>();

		for (String draft_no : draft_line_list) {
			cooperation = dao.selectCooperation_rec(draft_no, emp_no);
			cooperationlist.add(cooperation);
		}
		
		System.out.println("결재라인이 적용된 출력할 협조문 : " + cooperationlist.toString());
		System.out.println("그 길이 : " + cooperationlist.size());
		
		// 참조당한 협조문 결재문서 리스트 불러오기
		List<Cooperation> cooperation_reflist = dao.selectDraft_ref_Cooperaion(emp_no);
		
		System.out.println("참조당한 협조문 리스트 : " + cooperation_reflist.toString());
		System.out.println("그 길이 : " + cooperation_reflist.size());
		for(Cooperation cooper : cooperation_reflist) {
			// 이미 리스트에 add되어 있으면 add하지 않겠다
			if(cooperationlist.size()>0) {
				for (int i = 0; i < cooperationlist.size(); i++) {
					if (!cooper.getDraft_no().equals(cooperationlist.get(i).getDraft_no())) {
						cooperationlist.add(cooper);
					}
				}
			}
			else {
				cooperationlist.add(cooper);
			}
		}
		
		System.out.println("최종 협조문 리스트 : " + cooperationlist.toString());
		
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
		
		// 참조 당한 휴가신청서 결재 문서 불러오기
		List<Break> break_reflist = dao.selectDraft_ref_Break(emp_no);
		
		for(Break break2 : break_reflist) {
			// 이미 리스트에 add되어 있으면 add하지 않겠다
			if(breaklist.size() >0) {
				for (int i = 0; i < breaklist.size(); i++) {
					if (!break2.getDraft_no().equals(breaklist.get(i).getDraft_no())) {
						breaklist.add(break2);
					}
				}
			}
			else {
				breaklist.add(break2);
			}
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
	
	// 기존 승인 정보 가져오기
	public String selectApp_check(String draft_no, String emp_no) { 
		System.out.println("SERVICE] 기존 승인 정보 가져오기");
		
		Draft_lineDAO dao = sqlsession.getMapper(Draft_lineDAO.class);
		String app_check = dao.selectApp_check(draft_no, emp_no);
		
		return app_check;
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
		
		System.out.println("터졌나 확인확인111");
		return reflist;
	}
	
	// 상세 처리
	public int rec_process(String draft_no) {
		System.out.println("SERVICE] 상세 처리를 시작합니다");
		System.out.println("넘겨진 draft_no : " + draft_no);
		
		DraftDAO dao = sqlsession.getMapper(DraftDAO.class);
		int result = 0;
		
		int result1 = dao.updateDraft(draft_no);
		int result2 = dao.updateDraft_line(draft_no);
				
		if(result1 > 0 && result2 > 0) result = 1;
		
		return result;
	}
	
	// 수신함에서 삭제하기
	public int draft_rec_delete(String draft_no) {
		System.out.println("SERVICE] 수신함에서 삭제합니다");
		System.out.println("넘겨진 draft_no : " + draft_no);
		
		DraftDAO dao = sqlsession.getMapper(DraftDAO.class);
		int result = dao.rec_deleteDraft(draft_no);
		
		return result;
	}
	
	// 송신함에서 삭제하기
	public int draft_delete(String draft_no) {
		System.out.println("SERVICE] 송신함에서 삭제합니다");
		System.out.println("넘겨진 draft_no : " + draft_no);

		DraftDAO dao = sqlsession.getMapper(DraftDAO.class);
		int result = dao.deleteDraft(draft_no);
		
		return result;
	}
	
	// 전자결재 승인 처리하기
	public int updateDraft_line_app(HttpSession session, String draft_no, String app_check) {
		System.out.println("SERVICE] 승인처리를 시작합니다");
		String emp_no = (String) session.getAttribute("emp_no");
		
		DraftDAO dao = sqlsession.getMapper(DraftDAO.class);
		Draft_lineDAO linedao = sqlsession.getMapper(Draft_lineDAO.class);
		
		int result = linedao.updateDraft_line_app(draft_no, emp_no, app_check);
		
		List<String> app_check_list = linedao.selectApp_check_all(draft_no);
		System.out.println("전체 승인정보들 가져오기 : " + app_check_list.toString());
		for(String data : app_check_list) {
			if(!data.equals("1")) {
				if(data.equals("2")) {
					dao.updateDraft_step_no("2", draft_no);
				} else if(data.equals("3")) {
					dao.updateDraft_step_no("3", draft_no);
				}
			}
			else {
				dao.updateDraft_step_no("1", draft_no);
			}
		}
		
		if(result > 0) {
			System.out.println("승인처리에 성공했습니다");
		} else {
			System.out.println("ERROR");
		}
		
		return result;
	}
	
	// 승인 권한을 위해 draft_no 로 emp_no 불러오기
	public List<String> selectDraft_line_emp_no(String draft_no) {
		System.out.println("SERVICE] 권한 위해 emp_no 들을 불러옵니다");
		
		Draft_lineDAO dao = sqlsession.getMapper(Draft_lineDAO.class);
		
		List<String> list = dao.selectDraft_line_emp_no(draft_no);
		
		return list;
	}
}
