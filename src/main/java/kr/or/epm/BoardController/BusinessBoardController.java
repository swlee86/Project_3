package kr.or.epm.BoardController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import kr.or.epm.Service.BusinessBoardService;
import kr.or.epm.VO.BusinessBoard;

/*
 * 작성자 : 이상원
 * 작성일 : 2016-11-18
 * 목  적 : BusinessBoard 컨트롤러 
 */

@Controller
public class BusinessBoardController {
	
	@Autowired
	private BusinessBoardService businessboardservice;
	
	public String em(Model mv, String pagesize, String currentpage){
		int totalcount = businessboardservice.selectBoardCount();
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
		
		List<BusinessBoard> list = null;
		
		
		try{
			 list = businessboardservice.selectBoard(cpage, pgsize); 
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
		return "board_business.business_board_list";
	}

}
