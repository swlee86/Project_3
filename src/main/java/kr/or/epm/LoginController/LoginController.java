package kr.or.epm.LoginController;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

import kr.or.epm.Service.LoginService;
import kr.or.epm.Util.Util;
import kr.or.epm.VO.Emp;
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
	public String loginview(HttpServletRequest request) {
		System.out.println("로그인");
	    String referrer = request.getHeader("Referer");
	    request.getSession().setAttribute("prevPage", referrer);
		return "/login";
	}
	
	
	//구글 로그인을 하면 해당 정보를 가지고 회원가입/로그인으로 화면을 redirection 시키는 함수
	@RequestMapping(value = "/loginToken.do")
	public View googleloginview(String id, String name, String imgurl, String email, Model model, HttpSession session){
		System.out.println("구글 로그인 데이터 저장");
		System.out.println("구글 id " + id);
		System.out.println("구글 Name " + name);
		System.out.println("구글 imgurl " + imgurl);
		System.out.println("구글 email " + email);
		
		 
		//db에 저장 되어 있는 구글 아이디 탐색
		 String iddata = service.selectGoogleLoginData(id);
		 System.out.println("컨트롤러 확인합시다 : "+iddata);
		 boolean test = Util.isEmpty(iddata);
		 
		 if(test==true){
			 System.out.println("아이디가 없네요 ㅠㅠ");
			 iddata="아이디가 존재하지 않습니다. 가입 후 이용하세요";
			 model.addAttribute("iddata", iddata);
			 model.addAttribute("googleloginid", id);
			 
			 //매칭되는 아이디가 없을시 가입에 필요한 객체를 session 정보에 담음
			 session.setAttribute("googleApiKey", id);
			 session.setAttribute("googlemail", email);
		 }else{
			 System.out.println("엘스 부분 : "+email+ " / iddata : "+iddata);
			 model.addAttribute("iddata", iddata);
			 //로그인 데이터와 맞는 아이디가 있으면 정보를 session에 담음
			 session.setAttribute("googleApiKey", id);
			 session.setAttribute("googlemail", email);
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

		//아이디찾기
		@RequestMapping(value="/findId.do", method=RequestMethod.POST)
		public View findId(EmpJoinEmp_Detail emp, Model model){
			System.out.println("아이디 찾기 : "+emp.toString());
			String findId = service.selectFindId(emp);
			System.out.println("찾은 아이디는 ??? "+findId);
			model.addAttribute("id", findId);
			return jsonview;
		}
		
		
		//비밀번호찾기
		@RequestMapping(value="/findPw.do", method=RequestMethod.POST)
		public View findPw(EmpJoinEmp_Detail emp, Model model){	
			System.out.println("비밀번호 찾기 : "+emp.toString());
			String pw = null;
			
			try{
				
				pw = service.selectFindPw(emp);
				
				System.out.println("pw : "+pw);
				
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				
				if(pw != null || pw != "실패"){
					System.out.println("임시 비밀번호는요 ?????????????????????????? "+pw);
					model.addAttribute("temp",pw);
				}else{
					model.addAttribute("temp","실패하였습니다.");
				}
			}			
			return jsonview;
		}
		
		/*
		//아이디찾기 결과
		@RequestMapping("/findID_Result.do")
		public String findIdResult(){
			return "find.findID_Result";
		}

		//비밀번호찾기 결과
		@RequestMapping("/findPW_Result.do")
		public String findPwResult(){
			return "find.findPW_Result";
		}*/
		
	
}
