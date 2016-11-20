package kr.or.epm.LoginController;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.epm.Service.LoginService;
import kr.or.epm.VO.EmpJoinEmp_Detail;

/*
 * 작성일 : 2016-10-27
 * 작성자 : 박성준
 * 목  적 : 로그인 관련 컨트롤러. 
 * 
 */

@Controller
public class LoginController {

	@Autowired
	private LoginService service;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String loginview() {
		System.out.println("로그인");
		return "login.login";
	}

	// 내정보수정 > 뷰페이지
	@RequestMapping(value="/editMyinfo.do", method=RequestMethod.GET)
	public String editMyinfo(Principal principal, Model model) {
		
		//시큐리티를 이용한 아이디 뽑기
		String id = principal.getName();
		System.out.println("아이디  : "+id);
		
		EmpJoinEmp_Detail empinfo = service.modifyInfo(id);
		System.out.println("컨트롤러 : "+empinfo.toString());
		model.addAttribute("emp",empinfo);
		return "myinfo.editMyinfo";
	}
	
	@RequestMapping(value="/editMyinfo.do", method=RequestMethod.POST)
	public String editMyInfoModify(EmpJoinEmp_Detail infoDetail, Model model){
		
		infoDetail.setPwd(this.bCryptPasswordEncoder.encode(infoDetail.getPwd()));
		
		System.out.println("포스트 요청시 호출 : "+infoDetail.toString());
		
		String link = null;
		String msg = null;
		int result=0;;
		
		try{
		
			result = service.updateInfo(infoDetail);
		
		}catch (Exception e) {
		
			System.out.println(e.getMessage());
		
		}finally{
			if(result > 0){
				link = "index.do";
				msg = "정보수정 성공!";
			}else{
				link = "editMyinfo.do";
				msg = "정보수정 실패!";
			}
			
			model.addAttribute("link", link);
			model.addAttribute("msg", msg);	
		}
		
		return "myinfo.editMyinfo_Redirect";
	}

}
