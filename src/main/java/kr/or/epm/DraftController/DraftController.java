package kr.or.epm.DraftController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DraftController {
	
	// 전자 결재 등록 페이지 요청
	@RequestMapping(value="/draftWrite.do", method=RequestMethod.GET)
	public String draftWrite() {
		System.out.println("CONTROLLER] 전자 결재 페이지를 불러옵니다");
		
		return "draft.draft_write";
	}
	
	// 전자 결재 양식 반환
	@RequestMapping("/draftForm.do")
	public String draftForm(String cg_no) {
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
		
		return returnForm;
	}
	
	// 전자 결재 등록
	@RequestMapping(value="/draftWrite.do", method=RequestMethod.POST)
	public String draftWriteOk(Model model) {
		System.out.println("CONTROLLER] 전자 결재 등록");
		
		String link = "";
		link = "draft_write.do";
		
		model.addAttribute("link", link);
		return "draft.draft_direct";
	}
}
