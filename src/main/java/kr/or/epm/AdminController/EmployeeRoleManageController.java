package kr.or.epm.AdminController;

import java.util.ArrayList;
import java.util.List;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.epm.Service.EmployeeRoleManageService;
import kr.or.epm.VO.Emp_role;
import kr.or.epm.VO.EmployeeRoleManage;
import kr.or.epm.VO.Role;

@Controller
public class EmployeeRoleManageController {
	
	@Autowired
	private EmployeeRoleManageService employeeRoleManage;
	
	
	//관리자 > 회원관리 > 사원 권한 부여 페이지
	@RequestMapping("/adminEmployeeRoleManage.do")
	public String adminEmployeeRoleManage(Model mv, String pagesize, String currentpage){
		System.out.println("사원 권한 페이지 시작");
		int totalcount = employeeRoleManage.selectEmpRoleCount();
		List<Role> rolelist = employeeRoleManage.selectRoleList();
		System.out.println("사원 수 : " + totalcount);
		int pagecount = 0;
		System.out.println("처음 들어온 currentpage : " + currentpage);
		
        if(pagesize == null || pagesize.trim().equals("")){
            pagesize = "10"; 			// default 10건씩 
        }
        
        if(currentpage == null || currentpage.trim().equals("")){
            currentpage = "1";        //default 1 page
        }
        
        System.out.println("최종 currentpage : " + currentpage);
        
      
        int pgsize = Integer.parseInt(pagesize);  		// 10
        int cpage = Integer.parseInt(currentpage);     //1
                               
        
        if(totalcount % pgsize==0){        //전체 건수 , pagesize 
            pagecount = totalcount/pgsize;
        }else{
            pagecount = (totalcount/pgsize) + 1;
        }
		
		List<EmployeeRoleManage> list = null;	
		
		try{
			 list = employeeRoleManage.selectEmpRoleManage(cpage, pgsize);
			 System.out.println("list size chk : " +  list.size());
		}catch(Exception e){
			e.getMessage();
		}finally{
			mv.addAttribute("list", list);
			mv.addAttribute("cpage", cpage);
			mv.addAttribute("psize", pgsize);
			mv.addAttribute("pagecount", pagecount);
			mv.addAttribute("totalcount", totalcount);
			mv.addAttribute("rolelist", rolelist);
		}

		return "admin.adminEmployeeRoleManage";
	}
	
	// 2016-11-21 백승아
	// 관리자 > 회원관리 > 사원 권한 부여 페이지 > 사원 권한 부여하기
	@RequestMapping(value="/give_authority.do")
	public String adminEmployeeRoleGive(Emp_role[] checkboxValues){
		System.out.println("########## 사원에게 권한을 부여합니다");
		System.out.println("넘어온 사번 : " + checkboxValues.length);
		int result = 0;
		
		System.out.println("찍어보자" + checkboxValues[0].toString());
		
		for(int i = 0; i < checkboxValues.length ; i++) {
			try {
				result = employeeRoleManage.updateEmpRole();
			} catch (Exception e) {
				e.getMessage();
			} finally {
				if (result > 0) {
					System.out.println("########## 사원에게 권한 부여 성공");
				} else {
					System.out.println("########## ERROR");
				}
			}
		}
		
		return "redirect:adminEmployeeRoleManage.do";
	}
}
