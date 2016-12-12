package kr.or.epm.AdminController;

import java.util.ArrayList;
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
import kr.or.epm.VO.Emp_role;
import kr.or.epm.VO.Position;
import kr.or.epm.VO.Role;

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
	public String adminEmp_list(Model model, String pagesize, String currentpage, String f , String q ) {
		System.out.println("CONTROLLER] 사원 정보 리스트 출력 페이지");
		int pagecount = 0;
		
		// default값 설정
		if(pagesize == null || pagesize.trim().equals("")) {
			// default로 10건씩 확인
			pagesize = "5";
		}
		if(currentpage == null || currentpage.trim().equals("")) {
			// default로 1번 페이지 설정
			currentpage = "1";
		}
		
		
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
		
		int totalcount = service.selectCount(field, query);  //전체 갯수 구하는 함수
		
		//List<Emp> list = service.selectEmpList(cpage, pgsize);
		//int totalcount = list.size();
				
		if (totalcount % pgsize == 0) {
			pagecount = totalcount / pgsize;
		} else {
			pagecount = (totalcount / pgsize) + 1;
		}
		
		List<Emp> list = service.selectEmpList(cpage, pgsize,field, query);
System.out.println("cpage:"+cpage+"/pagesize:"+pagesize+"/pagecount:"+pagecount+"/totalcount:"+totalcount);
		
		
		
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
		System.out.println("CONTROLLER] 사원 등록 페이지");
		
		String newEmp_no = service.selectNew_emp_no();
		model.addAttribute("emp_no", newEmp_no);
		
		List<Emp_cg> emp_cg_list = service.selectEmp_cg_list();
		model.addAttribute("emp_cg", emp_cg_list);
		
		List<Position> position_list = service.selectPostion_list();
		model.addAttribute("position", position_list);
		
		List<Branch> branch_list = service.selectBranch_list();
		model.addAttribute("branch", branch_list);
		
		return "adminMember.adminAddMember";
	}
	
	// 사원 탈퇴 페이지
	@RequestMapping(value="/adminWithdrawal.do", method=RequestMethod.GET)
	public String adminWithdrawal(Model model) {
		System.out.println("CONTROLLER] 사원 탈퇴 요청 페이지");
		
		List<Emp> list = service.selectEmp_withdrawal();
		model.addAttribute("withdrawal", list);
		
		return "adminMember.adminWithdrawal";
	}
	
	// 사원 권한 부여 페이지
	@RequestMapping(value="/adminEmp_authority.do", method=RequestMethod.GET)
	public String adminAuthority(Model model) {
		System.out.println("CONTROLLER] 사원 권한 부여 페이지");
		
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
		System.out.println("CONTROLLER] 사원 권한 부여 상세 페이지");
		
		// 해당 직위의 사원 리스트 뿌리기
		List<Emp> elist = service.selectEmp_authority(position_no);
		
		String emp_no = "";
		List<Emp_role> rlist = new ArrayList<Emp_role>();
		
		for(int i=0; i<elist.size(); i++) {
			emp_no = elist.get(i).getEmp_no();
			
			// 해당 사원의 권한 리스트 뿌리기
			rlist = service.selecEmp_role(emp_no);
			System.out.println("보자 : " + rlist.toString());
			elist.get(i).setRolelist(rlist);
		}
		model.addAttribute("elist", elist);
		
		// 전제 권한 리스트 뿌리기
		List<Role> role = service.selectRole();
		model.addAttribute("role", role);
		
		return "adminMember.adminAuthority_detail";
	}
}
