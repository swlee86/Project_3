package kr.or.epm.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.emp.Interface.ViewSubmit_Inter;

//index.do 접근시에 index.jsp를 열어주는 컨트롤러

@Controller
public class IndexController implements ViewSubmit_Inter{

	@Override
	@RequestMapping("/index.do")
	public String view() {
		return "/views/index";
	}

	@Override
	public String submit() {
		// TODO Auto-generated method stub
		return null;
	}

}
