package kr.or.epm.AdminController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.epm.Service.EmployeeManageService;
import kr.or.epm.VO.EmployeeManage;

@Controller
public class EmployeeManageController {

	@Autowired
	private EmployeeManageService employeeManage;
	
	//관리자 > 사원관리 페이지를 열면서 데이터를 함께 불러오는 함수(페이징 처리 포함되어 있음)
	@RequestMapping("/adminEmployeeManage.do")
	public String adminEmployeeManage(Model mv, String pagesize, String currentpage){				
		int totalcount = employeeManage.selectEmpCount();
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
		
		List<EmployeeManage> list = null;
		
		
		try{
			 list = employeeManage.selectEmpManage(cpage, pgsize); 
			 System.out.println("list size chk : " +  list.size());
		}catch(Exception e){
			e.getMessage();
		}finally{
			mv.addAttribute("list", list);
			mv.addAttribute("cpage", cpage);
			mv.addAttribute("psize", pgsize);
			mv.addAttribute("pagecount", pagecount);
			mv.addAttribute("totalcount", totalcount);
		}
		return "admin.adminEmployeeManage";
	}
	
}
