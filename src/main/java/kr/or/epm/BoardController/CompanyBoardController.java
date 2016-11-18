package kr.or.epm.BoardController;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.epm.Service.CompanyBoardService;
import kr.or.epm.VO.Company;
import kr.or.epm.VO.Emp;
import kr.or.epm.VO.Emp_detail;

/*
 * 작성자 : 박성준
 * 작성일 : 2016-11-18
 * 목  적  : 회사 정보 게시판 관련 컨트롤러 
 */
@Controller
public class CompanyBoardController {

	
	@Autowired
	private CompanyBoardService companyBoardService;
	
	//회사정보 게시판  > 리스트페이지이동 
	@RequestMapping("/info_board_list.do")
	public String info_board_list(String pagesize, String currentpage, Model model) {
		
	
		
		
		int totalcount = companyBoardService.selectBoardCount();
		int pagecount = 0;

		
        if(pagesize == null || pagesize.trim().equals("")){
            pagesize = "10"; 			// default 10건씩 
        }
        
        if(currentpage == null || currentpage.trim().equals("")){
            currentpage = "1";        //default 1 page
        }
        
        
      
        int pgsize = Integer.parseInt(pagesize);  		// 10
        int cpage = Integer.parseInt(currentpage);     //1
                               
        
        if(totalcount % pgsize==0){        //전체 건수 , pagesize 
            pagecount = totalcount/pgsize;
        }else{
            pagecount = (totalcount/pgsize) + 1;
        }
        
        List<Company> list = null;
        try{
        	list = companyBoardService.selectBoard(cpage, pgsize);
        }catch (Exception e) {
        	e.printStackTrace();
		}finally {
			model.addAttribute("companyList", list);
			model.addAttribute("cpage", cpage);
			model.addAttribute("psize", pgsize);
			model.addAttribute("pagecount", pagecount);
			model.addAttribute("totalcount", totalcount);
		
		}
        
		return "board_info.info_board_list";
	}
	
	//상세보기		  
	@RequestMapping("/detailinfo_board_list.do")
	public String detailView(String no, int currentpage, int pagesize, Model model){
		Company company = null;
		System.out.println("넘어온 글번호 : "+no + "/currentPage : "+currentpage + "/pagesize : "+pagesize);
		int no2 = Integer.parseInt(no);
		try{
			 company = companyBoardService.selectDetailBoard(no2);
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			model.addAttribute("company", company);
		}
		
		return "board_info.info_board_view";
	}
	
	
	@RequestMapping(value="/CompanyBoardWrite.do", method=RequestMethod.POST)
	public String test(String title, String content, Principal principal){
		
		String id = principal.getName();
		System.out.println("아이디  : "+id);
		Emp_detail emp=companyBoardService.WriterStatus(id);
		
		System.out.println("유저 : " +emp.toString());
		companyBoardService.insertInfoBoard(title, content);
		
		
		return null;
	}
	
}
