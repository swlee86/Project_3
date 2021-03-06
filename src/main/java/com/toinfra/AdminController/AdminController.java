package com.toinfra.AdminController;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import com.toinfra.DTO.*;
import com.toinfra.Service.AdminService;
import com.toinfra.Service.CommuteService;
import com.toinfra.Service.RegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.toinfra.Service.PayService;

/*
 * 작성자 : 박성준
 * 작성일 : 2016-11-14
 * 목  적 : 관리자 전용 컨트롤러 
 */

@Controller
public class AdminController {

	@Autowired
	private RegisterService registerservice;
	
	@Autowired
	private AdminService adminservice;
	
	@Autowired
	private PayService payservice;
	
	@Autowired
	private CommuteService commuteservice;
	
	//관리자 > 지점보기 페이지
	@RequestMapping("/adminBranch.do")
	public String adminBranch(Model model){
		
		List<Branch> list = adminservice.listBranch();
		model.addAttribute("branchList",list);
		
		return "admin.adminDepartMentBranch";
	}

	//관리자 > 부서관리 페이지
	@RequestMapping("/adminDepartWidget.do")
	public String adminDepartMent(){
		return "admin.adminDepartWidget";
	}

	//관리자 > 부서 관리 페이지
	@RequestMapping("/adminDepartment.do")
	public String adminDepartment(Model model){
		List<Branch> list = adminservice.listBranch();
		model.addAttribute("branchList",list);
		return "admin.adminDepartMentView";
	}
	
	//관리자 > 하위 부서 관리 페이지
	@RequestMapping("/adminDownDepartment.do")
	public String adminDownDepartment(Model model){
		List<Branch> list = adminservice.listBranch();
		model.addAttribute("branchList",list);
		return "admin.adminDownDepartmentView";
	}

	//직위 관리 페이지
	@RequestMapping(value="/adminGrade.do", method=RequestMethod.GET)
	public String adminGrade(Model model){
		List<PositionJoin> list = adminservice.listPosition();
		model.addAttribute("positionList", list);
		return "admin.adminGradeView";
	}
	
