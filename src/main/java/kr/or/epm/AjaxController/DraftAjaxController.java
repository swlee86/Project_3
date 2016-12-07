package kr.or.epm.AjaxController;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

import kr.or.epm.DAO.PayDAO;
import kr.or.epm.Service.AdminService;
import kr.or.epm.Service.DraftService;
import kr.or.epm.Service.PayService;
import kr.or.epm.VO.Branch;
import kr.or.epm.VO.Dept;
import kr.or.epm.VO.DeptJoinBonus;
import kr.or.epm.VO.LowDeptJoin;
import kr.or.epm.VO.Low_dept;
import kr.or.epm.VO.PositionJoin;
import kr.or.epm.VO.Set_homepage;
import kr.or.epm.VO.Set_pay_date;
import kr.or.epm.VO.Set_time;
import net.sf.json.JSONArray;

/*
 * 작성자 : 백승아
 * 작성일 : 2016-12-07
 * 사용목적 : 전자결재 ajax 컨트롤러
 * 
 */

@Controller
public class DraftAjaxController {

	@Autowired
	private View jsonview;
	
	@Autowired
	private DraftService service;
	
	// 승인 처리하기
	@RequestMapping(value="/updateDraft_approval.do", method=RequestMethod.POST)
	public View updateDraft_approval(String draft_no, String app_check) {
		System.out.println("CONTROLLER-AJAX] 전자결재 승인처리");
		System.out.println("넘겨진 draft_no : " + draft_no);
		System.out.println("넘겨진 app_check : " + app_check);
		
		
		
		return jsonview;
	}
	
}
