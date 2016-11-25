package kr.or.epm.SanctionController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SanctionController {

	//협조 문서 페이지
	@RequestMapping("/CooperationDocument.do")
	public String CooperationDocument(){
		return "electronic_sanction/CooperationDocument";
	}
	//대외협조공문 페이지
	@RequestMapping("/office.do")
	public String office(){
		return "electronic_sanction/office";
	}
	
	
	//휴가 문서 페이지
	@RequestMapping("/VacationDocument.do")
	public String VacationDocument(){
		return "electronic_sanction/VacationDocument";
	}
	
	//휴가문서 서브밋시 호출
	@RequestMapping(value="/VactionForm.do", method=RequestMethod.POST)
	public String VactionForm(){
		
		return null;
	}
	
}
