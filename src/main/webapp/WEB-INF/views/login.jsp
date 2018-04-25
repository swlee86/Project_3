<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--  
	작성자	: 박성준
	작성일	: 2016-12-05
	목 적  	: 로그인 화면 layout, css
-->
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Page title -->
<title>2PM</title>

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<!--<link rel="shortcut icon" type="image/ico" href="favicon.ico" />-->

<!-- Vendor styles -->
<link rel="stylesheet" href="vendor/fontawesome/css/font-awesome.css" />
<link rel="stylesheet" href="vendor/metisMenu/dist/metisMenu.css" />
<link rel="stylesheet" href="vendor/animate.css/animate.css" />
<link rel="stylesheet" href="vendor/bootstrap/dist/css/bootstrap.css" />

<!-- App styles -->
<link rel="stylesheet"
	href="fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css" />
<link rel="stylesheet" href="fonts/pe-icon-7-stroke/css/helper.css" />
<link rel="stylesheet" href="styles/style.css">
<!--구글 API-->
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id"
	content="279959715456-km9o7eijb5j8sr8kn9i98dtmitu5l1tt.apps.googleusercontent.com">
<!-- 외부 추가 js 파일 링크 -->
<script src="js/custom/register.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	
	
<style>
body {
	background: url(images/mainImage.png) no-repeat center center fixed; 
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
}

h3 {
	color: white;
}

small {
	color: white;
}

