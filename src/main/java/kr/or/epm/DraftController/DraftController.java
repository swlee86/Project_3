package kr.or.epm.DraftController;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.epm.Service.CommonService;
import kr.or.epm.Service.DraftService;
import kr.or.epm.VO.Office;

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
	public String draftWriteOk(Office office) {
		System.out.println("CONTROLLER] 대외발신공문 등록");
		
		System.out.println("office : " + office.toString());
		service.insertOffice(office);
		
		return "draft.draft_write";
	}
}
