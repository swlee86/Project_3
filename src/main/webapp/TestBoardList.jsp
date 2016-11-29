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

<!-- App styles -->
<link rel="stylesheet"
	href="fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css" />
<link rel="stylesheet" href="fonts/pe-icon-7-stroke/css/helper.css" />
<link rel="stylesheet" href="styles/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

</head>
<body class="fixed-navbar fixed-sidebar">

	<!-- Simple splash screen-->
	<div class="splash">
		<div class="color-line"></div>
		<div class="splash-title">
			<h1>Homer - Responsive Admin Theme</h1>
			<p>Special Admin Theme for small and medium webapp with very
				clean and aesthetic style and feel.</p>
			<div class="spinner">
				<div class="rect1"></div>
				<div class="rect2"></div>
				<div class="rect3"></div>
				<div class="rect4"></div>
				<div class="rect5"></div>
			</div>
		</div>
	</div>
	<!--[if lt IE 7]>
<p class="alert alert-danger">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
<![endif]-->

	<!-- Header -->
	<jsp:include page="/sidebar/header.jsp" />
	<!--싸이드 메뉴-->
	<jsp:include page="/sidebar/aside.jsp" />



	<!-- Main Wrapper -->
	<div id="wrapper">

		<div class="content animate-panel">
			<div class="row">
				<div class="col-lg-12">
					<div class="hpanel">
						<div class="panel-heading">
							<div class="panel-tools">
								<a class="showhide"><i class="fa fa-chevron-up"></i></a> <a
									class="closebox"><i class="fa fa-times"></i></a>
							</div>
						</div>
						<div class="panel-body">
							<h3>공지사항</h3>
						</div>
					</div>
				</div>

			</div>

			<div class="row">
				<div class="col-lg-12">
					<div class="hpanel">

						<div class="panel-body">
							<div class="table-responsive">
								<table cellpadding="1" cellspacing="1" class="table table-bordered table-striped">
									<thead>
										<tr>
											<th>No.</th>
											<th>제목</th>
											<th>내용</th>
											<th>날짜</th>
											<th>글쓴이</th>
										</tr>
									</thead>
									<tbody id="testTbody">
										<tr>
											<td>첫번쨰</td>
											<td>공지사항테스트</td>
											<td>내용들어갑니다.</td>
											<td>2016-10-24</td>
											<td>admin</td>
										</tr>
									</tbody>
								</table>
								
								<input type="button" id="noteWriteBtn" class="btn btn-default text-right" value="공지사항쓰기">
								<input type="button" id="test" value="테스트글쓰기">
								<input type="button" id="dongButton" value="값뽑아보기">
							</div>
						</div>

					</div>

				</div>
			</div>




		</div>
	<div id="testDiv">
		
	</div>

		<!-- Footer-->
		<footer class="footer">
			<span class="pull-right"> Example text </span> Company 2015-2020
		</footer>

	</div>
	
	



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

	<script>
	$(function(){
		$('#noteWriteBtn').click(function(){
			location.href="TestEmailView.jsp";
		});
		$('#test').click(function(){
			var testoh = "<input type='text' class='form-control' name='testInput'><br/>";
			$('#testDiv').append(testoh);
			
		});
		
		$('#dongButton').click(function(){
			var length = $("input[name=testInput]").length;
			alert("숫자 : "+length);
			var array =[length];
			
			//array.push($('#testDiv').children().next().val());
			
			for(var i = 0; i< array.length; i++){
			
				for(var j = i; j <= i; j++ ){
					console.log(j);
					alert("j: " + j);
					array[j] = $('#testDiv').children().eq(j).val();	
				//console.log($("input[name=testInput]").next().val());
					
					console.log(array);		
				}
				
			}
			
			for(var i = 0; i < array.length; i++){
				alert(array[i]);
			}
			
		});
		
	});
	</script>
	
</body>
</html>