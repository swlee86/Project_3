package kr.or.epm.DraftController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DraftController {
	
	// 전자 결재 등록 페이지 요청
	@RequestMapping(value="draftWrite.do", method=RequestMethod.GET)
	public String draftWrite() {
		System.out.println("CONTROLLER] 전자 결재 페이지를 불러옵니다");
		
		return "draft.draft_write";
	}
	
	// 전자 결재 등록
	@RequestMapping(value="draftWrite.do", method=RequestMethod.POST)
	public String draftWriteOk(Model model) {
		System.out.println("CONTROLLER] 전자 결재 등록");
		
		String link = "";
		link = "draft_write.do";
		
		model.addAttribute("link", link);
		return "draft.draft_direct";
	}
}
