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
	@RequestMapping(value="/info_board_list.do", method=RequestMethod.GET)
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
	
	
	//게시판 글쓰기
	@RequestMapping(value="/CompanyBoardWrite.do", method=RequestMethod.POST)
	public String test(String title, String content, Principal principal, Model model){
		
		String id = principal.getName();
		System.out.println("아이디  : "+id);
		//시큐리티 이용 사번 정보 뽑기
		Emp_detail emp=companyBoardService.WriterStatus(id);
		System.out.println("유저 : " +emp.toString());
		Company company = new Company();
		company.setContent(content);
		company.setEmp_no(emp.getEmp_no());
		company.setTitle(title);
		
		String link = "";
		String msg = "";
		int result = 0;
		try{
			result = companyBoardService.insertInfoBoard(company);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(result>0){
				link = "info_board_list.do";
				msg = "글 입력에 성공하였습니다.";
			}else{
				link = "info_board_list.do";
				msg = "글 입력에 실패하였습니다.";
			}
			model.addAttribute("link", link);
			model.addAttribute("msg", msg);
		}
		
		return "board_info.info_board_redirect";
		
	}
	
	
	//제목 검색
	@RequestMapping(value ="/info_board_list.do", method=RequestMethod.POST)
	public String searchInfo_board(String title, String pagesize, String currentpage, Model model){
		System.out.println("검색하신 단어 : "+title);
		
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
        	list = companyBoardService.selectChooseBoard(title, cpage, pgsize);
        	
        }catch (Exception e) {
			e.printStackTrace();
		}finally{
			model.addAttribute("companyList", list);
			model.addAttribute("cpage", cpage);
			model.addAttribute("psize", pgsize);
			model.addAttribute("pagecount", pagecount);
			model.addAttribute("totalcount", totalcount);
		}
		return "board_info.info_board_list";
	}
	
	
}
