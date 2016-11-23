package kr.or.epm.RegisterController;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
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
		emp_detail.setPwd(this.bCryptPasswordEncoder.encode(emp_detail.getPwd()));;
		int result = 0;
		String answer = null;
		String data = null;			
		try{
			result = registerservice.insertEmp_detail(emp_detail);
			registerservice.insertEmpRoleList(emp_detail.getEmp_no());
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
		return "register/registerRedirect";
	}
	
	
	
}
