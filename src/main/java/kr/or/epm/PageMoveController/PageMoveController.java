package kr.or.epm.PageMoveController;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import kr.or.epm.Service.CreateLogService;
import kr.or.epm.Service.DraftService;
import kr.or.epm.Service.LoginService;
import kr.or.epm.Service.ProjectService;
import kr.or.epm.Service.PushService;
import kr.or.epm.Util.Util;
import kr.or.epm.VO.Break;
import kr.or.epm.VO.Company;
import kr.or.epm.VO.Cooperation;
import kr.or.epm.VO.CreateLog;
import kr.or.epm.VO.Office;
import kr.or.epm.VO.Pj;
import kr.or.epm.VO.Task;

//index.do 접근시에 index.jsp를 열어주는 컨트롤러

@Controller
public class PageMoveController {

	@Autowired
	private CreateLogService logservice;
	
	
	@Autowired
	private PushService pushService;
	
	@Autowired
	private LoginService service;
	
	@Autowired
	private DraftService service2;
	
	@Autowired
	private ProjectService projectservice;
	
	// 최초 접속(index.html)시 views/index.jsp 구동
	@RequestMapping("/index.do")
	public String indexview(HttpServletRequest request, HttpServletResponse response, String pagesize, String currentpage, Model model, Principal principal) {
		HttpSession session = request.getSession();
		String emp_no = (String)session.getAttribute("emp_no");
		
		
		
		//접속자의 ip를 가져와서 clientIP에 저장한다.
		HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
        String ip = req.getHeader("X-FORWARDED-FOR");
        if (ip == null)
            ip = req.getRemoteAddr();
         
        session.setAttribute("clientIP", ip);
		
		CreateLog log = new CreateLog();
		log.setIp((String)session.getAttribute("clientIP"));
		log.setPage(request.getRequestURI());
		log.setId((String)session.getAttribute("customerId"));
		log.setEmp_no((String)session.getAttribute("emp_no"));
		
		/*session.setAttribute("emp_no", emp_no);*/
		
		

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
		
		String id = null;
		
		//시큐리티를 이용한 아이디 뽑기 웹소켓 채팅 작업시 사용
		if(emp_no_chk==false){
			id = principal.getName();			
			String empinfo = service.selectUserName(id);
			session.setAttribute("userName", empinfo);
		}
		
		/////////////////////////////////
		
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
 				log.setResult("미확인업무_추출에러");
 				logservice.BasicLog(log);
 			}finally{
 				model.addAttribute("tasklist", tasklist);
 				//model.addAttribute("tasklistsize", tasklist.size());
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
 				log.setResult("진행중업무내역_추출에러");
 				logservice.BasicLog(log);
 			}finally{
 				model.addAttribute("mytasklist", mytasklist);
 				//model.addAttribute("mytasklistsize", mytasklist.size());
 			}
 			
 			
 		}
		
		/////////////////////인덱스에 띄워 줄 근태 차트 리스트 내용 구하기 시작////////////////////////////////////////////////////
