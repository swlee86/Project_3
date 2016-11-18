package kr.or.epm.AjaxController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import kr.or.epm.Service.AdminService;
import kr.or.epm.VO.Branch;
import kr.or.epm.VO.Dept;

/*
 * 작성자 : 박성준
 * 작성일 : 2016-11-17
 * 사용목적 : 관리자 아작스 컨트롤러
 * 
 */

@Controller
public class AdminAjaxController {

	@Autowired
	private View jsonview;
	@Autowired
	private AdminService adminservice;
	
	//지점 선택후 조회 클릭 했을시 지점 상세정보 출력
	@RequestMapping("/selectBranchList.do")
	public View branchList(String selectBranchName , Model model){	
		
		Branch dto = adminservice.chooseBranch(selectBranchName);
		model.addAttribute(dto);
		return jsonview;
	}
	
	//지점 추가
	@RequestMapping("/branchAdd.do")
	public View branchAdd(Branch dto, Model model){
		
		int result = adminservice.addBranch(dto);
		System.out.println("결과 : "+result);
		model.addAttribute("result", result);
		return jsonview;
	}
	
	
	//부서 페이지 - 부서에서 - > 지점 선택시 부서 select 에 뿌려주는 함수
	@RequestMapping("/departMentSelect.do")
	public View departMentSelect(String branch_name){
		System.out.println("컨트롤러 : "+branch_name);
		List<Dept> list = adminservice.listDept(branch_name);
		System.out.println("리스트싸이즈 : "+list.size());
		return jsonview;
	}
	
	
}