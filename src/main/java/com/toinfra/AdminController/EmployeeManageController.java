package com.toinfra.AdminController;

import java.util.List;

import com.toinfra.DTO.UserDto;
import com.toinfra.Service.EmployeeManageService;
import com.toinfra.Service.RegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.toinfra.DTO.Emp_cg;
import com.toinfra.DTO.Low_dept;
import com.toinfra.DTO.Position;

@Controller
public class EmployeeManageController {

	@Autowired
	private EmployeeManageService employeeManage;

	@Autowired
	private RegisterService registerservice;

	// 관리자 > 회원관리 > 회원 상세페이지 이동
	@RequestMapping("/adminMemberDetail.do")
	public String adminMemberDetail(String emp_no, Model model) {
/*		EmployeeManage result = null;
		try {
			result = employeeManage.selectDetail(emp_no);

		} catch (Exception e) {
			e.getMessage();
		} finally {

			mv.addAttribute("result", result);
		}
*/
		
		UserDto userDto = employeeManage.selectDetail2(emp_no);
		model.addAttribute("result", userDto);
		
		return "admin.adminMemberDetail";
	}

	
	// 관리자 > 회원관리 > 회원 정보 수정 할 수 있는 페이지로 이동
	@RequestMapping(value = "/adminMemberUpdate.do", method = RequestMethod.GET)
	public String adminMemberUpdate(Model model, String emp_no) {
		List<Low_dept> list = null;
		UserDto result = null;
		List<Emp_cg> empcglist = null;
		List<Position> plist = null;
		try {
			result = employeeManage.selectDetail2(emp_no);
			list = registerservice.selectLowDeptNo();
			empcglist = registerservice.selectEmpCgList();
			plist = registerservice.selectPositionList();
		} catch (Exception e) {
			e.getMessage();
		} finally {
			model.addAttribute("list", list);
			model.addAttribute("result", result);
			model.addAttribute("empCg", empcglist);
			model.addAttribute("plist", plist);
		}

		return "admin.adminMemberUpdate";
	}

	// 사원 정보 수정
	@RequestMapping(value = "/adminMemberUpdate.do", method = RequestMethod.POST)
	public String adminMemberUpdateOk(UserDto userDto, Model model) {
		
		
		String emp_no = userDto.getUser_id();
		String[] emp_no1 = emp_no.split(",");
		System.out.println("넘겨진 emp_no : " + emp_no1[0]);
		
		String link = "adminMemberDetail.do?emp_no="+emp_no1[0];
		String msg = "";
		int result = 0;
		
		result = employeeManage.updateEmp(userDto);
		if(result > 0){
			msg = "사원 정보 수정에 성공했습니다";
		} else {
			msg = "사원 정보 수정에 실패했습니다";
		}
		
		model.addAttribute("link", link);
		model.addAttribute("msg", msg);
		
		return "admin.admin_redirect";
	}

}
