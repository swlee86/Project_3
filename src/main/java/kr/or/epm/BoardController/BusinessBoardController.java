package kr.or.epm.BoardController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.epm.Service.BusinessBoardService;
import kr.or.epm.VO.BusinessBoard;
import kr.or.epm.VO.Re_BusinessBoard;

/*
 * 작성자 : 이상원
 * 작성일 : 2016-11-18
 * 목  적 : BusinessBoard 컨트롤러 
 */

@Controller
public class BusinessBoardController {
	
	@Autowired
	private BusinessBoardService businessboardservice;
	

	//업무정보게시판  > 업무정보게시판  리스트 페이지 이동
	@RequestMapping("/business_board_list.do")
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
	
	//업무정보게시판  > 업무정보게시판  상세 페이지 이동
	@RequestMapping("/business_board_view.do")
	public String business_board_view(Model mv, int no, int currentpage, int pagesize){
		String link = null;
		BusinessBoard businessboard = null;
		List<Re_BusinessBoard> re_list = null;
		try{
			businessboard = businessboardservice.selectDetail(no);
			re_list = businessboardservice.selectReList(no);
		}catch(Exception e){
			
		}finally{
			mv.addAttribute("list", businessboard);
			mv.addAttribute("re_list", re_list);
			mv.addAttribute("currentpage", currentpage);
			mv.addAttribute("pagesize", pagesize);
			link = "board_business.business_board_view";
		}
		
		return link;
	}
	
	//업무정보게시판  > 업무정보게시판  글쓰기 페이지 이동
	@RequestMapping("/business_board_write.do")
	public String business_board_write(){
		return "board_business.business_board_write";
	}

}
