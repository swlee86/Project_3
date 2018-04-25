package com.toinfra.DraftController;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.toinfra.Service.DraftService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.toinfra.Service.CommonService;
import com.toinfra.DTO.Break;
import com.toinfra.DTO.Common;
import com.toinfra.DTO.Cooperation;
import com.toinfra.DTO.Draft;
import com.toinfra.DTO.Draft_line;
import com.toinfra.DTO.Draft_ref;
import com.toinfra.DTO.Office;

/*
 * 작성자 : 백승아
 * 작성일 : 2016-12-12
 * 목  적 : 전자결재 전용 controller 
 */

@Controller
public class DraftController {
	
	@Autowired
	private CommonService commonservice;
	
	@Autowired
	private DraftService service;
	
	// 전자 결재 등록 페이지 요청
	@RequestMapping(value="/draftWrite.do", method=RequestMethod.GET)
	public String draftWrite() {
		return "draft.draft_write";
	}
	
	// 전자 결재 양식 반환
	@RequestMapping("/draftForm.do")
	public String draftForm(String cg_no, HttpSession session, Model model) {
		String returnForm = "";
		
		if(cg_no.equals("1")) {
			returnForm = "draft/office";
		} else if(cg_no.equals("2")) {
			returnForm = "draft/cooperation";
		} else if(cg_no.equals("3")) {
			returnForm = "draft/break";
		}
		
		// 로그인 id
		String emp_no = (String) session.getAttribute("emp_no");
		
		// 전자결재 번호
		String draft_no = service.selectDraft_no();
		model.addAttribute("draft_no", draft_no);
		
		// 등록을 위한 기본정보 가져오기
		Draft draft = service.selectDraft_basic(emp_no);
		model.addAttribute("draft", draft);
		
		return returnForm;
	}
	
	// 대외발신공문 등록
	@RequestMapping(value="/draftOffice.do", method=RequestMethod.POST)
	public String draftWriteOffice(HttpSession session, Model model, Office office, String draft_line_emp_no, String draft_ref_emp_no) {
		String cg_no = "1";
		
		// 로그인 id
		String emp_no = (String) session.getAttribute("emp_no");
		model.addAttribute("emp_no", emp_no);
				
		office.setUser_id(emp_no);
		office.setCg_no(cg_no);
		
		service.insertOffice(office);
		
		String draft_no = office.getDraft_no();
		String[] linelist = draft_line_emp_no.split(",");
		String[] reflist = draft_ref_emp_no.split(",");
		
		service.insertDraft_line(draft_no, linelist);
		service.insertDraft_ref(draft_no, reflist);
		
		return "draft.draft_write";
	}
	
	// 협조문 등록
	@RequestMapping(value="/draftCooperation.do", method=RequestMethod.POST)
	public String draftWriteCooperation(HttpSession session, Model model, Cooperation cooperation, String draft_line_emp_no, String draft_ref_emp_no) {
		String cg_no = "2";
		
		// 로그인 id
		String emp_no = (String) session.getAttribute("emp_no");
		model.addAttribute("emp_no", emp_no);
				
		cooperation.setUser_id(emp_no);
		cooperation.setCg_no(cg_no);
		
		service.insertCooperation(cooperation);
	
		String draft_no = cooperation.getDraft_no();
		String[] linelist = draft_line_emp_no.split(",");
		String[] reflist = draft_ref_emp_no.split(",");
		
		service.insertDraft_line(draft_no, linelist);
		service.insertDraft_ref(draft_no, reflist);
		
		return "draft.draft_write";
	}
	
	// 휴가신청서 등록
	@RequestMapping(value="/draftBreak.do", method=RequestMethod.POST)
	public String draftWriteBreak(HttpSession session, Model model, Break break2, String draft_line_emp_no, String draft_ref_emp_no) {
		String cg_no = "3";
		
		// 로그인 id
		String emp_no = (String) session.getAttribute("emp_no");
		model.addAttribute("emp_no", emp_no);
				
		break2.setUser_id(emp_no);
		break2.setCg_no(cg_no);
		
		service.insertBreak(break2);
		
		String draft_no = break2.getDraft_no();
		String[] linelist = draft_line_emp_no.split(",");
		String[] reflist = draft_ref_emp_no.split(",");
		
		service.insertDraft_line(draft_no, linelist);
		service.insertDraft_ref(draft_no, reflist);
		
		return "draft.draft_write";
	}
	
