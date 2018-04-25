package com.toinfra.RegisterController;


import javax.servlet.http.HttpSession;

import com.toinfra.DTO.UserDto;
import com.toinfra.Service.LoginService;
import com.toinfra.Service.RegisterService;
import com.toinfra.Util.Util;
import com.toinfra.DTO.Emp_detail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;


/*
 * 작성일 : 2016-11-16
 * 작성자 : 이상원
 * 목  적 : 회원 가입  관련 처리 컨트롤러. 
 * 
 */

@Controller
public class RegisterController {
	
	@Autowired
	private View jsonview;
	
	@Autowired
	private LoginService service;
	
	@Autowired
	private RegisterService registerservice;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	//회원가입 클릭시 view 페이지 보여주는 함수
	@RequestMapping(value="/addMember.do", method=RequestMethod.GET)
	public String insertMember(HttpSession session, Model model){
		String google = null;
		String googlemail = null;

		if(Util.isEmpty((String)session.getAttribute("googleApiKey"))){

		}else{
			google = (String)session.getAttribute("googleApiKey");
			googlemail = (String)session.getAttribute("googlemail");
			model.addAttribute("registerGoogleId", google);
			model.addAttribute("registerGoogleMail", googlemail);
		}

		String data=null;
		String answer=null;

		
		 //db에 저장 되어 있는 구글 아이디 탐색
		if(Util.isEmpty(google)){
			model.addAttribute("choose","2");
			model.addAttribute("success", "가입을 진행합니다.");
			return "register.addMember";
		}else{
			String iddata = service.selectGoogleLoginData(google);
			boolean test = Util.isEmpty(iddata);
			if(test==false){
				model.addAttribute("choose","1");
				data="아이디가 존재합니다. 아이디 비밀번호를 잊은 경우 아이디/패스워드 찾기를 진행해 주세요";
				answer = "index.do";
				model.addAttribute("data", data);
				model.addAttribute("answer", answer);
			}else{
				model.addAttribute("choose","2");
				model.addAttribute("success", "가입하실수 있는 아이디입니다. 가입을 진행해주세요 !");
				model.addAttribute("registerGoogleId", google);
				model.addAttribute("registerGoogleMail", googlemail);
				return "register.addMember";

			}
		}
		return "register.registerRedirect";
		 
	}
	
	//register를 누르면 회원가입을 시도하는 함수

	@Transactional
	@RequestMapping(value="/addMember.do", method=RequestMethod.POST)
	public String insertMemberOk(Emp_detail emp_detail, Model mv, String email){
		emp_detail.setPwd(this.bCryptPasswordEncoder.encode(emp_detail.getPwd()));;
		UserDto userDto = new UserDto();
		userDto.setEmail(email);
		userDto.setUser_id(emp_detail.getUser_id());
	
		int resultempdetail = 0;
		int resultemp = 0;
		int resultrole = 0;
		String answer = null;
		String data = null;			
		try{
			resultempdetail = registerservice.insertEmp_detail(emp_detail);
		}catch(Exception e){
			e.getMessage();
		}finally{
			try{
				resultemp = registerservice.updateEmail(userDto);
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try{
					resultrole = registerservice.insertEmpRoleList(emp_detail.getUser_id());
				}catch(Exception e){
					e.printStackTrace();
				}finally{
					if(resultrole>0){
						answer = "login.do";
						data = "회원 가입에 성공하였습니다.";
					}else{
						answer = "login.do";
						data = "회원 가입에 실패 하였습니다.";
					}					
				}
			}
			
			mv.addAttribute("data", data);
			mv.addAttribute("answer", answer);
		}
		return "register/registerRedirect";
	}
	
	
	
}
