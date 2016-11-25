package kr.or.epm.AdminController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.epm.Service.EmployeeManageService;
import kr.or.epm.Service.RegisterService;
import kr.or.epm.VO.Emp;
import kr.or.epm.VO.Emp_cg;
import kr.or.epm.VO.Emp_his_cg;
import kr.or.epm.VO.EmployeeManage;
import kr.or.epm.VO.Low_dept;
import kr.or.epm.VO.Position;

@Controller
public class EmployeeManageController {

	@Autowired
	private EmployeeManageService employeeManage;

	@Autowired
	private RegisterService registerservice;

	// 관리자 > 사원관리 페이지를 열면서 데이터를 함께 불러오는 함수(페이징 처리 포함되어 있음)
	@RequestMapping("/adminEmployeeManage.do")
	public String adminEmployeeManage(Model mv, String pagesize, String currentpage) {
		int totalcount = employeeManage.selectEmpCount();

		int pagecount = 0;
		System.out.println("처음 들어온 currentpage : " + currentpage);

		if (pagesize == null || pagesize.trim().equals("")) {
			pagesize = "10"; // default 10건씩
		}

		if (currentpage == null || currentpage.trim().equals("")) {
			currentpage = "1"; // default 1 page
		}

		System.out.println("최종 currentpage : " + currentpage);

		int pgsize = Integer.parseInt(pagesize); // 10
		int cpage = Integer.parseInt(currentpage); // 1

		if (totalcount % pgsize == 0) { // 전체 건수 , pagesize
			pagecount = totalcount / pgsize;
		} else {
			pagecount = (totalcount / pgsize) + 1;
		}

		List<EmployeeManage> list = null;

		try {
			list = employeeManage.selectEmpManage(cpage, pgsize);
			System.out.println("list size chk : " + list.size());
		} catch (Exception e) {
			e.getMessage();
		} finally {
			mv.addAttribute("list", list);
			mv.addAttribute("cpage", cpage);
			mv.addAttribute("psize", pgsize);
			mv.addAttribute("pagecount", pagecount);
			mv.addAttribute("totalcount", totalcount);
		}
		return "admin.adminEmployeeManage";
	}

	// 사원 등록 페이지로 이동하는 함수
	@RequestMapping("/adminMakeMember.do")
	public String makeNewMember(Model mv) {
		List<Low_dept> list = null;
		List<Emp_cg> empcglist = null;
		List<Position> plist = null;
		try {
			list = registerservice.selectLowDeptNo();
			empcglist = registerservice.selectEmpCgList();
			plist = registerservice.selectPositionList();
		} catch (Exception e) {
			e.getMessage();
		} finally {
			mv.addAttribute("list", list);
			mv.addAttribute("emphis", empcglist);
			mv.addAttribute("plist", plist);
		}

		return "admin.adminNewMember";
	}

	// 관리자 > 사원관리 > 사원 등록에서 등록 버튼을 누르면 타게 되는 함수(인서트 처리를 담당한다)
	@RequestMapping("/adminAddMember.do")
	public String insertEmp(Emp emp, Model mv) {
		System.out.println(emp.toString());
		int result = 0;
		String answer = null;
		String data = null;
		try {
			result = registerservice.insertEmp(emp);
		} catch (Exception e) {
			e.getMessage();
		} finally {
			if (result > 0) {
				System.out.println("반영 성공");
				answer = "adminEmployeeManage.do";
				data = "사원정보 등록에 성공하였습니다.";
			} else {
				System.out.println("반영 실패");
				answer = "adminMakeMember.do";
				data = "사원정보 등록에 실패 하였습니다.";
			}
		}
		mv.addAttribute("data", data);
		mv.addAttribute("answer", answer);
		return "register/registerRedirect";
	}

	// 관리자 > 회원관리 > 회원 상세페이지 이동
	@RequestMapping("/adminMemberDetail.do")
	public String adminMemberDetail(String emp_no, Model mv) {
		EmployeeManage result = null;
		try {
			result = employeeManage.selectDetail(emp_no);

		} catch (Exception e) {
			e.getMessage();
		} finally {

			mv.addAttribute("result", result);
			System.out.println(result.toString());
		}

		return "admin.adminMemberDetail";
	}

	// 관리자 > 회원관리 > 회원 정보 수정 할 수 있는 페이지로 이동
	@RequestMapping(value = "/adminMemberUpdate.do", method = RequestMethod.GET)
	public String adminMemberUpdate(Model model, String emp_no) {
		List<Low_dept> list = null;
		EmployeeManage result = null;
		List<Emp_cg> empcglist = null;
		List<Position> plist = null;
		try {
			result = employeeManage.selectDetail(emp_no);
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

	@RequestMapping(value = "/adminMemberUpdate.do", method = RequestMethod.POST)
	public String adminMemberUpdateOk() {

		return null;
	}

}