	// 결재 수신함 페이지 요청
	@RequestMapping(value="/draft_rec.do", method=RequestMethod.GET)
	public String draft_rec(HttpSession session, Model model) {
		// 로그인 id
		String emp_no = (String) session.getAttribute("emp_no");
		
		// 대외발신공문
		// 목록 가져오기
		List<Office> officelist = service.selectOffice_rec(emp_no);
		model.addAttribute("officelist", officelist);

		// 글 개수 구하기
		int officecount = officelist.size();
		model.addAttribute("officecount", officecount);
		
		// 협조문
		// 목록 가져오기
		List<Cooperation> cooperationlist = service.selectCooperation_rec(emp_no);
		model.addAttribute("cooperationlist", cooperationlist);
		
		// 글 개수 구하기
		int cooperationcount = cooperationlist.size();
		model.addAttribute("cooperationcount", cooperationcount);
		
		// 휴가신청서
		// 목록 가져오기
		List<Break> breaklist = service.selectBreak_rec(emp_no);
		model.addAttribute("breaklist", breaklist);
		
		// 글 개수 구하기
		int breakcount = breaklist.size();
		model.addAttribute("breakcount", breakcount);
		 
		return "draft.draft_rec";
	}
	
	// 결재 송신함 페이지 요청
	@RequestMapping(value="/draft.do", method=RequestMethod.GET)
	public String draft(HttpSession session, Model model) {
		// 로그인 id
		String emp_no = (String) session.getAttribute("emp_no");
		
		// 대외발신공문
		// 목록 가져오기
		List<Office> officelist = service.selectOffice(emp_no);
		model.addAttribute("officelist", officelist);

		// 글 개수 구하기
		int officecount = officelist.size();
		model.addAttribute("officecount", officecount);
					
		// 협조문
		// 목록 가져오기
		List<Cooperation> cooperationlist = service.selectCooperation(emp_no);
		model.addAttribute("cooperationlist", cooperationlist);
				
		// 글 개수 구하기
		int cooperationcount = cooperationlist.size();
		model.addAttribute("cooperationcount", cooperationcount);
				
		// 휴가신청서
		// 목록 가져오기
		List<Break> breaklist = service.selectBreak(emp_no);
		model.addAttribute("breaklist", breaklist);
				
		// 글 개수 구하기
		int breakcount = breaklist.size();
		model.addAttribute("breakcount", breakcount);
		
		return "draft.draft";
	}
	
	// 대외발신공문 상세
	@RequestMapping(value="/office_detail.do", method=RequestMethod.GET)
	public String office_detail(HttpSession session, String draft_no, Model model) {
		// 로그인 id
		String emp_no = (String) session.getAttribute("emp_no");
		
		// 승인 권한 (hidden 속성 부여)
		List<String> db_emp_no_list = service.selectDraft_line_emp_no(draft_no);
		String session_emp_no = emp_no;
		model.addAttribute("db_emp_no_list", db_emp_no_list);
		model.addAttribute("session_emp_no", session_emp_no);
		
		// 기존 승인 정보 가져오기
		String app_check = service.selectApp_check(draft_no, emp_no);
		model.addAttribute("app_check", app_check);
		
		// 대외발신공문 상세 가져오기
		Office detail = service.selectOffice_detail(draft_no);
		model.addAttribute("detail", detail);

		// 결재라인 가져오기
		List<Draft_line> linedetail = service.selectDraft_line(draft_no);
		model.addAttribute("linedetail", linedetail);
		
		// 결재라인 인원수
		int linecount = linedetail.size();
		model.addAttribute("linecount", linecount);
		
		// 전자결재 참조자 가져오기
		List<Draft_ref> refdetail = service.selectDraft_ref(draft_no);
		model.addAttribute("refdetail", refdetail);
		
		// 전자결재 인원수
		int refcount = refdetail.size();
		model.addAttribute("refcount", refcount);
		
		// 결재자가 읽으면 rec_check에 날짜 삽입
		for(Draft_line data : linedetail) {
			if(data.getUser_id().equals(session_emp_no)) {
				service.insertRec_check(draft_no);
			}
		}
		for(Draft_ref data : refdetail) {
			if(data.getUser_id().equals(session_emp_no)) {
				service.insertRec_date(draft_no);
			}
		}
		
		return "draft.office_detail";
	}
	
