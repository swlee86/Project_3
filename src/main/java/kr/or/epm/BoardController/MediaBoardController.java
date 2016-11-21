package kr.or.epm.BoardController;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.epm.Service.MediaBoardService;
import kr.or.epm.VO.Emp;
import kr.or.epm.VO.MediaBoard;
import kr.or.epm.VO.MediaBoardReply;
import kr.or.epm.VO.Re_MediaBoard;


/*
 * 작성자 : 박지은
 * 작성일 : 2016-11-18
 * 목  적 : MediaBoard 컨트롤러 
 */

@Controller
public class MediaBoardController {
	
	@Autowired
	private MediaBoardService mediaboardservice;

	// 언론게시판 > 언론게시판 리스트 페이지 이동
	@RequestMapping(value = "/media_board_list.do")
	public String media_board_list(String pg , String f , String q , Model model) {
		System.out.println("media_board_list() 컨트롤러 탐");
		
		/*System.out.println("q : "+q +" q!==null : "+(q != null)+"q.equals('') : "+q.equals(""));*/
		int totalcount = 0;
		int cpage = 1;
		int pagecount = 0;
		int pagesize = 5;
		
		String field = "title";
		String query ="%%";
		
		List<MediaBoard> list = null;	
		
		if(pg != null && !pg.equals("")){
			cpage = Integer.parseInt(pg);
		}
		if(f != null && !f.equals("")){
			field = f;
		}
		if(q != null && !q.equals("")){
			query = q;
		}
		
		totalcount = mediaboardservice.selectCount(field, query);

		System.out.println("cpage:"+cpage+"/ field:"+field+"/ query:"+query+ "/ totalcount:"+totalcount);
		
	    if(totalcount % pagesize == 0){       
	    	pagecount = totalcount/pagesize;
        }else{
        	pagecount = (totalcount/pagesize) + 1;
        }
		
	    System.out.println("pagecount : " + pagecount);
		
		list = mediaboardservice.selectList(cpage, pagesize, field, query);
		
		model.addAttribute("f",field);
		model.addAttribute("q",query);
		model.addAttribute("pagecount", pagecount);
		model.addAttribute("pg",cpage);
		model.addAttribute("totalcount",totalcount);
		model.addAttribute("list", list);
		
		return "board_media.media_board_list";	
	}

	// 언론게시판 > 언론게시판 글쓰기 페이지 이동
	@RequestMapping(value = "/media_board_write.do", method = RequestMethod.GET)
	public String media_board_write() {
		System.out.println("media_board_write() 컨트롤러 탐");
		return "board_media.media_board_write";
	}

	// 언론게시판 > 언론게시판 상세보기 페이지 이동
	@RequestMapping(value = "/media_board_view.do", method = RequestMethod.GET)
	public String media_board_view(String no, String pg, Model model) {
		System.out.println("media_board_view() 컨트롤러 탐");
		
		System.out.println("no : "+ no + "pg : "+pg);
		
		MediaBoard list = null;
		List<MediaBoardReply> relist = null;
		
		list = mediaboardservice.selectDetail(Integer.parseInt(no));		
		
		relist = mediaboardservice.selectReList(Integer.parseInt(no));
		
		model.addAttribute("list", list);
		model.addAttribute("pg", pg);
		model.addAttribute("relist", relist);
		
		return "board_media.media_board_view";
	}
	