/*		List<Commute> commutelist = null;
		if(emp_no_chk==true){
 			String commutemsg = "근태 내역은 로그인 후 내용 확인 가능합니다";
 			model.addAttribute("commutemsg", commutemsg);
 		}else{
 			try{
 				commutelist = pushService.commutelist(emp_no); 	
 				for(int i=0; i<=commutelist.size(); i++){
 					System.out.println("일시 : " + commutelist.get(i).getRegdate());
 					System.out.println("출근 : " + commutelist.get(i).getIn_time());
 					System.out.println("퇴근 : " + commutelist.get(i).getOut_time());
 				}
 			}catch(Exception e){

 			}finally{
 				model.addAttribute("commutelist", commutelist);
 				
 			}
 			
 		}*/
		
		String deptavg = "";
		String myavg = "";
		if(emp_no_chk==true){
			String commutemsg = "근태 내역은 로그인 후 내용 확인 가능합니다";
 			model.addAttribute("commutemsg", commutemsg);
		}else{
			try{
				deptavg = pushService.avgcommute_dept(emp_no);
				//System.out.println("@!@!@!@!@!부서의 평균 근무시간 : "+deptavg);
				if(deptavg==null){
					deptavg="0";
				}
				myavg = pushService.avgcommute_my(emp_no);
				//System.out.println("@!@!@!@!@!나의 평균 근무시간 : " + myavg);
				if(myavg==null){
					myavg="0";
				}
 			}catch(Exception e){
 				System.err.println(e.getMessage());
 				log.setResult("근태내역_추출에러");
 				logservice.BasicLog(log);
 			}finally{
 				model.addAttribute("deptavg", deptavg);
 				model.addAttribute("myavg",myavg);
 				
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
 				//System.out.println("@@@@@@@프로젝트 리스트 사이즈 : " +pjlist.size());
 			}catch(Exception e){
 				System.err.println(e.getMessage());
 				log.setResult("프로젝트내역_추출에러");
 				logservice.BasicLog(log);
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
 				log.setResult("미승인프로젝트내역_추출에러");
 				logservice.BasicLog(log);
 			}finally{ 				
 				//System.out.println("approve_pjlist size : "+approve_pjlist.size());
 				model.addAttribute("approve_pjlist", approve_pjlist);
 			}
 		}
		
		 /////////////////////////인덱스에 띄워 줄 전자결재 내용 구하기 시작////////////////////////////////////////////////////
		// 대외발신공문
		// 목록 가져오기
		List<Office> officelist_ex = service2.selectOffice_rec(emp_no);
		List<Office> officelist = new ArrayList<Office>();
		
		if(officelist_ex.size() >= 5){
			for(int i=0; i< 5; i++){
				officelist.add(officelist_ex.get(i));
			}
			
		}else if(officelist_ex.size() == 0){
			officelist.add(null);
		}else{
			for(int i=0; i< officelist_ex.size(); i++){
				officelist.add(officelist_ex.get(i));
			}
		}
		model.addAttribute("officelist", officelist);
		
		
		
		// 협조문
		// 목록 가져오기
		List<Cooperation> cooperationlist_ex = service2.selectCooperation_rec(emp_no);
		List<Cooperation> cooperationlist_cham = service2.selectCooperation_rec_cham(emp_no);
		List<Cooperation> cooperationlist = new ArrayList<Cooperation>();
		
		if(cooperationlist_ex.size() >= 5){
			for(int i=0; i< 5; i++){
				cooperationlist.add(cooperationlist_ex.get(i));
			}
			
		}else if(cooperationlist_ex.size() == 0){
			cooperationlist.add(null);
		}else{
			for(int i=0; i< cooperationlist_ex.size(); i++){
				cooperationlist.add(cooperationlist_ex.get(i));
			}
		}
		model.addAttribute("cooperationlist", cooperationlist);
		model.addAttribute("cooperationlist_chaam", cooperationlist_cham);
		

		// 휴가신청서
		// 목록 가져오기
		List<Break> breaklist_ex = service2.selectBreak_rec(emp_no);
		List<Break> breaklist = new ArrayList<Break>();
		
		if(breaklist_ex.size() >= 5){
			for(int i=0; i< 5; i++){
				breaklist.add(breaklist_ex.get(i));
			}
			
		}else if(breaklist_ex.size() == 0){
			breaklist.add(null);
		}else{
			for(int i=0; i< breaklist_ex.size(); i++){
				breaklist.add(breaklist_ex.get(i));
			}
		}
		
		model.addAttribute("breaklist", breaklist);
		
		
		


        
        /////////////////////////인덱스에 띄워 줄 메일 내용 구하기 시작////////////////////////////////////////////////////

    	//메인에 띄워 줄 메일 토탈 카운트 구하기
/*        List<Mail> mail =  null;
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
		}*/
		
		
		//로그 데이터에 담을 VO 생성

		log.setResult("인덱스_정상진입");
		logservice.BasicLog(log);

		
		return "home.index";
	}

	// spring security 권한 잡기
	@RequestMapping("/authority.do")
	public String authority() {
		
		return "errors.lock";
	}
	/*
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
	
	*/
	
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

	//아이디찾기,비밀번호찾기 메인
	@RequestMapping("/findIdPw.do")
	public String findIdPw(){
		return "find.findMainView";
	}
	
	
}