	// 협조문 상세
	@RequestMapping(value="/cooperation_detail.do", method=RequestMethod.GET)
	public String cooperation_detail(HttpSession session, String draft_no, Model model) {
		// 로그인 id
		String emp_no = (String) session.getAttribute("emp_no");
		
		// 승인 권한 (hidden 속성 부여)
		List<String> db_emp_no_list = service.selectDraft_line_emp_no(draft_no);
		String session_emp_no = emp_no;
		model.addAttribute("db_emp_no_list", db_emp_no_list);
		model.addAttribute("session_emp_no", session_emp_no);
				
		// 기존 승인 정보 가져오기
		String app_check = service.selectApp_check(draft_no, emp_no);
		model.addAttribute("app_check", app_check);
		
		// 협조문 상세 가져오기
		Cooperation detail = service.selectCooperation_detail(draft_no);
		model.addAttribute("detail", detail);
		
		String low_dept_no = detail.getLow_dept_no();
		
		// 협조문 수신부서 상세 가져오기
		Common attach = commonservice.selectAttach(low_dept_no);
		model.addAttribute("attach", attach);
		
		// 결재라인 가져오기
		List<Draft_line> linedetail = service.selectDraft_line(draft_no);
		model.addAttribute("linedetail", linedetail);
		
		// 결재라인 인원수
		int linecount = linedetail.size();
		model.addAttribute("linecount", linecount); 
		
		// 전자결재 참조자 가져오기
		List<Draft_ref> refdetail = service.selectDraft_ref(draft_no);
		model.addAttribute("refdetail", refdetail);
		
		// 전자결재 인원수
		int refcount = refdetail.size();
		model.addAttribute("refcount", refcount);
		
		// 결재자가 읽으면 rec_check에 날짜 삽입
		for(Draft_line data : linedetail) {
			if(data.getUser_id().equals(emp_no)) {
				service.insertRec_check(draft_no);
			}
		}
		for(Draft_ref data : refdetail) {
			if(data.getUser_id().equals(emp_no)) {
				service.insertRec_date(draft_no);
			}
		}
				
		return "draft.cooperation_detail";
	}
	
	// 휴가신청서 상세
	@RequestMapping(value="/break_detail.do", method=RequestMethod.GET)
	public String break_detail(HttpSession session, String draft_no, Model model) {
		// 로그인 id
		String emp_no = (String) session.getAttribute("emp_no");
		
		// 승인 권한 (hidden 속성 부여)
		List<String> db_emp_no_list = service.selectDraft_line_emp_no(draft_no);
		String session_emp_no = emp_no;
		model.addAttribute("db_emp_no_list", db_emp_no_list);
		model.addAttribute("session_emp_no", session_emp_no);
				
		// 기존 승인 정보 가져오기
		String app_check = service.selectApp_check(draft_no, emp_no);
		model.addAttribute("app_check", app_check);
		
		// 휴가 신청서 상세 가져오기
		Break detail = service.selectBreak_detail(draft_no);
		model.addAttribute("detail", detail);

		// 결재라인 가져오기
		List<Draft_line> linedetail = service.selectDraft_line(draft_no);
		model.addAttribute("linedetail", linedetail);
				
		// 결재라인 인원수
		int linecount = linedetail.size();
		model.addAttribute("linecount", linecount);
				
		// 전자결재 참조자 가져오기
		List<Draft_ref> refdetail = service.selectDraft_ref(draft_no);
		model.addAttribute("refdetail", refdetail);
				
		// 전자결재 인원수
		int refcount = refdetail.size();
		model.addAttribute("refcount", refcount);

		// 결재자가 읽으면 rec_check에 날짜 삽입
		for(Draft_line data : linedetail) {
			if(data.getUser_id().equals(emp_no)) {
				service.insertRec_check(draft_no);
			}
		}
		for(Draft_ref data : refdetail) {
			if(data.getUser_id().equals(emp_no)) {
				service.insertRec_date(draft_no);
			}
		}
				
		return "draft.break_detail";
	}
	
	// 수신함에서 삭제하기
	@RequestMapping(value="/draft_rec_delete.do", method=RequestMethod.GET)
	public String draft_rec_delete(String draft_no, Model model) {
		service.draft_rec_delete(draft_no);
		
		String link = "draft.draft_rec";
		model.addAttribute("link", link);
		
		return "draft_redirect";
	}
	
	// 송신함에서 삭제하기
	@RequestMapping(value="/draft_delete.do", method=RequestMethod.GET)
	public String draft_delete(String draft_no, Model model) {
		service.draft_delete(draft_no);
		
		String link = "draft.draft";
		model.addAttribute("link", link);
		
		return "draft_redirect";
	}
}
