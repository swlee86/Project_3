package kr.or.epm.BoardController;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.security.Principal;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.or.epm.Service.FreeBoardService;
import kr.or.epm.VO.FreeBoard;
import kr.or.epm.VO.Re_FreeBoard;

@Controller
public class FreeBoardController {

	@Autowired
	private FreeBoardService freeboardservice;
	
	//사원정보공유 게시판   > 리스트 페이지 이동
	@RequestMapping(value="/free_board_list.do")
	public String free_board_list(Model mv, String pagesize, String currentpage, String f, String q) {
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
		if(q != null && !q.equals("")){
			query = q;
		}
        
		totalcount = freeboardservice.selectBoardCount(field, query);

        int pgsize = Integer.parseInt(pagesize);  		// 10
        int cpage = Integer.parseInt(currentpage);     //1
                               
        
        if(totalcount % pgsize==0){        //전체 건수 , pagesize 
            pagecount = totalcount/pgsize;
        }else{
            pagecount = (totalcount/pgsize) + 1;
        }
		
		List<FreeBoard> list = null;

		try{
			 list = freeboardservice.selectBoard(cpage, pgsize, field, query); 
		}catch(Exception e){
			e.getMessage();
		}finally{
			mv.addAttribute("list", list);
			mv.addAttribute("cpage", cpage);
			mv.addAttribute("pgsize", pgsize);
			mv.addAttribute("pagecount", pagecount);
			mv.addAttribute("totalcount", totalcount);
		}

		return "board_free.free_board_list";
	}
	
	//자유게시판  > 자유게시판 상세 페이지 이동
	@RequestMapping(value="/free_board_view.do", method=RequestMethod.GET)
	public String free_board_view(Model mv, int no, String currentpage, String pagesize,HttpSession session){
		String link = null;
		FreeBoard freeboard = null;
		List<Re_FreeBoard> re_list = null;
		String rec_emp_no = (String)session.getAttribute("emp_no");

		try{
			freeboard = freeboardservice.selectDetail(no);
			re_list = freeboardservice.selectReList(no);
			freeboardservice.updateHit(no);
		}catch(Exception e){
			
		}finally{
			mv.addAttribute("list", freeboard);
			mv.addAttribute("re_list", re_list);
			mv.addAttribute("currentpage", currentpage);
			mv.addAttribute("pagesize", pagesize);
			mv.addAttribute("rec_emp_no",rec_emp_no);

			link = "board_free.free_board_view";
		}
		
		return link;
	}
	
	//업무정보공유게시판  > 업무정보게시판  글쓰기 페이지 이동
	@RequestMapping(value="/free_board_write.do", method=RequestMethod.GET)
	public String free_board_write(int currentpage, int pagesize, Model mv){
		mv.addAttribute("currentpage", currentpage);
		mv.addAttribute("pagesize", pagesize);
		return "board_free.free_board_write";
	}
	
