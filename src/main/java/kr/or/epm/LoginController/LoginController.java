package kr.or.epm.LoginController;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

import kr.or.epm.Service.LoginService;
import kr.or.epm.Util.Util;
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
	private View jsonview;
	
	@Autowired
	private LoginService service;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String loginview() {
		System.out.println("로그인");
		return "login.login";
	}
	
	
	//구글 로그인을 하면 해당 정보를 가지고 회원가입/로그인으로 화면을 redirection 시키는 함수
	@RequestMapping(value = "/loginToken.do")
	public View googleloginview(String id, String name, String imgurl, String email, Model model){
		System.out.println("구글 로그인 데이터 저장");
		System.out.println("구글 id " + id);
		System.out.println("구글 Name " + name);
		System.out.println("구글 imgurl " + imgurl);
		System.out.println("구글 email " + email);
		
		//최후 리턴시킬 url
		String url = null;
		 
		//db에 저장 되어 있는 구글 아이디 탐색
		 EmpJoinEmp_Detail idpwd = service.selectGoogleLoginData(id);
		 String chk = null;
		 chk = idpwd.getId();
		 boolean test = Util.isEmpty(chk);
		 
		 if(test==true){
			 url = "register.addMember";	
		 }else{
			model.addAttribute("iddata", chk);
		 }

		return jsonview;

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