.test {
	margin-top: 15px;
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
									<h3 style="color: white"><B>Login</B></h3>
									<small>WelCome ToInfra!
										<c:if test="${param.error != null}">
											<div>
											
		       										${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
													<c:remove scope="session" var="SPRING_SECURITY_LAST_EXCEPTION"/>
										
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
											title="Please enter you username" required="required"
											name="username" id="username" class="form-control">
										<span class="help-block small">
										</span>
									</div>
									
									<div class="form-group">
										<label class="control-label" for="password"
											style="color: black;">비밀번호</label> <input type="password"
											title="Please enter your password" placeholder="******"
											required="required" value="" name="password" id="password"
											class="form-control"> <span class="help-block small"><!-- 비밀번호를 입력하세요 -->
											</span>
									</div>
									<br>
									<div style="text-align: center;">
										<div class="row ">
												<div class=" col-md-12">
														<div class="g-signin2" data-onsuccess="onSignIn"
														style="display: block;"></div>
												</div>
										</div>	
									</div>
									<br>


										<div class="row">
										<div class="col-md-12">
											<div class="col-md-4" id="logOutDiv">
												
														<input type="hidden" name="loginRedirect"
														value="${loginRedirect}" /> <a 
														href="#" id="googlelogout"
														onClick="javascript:window.open('https://accounts.google.com/logout','popup','scrollbars=no, resizable=no, width=500px,height=800px')">
														<B style="color:gb(54, 109, 133);"><i class="fa fa-google-plus"></i>&nbsp; logout</b></a>
											</div>
												
											<div class="col-md-4 pull-right">
												<a data-toggle="modal" 
													data-target="#findId">ID </a>&nbsp;/&nbsp;<a
													data-toggle="modal" data-target="#findPw">PWD 찾기</a>
											
											</div>
											</div>
										</div>

									<hr>

									<input type="submit" class="btn btn-success btn-block"
										value="로그인" id="loginSubmitBtn"> <a 
										class="btn btn-default btn-block" id="addMemberAjaxAtag">회원가입</a>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!--아이디 찾기-->
	<div class="modal fade hmodal-success" id="findId" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="color-line"></div>
				<form class="form-horizontal" action="findId.do" method="POST"
					id="findIdForm">
					<div class="modal-header">
						<h4 class="modal-title">아이디 찾기</h4>
						<small class="font-bold" id="result_IdSmall">찾으실 아이디를
							입력하세요</small>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="form-group col-lg-12">
								<label class="col-sm-4 control-label" style="text-align: right;">사번</label>
								<div class="col-md-8">
									<input type="text" name="emp_no" id="emp_no"
										class="form-control" placeholder="사번">
								</div>
							</div>

							<div class="form-group col-lg-12">
								<label class="col-md-4 control-label" style="text-align: right;">이름</label>
								<div class="col-md-8">
									<input type="text" name="emp_name" id="emp_name"
										class="form-control" placeholder="이름">
								</div>
							</div>

							<div class="form-group col-lg-12">
								<label class="col-md-4 control-label" style="text-align: right;">연락처</label>
								<div class="col-md-8">
									<input type="text" class="form-control" name="cell_phone"
										id="cell_phone" placeholder="연락처">
								</div>
							</div>


						</div>

					</div>
					<div class="modal-footer">
						<a class="btn btn-default" data-dismiss="modal"
							id="cancleFindIdBtn"><i class="fa fa-close"></i></a> <button type="button"
							class="btn btn-success" id="findIdBtn" >아이디 <i class="fa fa-search"></i></button>
					</div>
				</form>
			</div>
		</div>

	</div>

	<!--비밀번호 찾기-->
	<div class="modal fade hmodal-success" id="findPw" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<form class="form-horizontal" id="findPwForm" action="findPw.do" method="POST">
					<div class="color-line"></div>
					<div class="modal-header">
						<h4 class="modal-title">비밀번호 찾기</h4>
						<small class="font-bold" id="result_findPw">찾으실 비밀번호를 입력하세요</small>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="form-group col-lg-12">
								<label class="col-sm-4 control-label" style="text-align: right;">아이디</label>
								<div class="col-md-8">
									<input type="text" class="form-control" placeholder="아이디" id="findPw_Id" name="emp_id" required="required">
								</div>
							</div>

							<div class="form-group col-lg-12">
								<label class="col-sm-4 control-label" style="text-align: right;">사번</label>
								<div class="col-md-8">
									<input type="text" class="form-control" placeholder="사번" id="findPw_no" name="emp_no" required="required">
								</div>
							</div>

							<div class="form-group col-lg-12">
								<label class="col-md-4 control-label" style="text-align: right;">이름</label>
								<div class="col-md-8">
									<input type="text" class="form-control" placeholder="이름" id="findPw_name" name="emp_name" required="required">
								</div>
							</div>

							<div class="form-group col-lg-12">
								<label class="col-md-4 control-label" style="text-align: right;">연락처</label>
								<div class="col-md-8">
									<input type="text" class="form-control"
										placeholder="010-1111-2222" name="cel_phone" id="findPw_phone" required="required">
								</div>
							</div>

						</div>

					</div>
					<div class="modal-footer">
						<a class="btn btn-default" href="login.do" data-dismiss="modal"><i class="fa fa-close"></i></a>
						<button type="button" id="findPwBtn" class="btn btn-success" >비밀번호 <i class="fa fa-search"></i></button>
					</div>
				</form>
			</div>
		</div>
	</div>


	<!--회원 가입-->
	<div class="modal fade hmodal-success" id="AddMemberForm" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<form class="form-horizontal" action="addMember.do" method="POST">
					<div class="modal-body" style="height:500px;">
						<h3>회원가입</h3>
						<small>2PM 의 다양한 기능을 느껴보세요!</small>
						<div class="form-group col-lg-12">
							<label style="color: black;">사번 확인</label>
							<div class="input-group">
								<input type="text" value="" id="Register_emp_no" class="form-control"
									name="emp_no"> <span class="input-group-btn"
									id="numchkmsg"> <input type="button"
									class="btn btn-success " id="numchk" value="사번 확인">
								</span>
							</div>
							<span id="numchkresult" style="color: blue;"></span>
						</div>

						<div class="form-group col-lg-12">
							<label style="color: black;">ID</label>
							<div class="input-group">
								<input type="text" value="" id="Register_id" class="form-control"
									name="id"> <span class="input-group-btn"> <input
									type="button" class="btn btn-success " id="idchk" value="중복 체크">
								</span>
							</div>
							<span id="idchkresult" style="color: blue;"></span>
						</div>

						<div class="form-group col-lg-6">
							<label style="color: black;">Password</label> <input
								type="password" value="" id="pwd" class="form-control"
								name="pwd">
						</div>
						<div class="form-group col-lg-6">
							<label style="color: black;">Repeat Password</label> <input
								type="password" value="" id="pwdchk" class="form-control"
								name="pwdchk">
						</div>
						<div class="form-group col-lg-12">
							<label style="color: black;">주소</label>
							<div class="input-group">
								<input type="text" id="sample6_postcode" name="postcode"
									class="form-control" placeholder="우편번호"> <span
									class="input-group-btn"> <input type="button"
									onclick="sample6_execDaumPostcode()" class="btn btn-success "
									value="우편번호 찾기">
								</span>
							</div>
							<div class="row">
								<br>
								<div class=" col-lg-6">
									<input type="text" id="sample6_address" name="addr"
										class="form-control" placeholder="기본주소">
								</div>
								<div class=" col-lg-6">
									<input type="text" id="sample6_address2" name="addr_detail"
										class="form-control" placeholder="상세주소">
								</div>

							</div>
						</div>
						<div class="form-group col-lg-12">
							<label style="color: black;">E-mail</label>
							<div class="row">
								<div class="col-lg-12">
									<input type="text" id="email" 
										class="form-control" name="email" readonly="readonly">
								</div>
							</div>
						</div>

						<div class="form-group col-lg-12">
							<label style="color: black;">계좌번호</label>
							<div class="row">
								<div class=" col-lg-6">
									<select class="form-control" name="bank">
										<option value="국민">국민</option>
										<option value="신한">신한</option>
										<option value="기업">기업</option>
										<option value="SC은행">SC은행</option>
										<option value="우체국">우체국</option>
										<option value="농협">농협</option>
									</select>
								</div>
								<div class=" col-lg-6">
									<input type="text" value="" id="account" class="form-control"
										name="account">
								</div>
								<input type="hidden" id="googleId" value="${registerGoogleId}"
									name="googleapiid">
							</div>
						</div>
					</div>
					<div class="text-center">
						<input type="submit" class="btn btn-success" value="회원 가입">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
					<br/><br/>
				</form>
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

	$(function(){

		//회원 가입 버튼 클릭시 처음 실행되는 아작스 함수.
		$('#addMemberAjaxAtag').click(function(){
			alert("아이디 : >"+$('#username').val()+"<");
			
			 if($('#username').val()==null || $('#username').val()=='' ||$('#username').val()==""){
				 alert("구글 아이디로 로그인 해주세요!");
			 }else{
				   $.ajax({
						url : "addMember.do",
						type : "GET",
						success : function(data){
							if(data.choose == '1'){
								alert(data.data);
							}else{
								alert(data.success);
								$('#AddMemberForm').modal();
								$('#googleId').val(data.registerGoogleId);
								$('#email').val(data.registerGoogleMail);
							}
						}
					});
			 }
		});
		
		//비밀번호 찾기 모달 실행시 
		$('#findPwBtn').click(function(){
			
			var id = $('#findPw_Id').val();
			var emp_no = $('#findPw_no').val();
			var name = $('#findPw_name').val();
			var phone = $('#findPw_phone').val();
			
			alert("id : "+id + " / pw : "+emp_no + " / name : "+name+ " / phone : "+phone);
			$.ajax({
				url : "findPw.do",
				type : "post",
				data : {
					id : id,
					emp_no : emp_no,
					emp_name : name,
					cell_phone : phone
				},
				success : function(data){
					
					if(data.temp != null || data.temp != ''){
						$('#result_findPw').html();
						$('#result_findPw').html("<br/><span style='color:blue;font-size:18px;'>비밀번호 : "+data.temp+"</span>")
					}else{
						$('#result_findPw').html();
						$('#result_findPw').html("<br/><span style='color:red;font-size:18px;'>정보를 확인해주세요!</span>");
					}
				}
			});
			
		});
		
		$('#googlelogout').click(function(){
			signOut();
		});
		
		
		$('#cancleFindIdBtn').click(function(){
			$('#result_IdSmall').empty();
		});
		
		$('#findIdBtn').click(function(){
			
			if($('#emp_no').val() == ''){ 
				alert("사번을 입력해주세요 !");
				$('#emp_no').focus();
			}else if( $('#emp_name').val() == '' ){
				alert("이름을 입력해주세요 !");
				$('#emp_name').focus();
			}else if( $('#cell_phone').val() == ''){
				alert('전화번호를 입력해주세요 !');
				$('#cell_phone').focus();
			}else{
				$.ajax({
					url:"findId.do",
					data: {
						emp_no : $('#emp_no').val(),
						emp_name : $('#emp_name').val(),
						cell_phone : $('#cell_phone').val()
					},
					type:"POST",
					success : function(data){
						$('#result_IdSmall').empty();
						if(data.id != null){
						$('#result_IdSmall').html("<br/><span style='color:blue;font-size:18px;'>아이디 : "+data.id+"</span>");
						}else{
							$('#result_IdSmall').html("<br/><span style='color:red;font-size:18px;'>정보가 없습니다.</span>");
						}
					}
					
				});
				$('#emp_no').val('');
				$('#emp_name').val('');
				$('#cell_phone').val('');
			}
			
		});
		
	});
	
	function onSignIn(googleUser) {
		  console.log("구글 로그인시 사용 : "+googleUser);
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
		
			$.ajax({
				url : "sessionOut.do",
				success : function(data){
					alert(data.result);
				}
			}); 
		  	var auth2 = gapi.auth2.getAuthInstance();
		    auth2.signOut().then(function () {
		      console.log('User signed out.');
		    });
		} 

		//주소 api 사용	 
	    function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var fullAddr = ''; // 최종 주소 변수
	                var extraAddr = ''; // 조합형 주소 변수

	                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    fullAddr = data.roadAddress;

	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    fullAddr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
	                if(data.userSelectedType === 'R'){
	                    //법정동명이 있을 경우 추가한다.
	                    if(data.bname !== ''){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있을 경우 추가한다.
	                    if(data.buildingName !== ''){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
	                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
	                document.getElementById('sample6_address').value = fullAddr;

	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById('sample6_address2').focus();
	            }
	        }).open();
	    }

	  
	  $(function(){
		  $('#googlelogout').click(function(){
			 // $('#username').val("구글 로그인 후 이용하세요");
			 $('#username').val('');
			 var test = $('#username').val();
	
		  });
		  
		  $('#numchk').click(function() {
			  
				$.ajax({
					type : "post",
					url : "numchk.do",
					data : "emp_no=" + $('#Register_emp_no').val(),
					success : function(data) {
						console.log(data);
						$('#numchkresult').empty();
						$('#numchkresult').append(data.numcheck);
					}
				})
			});
			
			$('#idchk').click(function() {
				$.ajax({
					type : "post",
					url : "idchk.do",
					data : "id=" + $('#Register_id').val(),
					success : function(data) {
						console.log(data);
						$('#idchkresult').empty();
						$('#idchkresult').append(data.idcheck);
					}
				})
			});
		  
	  })
	  
	  
	  
	</script>
</body>
</html>