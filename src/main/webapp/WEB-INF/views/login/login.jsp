<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<header id="page-top">
		<div class="container">
			<div class="heading">

				<div class="login-container">
					<div class="row">
						<div class="col-md-12">
							<div class="text-center m-b-md">
								<h3>로그인</h3>
								<small>WelCome ToInfra!
									<c:if test="${param.error != null}">
										<div>
											로그인실패<br>
											<c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null}">
       										이유 : <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />
											</c:if>
										</div>
									</c:if>
								</small>
							</div>
							<div class="hpanel">
								<div class="panel-body">
									<form action="${pageContext.request.contextPath}/login" id="loginForm" method="POST" name="f">
										<div class="form-group">
											<label class="control-label" for="username" style="color: black;">아이디</label> <input
												type="text" title="Please enter you username" required="" value=""
												name="username" id="username" class="form-control">
											<span class="help-block small">Your unique username to
												app</span>
										</div>
										<div class="form-group">
											<label class="control-label" for="password" style="color:black;">비밀번호</label> <input
												type="password" title="Please enter your password"
												placeholder="******" required="" value="" name="password"
												id="password" class="form-control"> <span
												class="help-block small">Your strong password</span>
										</div>
										<div class="checkbox">
											<input type="checkbox" class="i-checks" checked> 
												<label style="color: black;">로그인상태 유지</label>
											<p class="help-block small">(if this is a private computer)</p>
										</div>
										<div style="text-align: center;">
										<div class="g-signin2" data-onsuccess="onSignIn" style="display: block;"></div>
										</div>
										<hr>
										<input type="hidden" name="loginRedirect" value="${loginRedirect}" />
										<a class="btn btn-default btn-block" href="#" id="googlelogout" onClick="javascript:window.open('https://accounts.google.com/logout','popup','scrollbars=no, resizable=no, width=500px,height=800px')">구글 로그아웃</a>
										<input type="submit" class="btn btn-success btn-block" value="로그인" id="loginSubmitBtn"> 
										<a class="btn btn-default btn-block" href="addMember.do">회원가입</a>
										<a class="btn btn-default btn-block" href="findId.do">아이디 찾기</a>
										<a class="btn btn-default btn-block" href="findPw.do">비밀번호 찾기</a>
										
									</form>
								</div>
							</div>
						</div>
					</div>
			</div>
		</div>
	</div>
	</header>
	<div class="heading-image animate-panel" data-child="img-animate" data-effect="fadeInRight" style="height: 100%;"></div>
	
	
	<script>
	/* function onSignIn(googleUser) {
		  var profile = googleUser.getBasicProfile();
		  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
		  console.log('Name: ' + profile.getName());
		  console.log('Image URL: ' + profile.getImageUrl());
		  console.log('Email: ' + profile.getEmail());
		  
		  $.ajax({
			  type:"POST"
			  ,url:"loginToken.do" //세션 생성페이지 (setAttribute...)
			  ,data:"id="+profile.getId()+"&name="+profile.getName()+"&imgurl="+profile.getImageUrl()+"&email="+profile.getEmail()
			  ,success:function(result){
				console.log("data : " + result.iddata);
				console.log("googleloginid : " + result.googleloginid);
					 $('#username').val(result.iddata);
			  }
			 });
	}
	
	  function signOut() {
		    var auth2 = gapi.auth2.getAuthInstance();
		    auth2.signOut().then(function () {
		      console.log('User signed out.');
		    });
		  }

	  
	  $(function(){
		  $('#googlelogout').click(function(){
			  $('#username').val("구글 로그인 후 이용하세요");
		  });
		  
	  }) */
	</script>
