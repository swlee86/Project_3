package kr.or.epm.BoardController;

import java.util.List;

import javax.print.attribute.standard.Media;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.epm.Service.MediaBoardService;
import kr.or.epm.VO.MediaBoard;
import kr.or.epm.VO.MediaBoardReply;


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
	
	
	
}