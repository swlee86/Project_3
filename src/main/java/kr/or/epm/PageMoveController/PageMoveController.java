package kr.or.epm.PageMoveController;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//index.do 접근시에 index.jsp를 열어주는 컨트롤러

@Controller
public class PageMoveController {

	// 최초 접속(index.html)시 views/index.jsp 구동
	@RequestMapping("/index.do")
	public String indexview() {
		return "home.index";
	}

	// SideBar(aside.jsp) 개인 메모 클릭시 구동
	@RequestMapping("/private_memo.do")
	public String memoview() {
		return "memo.private_notes";
	}

	// SideBar(aside.jsp) 주소록 클릭시 구동
	@RequestMapping("/contacts.do")
	public String contactsview() {
		return "contacts.contacts";
	}

	// SideBar(aside.jsp) 조직도 > 부서인원 클릭시 구동
	@RequestMapping("/team_member.do")
	public String teammemberview() {
		return "organization_chart.team_member";
	}

	// SideBar(aside.jsp) 프로젝트 > 전체 프로젝트 클릭시 구동
	@RequestMapping("/projects.do")
	public String projectlistview() {
		return "project.projects";
	}
	
	// SideBar(aside.jsp) 프로젝트 > 진행중인 프로젝트 클릭시 구동
	@RequestMapping("/project_list.do")
	public String projectview() {
		return "project.project_list";
	}
	
	//프로젝트 생성하기
	@RequestMapping(value="/projectMake.do", method=RequestMethod.GET)
	public String projectMake(){
		return "project.projectMakeForm";
	}
	
	// SideBar(aside.jsp) 일정관리 > 일정등록 클릭시 구동
	@RequestMapping("/registration_schedule.do")
	public String registration_scheduleview() {
		return "schedule.registration_schedule";
	}

	// SideBar(aside.jsp) 일정관리 > 일정 보기 클릭시 구동
	@RequestMapping("/calendar_schedule.do")
	public String calendar_scheduleview() {
		return "schedule.calendar_schedule";
	}

	// SideBar(aside.jsp) 메일 서비스 > 메일함 클릭시 구동
	@RequestMapping("/mailbox.do")
	public String mailboxview() {
		return "mail.mailbox";
	}

	// SideBar(aside.jsp) 메일 서비스 > 메일쓰기 // 메일함 > sent 클릭시 구동
	@RequestMapping("/mailbox_compose.do")
	public String mailbox_composeview() {
		return "mail/mailbox_compose";
	}

	//메일 > 보낸메일함 페이지이동 
	@RequestMapping("/mailbox_send.do")
	public String mailbox_send() {
		return "mail.mailbox_send";
	}
	
	//메일 > 휴지통 페이지이동 
	@RequestMapping("/mailbox_trash.do")
	public String mailbox_trash() {
		return "mail.mailbox_trash";
	}
	
	// SideBar(aside.jsp) 인사관리 > 사원정보(관리자) 클릭시 구동
	@RequestMapping("/member_datatables.do")
	public String member_datatablesview() {
		return "members.member_datatables";
	}

	// SideBar(aside.jsp) 전자 결재 > 결재 승인(관리자) 클릭시 구동
	@RequestMapping("/sanction_approve.do")
	public String sanction_approveview() {
		return "electronic_sanction.sanction_approve";
	}

	
	// 404번 에러 발생시 구동
	@RequestMapping("/error_404.do")
	public String error_404view() {
		return "error_404";
	}

	// 500번 에러 발생시 구동
	@RequestMapping("/error_500.do")
	public String error_500view() {
		return "error_500";
	}

	// 사이드바에서 채팅 클릭시 구동
	@RequestMapping("/chat_ws.do")
	public String chat_wsview() {
		return "chat.chat_ws";
	}
	
	//회사정보 게시판  > 리스트페이지이동 
	@RequestMapping("/info_board_list.do")
	public String info_board_list() {
		return "board_info.info_board_list";
	}
	//회사정보 게시판  > 글쓰기페이지이동 
	@RequestMapping("/info_board_write.do")
	public String info_board_write() {
		return "board_info/info_board_write";
	}
	//회사정보 게시판 > 글보기페이지 이동
	@RequestMapping("/info_board_view.do")
	public String info_board_view() {
		return "board_info.info_board_view";
	}
	//사원정보공유 게시판   > 리스트페이지이동
	@RequestMapping("/free_board_list.do")
	public String free_board_list() {
		return "board_free.free_board_list";
	}
	
	//주소록 > 주소록 추가 페이지 이동
	@RequestMapping("/enroll.do")
	public String contacts() {
		return "contacts.enroll";
	}
	

	//전자 결재 > 기안문작성 페이지이동
	@RequestMapping("/sanction_list.do")
	public String sanction_list() {
		return "electronic_sanction.sanction_list";
	}	
	
	//전자 결재 > 기안문작성 페이지이동
	@RequestMapping("/sanction_write.do")
	public String sanction_write() {
		return "electronic_sanction.sanction_write";
	}	
	
	//전자결재 > 결재보기화면 페이지이동
	@RequestMapping("/sanction_approve_view.do")
	public String sanction_approve_view() {
		return "electronic_sanction.sanction_approve_view";
	}
	
	//메일  > 메일세부글 보기 페이지 이동
	@RequestMapping("/mail_detail.do")
	public String mailbox_read() {
		return "mail.mail_detail";
	}
	
	//헤더  > 차트 (매출 현황보기)
	@RequestMapping("/analytics.do")
	public String chartView(){
		return "chart.chartMoney_View";
	}
	
	//급여 관리 > 급여 항목 설정
	@RequestMapping("/salarySetting.do")
	public String salrySetting(){
		return "salary.salarySetting";
	}
	
	//근태 관리 > 근태 
	@RequestMapping("/Attendace.do")
	public String Attendace(HttpServletRequest request, Model model){
		String ip =request.getRemoteAddr();
		System.out.println("나의 아이피 : "+ip);
		model.addAttribute("ip",ip);
		return "TAttendance.TimeAttendaceMainView";
	}
	
	//월별 근태 보기
	@RequestMapping("/AttendaceMonth.do")
	public String AttendaceMonth(){
		return "TAttendance.MonthAttendaceView";
	}
	
	//주소록  > 주소록 그룹 관리 페이지 이동
	@RequestMapping("/contaacts_group.do")
	public String contaacts_group(){
		return "contacts.contacts_group";
	}
	
	
}
