package kr.or.epm.RegisterController;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import kr.or.epm.Service.RegisterService;
import kr.or.epm.VO.Emp;
import kr.or.epm.VO.Emp_detail;


/*
 * 작성일 : 2016-11-16
 * 작성자 : 이상원
 * 목  적 : 회원 가입  관련 처리 컨트롤러. 
 * 
 */

@Controller
public class RegisterController {

	@Autowired
	private RegisterService registerservice;
	
	//회원가입 클릭시 view 페이지 보여주는 함수
	@RequestMapping(value="/addMember.do", method=RequestMethod.GET)
	public String insertMember(){
		System.out.println("회원 가입");
		return "register.addMember";
	}
	
	//register를 누르면 회원가입을 시도하는 함수
	@RequestMapping(value="/addMember.do", method=RequestMethod.POST)
	public String insertMemberOk(Emp_detail emp_detail, Model mv){
		System.out.println("회원 가입 처리 중...");
		int result = 0;
		String answer = null;
		String data = null;			
		try{
			result = registerservice.insertEmp_detail(emp_detail);
		}catch(Exception e){
			e.getMessage();
		}finally{
			if(result>0){
				System.out.println("반영 성공");
				answer = "index.do";
				data = "회원 가입에 성공하였습니다.";
			}else{
				System.out.println("반영 실패");
				answer = "addMember.do";
				data = "회원 가입에 실패 하였습니다.";
			}
			mv.addAttribute("data", data);
			mv.addAttribute("answer", answer);
		}
		return "admin/redirect";
	}
	
	//관리자 > 사원정보 등록페이지에서 사원 등록메뉴 처리시에 필요한 하위 부서번호를 가져 오는 함수
	public String selectLowDeptNo(Model mv){
		

		return null;
	}
	

	//관리자 > 사원관리 > 사원 등록에서 등록 버튼을 누르면 타게 되는 함수(인서트 처리를 담당한다)
	@RequestMapping("/adminAddMember.do")
	public String insertEmp(Emp emp, Model mv){
		System.out.println(emp.toString());
		int result = 0;
		String answer = null;
		String data = null;
		try{
			result = registerservice.insertEmp(emp);			
		}catch(Exception e){
			e.getMessage();
		}finally{
			if(result>0){
				System.out.println("반영 성공");
				answer = "adminEmployeeManage.do";
				data = "사원정보 등록에 성공하였습니다.";
			}else{
				System.out.println("반영 실패");
				answer = "adminMakeMember.do";
				data = "사원정보 등록에 실패 하였습니다.";
			}
		}
		mv.addAttribute("data", data);
		mv.addAttribute("answer", answer);
		return "admin/redirect";
	}
	
	
}
