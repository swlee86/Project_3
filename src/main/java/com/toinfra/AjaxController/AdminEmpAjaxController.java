package com.toinfra.AjaxController;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.toinfra.VO.Dept;
import com.toinfra.VO.Emp;
import com.toinfra.VO.Low_dept;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

import com.toinfra.Service.AdminEmpService;
import com.toinfra.VO.Dept;
import com.toinfra.VO.Emp;
import com.toinfra.VO.Low_dept;
import net.sf.json.JSONArray;

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
	
	// 사원 등록에서 지점 선택했을 때 부서 리스트 불러오기
	@RequestMapping(value="/selectBranch.do", method=RequestMethod.POST)
	public View selectBranch(String branch_no, Model model) {
		List<Dept> list = service.selectDept_list(branch_no);
		model.addAttribute("dept", list);
		
		return jsonview;
	}
	
	// 사원 등록에서 부서 선택했을 때 하위 부서 리스트 불러오기
	@RequestMapping(value="/selectDept.do", method=RequestMethod.POST)
	public View selectDept(String dept_no, Model model) {
		List<Low_dept> list = service.selectLow_dept_list(dept_no);
		model.addAttribute("low_dept", list);
		
		return jsonview;
	}
	
	// 사원 등록
	@RequestMapping(value="/adminAdd_member_ok.do", method=RequestMethod.POST)
	public View adminAdd_member_ok(Emp emp, Model model) {
		service.insertEmp(emp);
		model.addAttribute("result", "성공");
		return jsonview;
	}
	
	// 사원 이력 출력
	@RequestMapping(value="/adminEmp_his.do", method=RequestMethod.POST)
	public View adminEmp_his(String emp_no, Model model) {
		List<Emp> list = service.selectEmp_his(emp_no);
		model.addAttribute("list", list);
		
		return jsonview;
	}
	
	// 탈퇴를 요청한 사원의 상세를 출력
	@RequestMapping(value="/adminEmp_withdrawal_detail.do", method=RequestMethod.POST)
	public View adminEmp_withdrawal_detail(String emp_no, Model model) {
		Emp detail = service.selectEmp_withdrawal_detail(emp_no);
		model.addAttribute("detail", detail);
		
		return jsonview;
	}
	
	// 탈퇴 요청자의 탈퇴 승인
	@RequestMapping(value="/adminEmp_delete.do", method=RequestMethod.POST)
	public View adminEmp_delete(String emp_no, Model model) {
		int result = service.deleteEmp(emp_no);
		model.addAttribute("result", result);
		
		return jsonview;
	}
	
	// 직위를 기준으로 사원에서 권한을 부여
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/adminEmp_authority.do", method=RequestMethod.POST)
	public View adminEmp_authority(HttpServletRequest request, Model model) {
		String param = request.getParameter("param");
		List<String> rolelist = new ArrayList<String>();
		rolelist = JSONArray.fromObject(param);
		
		String position_no = request.getParameter("position_no");
		
		// 직위의 사원 리스트
		List<String> emplist = service.selectEmp_no(position_no);
		
		// 권한 부여 (권한 전체 삭제 > 부여)
		for(String emp_no : emplist) {
			service.deleteEmp_role(emp_no);
			for(String role_no : rolelist) {
				service.insertEmp_role(emp_no, role_no);
			}
		}

		model.addAttribute("result", "성공");
		
		return jsonview;
	}
	
	// 사번을 기준으로 사원에게 권한 부여
	@SuppressWarnings("unchecked")
	@RequestMapping(value="adminEmp_authority_emp_no.do", method=RequestMethod.POST)
	public View adminEmp_authority_emp_no(HttpServletRequest request, Model model) {
		String emp_no = request.getParameter("emp_no");
		String role = request.getParameter("role");
		List<String> rolelist = new ArrayList<String>();
		rolelist = JSONArray.fromObject(role);
		
		// 권한 삭제
		service.deleteEmp_role(emp_no);
		
		// 권한 부여
		for(String role_no : rolelist) {
			service.insertEmp_role(emp_no, role_no);
		}

		model.addAttribute("result", "성공");
		
		return jsonview;
	}
	
	// 사원 정보 수정
	public View adminEmp_update(Emp emp, Model model) {
		service.updateEmp_detail(emp);
		model.addAttribute("result", "성공");
		
		return jsonview;
	}
}
