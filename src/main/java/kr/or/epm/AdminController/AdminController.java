package kr.or.epm.AdminController;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.epm.Service.AdminService;
import kr.or.epm.Service.PayService;
import kr.or.epm.Service.RegisterService;
import kr.or.epm.VO.Branch;
import kr.or.epm.VO.Dept;
import kr.or.epm.VO.Low_dept;
import kr.or.epm.VO.PayList;
import kr.or.epm.VO.Position;
import kr.or.epm.VO.PositionJoin;

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
	
	//관리자 개발.
	@RequestMapping(value="/adminDepart_depart.do",method=RequestMethod.GET)
	@ResponseBody
	public List<TestAdminDTO> departMent(String depart){
		System.out.println("넘어온 부서이름 : "+depart);
		List<TestAdminDTO> list = new ArrayList<TestAdminDTO>();
		list.add(new TestAdminDTO(depart, "20"));
		list.add(new TestAdminDTO("박성준", "28"));
		list.add(new TestAdminDTO("테스트", "25"));
		return list;
	}
	
	
	
	
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
	@RequestMapping("/adminGrade.do")
	public String adminGrade(Model model){
		List<PositionJoin> list = adminservice.listPosition();
		System.out.println("리스트 : " +list.toString());
		model.addAttribute("positionList", list);
		return "admin.adminGradeView";
	}
	
	//직위 정보 수정 시 사용
	@RequestMapping("/positionModify.do")
	public String modifyPosition(PositionJoin position, Model model){
		System.out.println("컨트롤러 : "+position.toString());
		int result = adminservice.positionUpdate(position);
		System.out.println("결과 : "+result);
		
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
	
	//시간 등록 페이지 이동
	@RequestMapping("/adminTimeInfo.do")
	public String timeInfo(){
		return "admin.adminTimeInfo";
	}
	//시간 관리 목록 페이지로 이동
	@RequestMapping("/adminCommute.do")
	public String commuteTime(){
		return "admin.adminCommute";
	}

	//급여 관리 메뉴 목록 페이지
	@RequestMapping("/adminSalaryView.do")
	public String salaryView(){
		return "admin.adminSalaryView";
	}
	
	//당월 지급 예정 급여 내역 목록 페이지
	@RequestMapping("/adminSalary.do")
	public String salaryManage(Model model){
		
		SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM", Locale.KOREA );
		Date currentTime = new Date( );
		String dTime = formatter.format ( currentTime );
		System.out.println ("연월 : "+dTime ); 
		
		List<PayList> list = payservice.selectPay_all_Close(dTime);
		model.addAttribute("date", dTime);
		model.addAttribute("list", list);
		return "admin.salaryClose";
	}
	
	//급여 기본 정보 관리 페이지 > hidden 에 데이타 ㄱㄱ
	@RequestMapping("/adminSalaryManage.do")
	public String salaryInfo(Model model){
		
	  String pay_date= adminservice.selectpay_date();
	  System.out.println("급여일: "+pay_date);	
	  
	  if(pay_date !=null){
		  model.addAttribute("result", "1");
	  }else{
		  model.addAttribute("result", "0");
	  }
		model.addAttribute("pay_date", pay_date);
		return "admin.adminSalaryManage";
	}
	//기지급 급여 내역 페이지
	@RequestMapping("/adminSalaryList.do")
	public String totalSalaryList(){
		return "admin.admintotalSalaryList";
	}
	//기지급 급여 목록에서 특정 월 클릭시 상세보기
	@RequestMapping("/adminSalaryListDetail.do")
	public String totalSalaryListDetail(){
		return "admin.admintotalSalaryListDetail";
	}
	//급여 기본 정보 등록/수정 페이지
	@RequestMapping("/adminSalaryModify.do")
	public String salaryInfoModify(){
		return "admin.adminSalaryModify";
	}
	
	
	
}
