package kr.or.epm.BoardController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.epm.Service.BusinessBoardService;
import kr.or.epm.Service.CompanyBoardService;
import kr.or.epm.VO.Company;

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
		System.out.println("게시글 총 수 : "+totalcount);
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
        
        List<Company> list = null;
        try{
        	
        	list = companyBoardService.selectBoard(cpage, pgsize);
        	System.out.println("컨트롤러 : "+list.size());
        	
        }catch (Exception e) {
        	e.getMessage();
        }
		
		return "board_info.info_board_list";
	}
	
	@RequestMapping(value="/CompanyBoardWrite.do", method=RequestMethod.POST)
	public String test(String title, String infotext){
		
		System.out.println("제목 : "+title + " / 내용 : "+infotext);
		
		return null;
	}
	
}
