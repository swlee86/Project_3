package com.toinfra.BoardController;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.security.Principal;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.toinfra.Service.CompanyBoardService;
import com.toinfra.DTO.Company;
import com.toinfra.DTO.Emp_detail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

/*
 * 작성자 : 박성준
 * 작성일 : 2016-11-18
 * 목  적  : 회사 정보 게시판 관련 컨트롤러 
 */
@Controller
public class CompanyBoardController {

	
	@Autowired
	private CompanyBoardService companyBoardService;
	
	//파일 다운
	@RequestMapping("/info_board_fileDown.do")
	public void download(String name, HttpServletResponse response, HttpServletRequest request)
			throws Exception {

		//파일 업로드 
		String path = request.getRealPath("/board/company_upload/");
		File f = new File(path + "/"+name);
		String fname = new String(name.getBytes("utf-8"), "8859_1");

		response.setHeader("Content-Disposition", "attachment;filename=" + fname + ";");
		FileInputStream fin = new FileInputStream(f);
		// 출력 도구 얻기 :response.getOutputStream()
		ServletOutputStream sout = response.getOutputStream();
		byte[] buf = new byte[1024]; // 전체를 다읽지 않고 1204byte씩 읽어서
		int size = 0;
		while ((size = fin.read(buf, 0, buf.length)) != -1) // buffer 에 1024byte
		// 담고
		{ // 마지막 남아있는 byte 담고 그다음 없으면 탈출
			sout.write(buf, 0, size); // 1kbyte씩 출력
		}
		fin.close();
		sout.close();
	}

	
	//회사정보 게시판  > 리스트페이지이동 
	@RequestMapping(value="/info_board_list.do", method=RequestMethod.GET)
	public String info_board_list(String pagesize, String currentpage, HttpSession session,Model model) {
		String rec_emp_no = (String)session.getAttribute("emp_no");

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
			model.addAttribute("rec_emp_no",rec_emp_no);
		}
        
		return "board_info.info_board_list";
	}
	
	//상세보기		  
	@RequestMapping("/detailinfo_board_list.do")
	public String detailView(String no, String currentpage, String pagesize, HttpSession session, Model model){
		String rec_emp_no = (String)session.getAttribute("emp_no");

		Company company = null;
		
		int no2 = Integer.parseInt(no);
		try{
			 company = companyBoardService.selectDetailBoard(no2);
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			model.addAttribute("company", company);
			model.addAttribute("currentpage",currentpage);
			model.addAttribute("pagesize",pagesize);
			model.addAttribute("rec_emp_no",rec_emp_no);
		}
		
		return "board_info.info_board_view";
	}
	
	
	//게시판 글쓰기
	@RequestMapping(value="/CompanyBoardWrite.do", method=RequestMethod.POST)
	public String test(@RequestParam("uploadfile") MultipartFile file, String title, String content, Principal principal, Model model, HttpServletRequest request){
		
		//File cFile = new File("C:/images/", file.getOriginalFilename());
		String path = request.getRealPath("/board/company_upload/");
		File cFile = new File(path, file.getOriginalFilename());
	
		try {
			file.transferTo(cFile);
		} catch (IllegalStateException e1) {
			e1.printStackTrace();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		String id = principal.getName();

		//시큐리티 이용 사번 정보 뽑기
		Emp_detail emp=companyBoardService.WriterStatus(id);

		Company company = new Company();
		company.setContent(content);
		company.setUser_id(emp.getUser_id());
		company.setTitle(title);
		company.setFile_name(file.getOriginalFilename());
		
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
	public String searchInfo_board(String q, String pagesize, String currentpage, String f, Model model){
		int pagecount = 0;
		
		String field = "title";
		String query="%%";
		
        if(pagesize == null || pagesize.trim().equals("")){
            pagesize = "10"; 			// default 10건씩 
        }
        
        if(currentpage == null || currentpage.trim().equals("")){
            currentpage = "1";        //default 1 page
        }
        
        if( q != null && !q.equals("")){
        	query = q;
        }
        
        if( f != null && !f.equals("")){
        	field = f;
        }
        
		int totalcount = companyBoardService.selectBoardCount_post(field,query);

      
        int pgsize = Integer.parseInt(pagesize);  		// 10
        int cpage = Integer.parseInt(currentpage);     //1
                               
        
        if(totalcount % pgsize==0){        //전체 건수 , pagesize 
        	pagecount = (totalcount/pgsize);
        }else{
            pagecount = (totalcount/pgsize) + 1;
        }
        
        List<Company> list = null;
		
        try{
        	list = companyBoardService.selectChooseBoard(query, cpage, pgsize, field);
        	
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
	
	//수정페이지로 이동
	@RequestMapping(value = "/info_board_update.do", method = RequestMethod.GET)
	public String info_board_update(String no, Model model) {
		Company company = companyBoardService.selectDetailBoard(Integer.parseInt(no));		
		
		model.addAttribute("company",company);
		System.out.println("리턴 ㄱㄱ");
		return "board_info.info_board_rewrite";
	}
	
	//수정 처리
	@RequestMapping(value = "/info_board_update.do", method = RequestMethod.POST)
	public String info_board_update(@RequestParam("uploadfile") MultipartFile file, Company company, Model model, HttpServletRequest request) {
		int result = 0;
			
		//File cFile = new File("C:/images/", file.getOriginalFilename());
		 String path = request.getRealPath("/board/company_upload/");
			File cFile = new File(path, file.getOriginalFilename());
			
			try {
				file.transferTo(cFile);
			} catch (IllegalStateException e1) {
				e1.printStackTrace();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			
			company.setFile_name(file.getOriginalFilename());
			
			result = companyBoardService.updateRow(company);
		
			if(result > 0){
				return "redirect:detailinfo_board_list.do?no="+company.getNo();
			}else{
				return "redirect:info_board_list.do";
			}
		}
	
	//삭제하기
	@RequestMapping(value = "/info_board_delete.do")
		public String info_board_delete(String no) {
			companyBoardService.deleteRow(Integer.parseInt(no));				
			return "redirect:info_board_list.do";
		}
	
}