	//직위 정보 수정 시 사용
	@RequestMapping("/positionModify.do")
	public String modifyPosition(PositionJoin position, Model model){
		int result = adminservice.positionUpdate(position);
		
		String msg = "";
		String link = "";
		
		if(result > 0){
			msg = "수정 성공!";
			link = "adminGrade.do";
		}else{
			msg = "수정 실패!";
			link = "adminGrade.do";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("link",link);
		
		return "admin.admin_redirect";
	}
	
	/*//시간 등록 페이지 이동
	@RequestMapping("/adminTimeInfo.do")
	public String timeInfo(){
		return "admin.adminTimeInfo";
	}
	//시간 관리 목록 페이지로 이동
	@RequestMapping("/adminCommute.do")
	public String commuteTime(){
		return "admin.adminCommute";
	}*/

	//급여 관리 메뉴 목록 페이지
	@RequestMapping("/adminSalaryView.do")
	public String salaryView(){
		return "admin.adminSalaryView";
	}
	
	//급여 마감 내역 목록 페이지
	@RequestMapping("/adminSalary.do")
	public String salaryManage(Model model){
		
		SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM", Locale.KOREA );
		Date currentTime = new Date( );
		String dTime2 = formatter.format ( currentTime );
		String[] dTimearray = dTime2.split("-");
		int darrayS = Integer.parseInt(dTimearray[1])-1;
		String dTime =dTimearray[0]+"-"+darrayS;
		
		List<PayList> list = payservice.selectPay_all_Close(dTime);
		String pay_date= adminservice.selectpay_date();
		
		model.addAttribute("date", dTime);
		model.addAttribute("list", list);
		model.addAttribute("pay_date", pay_date);
		
		return "admin.salaryClose";
	}
	
	//급여 기본 정보 관리 페이지 > hidden 에 데이타 ㄱㄱ
	@RequestMapping("/adminSalaryManage.do")
	public String salaryInfo(Model model){
		
	  //리스트 출력
		List<PayList> list = payservice.selectPayList_Manage();
		model.addAttribute("paylist", list);
		int count =list.size();
		model.addAttribute("count", count);
		
		return "admin.adminSalaryManage";
	}
	
	//기지급 급여 내역 페이지
	@RequestMapping("/adminSalaryList.do")
	public String totalSalaryList(Model model){		
		SimpleDateFormat formatter = new SimpleDateFormat ("yyyy", Locale.KOREA );
		Date currentTime = new Date( );
		String dTime = formatter.format ( currentTime );
		
		List<Pay> list = adminservice.total_paylist(dTime);
		model.addAttribute("list", list);
		return "admin.admintotalSalaryList";
	}
	
	
	//기지급 급여 목록에서 특정 월 클릭시 상세보기
	@RequestMapping("/adminSalaryListDetail.do")
	public String totalSalaryListDetail(String date, Model model){
		
		List<PayList> list = payservice.select_payMoth_Detail(date);
		for(int i = 0; i < list.size(); i++){
			System.out.println(list.get(i).toString());
		}
		model.addAttribute("count", list.size());
		model.addAttribute("paylist", list);
		return "admin.admintotalSalaryListDetail";
	}
	
	
	//급여 기본 정보 등록/수정 페이지
	@RequestMapping("/adminSalaryModify.do")
	public String salaryInfoModify(String emp_no, Model model){
		
		PayList pay =payservice.selectPayList_Modify(emp_no);
		model.addAttribute("pay", pay);
		
		return "admin.adminSalaryModify";
	}
	//관리자 - 근태 마감 - 리스트 보기
	@RequestMapping("/CommuteAdmin.do")
	public String CommuteAdmin(Model model){
		
		SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM", Locale.KOREA );
		Date currentTime = new Date( );
		String dTime2 = formatter.format ( currentTime );
		String[] dTimearray = dTime2.split("-");
		int darrayS = Integer.parseInt(dTimearray[1])-1;
		String dTime =dTimearray[0]+"-"+darrayS;
		
		List<PayList> Commutelist = commuteservice.selectCommute_all_Close(dTime);
		
		String pay_date= adminservice.selectpay_date();
		
		model.addAttribute("date", dTime);
		model.addAttribute("Commutelist", Commutelist);
		model.addAttribute("pay_date", pay_date);
		return "admin.CommuteAdminView";
	}
	
	//관리자 - 근태마감 - 확정 하기
	@RequestMapping(value="/commuteAdminEnd.do", method=RequestMethod.POST)
	public String CommuteEnd(String hiddenCommute, String emp_no, Model model, String payDate){
		//commute_no 뽑아서 배열에 담아둠
		String[] commute_no = hiddenCommute.split(",");
		String[] emp_noArray = emp_no.split(",");
		for(int i = 0; i < commute_no.length; i++){
		}
		
		for(int i = 0; i < emp_noArray.length; i++){
		}
		
		int result=0;
		
		String link = null;
		String msg = null;
		try{
			for(int i=0; i<commute_no.length; i++){
				result = commuteservice.updateCommute_mgr_check(commute_no[i], emp_noArray[i]);
			}
			
		}catch (Exception e) {
			e.getMessage();
		}finally{
			if(result>0){
				link = "CommuteAdmin.do";
				msg = "급여 마감이 완료되었습니다.";
			}else{
				link = "CommuteAdmin.do";
				msg = "급여 마감에 실패하였습니다.";
			}
			model.addAttribute("link", link);
			model.addAttribute("msg", msg);
		}
		
		
		return "admin.admin_redirect";
	}
	
	//관리자 > 급여관리 > 급여 기본 정보 수정
	@RequestMapping("/adminSalary_Modify.do")
	public String adminSalary_Modify(PayList list, Model model){
		
		int result =payservice.update_pay_Info_emp(list);
		
		String msg = "";
		String link = "";
		
		if(result >=2){
			msg = "수정 성공!";
			link = "adminSalaryModify.do?emp_no="+list.getUser_id();
		}else{
			msg = "수정 실패!";
			link = "adminSalaryModify.do?emp_no="+list.getUser_id();
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("link",link);
		
		return "admin.admin_redirect";
	}
	
	//급여 설정 관리 페이지로 이동
	@RequestMapping("/adminSalarySetting.do")
	public String adminSalarySetting(Model model){
		
		//급여일 설정
		  String pay_date= adminservice.selectpay_date();
		  
		  if(pay_date !=null){
			  model.addAttribute("result", "1");
		  }else{
			  model.addAttribute("result", "0");
		  }
			model.addAttribute("pay_date", pay_date);
			
		//상여금 설정 > 리스트 출력
			List<Dept> list =adminservice.select_allDept();
			model.addAttribute("list", list);
			
			
		return "admin.adminSalarySetting";
	}
	
	//회원 탈퇴 신청 리스트 보기
	@RequestMapping("/adminCheckWithdrawal.do")
	public String CheckWithdrawal(){
		
		
		return "admin.adminCheckWithdrawal";
	}
	
}
