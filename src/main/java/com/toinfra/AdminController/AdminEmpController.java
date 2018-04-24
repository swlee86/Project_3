package com.toinfra.AdminController;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.toinfra.Service.AdminEmpService;
import com.toinfra.VO.Branch;
import com.toinfra.VO.Emp;
import com.toinfra.VO.Emp_cg;
import com.toinfra.VO.Emp_role;
import com.toinfra.VO.Position;
import com.toinfra.VO.Role;

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
	public String adminEmp_list(Model model, String pagesize, String currentpage, String f, String q ) {
		int pagecount = 0;
		
		// default값 설정
		if(pagesize == null || pagesize.trim().equals("")) {
			pagesize = "5";
		}
		if(currentpage == null || currentpage.trim().equals("")) {
			currentpage = "1";
		}
		
		// 검색
		String field = "emp_no";
		String query ="%%";
		
		if(f != null && !f.equals("")){
			field = f;
		}
		if(q != null && !q.equals("")){
			query = q;
		}
		
		int pgsize = Integer.parseInt(pagesize);
		int cpage = Integer.parseInt(currentpage);
		
		//전체 갯수 구하는 함수
		int totalcount = service.selectCount(field, query); 
		
		if (totalcount % pgsize == 0) {
			pagecount = totalcount / pgsize;
		} else {
			pagecount = (totalcount / pgsize) + 1;
		}
		
		List<Emp> list = service.selectEmpList(cpage, pgsize,field, query);
		
		model.addAttribute("field", field);
		model.addAttribute("query", query);
		
		model.addAttribute("list", list);
		model.addAttribute("cpage", cpage);
		model.addAttribute("pagesize", pgsize);
		model.addAttribute("pagecount", pagecount);
		model.addAttribute("totalcount", totalcount);
		
		return "adminMember.adminEmpList";
	}
	
	// 사원 등록 페이지
	@RequestMapping(value="/adminAdd_member.do", method=RequestMethod.GET)
	public String adminAdd_member(Model model) {
		// 새로운 사원 번호 채번
		String newEmp_no = service.selectNew_emp_no();
		model.addAttribute("emp_no", newEmp_no);
		
		// 근무 상태 리스트
		List<Emp_cg> emp_cg_list = service.selectEmp_cg_list();
		model.addAttribute("emp_cg", emp_cg_list);
		
		// 직위 리스트
		List<Position> position_list = service.selectPostion_list();
		model.addAttribute("position", position_list);
		
		// 지점 리스트
		List<Branch> branch_list = service.selectBranch_list();
		model.addAttribute("branch", branch_list);
		
		return "adminMember.adminAddMember";
	}
	
	// 사원 탈퇴 페이지
	@RequestMapping(value="/adminWithdrawal.do", method=RequestMethod.GET)
	public String adminWithdrawal(Model model) {
		// 탈퇴 요청자 출력
		List<Emp> list = service.selectEmp_withdrawal();
		model.addAttribute("withdrawal", list);
		
		return "adminMember.adminWithdrawal";
	}
	
	// 사원 권한 부여 페이지
	@RequestMapping(value="/adminEmp_authority.do", method=RequestMethod.GET)
	public String adminAuthority(Model model) {
		// 직위 리스트 불러오기
		List<Position> plist = service.selectPostion_list();
		
		for(int i=0; i<plist.size(); i++) {
			// 이미 부여된 권한 리스트 불러오기
			List<String> rlisted = service.selectRole_selected(plist.get(i).getPosition_no());
			plist.get(i).setRolelist(rlisted);
		}
		model.addAttribute("plist", plist);
		
		// 권한 리스트 불러오기
		List<Role> rlist = service.selectRole();
		model.addAttribute("rlist", rlist);
		
		return "adminMember.adminAuthority";
	}          
	
	// 사원 권한 상세 부여 페이지
	@RequestMapping(value="/adminAuthority_detail.do", method=RequestMethod.GET)
	public String adminAuthority_detail(String position_no, Model model) {
		// 해당 직위의 사원 리스트 불러오기
		List<Emp> elist = service.selectEmp_authority(position_no);
		
		String emp_no = "";
		List<Emp_role> rlist = new ArrayList<Emp_role>();
		
		for(int i=0; i<elist.size(); i++) {
			emp_no = elist.get(i).getEmp_no();
			
			// 해당 사원의 권한 리스트 불러오기
			rlist = service.selecEmp_role(emp_no);
			elist.get(i).setRolelist(rlist);
		}
		model.addAttribute("elist", elist);
		
		// 전제 권한 리스트 불러오기
		List<Role> role = service.selectRole();
		model.addAttribute("role", role);
		
		return "adminMember.adminAuthority_detail";
	}
	
	// 사원 정보 수정 페이지
	@RequestMapping(value="/adminEmp_detail.do", method=RequestMethod.GET)
	public String adminEmp_detail(String emp_no, Model model) {
		// 사원 상세 정보 불러오기
		Emp detail = service.selectEmp_detail(emp_no);
		model.addAttribute("detail", detail);
		
		return "adminMember.adminEdit";
	}
	
	// 사원 정보 수정 Ok
	@RequestMapping(value="/adminEmp_detail.do", method=RequestMethod.POST)
	public String adminEmp_detail_Ok(Emp emp, Model model) {
		// 사원 정보 수정하기
		int result = service.updateEmp_detail(emp);

		Emp detail = service.selectEmp_detail(emp.getEmp_no());
		model.addAttribute("detail", detail);

		return "adminMember.adminEdit";
	}
	
}
