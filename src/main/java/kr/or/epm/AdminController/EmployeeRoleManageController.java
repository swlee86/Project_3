package kr.or.epm.AdminController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import kr.or.epm.Service.EmployeeRoleManageService;
import kr.or.epm.VO.EmployeeRoleManage;
import kr.or.epm.VO.Role;

@Controller
public class EmployeeRoleManageController {
	
	@Autowired
	private EmployeeRoleManageService employeeRoleManage;
	
	@Autowired
	private View jsonview;
	
	
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
}