	//글쓰기 누르면 인서트 시키는 서비스 함수 + 파일업로드
	@RequestMapping(value="/free_board_write.do", method=RequestMethod.POST)
	public String free_board_write_ok(@RequestParam("uploadfile") MultipartFile file, Principal principal, FreeBoard board, Model mv,HttpServletRequest request){
	
		//파일 업로드 
		 String path = request.getRealPath("/board/free_upload/");

			File cFile = new File(path, file.getOriginalFilename());
			try {
				file.transferTo(cFile);
			} catch (IllegalStateException e1) {
				e1.printStackTrace();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			
		
		String id= principal.getName();
		Re_FreeBoard free = freeboardservice.selectWrite(id);
		int maxrefer = freeboardservice.selectRefer();
		
		board.setEmp_no(free.getEmp_no());
		board.setEmp_name(free.getEmp_name());;
		board.setLow_dept_no(free.getLow_dept_no());
		board.setLow_dept_name(free.getLow_dept_name());
		board.setRefer(maxrefer+1);
		board.setFile_name(file.getOriginalFilename());

		int result = 0;
		String link = null;
		String msg = null;
		try{
			result = freeboardservice.insertArticle(board);			
		}catch(Exception e){
			e.getMessage();
		}finally{
			if(result>0){
				link = "free_board_list.do";
				msg = "글 입력에 성공하였습니다.";
			}else{
				link = "free_board_list.do";
				msg = "글 입력에 실패하였습니다.";
			}
			mv.addAttribute("link", link);
			mv.addAttribute("msg", msg);
		}
		return "board_free.free_redirect";
	}
	
	
	
	//댓글 입력을 누르면 인서트 되는 함수
		@RequestMapping(value="/free_reply_insert.do")
		public String reply_write(Principal principal, Re_FreeBoard dto, Model mv, String pagesize, String currentpage, String no, String content){
			String id= principal.getName();
			dto = freeboardservice.selectWrite(id);
			dto.setContent(dto.getContent());
			dto.setNo(no);
			dto.setContent(content);
			
			int result = 0;
			String link = null;
			String msg = null;
			
			try{
				result  = freeboardservice.insertReply(dto);
			}catch(Exception e){
				e.getMessage();
			}finally{
				if(result>0){
					link = "free_board_view_reply.do?no="+dto.getNo()+"&currentpage="+currentpage+"&pagesize="+pagesize;
					msg = "댓글 입력에 성공하였습니다.";
				}else{
					link = "free_board_view_reply.do?no="+dto.getNo()+"&currentpage="+currentpage+"&pagesize="+pagesize;
					msg = "댓글 입력에 실패하였습니다.";
			}		
				mv.addAttribute("link", link);
				mv.addAttribute("msg", msg);	
		}
			return "board_free.free_redirect";
	}	

		//댓글 달고나서 다시 본문을 불러오는 함수(hit 증가 없음)
		@RequestMapping(value="/free_board_view_reply.do", method=RequestMethod.GET)
		public String free_board_view_after_reply(Model mv, int no, int currentpage, int pagesize, HttpSession session){
			String link = null;
			FreeBoard freeboard = null;
			List<Re_FreeBoard> re_list = null;
			String rec_emp_no = (String)session.getAttribute("emp_no");

			try{
				freeboard = freeboardservice.selectDetail(no);
				re_list = freeboardservice.selectReList(no);
			}catch(Exception e){
				
			}finally{
				mv.addAttribute("list", freeboard);
				mv.addAttribute("re_list", re_list);
				mv.addAttribute("currentpage", currentpage);
				mv.addAttribute("pagesize", pagesize);
				mv.addAttribute("rec_emp_no",rec_emp_no);

				link = "board_free.free_board_view";
			}
			
			return link;
		}
	

		//답변하기 누르면 기존 글의 데이터를 가지고 가서 write 화면에 뿌려주는 함수
		@RequestMapping(value="/answerfree.do", method=RequestMethod.GET)
		public String answer(Model mv, int no, int currentpage, int pagesize){
			String link = null;
			FreeBoard freeboard = null;
			try{
				freeboard = freeboardservice.selectDetail(no);
			}catch(Exception e){
				
			}finally{
				mv.addAttribute("list", freeboard);
				mv.addAttribute("currentpage", currentpage);
				mv.addAttribute("pagesize", pagesize);
				link = "board_free.free_board_answer";
			}
			return link;
		}
		
		
		//답변 인서트 컨트롤러 
		@RequestMapping(value="/answerfree.do", method=RequestMethod.POST)
		public String answerOk(@RequestParam("uploadfile") MultipartFile file, Model mv, String title, String content, String no, Principal principal, int refer, int step, int depth,HttpServletRequest request){
			//파일 업로드 
			String path = request.getRealPath("/board/free_upload/");
			
			File cFile = new File(path, file.getOriginalFilename());
			try {
				file.transferTo(cFile);
			} catch (IllegalStateException e1) {
				e1.printStackTrace();
			} catch (IOException e1) {
				e1.printStackTrace();
			}

			Re_FreeBoard dto = freeboardservice.selectWrite(principal.getName());
			FreeBoard free = new FreeBoard();
			String link = null;
			String msg = null;
			int result = 0;
			
			freeboardservice.updateStep(refer, step);

			if(free.getFile_name()==null){
					free.setFile_name("0");
			}
			
			free.setNo(no);
			free.setTitle(title);
			free.setContent(content);
			free.setRefer(refer);
			free.setHit(0);
			free.setEmp_no(dto.getEmp_no());
			free.setEmp_name(dto.getEmp_name());
			free.setLow_dept_name(dto.getLow_dept_name());
			free.setLow_dept_no(dto.getLow_dept_no());
			free.setDepth(depth+1);//부모글의 depth +1
			free.setStep(step+1);	//부모글의 스텝번호+1
			free.setFile_name(file.getOriginalFilename());
			try{
				
				result = freeboardservice.insertArticle(free);
			}catch(Exception e){
				e.getMessage();
			}finally{
				if(result > 0){
				link = "free_board_list.do";
				msg = "글 입력에 성공하였습니다.";
			}else{
				link = "free_board_list.do";
				msg = "글 입력에 실패하였습니다.";
			}
			mv.addAttribute("link", link);
			mv.addAttribute("msg", msg);
			}
			
			return "board_free.free_redirect";
		}

		
		//파일 다운
		@RequestMapping("/FreeBoard_fileDown.do")
		public void download(String name, HttpServletResponse response, HttpServletRequest request)
				throws Exception {
			//File f = new File("C:/images/" + name);
			//파일 업로드 
			//파일 업로드 
			String path = request.getRealPath("/board/free_upload/");
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
		

		// 수정페이지 이동
		@RequestMapping(value = "/free_board_update.do", method = RequestMethod.GET)
		public String free_board_update(String no, Model model) {
			FreeBoard list = freeboardservice.selectDetail(Integer.parseInt(no));				
			model.addAttribute("list",list);
			return "board_free.free_board_rewrite";
		}
		
		//수정 처리
		@RequestMapping(value = "/free_board_update.do", method = RequestMethod.POST)
		public String free_board_update(@RequestParam("uploadfile") MultipartFile file, FreeBoard freeBoard, Model model, HttpServletRequest request) {
			int result = 0;
			
			//File cFile = new File("C:/images/", file.getOriginalFilename());
			String path = request.getRealPath("/board/free_upload/");
			File cFile = new File(path, file.getOriginalFilename());
			
			try {
				file.transferTo(cFile);
			} catch (IllegalStateException e1) {
				e1.printStackTrace();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			
			freeBoard.setFile_name(file.getOriginalFilename());

			result = freeboardservice.updateRow(freeBoard);

			if(result > 0){
				return "redirect:free_board_view.do?no="+freeBoard.getNo();
			}else{
				return "redirect:board_free.free_board_list.do";
			}
		}
		
		//삭제 처리
		@RequestMapping(value = "/free_board_delete.do")
		public String free_board_delete(String no) {
			freeboardservice.deleteReply(Integer.parseInt(no));
			freeboardservice.deleteRow(Integer.parseInt(no));				
			return "redirect:free_board_list.do";
		}
}
