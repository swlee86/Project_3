package com.toinfra.IndexController;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.toinfra.DTO.*;
import com.toinfra.Util.Util;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.toinfra.Service.CreateLogService;
import com.toinfra.Service.DraftService;
import com.toinfra.Service.LoginService;
import com.toinfra.Service.ProjectService;
import com.toinfra.Service.PushService;

//index.do 접근시에 index.jsp를 열어주는 컨트롤러

@Controller
public class IndexController {

	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);

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
	@RequestMapping(value={"index.do"}, method=RequestMethod.GET)
	public String indexview(HttpServletRequest request, HttpServletResponse response, String pagesize, String currentpage, Model model, Principal principal) {
			HttpSession session = request.getSession();
			Emp_detail user_date = (Emp_detail)session.getAttribute("user_date");
			String user_id = null;

			if(Util.isEmpty(user_date)){
				user_id = "";
			}else{
				user_id = user_date.getUser_id();
				//시큐리티를 이용한 아이디 뽑기 웹소켓 채팅 작업시 사용
				session.setAttribute("userName", user_id);
			}

			boolean emp_no_chk = Util.isEmpty(user_date);

			logger.info("emp_no_chk 값 : " + emp_no_chk);

			logger.info("IndexPage user_data 세션 : " + user_date);
			logger.info("IndexPage user_data 세션의 ID 추출 : " + user_id);

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





			/////////////////////////////////

			List<Task> tasklist = null;

			///////////////////////인덱스에 띄워 줄 업무 내용 구하기 시작////////////////////////////////////////////////////
			if(emp_no_chk==true){
				String msg_task = "미확인 업무 내역은 로그인 후 내용 확인 가능합니다";
				model.addAttribute("msg_task", msg_task);
			}else{
				try{
					tasklist = pushService.tasklist(user_id, cpage, pgsize);
				}catch(Exception e){
					e.printStackTrace();
					session.setAttribute("error_Cd","9999999");
					session.setAttribute("change_value","미확인업무_추출에러");
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
					mytasklist = pushService.mytasklist(user_id, cpage, pgsize);
				}catch(Exception e){
					e.printStackTrace();
					session.setAttribute("error_Cd","9999999");
					session.setAttribute("change_value","진행중업무내역_추출에러");
				}finally{
					model.addAttribute("mytasklist", mytasklist);
					//model.addAttribute("mytasklistsize", mytasklist.size());
				}


			}


			String deptavg = "";
			String myavg = "";
			if(emp_no_chk==true){
				String commutemsg = "근태 내역은 로그인 후 내용 확인 가능합니다";
				model.addAttribute("commutemsg", commutemsg);
			}else{
				try{
					deptavg = pushService.avgcommute_dept(user_id);
					//System.out.println("@!@!@!@!@!부서의 평균 근무시간 : "+deptavg);
					if(deptavg==null){
						deptavg="0";
					}
					myavg = pushService.avgcommute_my(user_id);
					//System.out.println("@!@!@!@!@!나의 평균 근무시간 : " + myavg);
					if(myavg==null){
						myavg="0";
					}
				}catch(Exception e){
					e.printStackTrace();
					session.setAttribute("error_Cd","9999999");
					session.setAttribute("change_value","근태내역_추출에러");
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
					pjlist = projectservice.selectPj_callendar(user_id);
					//System.out.println("@@@@@@@프로젝트 리스트 사이즈 : " +pjlist.size());
				}catch(Exception e){
					e.printStackTrace();
					session.setAttribute("error_Cd","9999999");
					session.setAttribute("change_value","프로젝트내역_추출에러");
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
					approve_pjlist = pushService.selectPj_rec(user_id, cpage, pgsize);
				}catch(Exception e){
					e.printStackTrace();
					session.setAttribute("error_Cd","9999999");
					session.setAttribute("change_value","미승인프로젝트내역_추출에러");
				}finally{
					//System.out.println("approve_pjlist size : "+approve_pjlist.size());
					model.addAttribute("approve_pjlist", approve_pjlist);
				}
			}

			/////////////////////////인덱스에 띄워 줄 전자결재 내용 구하기 시작////////////////////////////////////////////////////
			// 대외발신공문
			// 목록 가져오기
			List<Office> officelist_ex = service2.selectOffice_rec(user_id);
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
			List<Cooperation> cooperationlist_ex = service2.selectCooperation_rec(user_id);
			List<Cooperation> cooperationlist_cham = service2.selectCooperation_rec_cham(user_id);
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
			List<Break> breaklist_ex = service2.selectBreak_rec(user_id);
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


			//로그 데이터에 담을 DTO 생성
			session.setAttribute("error_Cd","0000000");
			session.setAttribute("change_value","인덱스_정상진입");
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
