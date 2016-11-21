package kr.or.epm.BoardController;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.epm.Service.FreeBoardService;
import kr.or.epm.VO.FreeBoard;
import kr.or.epm.VO.Re_FreeBoard;

@Controller
public class FreeBoardController {

	@Autowired
	private FreeBoardService freeboardservice;
	
	//사원정보공유 게시판   > 리스트 페이지 이동
	@RequestMapping(value="/free_board_list.do", method=RequestMethod.GET)
	public String free_board_list(Model mv, String pagesize, String currentpage) {
		int totalcount = freeboardservice.selectBoardCount();
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
		
		List<FreeBoard> list = null;
		
		
		try{
			 list = freeboardservice.selectBoard(cpage, pgsize); 
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

		return "board_free.free_board_list";
	}
	
	//자유게시판  > 자유게시판 상세 페이지 이동
	@RequestMapping(value="/free_board_view.do", method=RequestMethod.GET)
	public String free_board_view(Model mv, int no, int currentpage, int pagesize){
		String link = null;
		FreeBoard freeboard = null;
		List<Re_FreeBoard> re_list = null;
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
	
	//글쓰기 누르면 인서트 시키는 서비스 함수
	@RequestMapping(value="/free_board_write.do", method=RequestMethod.POST)
	public String free_board_write_ok(Principal principal, FreeBoard board, Model mv){
		String id= principal.getName();
		System.out.println(id);
		Re_FreeBoard free = freeboardservice.selectWrite(id);
		int maxrefer = freeboardservice.selectRefer();
		
		board.setEmp_no(free.getEmp_no());
		board.setEmp_name(free.getEmp_name());;
		board.setLow_dept_no(free.getLow_dept_no());
		board.setLow_dept_name(free.getLow_dept_name());
		board.setRefer(maxrefer+1);
		
		if(board.getFile_name()==null){
			board.setFile_name("0");
		}
		
		System.out.println(board.toString());
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
			
			System.out.println(dto.toString());
			
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
		public String free_board_view_after_reply(Model mv, int no, int currentpage, int pagesize){
			String link = null;
			FreeBoard freeboard = null;
			List<Re_FreeBoard> re_list = null;
			try{
				freeboard = freeboardservice.selectDetail(no);
				re_list = freeboardservice.selectReList(no);
			}catch(Exception e){
				
			}finally{
				mv.addAttribute("list", freeboard);
				mv.addAttribute("re_list", re_list);
				mv.addAttribute("currentpage", currentpage);
				mv.addAttribute("pagesize", pagesize);
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
		public String answerOk(Model mv, String title, String content, String no, Principal principal, int refer, int step, int depth){
			System.out.println("답번쓰기 시작");
			Re_FreeBoard dto = freeboardservice.selectWrite(principal.getName());
			System.out.println("title : " + title + " / " + "content : " + content + "no : " + no + "refer : " + refer + "step : " + step);
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
			System.out.println(free.toString());
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


}
