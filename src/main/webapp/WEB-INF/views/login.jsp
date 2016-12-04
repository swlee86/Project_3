<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Page title -->
<title>EPM | WebApp admin theme</title>

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<!--<link rel="shortcut icon" type="image/ico" href="favicon.ico" />-->

<!-- Vendor styles -->
<link rel="stylesheet" href="vendor/fontawesome/css/font-awesome.css" />
<link rel="stylesheet" href="vendor/metisMenu/dist/metisMenu.css" />
<link rel="stylesheet" href="vendor/animate.css/animate.css" />
<link rel="stylesheet" href="vendor/bootstrap/dist/css/bootstrap.css" />

<!-- App styles -->
<link rel="stylesheet" href="fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css" />
<link rel="stylesheet" href="fonts/pe-icon-7-stroke/css/helper.css" />
<link rel="stylesheet" href="styles/style.css">
<!--구글 API-->
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id"
	content="279959715456-km9o7eijb5j8sr8kn9i98dtmitu5l1tt.apps.googleusercontent.com">
<style>
	body{
		background-image: url("images/landing/header.jpg");
	}
	
	h3{
		color: white;
	}
	
	small{
		color: white;
	}
	
</style>
</head>
<body class="fixed-navbar fixed-sidebar media-body">
	
	<div class="splash">
		<div class="color-line"></div>
		<div class="splash-title">
			<h1>2PM</h1>
			<p>Now loading...</p>
			<div class="spinner">
				<div class="rect1"></div>
				<div class="rect2"></div>
				<div class="rect3"></div>
				<div class="rect4"></div>
				<div class="rect5"></div>
			</div>
		</div>
	</div>
	
	
	<div class="container">
		<div class="heading">

			<div class="login-container">
				<div class="row">
					<div class="col-md-12">
						<div class="text-center m-b-md">
							<div id="page-top">
								<div class="heading">
									<h3 style="color: white">로그인</h3>
									<small>WelCome 2pm! <c:if test="${param.error != null}">
											<div>
												로그인실패<br>
												<c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null}">
		       										이유 : <c:out
														value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />
												</c:if>
											</div>
										</c:if>
									</small>
								</div>
							</div>
						</div>
						<div class="hpanel">
							<div class="panel-body">
								<form action="${pageContext.request.contextPath}/login"
									id="loginForm" method="POST" name="f">
									<div class="form-group">
										<label class="control-label" for="username"
											style="color: black;">아이디</label> <input type="text"
											title="Please enter you username" required=""
											value="구글 로그인 후 이용하세요" name="username" id="username"
											class="form-control"> <span class="help-block small">Your
											unique username to app</span>
									</div>
									<div class="form-group">
										<label class="control-label" for="password"
											style="color: black;">비밀번호</label> <input type="password"
											title="Please enter your password" placeholder="******"
											required="" value="" name="password" id="password"
											class="form-control"> <span class="help-block small">Your
											strong password</span>
									</div>
									<div style="text-align: center;">
										<div class="g-signin2" data-onsuccess="onSignIn"
											style="display: block;"></div>
									</div>
									<hr>
									<input type="hidden" name="loginRedirect"
										value="${loginRedirect}" /> <a
										class="btn btn-default btn-block" href="#" id="googlelogout"
										onClick="javascript:window.open('https://accounts.google.com/logout','popup','scrollbars=no, resizable=no, width=500px,height=800px')">구글
										로그아웃</a> <input type="submit" class="btn btn-success btn-block"
										value="로그인" id="loginSubmitBtn"> <a
										class="btn btn-default btn-block" href="addMember.do">회원가입</a>
									<a class="btn btn-default btn-block" data-toggle="modal"
										data-target="#findId">아이디 찾기</a> 
									<a class="btn btn-default btn-block" data-toggle="modal" data-target="#findPw">비밀번호 찾기</a>

								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!--아이디 찾기-->
	<div class="modal fade" id="findId" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="color-line"></div>
				<div class="modal-header">
					<h4 class="modal-title">아이디 찾기</h4>
					<small class="font-bold">찾으실 아이디를 입력하세요</small>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
 						<div class="row">
							<div class="form-group col-lg-12">
								<label class="col-sm-4 control-label" style="text-align: right;">사번</label>
								<div class="col-md-8">
									<input type="text" class="form-control" placeholder="사번">
								</div>
							</div>

							<div class="form-group col-lg-12">
								<label class="col-md-4 control-label" style="text-align: right;">이름</label>
								<div class="col-md-8">
									<input type="text" class="form-control"  placeholder="이름">
								</div>
							</div>
							
							<div class="form-group col-lg-12">
								<label class="col-md-4 control-label" style="text-align: right;">연락처</label>
								<div class="col-md-8">
									<input type="text" class="form-control"  placeholder="부서번호">
								</div>
							</div>
						
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<a class="btn btn-default" href="login.do"data-dismiss="modal">취소하기</a>
					<a class="btn btn-success" href="findID_Result.do">아이디찾기</a>
				</div>
			</div>
		</div>
	</div>
	
	<!--비밀번호 찾기-->
	<div class="modal fade" id="findPw" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="color-line"></div>
				<div class="modal-header">
					<h4 class="modal-title">비밀번호 찾기</h4>
					<small class="font-bold">찾으실 비밀번호를 입력하세요</small>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
 						<div class="row">
							<div class="form-group col-lg-12">
								<label class="col-sm-4 control-label" style="text-align: right;">아이디</label>
								<div class="col-md-8">
									<input type="text" class="form-control" placeholder="아이디">
								</div>
							</div>
							
							<div class="form-group col-lg-12">
								<label class="col-sm-4 control-label" style="text-align: right;">사번</label>
								<div class="col-md-8">
									<input type="text" class="form-control" placeholder="사번">
								</div>
							</div>

							<div class="form-group col-lg-12">
								<label class="col-md-4 control-label" style="text-align: right;">이름</label>
								<div class="col-md-8">
									<input type="text" class="form-control"  placeholder="이름">
								</div>
							</div>
							
							<div class="form-group col-lg-12">
								<label class="col-md-4 control-label" style="text-align: right;">연락처</label>
								<div class="col-md-8">
									<input type="text" class="form-control"  placeholder="010-1111-2222">
								</div>
							</div>
						
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<a class="btn btn-default" href="login.do"data-dismiss="modal">취소하기</a>
					<a class="btn btn-success" href="findID_Result.do">PW찾기</a>
				</div>
			</div>
		</div>
	</div>
	













	<!-- Vendor scripts -->
	<script src="vendor/jquery/dist/jquery.min.js"></script>
	<script src="vendor/jquery-ui/jquery-ui.min.js"></script>
	<script src="vendor/slimScroll/jquery.slimscroll.min.js"></script>
	<script src="vendor/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="vendor/jquery-flot/jquery.flot.js"></script>
	<script src="vendor/jquery-flot/jquery.flot.resize.js"></script>
	<script src="vendor/jquery-flot/jquery.flot.pie.js"></script>
	<script src="vendor/flot.curvedlines/curvedLines.js"></script>
	<script src="vendor/jquery.flot.spline/index.js"></script>
	<script src="vendor/metisMenu/dist/metisMenu.min.js"></script>
	<script src="vendor/iCheck/icheck.min.js"></script>
	<script src="vendor/peity/jquery.peity.min.js"></script>
	<script src="vendor/sparkline/index.js"></script>

	<!-- App scripts -->
	<script src="scripts/homer.js"></script>


	<script>
	
	function onSignIn(googleUser) {
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
		  
	  })
	</script>
</body>
</html>