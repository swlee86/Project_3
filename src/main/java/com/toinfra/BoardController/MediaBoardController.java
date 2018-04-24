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

import com.toinfra.Service.MediaBoardService;
import com.toinfra.VO.Emp;
import com.toinfra.VO.MediaBoard;
import com.toinfra.VO.MediaBoardReply;
import com.toinfra.VO.Re_MediaBoard;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.toinfra.Service.MediaBoardService;
import com.toinfra.VO.Emp;
import com.toinfra.VO.MediaBoard;
import com.toinfra.VO.MediaBoardReply;
import com.toinfra.VO.Re_MediaBoard;

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
	public String media_board_list(String pagesize, String pg , String f , String q , Model model) {
		int totalcount = 0;
		int cpage = 1;
		int pagecount = 0;
		int pgsize = 10;
		
		String field = "title";
		String query ="%%";
		
		List<MediaBoard> list = null;
		if(pagesize != null && !pagesize.equals("")){
            pgsize = Integer.parseInt(pagesize); 			
        }
		
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
		
	    if(totalcount % pgsize == 0){       
	    	pagecount = totalcount/pgsize;
        }else{
        	pagecount = (totalcount/pgsize) + 1;
        }
		
		list = mediaboardservice.selectList(cpage, pgsize, field, query);
		
		model.addAttribute("f",field);
		model.addAttribute("q",query);
		model.addAttribute("pagecount", pagecount);
		model.addAttribute("pg",cpage);
		model.addAttribute("pgsize",pgsize);
		model.addAttribute("totalcount",totalcount);
		model.addAttribute("list", list);
		
		return "board_media.media_board_list";	
	}

	// 언론게시판 > 언론게시판 글쓰기 페이지 이동
	@RequestMapping(value = "/media_board_write.do", method = RequestMethod.GET)
	public String media_board_write() {
		return "board_media.media_board_write";
	}

	// 언론게시판 > 언론게시판 상세보기 페이지 이동
	@RequestMapping(value = "/media_board_view.do", method = RequestMethod.GET)
	public String media_board_view(String pagesize, String no, String pg, HttpSession session, Model model) {
		String rec_emp_no = (String)session.getAttribute("emp_no");
		MediaBoard list = null;
		List<MediaBoardReply> relist = null;
		
		list = mediaboardservice.selectDetail(Integer.parseInt(no));		
		
		relist = mediaboardservice.selectReList(Integer.parseInt(no));
		
		model.addAttribute("list", list);
		model.addAttribute("pg", pg);
		model.addAttribute("relist", relist);
		model.addAttribute("pgsize",pagesize);
		model.addAttribute("rec_emp_no",rec_emp_no);

		return "board_media.media_board_view";
	}
	
	//언론게시판 > 글쓰기 처리
	@RequestMapping(value = "/media_board_write.do", method = RequestMethod.POST)
	public String media_board_write(@RequestParam("uploadfile") MultipartFile file, Principal principal, MediaBoard mediaBoard , Model model, HttpServletRequest request) {
		int result = 0;
		String id= principal.getName();
		System.out.println("id : "+id);
		
		 String path = request.getRealPath("/board/media_upload/");
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
		
		
		Emp info = mediaboardservice.selectInfoSearch(id);  //사번,이름 가져가기
		
		mediaBoard.setEmp_no(info.getEmp_no());
		mediaBoard.setEmp_name(info.getEmp_name());
		mediaBoard.setFile_name(file.getOriginalFilename());

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
		mediaboardservice.deleteReply(Integer.parseInt(no));
		mediaboardservice.deleteRow(Integer.parseInt(no));	
		
		return "redirect:media_board_list.do";
	}
	
	//언론게시판 > 수정페이지 이동
	@RequestMapping(value = "/media_board_update.do", method = RequestMethod.GET)
	public String media_board_update(String no, Model model) {
		MediaBoard list = mediaboardservice.selectDetail(Integer.parseInt(no));		
		model.addAttribute("list",list);
		return "board_media.media_board_rewrite";
	}
	
	//언론게시판 > 수정 처리
	@RequestMapping(value = "/media_board_update.do", method = RequestMethod.POST)
	public String media_board_update(@RequestParam("uploadfile") MultipartFile file, MediaBoard mediaBoard, Model model, HttpServletRequest request) {
		int result = 0;

		 String path = request.getRealPath("/board/media_upload/");
		File cFile = new File(path, file.getOriginalFilename());
		
		try {
			file.transferTo(cFile);
		} catch (IllegalStateException e1) {
			e1.printStackTrace();
		} catch (IOException e1) {
			e1.printStackTrace();
		}

		mediaBoard.setFile_name(file.getOriginalFilename());

		result = mediaboardservice.updateRow(mediaBoard);
	
		if(result > 0){
			return "redirect:media_board_view.do?no="+mediaBoard.getNo();
		}else{
			return "redirect:board_media.media_board_list.do";
		}
	}
	
	//언론게시판 > 리플 등록 처리
		@RequestMapping(value = "/media_board_reply.do" ,method=RequestMethod.POST)
		public  @ResponseBody
        Re_MediaBoard media_board_reply(Principal principal, String replytext, String no) {
			int result = 0;
			Re_MediaBoard re_MediaBoard = new Re_MediaBoard();
			String id= principal.getName();
			
			Emp info = mediaboardservice.selectInfoSearch(id);  //사번,이름 가져가기

			re_MediaBoard.setEmp_no(info.getEmp_no());
			re_MediaBoard.setEmp_name(info.getEmp_name());
			re_MediaBoard.setContent(replytext);
			re_MediaBoard.setNo(no);
			
			result = mediaboardservice.insertRowReply(re_MediaBoard); //댓글달기
			
			if(result > 0){ //댓글 성공시
				re_MediaBoard = mediaboardservice.selectRowReply(Integer.parseInt(no));//댓글 뽑기
				return re_MediaBoard;
			}else{
				return null;
			}
		}
		
	
		
		//파일 다운
		@RequestMapping("/media_board_fileDown.do")
		public void download(String name, HttpServletResponse response, HttpServletRequest request)
				throws Exception {
			//File f = new File("C:/images/" + name);
			//파일 업로드 
			String path = request.getRealPath("/board/media_upload/");
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
}
