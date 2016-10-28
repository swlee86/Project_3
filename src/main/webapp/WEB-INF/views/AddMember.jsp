<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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

<!-- App styles -->
<link rel="stylesheet"
	href="fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css" />
<link rel="stylesheet" href="fonts/pe-icon-7-stroke/css/helper.css" />
<link rel="stylesheet" href="styles/style.css">

</head>
<body class="blank">

	<div class="color-line"></div>

	<div class="back-link">
		<a href="index.do" class="btn btn-primary">메인으로 가기</a>
	</div>

	<div class="login-container">

		<div class="row">
			
			<div class="col-md-12">
			
			<div class="text-center m-b-md">
				<h3>회원가입 페이지</h3>
			</div>
			
				<div class="hpanel">
					<!--흰 화면 -->
					<div class="panel-body">
						<form action="" method="post">
			
							<div class="form-group">
								<label class="control-label" for="userId">아이디</label>
							    <input type="text" class="form-control" id="userId" name="userId">
							    <span>아이디체크</span>
							</div>

							<div class="form-group">
								<label class="control-label" for="userPw">비밀번호</label>
							    <input type="password" class="form-control" id="userPw" name="userPw">
							</div>

							<div class="form-group">
								<label class="control-label" for="userName">이름</label>
							    <input type="text" class="form-control" id="userName" name="userName">
							</div>
							
							<div class="form-group">
								<label class="control-label" for="userName">전화번호</label>
							    <input type="text" class="form-control" id="userName" name="userName">
							</div>
							
							<div class="form-group">
								
							    <input type="submit" class="btn btn-success btn-block" value="회원가입">
							    
							</div>
							

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>