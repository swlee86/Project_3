package kr.or.epm.BoardController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.epm.Service.MediaBoardService;


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
	@RequestMapping(value = "/media_board_list.do", method = RequestMethod.GET)
	public String media_board_list() {
		System.out.println("media_board_list() 컨트롤러 탐");
		
		
		
		
		
		
		
		
		
		
		
		
		
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
	public String media_board_view() {
		System.out.println("media_board_view() 컨트롤러 탐");
		return "board_media.media_board_view";
	}
	
	
	
}
