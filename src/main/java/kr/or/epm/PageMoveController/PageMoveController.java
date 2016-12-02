package kr.or.epm.PageMoveController;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.epm.MailController.ReceiveMailImap;
import kr.or.epm.Service.CompanyBoardService;
import kr.or.epm.Service.ProjectService;
import kr.or.epm.Service.PushService;
import kr.or.epm.Util.Util;
import kr.or.epm.VO.Commute;
import kr.or.epm.VO.Company;
import kr.or.epm.VO.Mail;
import kr.or.epm.VO.Pj;
import kr.or.epm.VO.Task;

//index.do 접근시에 index.jsp를 열어주는 컨트롤러

@Controller
public class PageMoveController {

	@Autowired
	private PushService pushService;
	
	@Autowired
	private CompanyBoardService companyBoardService;
	
	@Autowired
	private ProjectService projectservice;
	
	// 최초 접속(index.html)시 views/index.jsp 구동
	@RequestMapping("/index.do")
	public String indexview(HttpServletRequest request, HttpServletResponse response, String pagesize, String currentpage, Model model, Principal principal) {
		HttpSession session = request.getSession();
		String emp_no = (String)session.getAttribute("emp_no");
		System.out.println("index.do에서 정보를 뽑기 위한 emp_no 데이터 : " + emp_no);
		session.setAttribute("emp_no", emp_no);
		
		///////////////////////인덱스에 띄워 줄 회사 게시판 내용 구하기 시작////////////////////////////////////////////////////
        List<Company> list = null;
        
		
		if(pagesize == null || pagesize.trim().equals("")){
			pagesize = "5"; 			// default 5건씩 
		}
		
		if(currentpage == null || currentpage.trim().equals("")){
			currentpage = "1";        //default 1 page
		}
		
		int pgsize = Integer.parseInt(pagesize);  		// 10
		int cpage = Integer.parseInt(currentpage);     //1
		
		
		
		boolean emp_no_chk = Util.isEmpty(emp_no);
		
		List<Task> tasklist = null;
		///////////////////////인덱스에 띄워 줄 업무 내용 구하기 시작////////////////////////////////////////////////////
		if(emp_no_chk==true){
 			String msg_task = "미확인 업무 내역은 로그인 후 내용 확인 가능합니다";
 			model.addAttribute("msg_task", msg_task);
 		}else{
 			try{
 				tasklist = pushService.tasklist(emp_no, cpage, pgsize);
 			}catch(Exception e){
 				System.err.println(e.getMessage());
 			}finally{
 				model.addAttribute("tasklist", tasklist);
 			}
 			
 		}
		
		List<Task> mytasklist = null;
		
		if(emp_no_chk==true){
 			String my_task = "진행중인 업무 내역은 로그인 후 내용 확인 가능합니다";
 			model.addAttribute("my_task", my_task);
 		}else{
 			try{
 				mytasklist = pushService.mytasklist(emp_no, cpage, pgsize);
 			}catch(Exception e){
 				System.err.println(e.getMessage());
 			}finally{
 				model.addAttribute("mytasklist", mytasklist);
 			}
 			
 			
 		}
		
		/////////////////////인덱스에 띄워 줄 근태 리스트 내용 구하기 시작////////////////////////////////////////////////////
		List<Commute> commutelist = null;
		if(emp_no_chk==true){
 			String commutemsg = "근태 내역은 로그인 후 내용 확인 가능합니다";
 			model.addAttribute("commutemsg", commutemsg);
 		}else{
 			try{
 				commutelist = pushService.commutelist(emp_no, cpage, pgsize); 	
 				for(int i=0; i<=commutelist.size(); i++){
 					System.out.println();
 				}
 			}catch(Exception e){
 				
 			}finally{
 				
 			}
 			
 		}
		
		
		/////////////////////인덱스에 띄워 줄 프로젝트 내용 구하기 시작////////////////////////////////////////////////////
		List<Pj> pjlist = null;
		
		if(emp_no_chk==true){
 			String msg_pj = "프로젝트 내역은 로그인 후 내용 확인 가능합니다";
 			model.addAttribute("msg_pj", msg_pj);
 		}else{
 			try{
 				pjlist = projectservice.selectPj_callendar(emp_no); 				
 				System.out.println("프로젝트 리스트 사이즈 : " +pjlist.size());
 			}catch(Exception e){
 				System.err.println(e.getMessage());
 			}finally{
 				model.addAttribute("pjlist", pjlist);
 			}
 		}
		
		List<Pj> approve_pjlist = null;
		
		if(emp_no_chk==true){
 			String approve_pj = "미승인 프로젝트 내역은 로그인 후 내용 확인 가능합니다";
 			model.addAttribute("approve_pj", approve_pj);
 		}else{
 			try{
 				approve_pjlist = pushService.selectPj_rec(emp_no, cpage, pgsize); 				
 			}catch(Exception e){
 				System.err.println(e.getMessage());
 			}finally{
 				model.addAttribute("approve_pjlist", approve_pjlist);
 			}
 		}
		
		
		

        
        /////////////////////////인덱스에 띄워 줄 메일 내용 구하기 시작////////////////////////////////////////////////////

    	//메인에 띄워 줄 메일 토탈 카운트 구하기
        List<Mail> mail =  null;
		String mailid = (String)session.getAttribute("googlemail");
        String sessionchk=(String)session.getAttribute("mailusedata");
        boolean test = Util.isEmpty(sessionchk);
        
 	    String saveFolder="/mail/data";
 	    String filePath = request.getRealPath(saveFolder); 
        
 		if(test==true){
 			String msg = "메일은 보안 관계상 로그인 후 내용 확인 가능합니다";
 			model.addAttribute("msg", msg);
 			
 		}else{
 			try {
				mail =  ReceiveMailImap.doit(mailid, sessionchk, filePath, pgsize, cpage);
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				model.addAttribute("maillist", mail);
			}
 		}       
        
        try{
        	list = companyBoardService.selectBoard(cpage, pgsize+5);
        	
        }catch (Exception e) {
        	e.printStackTrace();
		}finally {
			model.addAttribute("companyList", list);
			
			model.addAttribute("cpage", cpage);
			model.addAttribute("psize", pgsize);
		}

		
		return "home.index";
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
	
	//전자 결재 > 기안문작성 페이지이동
	@RequestMapping("/sanction_list.do")
	public String sanction_list() {
		return "electronic_sanction.sanction_list";
	}	
	
	//전자결재 > 결재보기화면 페이지이동
	@RequestMapping("/sanction_approve_view.do")
	public String sanction_approve_view() {
		return "electronic_sanction.sanction_approve_view";
	}

	
	//헤더  > 차트 (매출 현황보기)
	@RequestMapping("/analytics.do")
	public String chartView(){
		return "chart.chartMoney_View";
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
	
	
	
}
