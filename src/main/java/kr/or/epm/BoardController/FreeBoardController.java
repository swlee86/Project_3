package kr.or.epm.BoardController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.epm.Service.FreeBoardService;

public class FreeBoardController {

	@Autowired
	private FreeBoardService freeboardservice;
	
	//사원정보공유 게시판   > 리스트 페이지 이동
	@RequestMapping(value="/free_board_list.do", method=RequestMethod.GET)
	public String free_board_list() {
		return "board_free.free_board_list";
	}
	
}
