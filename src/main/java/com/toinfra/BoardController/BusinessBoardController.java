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

import com.toinfra.Service.BusinessBoardService;
import com.toinfra.DTO.BusinessBoard;
import com.toinfra.DTO.Re_BusinessBoard;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
	public String business_board_list(Model mv, String pagesize, String currentpage,String f, String s){
		int totalcount = 0;
		int pagecount = 0;
		
		String field = "title";
		String query ="%%";
		
        if(pagesize == null || pagesize.trim().equals("")){
            pagesize = "10"; 			// default 10건씩 
        }
        
        if(currentpage == null || currentpage.trim().equals("")){
            currentpage = "1";        //default 1 page
        }
        if(f != null && !f.equals("")){
			field = f;
		}
		if(s != null && !s.equals("")){
			query = s;
		}

        int pgsize = Integer.parseInt(pagesize);  		// 10
        int cpage = Integer.parseInt(currentpage);     //1
                               
        totalcount = businessboardservice.selectBoardCount(field, query);
        
        if(totalcount % pgsize==0){        //전체 건수 , pagesize 
            pagecount = totalcount/pgsize;
        }else{
            pagecount = (totalcount/pgsize) + 1;
        }
       
		List<BusinessBoard> list = null;
			
		try{
			 list = businessboardservice.selectBoard(cpage, pgsize,field, query); 
		}catch(Exception e){
			e.getMessage();
		}finally{
			mv.addAttribute("list", list);
			mv.addAttribute("cpage", cpage);
			mv.addAttribute("pgsize", pgsize);
			mv.addAttribute("pagecount", pagecount);
			mv.addAttribute("totalcount", totalcount);
		}
		return "board_business.business_board_list";
	}
	
	//업무정보게시판  > 업무정보게시판  글 내용보는 페이지 이동
	@RequestMapping(value="/business_board_view.do", method=RequestMethod.GET)
	public String business_board_view(Model mv, int no, String currentpage, String pagesize,HttpSession session){
		String link = null;
		BusinessBoard businessboard = null;
		List<Re_BusinessBoard> re_list = null;
		String rec_emp_no = (String)session.getAttribute("emp_no");

		try{
			businessboard = businessboardservice.selectDetail(no);
			re_list = businessboardservice.selectReList(no);
			businessboardservice.updateHit(no);
		}catch(Exception e){
			
		}finally{
			mv.addAttribute("list", businessboard);
			mv.addAttribute("re_list", re_list);
			mv.addAttribute("currentpage", currentpage);
			mv.addAttribute("pagesize", pagesize);
			mv.addAttribute("rec_emp_no",rec_emp_no);
		
			link = "board_business.business_board_view";
		}
		
		return link;
	}
	
		//댓글 달고나서 다시 본문을 불러오는 함수(hit 증가 없음)
		@RequestMapping(value="/business_board_view_reply.do", method=RequestMethod.GET)
		public String business_board_view_after_reply(Model mv, int no, int currentpage, int pagesize){
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
	
	
	
	//댓글 입력을 누르면 인서트 되는 함수
	@RequestMapping(value="/business_reply_insert.do")
	public String reply_write(Principal principal, Re_BusinessBoard dto, Model mv, String pagesize, String currentpage, String no, String content){
		String id= principal.getName();
		dto = businessboardservice.selectWrite(id);
		dto.setContent(dto.getContent());
		dto.setNo(no);
		dto.setContent(content);
		
		
		int result = 0;
		String link = null;
		String msg = null;
		
		try{
			result  = businessboardservice.insertReply(dto);
		}catch(Exception e){
			e.getMessage();
		}finally{
			if(result>0){
				link = "business_board_view_reply.do?no="+dto.getNo()+"&currentpage="+currentpage+"&pagesize="+pagesize;
				msg = "댓글 입력에 성공하였습니다.";
			}else{
				link = "business_board_view_reply.do?no="+dto.getNo()+"&currentpage="+currentpage+"&pagesize="+pagesize;
				msg = "댓글 입력에 실패하였습니다.";
		}		
			mv.addAttribute("link", link);
			mv.addAttribute("msg", msg);	
	}
		return "board_business.business_redirect";
}	
	
	
	//업무정보게시판  > 업무정보게시판  글쓰기 페이지 이동
	@RequestMapping(value="/business_board_write.do", method=RequestMethod.GET)
	public String business_board_write(int currentpage, int pagesize, Model mv){
		mv.addAttribute("currentpage", currentpage);
		mv.addAttribute("pagesize", pagesize);
		return "board_business.business_board_write";
	}

	
	//글쓰기 누르면 인서트 시키는 서비스 함수
	@RequestMapping(value="/business_board_write.do", method=RequestMethod.POST)
	public String business_board_write_Ok(@RequestParam("uploadfile") MultipartFile file, Principal principal, BusinessBoard board, Model mv,HttpServletRequest request){
		
		//파일 업로드 
		 String path = request.getRealPath("/board/business_upload/");
		File cFile = new File(path, file.getOriginalFilename());
		try {
			file.transferTo(cFile);
		
		} catch (IllegalStateException e1) {
			e1.printStackTrace();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		
		String id= principal.getName();
		Re_BusinessBoard business = businessboardservice.selectWrite(id);
		int maxrefer = businessboardservice.selectRefer();
		
		board.setUser_id(business.getUser_id());
		board.setEmp_name(business.getEmp_name());;
		board.setLow_dept_no(business.getLow_dept_no());
		board.setLow_dept_name(business.getLow_dept_name());
		board.setRefer(maxrefer+1);
		board.setFile_name(file.getOriginalFilename());
		
	
		System.out.println(board.toString());
		int result = 0;
		String link = null;
		String msg = null;
		try{
			result = businessboardservice.insertArticle(board);			
		}catch(Exception e){
			e.getMessage();
		}finally{
			if(result>0){
				link = "business_board_list.do";
				msg = "글 입력에 성공하였습니다.";
			}else{
				link = "business_board_list.do";
				msg = "글 입력에 실패하였습니다.";
			}
			mv.addAttribute("link", link);
			mv.addAttribute("msg", msg);
		}
		return "board_business.business_redirect";
	}
	
	
	//파일 다운
	@RequestMapping("/businessBoard_fileDown.do")
	public void download(String name, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
	
		//파일 업로드 
		String path = request.getRealPath("/board/business_upload/");
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
	
	
	//답변하기 누르면 기존 글의 데이터를 가지고 가서 write 화면에 뿌려주는 함수
	@RequestMapping(value="/answer.do", method=RequestMethod.GET)
	public String answer(Model mv, int no, int currentpage, int pagesize){
		String link = null;
		BusinessBoard businessboard = null;
		try{
			businessboard = businessboardservice.selectDetail(no);
		}catch(Exception e){
			
		}finally{
			mv.addAttribute("list", businessboard);
			mv.addAttribute("currentpage", currentpage);
			mv.addAttribute("pagesize", pagesize);
			link = "board_business.business_board_answer";
		}
		return link;
	}
	
	
	//답변 인서트 컨트롤러  + 파일 업로드
	@RequestMapping(value="/answer.do", method=RequestMethod.POST)
	public String answerOk(@RequestParam("uploadfile") MultipartFile file, Model mv, String title, String content, String no, Principal principal, int refer, int step, int depth,HttpServletRequest request){

		String path = request.getRealPath("/board/business_upload/");
		File cFile = new File(path, file.getOriginalFilename());
		try {
			file.transferTo(cFile);
	
		} catch (IllegalStateException e1) {
			e1.printStackTrace();
		} catch (IOException e1) {
			e1.printStackTrace();
		}

		Re_BusinessBoard dto = businessboardservice.selectWrite(principal.getName());
		BusinessBoard business = new BusinessBoard();
		String link = null;
		String msg = null;
		int result = 0;
		
		businessboardservice.updateStep(refer, step);
		
		business.setNo(no);
		business.setTitle(title);
		business.setContent(content);
		business.setRefer(refer);
		business.setHit(0);
		business.setUser_id(dto.getUser_id());
		business.setEmp_name(dto.getEmp_name());
		business.setLow_dept_name(dto.getLow_dept_name());
		business.setLow_dept_no(dto.getLow_dept_no());
		business.setDepth(depth+1);//부모글의 depth +1
		business.setStep(step+1);	//부모글의 스텝번호+1
		business.setFile_name(file.getOriginalFilename());
		System.out.println(business.toString());
		try{
			
			result = businessboardservice.insertArticle(business);
		}catch(Exception e){
			e.getMessage();
		}finally{
			if(result > 0){
			link = "business_board_list.do";
			msg = "글 입력에 성공하였습니다.";
		}else{
			link = "business_board_list.do";
			msg = "글 입력에 실패하였습니다.";
		}
		mv.addAttribute("link", link);
		mv.addAttribute("msg", msg);
		}
		
		return "board_business.business_redirect";
	}
	
	
	// 수정페이지 이동
	@RequestMapping(value = "/business_board_update.do", method = RequestMethod.GET)
	public String business_board_update(String no, Model model) {

		BusinessBoard list = businessboardservice.selectDetail(Integer.parseInt(no));		
		
		model.addAttribute("list",list);
		return "board_business.business_board_rewrite";
	}
	
	//수정 처리
	@RequestMapping(value = "/business_board_update.do", method = RequestMethod.POST)
	public String business_board_update(@RequestParam("uploadfile") MultipartFile file, BusinessBoard businessBoard, Model model, HttpServletRequest request) {
		
		int result = 0;
		
		String path = request.getRealPath("/board/business_upload/");
	
		File cFile = new File(path, file.getOriginalFilename());
		
		try {
			file.transferTo(cFile);
	
		} catch (IllegalStateException e1) {
			e1.printStackTrace();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		

		businessBoard.setFile_name(file.getOriginalFilename());
	
		result = businessboardservice.updateRow(businessBoard);

		if(result > 0){
			return "redirect:business_board_view.do?no="+businessBoard.getNo();
		}else{
			return "redirect:board_business.business_board_list.do";
		}
	}
	
	//삭제 처리
	@RequestMapping(value = "/business_board_delete.do")
	public String business_board_delete(String no) {
		businessboardservice.deleteReply(Integer.parseInt(no));
		businessboardservice.deleteRow(Integer.parseInt(no));				
		return "redirect:business_board_list.do";
	}
}