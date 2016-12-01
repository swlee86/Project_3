package kr.or.epm.DraftController;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.epm.Service.CommonService;
import kr.or.epm.Service.DraftService;
import kr.or.epm.VO.Break;
import kr.or.epm.VO.Cooperation;
import kr.or.epm.VO.Office;
import kr.or.epm.VO.Task;

@Controller
public class DraftController {
	
	@Autowired
	private CommonService commonservice;
	
	@Autowired
	private DraftService service;
	
	// 전자 결재 등록 페이지 요청
	@RequestMapping(value="/draftWrite.do", method=RequestMethod.GET)
	public String draftWrite() {
		System.out.println("CONTROLLER] 전자 결재 페이지를 불러옵니다");
		
		return "draft.draft_write";
	}
	
	// 전자 결재 양식 반환
	@RequestMapping("/draftForm.do")
	public String draftForm(String cg_no, Principal principal, Model model) {
		System.out.println("CONTROLLER] 전자 결재 양식을 불러옵니다");
		System.out.println("받아온 cg_no : " + cg_no);
		
		String returnForm = "";
		
		if(cg_no.equals("1")) {
			returnForm = "draft/office";
		} else if(cg_no.equals("2")) {
			returnForm = "draft/cooperation";
		} else if(cg_no.equals("3")) {
			returnForm = "draft/break";
		}
		
		// 로그인 id
		String id = principal.getName();
		System.out.println("id : " + id);
		String emp_no = commonservice.selectEmp_no(id);
		System.out.println("로그인한 사원의 emp_no : " + emp_no);
		
		model.addAttribute("emp_no", emp_no);
		
		return returnForm;
	}
	
	// 대외발신공문 등록
	@RequestMapping(value="/draftOffice.do", method=RequestMethod.POST)
	public String draftWriteOk(Office office, String draft_line_emp_no, String draft_ref_emp_no) {
		System.out.println("CONTROLLER] 대외발신공문 등록");
		
		System.out.println("office : " + office.toString());
		System.out.println("draft_line_emp_no : " + draft_line_emp_no.toString());
		System.out.println("draft_ref_emp_no : " + draft_ref_emp_no.toString());
		//service.insertOffice(office);
		
		return "draft.draft_write";
	}
	
	// insert 작업은 일시 정지 : 진도가 너무 안나가....
	
	// 결재 대기함 페이지 요청
	@RequestMapping(value="/draft_rec.do", method=RequestMethod.GET)
	public String draft_rec(Principal principal, Model model) {
		System.out.println("CONTROLLER] 결재 대기함 페이지");
		
		// 로그인 id
		String id = principal.getName();
		System.out.println("id : " + id);
		String emp_no = commonservice.selectEmp_no(id);
		System.out.println("로그인한 사원의 emp_no : " + emp_no);

		// 대외발신공문
		// 목록 가져오기
		List<Office> officelist = service.selectOffice_rec(emp_no);
		model.addAttribute("officelist", officelist);

		// 글 개수 구하기
		int officecount = officelist.size();
		System.out.println("대외발신공문 수신함 글 개수 : " + officecount);
		model.addAttribute("officecount", officecount);
		
		
		// 협조문
		// 목록 가져오기
		List<Cooperation> cooperationlist = service.selectCooperation_rec(emp_no);
		model.addAttribute("cooperationlist", cooperationlist);
		
		// 글 개수 구하기
		int cooperationcount = cooperationlist.size();
		System.out.println("협조문 수신함 글 개수 : " + cooperationcount);
		model.addAttribute("cooperationcount", cooperationcount);
		
		
		// 휴가신청서
		// 목록 가져오기
		List<Break> breaklist = service.selectBreak_rec(emp_no);
		model.addAttribute("breaklist", breaklist);
		
		// 글 개수 구하기
		int breakcount = breaklist.size();
		System.out.println("휴가신청서 수신함 글 개수 : " + breakcount);
		model.addAttribute("breakcount", breakcount);
		 
		return "draft.draft_rec";
	}
	
	// 결재 대기함 상세
	
	// 결재 대기함 상세 > 승인 처리
	
	// 결재 송신함 페이지 요청
	@RequestMapping(value="/draft.do", method=RequestMethod.GET)
	public String draft() {
		System.out.println("CONTROLLER] 결재 송신함 페이지");
		
		return "draft.draft";
	}
	
	// 결재 송신함 페이지 상세
}
