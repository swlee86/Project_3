package kr.or.epm.PageMoveController;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.epm.Service.CompanyBoardService;
import kr.or.epm.VO.Company;

//index.do 접근시에 index.jsp를 열어주는 컨트롤러

@Controller
public class PageMoveController {

	@Autowired
	private CompanyBoardService companyBoardService;
	
	// 최초 접속(index.html)시 views/index.jsp 구동
	@RequestMapping("/index.do")
	public String indexview(String pagesize, String currentpage, Model model) {
		int totalcount = companyBoardService.selectBoardCount();
		int pagecount = 0;

		
        if(pagesize == null || pagesize.trim().equals("")){
            pagesize = "6"; 			// default 6건씩 
        }
        
        if(currentpage == null || currentpage.trim().equals("")){
            currentpage = "1";        //default 1 page
        }
        
        int pgsize = Integer.parseInt(pagesize);  		// 10
        int cpage = Integer.parseInt(currentpage);     //1
                               
        
        if(totalcount % pgsize==0){        //전체 건수 , pagesize 
            pagecount = totalcount/pgsize;
        }else{
            pagecount = (totalcount/pgsize) + 1;
        }
        
        List<Company> list = null;
        try{
        	list = companyBoardService.selectBoard(cpage, pgsize);
        }catch (Exception e) {
        	e.printStackTrace();
		}finally {
			model.addAttribute("companyList", list);
			model.addAttribute("cpage", cpage);
			model.addAttribute("psize", pgsize);
			model.addAttribute("pagecount", pagecount);
			model.addAttribute("totalcount", totalcount);
		}

		
		return "home.index";
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
		return "mail.mailbox_compose";
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

	//회사정보 게시판  > 글쓰기페이지이동 
	@RequestMapping("/info_board_write.do")
	public String info_board_write() {
		return "board_info.info_board_write";
	}
	//회사정보 게시판 > 글보기페이지 이동
	@RequestMapping("/info_board_view.do")
	public String info_board_view() {
		return "board_info.info_board_view";
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
	
	//급여 관리> 급여 조회(개인)
	@RequestMapping("/salarySearch.do")
	public String salarySearch(){
		return "salary.salarySearch";
	}
	//급여 관리 > 퇴직금 계산
	@RequestMapping("/severancepay.do")
	public String severancepay(){
		return "salary.severancepay";
	}
	
	//근태 관리 > 근태 
	@RequestMapping("/Commute.do")
	public String Commute(HttpServletRequest request, Model model){
		String ip =request.getRemoteAddr();
		System.out.println("나의 아이피 : "+ip);
		model.addAttribute("ip",ip);
		return "commute.TimeCommuteMainView";
	}
	
	//월별 근태 보기
	@RequestMapping("/CommuteMonth.do")
	public String CommuteMonth(){
		return "commute.MonthCommuteView";
	}
	
	//근태 신청서 쓰기
	@RequestMapping("/CommuteWrite.do")
	public String CommuteWrite(){
		return "commute.CommuteWriteView";
	}
	
	//각기 다른 근태 보기
	@RequestMapping("/CommuteOther.do")
	public String CommuteOther(){
		return "commute.CommuteOtherView";
	}
	
	//주소록  > 주소록 그룹 관리 페이지 이동
	@RequestMapping("/contaacts_group.do")
	public String contaacts_group(){
		return "contacts.contacts_group";
	}

	// 관리자 메뉴 > 거래처 > 거래처 메뉴로 이동
	@RequestMapping("/client.do")
	public String clientView() {
		return "admin.adminclientView";
	}

	
	
	


	
	

	//탈퇴
	@RequestMapping("/withdrawal.do")
	public String withdrawal(){
		return "withdrawal.withdrawalMainView";
	}
	
	//아이디찾기,비밀번호찾기 메인
	@RequestMapping("/findIdPw.do")
	public String findIdPw(){
		return "find.findMainView";
	}
	
	//아이디찾기
	@RequestMapping("/findId.do")
	public String findId(){
		return "find.findID";
	}
	
	//비밀번호찾기
	@RequestMapping("/findPw.do")
	public String findPw(){			
		return "find.findPW";
	}
	
	//아이디찾기 결과
	@RequestMapping("/findID_Result.do")
	public String findIdResult(){
		return "find.findID_Result";
	}

	//비밀번호찾기 결과
	@RequestMapping("/findPW_Result.do")
	public String findPwResult(){
		return "find.findPW_Result";
	}
	
	
	
	
	
	
	
	

	//주소록 > 주소록 수정페이지 이동
	@RequestMapping("/contacts_update.do")
	public String contacts_update(){			
		return "contacts.contacts_update";
	}
	
	
}
