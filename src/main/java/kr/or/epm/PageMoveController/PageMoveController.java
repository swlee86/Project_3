package kr.or.epm.PageMoveController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//index.do 접근시에 index.jsp를 열어주는 컨트롤러

@Controller
public class PageMoveController {

	// 최초 접속(index.html)시 views/index.jsp 구동
	@RequestMapping("/index.do")
	public String indexview() {
		return "index";
	}

	// SideBar(aside.jsp) 개인 메모 클릭시 구동
	@RequestMapping("/private_memo.do")
	public String memoview() {
		return "memo/private_notes";
	}

	// SideBar(aside.jsp) 주소록 클릭시 구동
	@RequestMapping("/contacts.do")
	public String contactsview() {
		return "contacts/contacts";
	}

	// SideBar(aside.jsp) 조직도 > 부서인원 클릭시 구동
	@RequestMapping("/team_member.do")
	public String teammemberview() {
		return "organization_chart/team_member";
	}

	// SideBar(aside.jsp) 프로젝트 > 진행중인 프로젝트 클릭시 구동
	@RequestMapping("/projects.do")
	public String projectview() {
		return "project/projects";
	}

	// SideBar(aside.jsp) 프로젝트 > 전체 프로젝트 클릭시 구동
	@RequestMapping("/project_list.do")
	public String projectlistview() {
		return "project/project_list";
	}

	// SideBar(aside.jsp) 일정관리 > 일정등록 클릭시 구동
	@RequestMapping("/registration_schedule.do")
	public String registration_scheduleview() {
		return "schedule/registration_schedule";
	}

	// SideBar(aside.jsp) 일정관리 > 일정 보기 클릭시 구동
	@RequestMapping("/calendar_schedule.do")
	public String calendar_scheduleview() {
		return "schedule/calendar_schedule";
	}

	// SideBar(aside.jsp) 메일 서비스 > 메일함 클릭시 구동
	@RequestMapping("/mailbox.do")
	public String mailboxview() {
		return "mail/mailbox";
	}

	// SideBar(aside.jsp) 메일 서비스 > 메일쓰기 // 메일함 > sent 클릭시 구동
	@RequestMapping("/mailbox_compose.do")
	public String mailbox_composeview() {
		return "mail/mailbox_compose";
	}

	// SideBar(aside.jsp) 인사관리 > 사원정보(관리자) 클릭시 구동
	@RequestMapping("/member_datatables.do")
	public String member_datatablesview() {
		return "members/member_datatables";
	}

	// SideBar(aside.jsp) 전자 결재 > 결재 승인(관리자) 클릭시 구동
	@RequestMapping("/sanction_approve.do")
	public String sanction_approveview() {
		return "electronic_sanction/sanction_approve";
	}

	// 404번 에러 발생시 구동
	@RequestMapping("/error_404.do")
	public String error_404view() {
		return "errors/error_404";
	}

	// 500번 에러 발생시 구동
	@RequestMapping("/error_500.do")
	public String error_500view() {
		return "errors/error_500";
	}

	// 사이드바에서 채팅 클릭시 구동
	@RequestMapping("/chat_ws.do")
	public String chat_wsview() {
		return "chat/chat_ws";
	}

}
