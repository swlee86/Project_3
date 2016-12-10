package kr.or.epm.AjaxController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

import kr.or.epm.Service.AdminEmpService;
import kr.or.epm.VO.Dept;
import kr.or.epm.VO.Emp;
import kr.or.epm.VO.Low_dept;

/*
 * 작성자 : 백승아
 * 작성일 : 2016-12-09
 * 목  적 : 사원관리 전용 ajax controller 
 */

@Controller
public class AdminEmpAjaxController {

	@Autowired
	private View jsonview;
	
	@Autowired
	private AdminEmpService service;
	
	// 사원 등록에서 지점 선택했을 때
	@RequestMapping(value="/selectBranch.do", method=RequestMethod.POST)
	public View selectBranch(String branch_no, Model model) {
		System.out.println("CONTROLLER] 지점을 선택했을 떄");
		System.out.println("넘거온 branch_no : " + branch_no);
		
		List<Dept> list = service.selectDept_list(branch_no);
		model.addAttribute("dept", list);
		
		return jsonview;
	}
	
	// 사원 등록에서 부서 선택했을 때
	@RequestMapping(value="/selectDept.do", method=RequestMethod.POST)
	public View selectDept(String dept_no, Model model) {
		System.out.println("CONTROLLER] 부서를 선택했을 때");
		System.out.println("넘겨온 dept_no : " + dept_no);
		
		List<Low_dept> list = service.selectLow_dept_list(dept_no);
		model.addAttribute("low_dept", list);
		
		return jsonview;
	}
	
	// 사원 등록
	@RequestMapping(value="/adminAdd_member_ok.do", method=RequestMethod.POST)
	public View adminAdd_member_ok(Emp emp, Model model) {
		System.out.println("CONTROLLER] 사원 등록");
		System.out.println("넘어오는 값 확인 : " + emp.toString());
			
		service.insertEmp(emp);
		model.addAttribute("result", "성공");
		return jsonview;
	}
	
	// 사원 이력 출력
	@RequestMapping(value="/adminEmp_his.do", method=RequestMethod.POST)
	public View adminEmp_his(String emp_no, Model model) {
		System.out.println("CONTROLLER] 사원 이력 출력");
		System.out.println("넘어오는 emp_no 확인하자 : " + emp_no);
		
		List<Emp> list = service.selectEmp_his(emp_no);
		model.addAttribute("list", list);
		
		return jsonview;
	}
	
	// 탈퇴를 요청한 사원의 상세를 출력
	@RequestMapping(value="/adminEmp_withdrawal_detail.do", method=RequestMethod.POST)
	public View adminEmp_withdrawal_detail(String emp_no, Model model) {
		System.out.println("CONTROLLER] 탈퇴를 요청한 사원의 상세");
		
		Emp detail = service.selectEmp_withdrawal_detail(emp_no);
		model.addAttribute("detail", detail);
		
		return jsonview;
	}
}
