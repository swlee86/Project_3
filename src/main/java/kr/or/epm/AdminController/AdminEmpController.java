package kr.or.epm.AdminController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.epm.Service.AdminEmpService;
import kr.or.epm.VO.Branch;
import kr.or.epm.VO.Emp;
import kr.or.epm.VO.Emp_cg;
import kr.or.epm.VO.Position;

/*
 * 작성자 : 백승아
 * 작성일 : 2016-12-08
 * 목  적 : 사원관리 전용 controller 
 */

@Controller
public class AdminEmpController {
	
	@Autowired
	private AdminEmpService service;

	// 사원 정보 리스트 출력 페이지
	@RequestMapping(value="/adminEmp_list.do", method=RequestMethod.GET)
	public String adminEmp_list(Model model, String pagesize, String currentpage) {
		System.out.println("CONTROLLER] 사원 정보 리스트 출력 페이지");
		int pagecount = 0;
		
		// default값 설정
		if(pagesize == null || pagesize.trim().equals("")) {
			// default로 10건씩 확인
			pagesize = "10";
		}
		if(currentpage == null || currentpage.trim().equals("")) {
			// default로 1번 페이지 설정
			currentpage = "1";
		}
		
		int pgsize = Integer.parseInt(pagesize);
		int cpage = Integer.parseInt(currentpage);
		
		List<Emp> list = service.selectEmpList(cpage, pgsize);
		int totalcount = list.size();
				
		if (totalcount % pgsize == 0) {
			pagecount = totalcount / pgsize;
		} else {
			pagecount = (totalcount / pgsize) + 1;
		}
		
		model.addAttribute("list", list);
		model.addAttribute("cpage", cpage);
		model.addAttribute("pagesize", pgsize);
		model.addAttribute("pagecount", pagecount);
		model.addAttribute("totalcount", totalcount);
		
		return "admin.adminEmpList";
	}
	
	// 사원 등록 페이지
	@RequestMapping(value="/adminAdd_member.do", method=RequestMethod.GET)
	public String adminAdd_member(Model model) {
		System.out.println("CONTROLLER] 사원 등록 페이지");
		// 필요한게 잔여휴가일, 연봉, 이름, 생년월일, 개인연락처
		String newEmp_no = service.selectNew_emp_no();
		model.addAttribute("emp_no", newEmp_no);
		
		List<Emp_cg> emp_cg_list = service.selectEmp_cg_list();
		model.addAttribute("emp_cg", emp_cg_list);
		
		List<Position> position_list = service.selectPostion_list();
		model.addAttribute("position", position_list);
		
		List<Branch> branch_list = service.selectBranch_list();
		model.addAttribute("branch", branch_list);
		
		return "admin.adminAddMember";
	}
}
