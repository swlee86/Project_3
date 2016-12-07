package kr.or.epm.LoginController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

import kr.or.epm.DAO.PushDAO;
import kr.or.epm.Service.PushService;
import kr.or.epm.VO.Emp;
import kr.or.epm.VO.Emp_detail;
import kr.or.epm.VO.Push;

public class CustomAuthenticationSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
	
	private SqlSession sqlsession;

	
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	private RequestCache requestCache = new HttpSessionRequestCache();

	private String targetUrlParameter;

	private String defaultUrl;

	private boolean useReferer;
	
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
	
	
	public CustomAuthenticationSuccessHandler() {
		System.out.println("###################Login###################");
		
		// TODO Auto-generated constructor stub
		targetUrlParameter = "";
		defaultUrl = "/index.do";
		useReferer = false;
	}
	
	public String getTargetUrlParameter() {
		return targetUrlParameter;
	}

	public void setTargetUrlParameter(String targetUrlParameter) {
		this.targetUrlParameter = targetUrlParameter;
	}

	public String getDefaultUrl() {
		return defaultUrl;
	}

	public void setDefaultUrl(String defaultUrl) {
		this.defaultUrl = defaultUrl;
	}

	public boolean isUseReferer() {
		return useReferer;
	}

	public void setUseReferer(boolean useReferer) {
		this.useReferer = useReferer;
	}

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
		//1.로그인 성공 할때 시작됨 
		request.getSession().removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
		System.out.println("########################로그인 성공시 스타트##################");
		System.out.println("아이디 : " + authentication.getName());
		
		
		
		//알림에 각 항목의 카운트를 담기 위한 변수
		String emp_no =null;
		String taskcount = null;
		String projectcount = null;
	
		//내가 추가한 부분 try 내부에 dao 이용해서 쿼리문 돌려줘야함.
		String approval = "1";
		String taskApprovalcount = "1";
		
		int resultdata = 0;
		System.out.println("푸쉬 주소값? : " + sqlsession.toString());
		PushDAO pushdao = sqlsession.getMapper(PushDAO.class);
		emp_no = pushdao.selectEmp_no(authentication.getName());
		
		//로그인 시 사용하는 Emp
		Emp emp = null;
		
		try{
		    emp = pushdao.selectLogin_Emp(emp_no);
			//ex) 승인 처리 후 확인 버튼 눌르는 경우 controller 부분에 추가 해준다. 쿼리문 씀 ////
			System.out.println("사번? : " + emp_no);
			taskcount = pushdao.taskCount(emp_no);
			projectcount = pushdao.myprojectCount(emp_no);
			System.out.println("미처리 taskcount : " + taskcount);
			System.out.println("내가 진행중인 프로젝트 count : " + projectcount);

			//각 항목의 카운트의 총 합
			resultdata = (Integer.parseInt(taskcount))+Integer.parseInt(projectcount) +Integer.parseInt(approval)+Integer.parseInt(taskApprovalcount);
			System.out.println("ResultData입니다 : " + resultdata);
			//////////////////////////////////////////////////////////////
					
		}catch(Exception e){
			System.err.println(e.getMessage());
		}
		
		HttpSession session = request.getSession();
		
		session.setAttribute("Emp", emp);
		
		clearAuthenticationAttributes(request);
		
		//로그인 성공시 session 객체들 사용
		//미완료 taskcount 생성 > websocket 사용
		session.setAttribute("customerId", authentication.getName());	//두개 세션은 로그인용
		session.setAttribute("emp_no", emp_no); //두개 세션은 로그인용

		//////////////////////////////////////////////////////////////////////////컨트롤러 쪽에 try내부 소스랑
		///////////같이 복붙.
		session.setAttribute("sessiontaskcount", taskcount);
		session.setAttribute("sessionprojectcount", projectcount);
		session.setAttribute("sessiontaskApprovalcount", taskApprovalcount);
		session.setAttribute("sessionApprovalcount", approval);//프로젝트 내가 승인 해야할 승인 여부 세션 생성 
		
		session.setAttribute("sessionpushcount", resultdata);
		
		//우리가 만드는 로그인 성공시 회원정보 담는 세션
		session.setAttribute("emp", "TEST");
		
		
		int intRedirectStrategy = decideRedirectStrategy(request, response);
		switch(intRedirectStrategy){
		case 1:
			System.out.println("정상 로그인?");
			useTargetUrl(request, response);
		case 2:
			useSessionUrl(request, response);
		case 3:
			useRefererUrl(request, response);
		default:
			useDefaultUrl(request, response);
		}
		
	}
	
	
	private void useTargetUrl(HttpServletRequest request, HttpServletResponse response) throws IOException{
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		if(savedRequest != null){
			requestCache.removeRequest(request, response);
		}
		String targetUrl = request.getParameter(targetUrlParameter);
		redirectStrategy.sendRedirect(request, response, targetUrl);
	}

	private void useSessionUrl(HttpServletRequest request, HttpServletResponse response) throws IOException{
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		String targetUrl = savedRequest.getRedirectUrl();
		redirectStrategy.sendRedirect(request, response, targetUrl);
	}
	
	private void useRefererUrl(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String targetUrl = request.getHeader("REFERER");
		redirectStrategy.sendRedirect(request, response, targetUrl);
	}

	private void useDefaultUrl(HttpServletRequest request, HttpServletResponse response) throws IOException{
		redirectStrategy.sendRedirect(request, response, defaultUrl);
	}
	
	
	private int decideRedirectStrategy(HttpServletRequest request, HttpServletResponse response){
		int result = 0;
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		
		if(!"".equals(targetUrlParameter)){
			result = 1;
		}else{
			if(savedRequest!=null){
				result=2;
			}else{
				String refererUrl = request.getHeader("REFERER");
				if(useReferer && StringUtils.hasText(refererUrl)){
					result = 3;
				}else{
					result = 0;
				}
			}
		}
		return result;
	}

		


}