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
	
	//SideBar(aside.jsp) 개인 메모 클릭시 구동
	@RequestMapping("/private_memo.do")
	public String memoview() {
		return "memo/private_memo";
	}
	
	//SideBar(aside.jsp) 주소록 클릭시 구동
	@RequestMapping("/contacts.do")
	public String contactsview() {
		return "contacts/contacts";
	}
	
	//SideBar(aside.jsp) 조직도 > 부서인원 클릭시 구동
	@RequestMapping("/team_member.do")
	public String teammemberview() {
		return "organization_chart/team_member";
	}
		
	//SideBar(aside.jsp) 프로젝트 > 진행중인 프로젝트 클릭시 구동
	@RequestMapping("/projects.do")
	public String projectview() {
		return "project/projects";
	}	
	
}
