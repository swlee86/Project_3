package kr.or.epm.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//index.do 접근시에 index.jsp를 열어주는 컨트롤러

@Controller
public class PageMoveController{

	
	//최초 접속(index.html)시 views/index.jsp 구동
	@RequestMapping("/index.do")
	public String indexview() {
		return "index";
	}
	
	@RequestMapping("/private_memo.do")
	public String memoview() {
		return "private_memo";
	}
}
