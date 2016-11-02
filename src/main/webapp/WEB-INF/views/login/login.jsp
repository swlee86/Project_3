<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Page title -->
<title>HOMER | WebApp admin theme</title>

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<!--<link rel="shortcut icon" type="image/ico" href="favicon.ico" />-->

<!-- Vendor styles -->
<link rel="stylesheet" href="vendor/fontawesome/css/font-awesome.css" />
<link rel="stylesheet" href="vendor/metisMenu/dist/metisMenu.css" />
<link rel="stylesheet" href="vendor/animate.css/animate.css" />
<link rel="stylesheet" href="vendor/bootstrap/dist/css/bootstrap.css" />

<!--얼럿창 스타일 먹이기-->
<link rel="stylesheet" href="vendor/sweetalert/lib/sweet-alert.css" />
<link rel="stylesheet" href="vendor/toastr/build/toastr.min.css" />


<!-- App styles -->
<link rel="stylesheet"
	href="fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css" />
<link rel="stylesheet" href="fonts/pe-icon-7-stroke/css/helper.css" />
<link rel="stylesheet" href="styles/style.css">
</head>
<body class="landing-page">

	<!-- Simple splash screen-->
	<!--화면에 로딩되게 전에 뭐 안되면 이거 뜸 -->


	<!--[if lt IE 7]>
	<p class="alert alert-danger">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
	<![endif]-->

	<header id="page-top">
		<div class="container">
			<div class="heading">

				<div class="login-container">
					<div class="row">
						<div class="col-md-12">
							<div class="text-center m-b-md">
								<h3>로그인</h3>
								<small>WelCome 2pm!</small>
							</div>
							<div class="hpanel">
								<div class="panel-body">
									<form action="#" id="loginForm" method="POST">
										<div class="form-group">
											<label class="control-label" for="username" style="color: black;">아이디</label> <input
												type="text" placeholder="example@gmail.com"
												title="Please enter you username" required="" value=""
												name="username" id="username" class="form-control">
											<span class="help-block small">Your unique username to
												app</span>
										</div>
										<div class="form-group">
											<label class="control-label" for="password" style="color: black;">비밀번호</label> <input
												type="password" title="Please enter your password"
												placeholder="******" required="" value="" name="password"
												id="password" class="form-control"> <span
												class="help-block small">Yur strong password</span>
										</div>
										<div class="checkbox">
											<input type="checkbox" class="i-checks" checked> 
												<label style="color: black;">로그인상태 유지</label>
											<p class="help-block small">(if this is a private
												computer)</p>
										</div>
										<input type="submit" class="btn btn-success btn-block"
											value="로그인" id="loginSubmitBtn"> <a
											class="btn btn-default btn-block" href="AddMember.do">회원가입</a>
									</form>
								</div>
							</div>
						</div>
					</div>

			</div>
	
				</div>
				
			</div>
	</header>
	<div class="heading-image animate-panel" data-child="img-animate"
					data-effect="fadeInRight" style="height: 100%;"></div>
	<!-- Vendor scripts -->
	<script src="vendor/jquery/dist/jquery.min.js"></script>
	<script src="vendor/jquery-ui/jquery-ui.min.js"></script>
	<script src="vendor/slimScroll/jquery.slimscroll.min.js"></script>
	<script src="vendor/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="vendor/metisMenu/dist/metisMenu.min.js"></script>
	<script src="vendor/iCheck/icheck.min.js"></script>
	<script src="vendor/sparkline/index.js"></script>

	<!-- App scripts -->
	<script src="scripts/homer.js"></script>


</body>
</html>