	//언론게시판 > 글쓰기 처리
	@RequestMapping(value = "/media_board_write.do", method = RequestMethod.POST)
	public String media_board_write(@RequestParam("uploadfile") MultipartFile file, Principal principal, MediaBoard mediaBoard , Model model, HttpServletRequest request) {
		System.out.println("media_board_write()처리 컨트롤러 탐");
		int result = 0;
		String id= principal.getName();
		System.out.println("id : "+id);
		
		 String path = request.getRealPath("/media/upload/");
		 System.out.println("=====> path : "+path);
		File cFile = new File(path, file.getOriginalFilename());
		
		try {
			file.transferTo(cFile);
			System.out.println("getAbsolutePath : " +cFile.getAbsolutePath());
			System.out.println("getPath : " +cFile.getPath());
		} catch (IllegalStateException e1) {
			e1.printStackTrace();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		System.out.println("file.getOriginalFilename() : "+ file.getOriginalFilename());
		
		Emp info = mediaboardservice.selectInfoSearch(id);  //사번,이름 가져가기
		
		mediaBoard.setEmp_no(info.getEmp_no());
		mediaBoard.setEmp_name(info.getEmp_name());
		mediaBoard.setFile_name(file.getOriginalFilename());
		
		System.out.println(mediaBoard.getTitle()+"/"+mediaBoard.getContent()+"/");
		System.out.println(mediaBoard.getFile_name());

		result = mediaboardservice.insertRow(mediaBoard, request);
		
		
		System.out.println("=> 글번호result : "+result);
		
	
		if(result > 0){
			return "redirect:media_board_view.do?no="+result+"&pg=1";
		}else{
			return "redirect:media_board_list.do";
		}
	}
	
	//언론게시판  > 삭제 처리
	@RequestMapping(value = "/media_board_delete.do")
	public String media_board_delete(String no) {
		System.out.println("media_board_delete() 컨트롤러 탐");		
		System.out.println("no : "+ no) ;
		
		mediaboardservice.deleteRow(Integer.parseInt(no));				
		return "redirect:media_board_list.do";
	}
	
	//언론게시판 > 수정페이지 이동
	@RequestMapping(value = "/media_board_update.do", method = RequestMethod.GET)
	public String media_board_update(String no, Model model) {
		System.out.println("media_board_update() 컨트롤러 탐");
		
		MediaBoard list = mediaboardservice.selectDetail(Integer.parseInt(no));		
		
		model.addAttribute("list",list);
		return "board_media.media_board_rewrite";
	}
	
	//언론게시판 > 수정 처리
	@RequestMapping(value = "/media_board_update.do", method = RequestMethod.POST)
	public String media_board_update(@RequestParam("uploadfile") MultipartFile file, MediaBoard mediaBoard, Model model, HttpServletRequest request) {
		System.out.println("media_board_update()처리 컨트롤러 탐");
		int result = 0;
		
		//File cFile = new File("C:/images/", file.getOriginalFilename());
		 String path = request.getRealPath("/media/upload/");
		 System.out.println("=====> path : "+path);
		File cFile = new File(path, file.getOriginalFilename());
		
		try {
			file.transferTo(cFile);
			System.out.println("getAbsolutePath : " +cFile.getAbsolutePath());
			System.out.println("getPath : " +cFile.getPath());
		} catch (IllegalStateException e1) {
			e1.printStackTrace();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		System.out.println("file.getOriginalFilename() : "+ file.getOriginalFilename());
		mediaBoard.setFile_name(file.getOriginalFilename());
		
		System.out.println("=>update 후 title :"+mediaBoard.getTitle()+"/내용: "+mediaBoard.getContent()+"/ 파일 제목 : "+mediaBoard.getFile_name());
		
		result = mediaboardservice.updateRow(mediaBoard);

		System.out.println("=> 글번호update result : "+mediaBoard.getNo());	
	
		if(result > 0){
			return "redirect:media_board_view.do?no="+mediaBoard.getNo();
		}else{
			return "redirect:board_media.media_board_list.do";
		}
	}
	
	//언론게시판 > 리플 등록 처리
		@RequestMapping(value = "/media_board_reply.do" ,method=RequestMethod.POST)
		public  @ResponseBody Re_MediaBoard media_board_reply(Principal principal, String replytext, String no, Model model) {
			System.out.println("media_board_reply()처리 컨트롤러 탐");
			int result = 0;
			Re_MediaBoard re_MediaBoard = new Re_MediaBoard();
			String id= principal.getName();
			System.out.println("id : "+id);
			System.out.println("replytext : " + replytext);
			System.out.println("no : " + no);
			
			Emp info = mediaboardservice.selectInfoSearch(id);  //사번,이름 가져가기
			
			System.out.println("info사번 : "+ info.getEmp_no()+"/ info이름:"+info.getEmp_name());
			re_MediaBoard.setEmp_no(info.getEmp_no());
			re_MediaBoard.setEmp_name(info.getEmp_name());
			re_MediaBoard.setContent(replytext);
			re_MediaBoard.setNo(no);
			
			System.out.println("리플 내용 정보 : "+re_MediaBoard.toString());
			
			result = mediaboardservice.insertRowReply(re_MediaBoard); //댓글달기
			
			if(result > 0){ //댓글 성공시
				re_MediaBoard = mediaboardservice.selectRowReply(Integer.parseInt(no));//댓글 뽑기
				System.out.println("리플 객체 리턴 :" + re_MediaBoard.toString());
				return re_MediaBoard;
			}else{
				return null;
			}
		}
		
	
}
