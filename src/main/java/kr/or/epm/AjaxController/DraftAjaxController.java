package kr.or.epm.AjaxController;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

import kr.or.epm.Service.DraftService;

/*
 * 작성자 : 백승아
 * 작성일 : 2016-12-07
 * 사용목적 : 전자결재 ajax 컨트롤러
 */

@Controller
public class DraftAjaxController {

	@Autowired
	private View jsonview;
	
	@Autowired
	private DraftService service;
	
	// 승인 처리
	@RequestMapping(value="/updateDraft_approval.do", method=RequestMethod.POST)
	public View updateDraft_approval(HttpSession session, String draft_no, String app_check, Model model) {
		service.updateDraft_line_app(session, draft_no, app_check);
		
		return jsonview;
	}
	
}
