<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<link rel="stylesheet" href="vendor/sweetalert/lib/sweet-alert.css" />

<link rel="stylesheet"
	href="vendor/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" />
<link rel="stylesheet" href="vendor/select2-3.5.2/select2.css" />
<link rel="stylesheet"
	href="vendor/select2-bootstrap/select2-bootstrap.css" />



<!-- App styles -->
<link rel="stylesheet"
	href="fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css" />
<link rel="stylesheet" href="fonts/pe-icon-7-stroke/css/helper.css" />
<link rel="stylesheet" href="styles/style.css">


<!--jQuery UI CSS-->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />

<!-- jquery ui -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />



<style>
span.sty {
	clear: both;
}

label.sty {
	width: 100px;
	margin-right: 30px;
	border-radius: 3px;
	border: 1px solid #ccc;
	color: #999;
}

/* hide input */
input.radio:empty {
	margin-left: -2999px;
}

input[type="radio"] {
	visibility: hidden;
}

/* style label */
input.radio:empty ~ label {
	position: relative;
	float: left;
	line-height: 2.5em;
	text-indent: 3.25em;
	margin-top: 2em;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

input.radio:empty ~ label:before {
	position: absolute;
	display: block;
	top: 0;
	bottom: 0;
	left: 0;
	content: '';
	width: 0.1em;
	background: white;
	border-radius: 3px 0 0 3px;
}

/* toggle hover */
input.radio:hover:not (:checked ) ~ label:before {
	content: '';
	text-indent: .9em;
	color: red;
	width: 0.1em;
}

input.radioa:hover:not (:checked ) ~ label {
	color: #3498db;
}

input.radior:hover:not (:checked ) ~ label {
	color: #e67e22;
}

input.radiow:hover:not (:checked ) ~ label {
	color: #a86ebf;
}

input.radioa:checked ~ label:before {
	content: '승인';
	text-indent: .9em;
	width: 100%;
	color: white;
	text-align: center;
	padding-left: 10px;
	background-color: #3498db;
}

input.radior:checked ~ label:before {
	content: '거부';
	text-indent: .9em;
	width: 100%;
	color: white;
	text-align: center;
	background-color: #e67e22;
}

input.radiow:checked ~ label:before {
	content: '보류';
	text-indent: .9em;
	width: 100%;
	color: white;
	text-align: center;
	background-color: #a86ebf;
}

input.radio:checked ~ label {
	color: white;
}

input.radio:focus ~ label:before {
	box-shadow: 0 0 0 3px #999;
}

ul {
	padding-left: 0px;
}
</style>





</head>
<body class="fixed-navbar fixed-sidebar">

	<!-- Simple splash screen-->
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

	<!--[if lt IE 7]>
<p class="alert alert-danger">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
<![endif]-->

	<!-- Header -->
	<tiles:insertAttribute name="header" />

	<!-- Navigation -->
	<tiles:insertAttribute name="sidebar" />

	<!-- Main Wrapper -->
	<div id="wrapper">
		<tiles:insertAttribute name="content" />

		<!-- Right sidebar -->
		<tiles:insertAttribute name="rightsidebar" />

		<!-- Footer-->
		<tiles:insertAttribute name="footer" />

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
	<script src="vendor/sweetalert/lib/sweet-alert.min.js"></script>
	<!-- App scripts -->
	<script src="scripts/homer.js"></script>
	<script type="text/javascript">
		$('#makeuserUpdateDate').datepicker(
				{
					changeMonth : true,
					dayNames : [ '월요일', '화요일', '수요일', '목요일', '금요일', '토요일',
							'일요일' ],
					dayNamesMin : [ '월', '화', '수', '목', '금', '토', '일' ],
					monthNamesShort : [ '1', '2', '3', '4', '5', '6', '7', '8',
							'9', '10', '11', '12' ],
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					dateFormat : 'yy-mm-dd',
					changeYear : true
				});

		$('#makeuserUpdateDate2').datepicker(
				{
					changeMonth : true,
					dayNames : [ '월요일', '화요일', '수요일', '목요일', '금요일', '토요일',
							'일요일' ],
					dayNamesMin : [ '월', '화', '수', '목', '금', '토', '일' ],
					monthNamesShort : [ '1', '2', '3', '4', '5', '6', '7', '8',
							'9', '10', '11', '12' ],
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					dateFormat : 'yy-mm-dd',
					changeYear : true
				});
		$('.demo4').click(function() {
			swal({
				title : "삭제 하시겠습니까?",
				text : "확인을 누르시면 선택하신  업무가 삭제 됩니다.",
				type : "warning",
				showCancelButton : true,
				confirmButtonColor : "#DD6B55",
				confirmButtonText : "확인",
				cancelButtonText : "취소",
				closeOnConfirm : false,
				closeOnCancel : false
			}, function(isConfirm) {
				if (isConfirm) {
					swal("삭제되었습니다", "선택하신 업무가 삭제되었습니다", "success");
				} else {
					swal("취소되었습니다.", "선택하신 업무가 유지됩니다 :)", "error");
				}
			});
		});
		$('.demo2').click(function() {
			swal({
				title : "등록성공",
				text : "정상적으로 업무가 등록되었습니다.",
				type : "success"
			});
		});

		$(function() {
			$('#deptA').click(
					function() {

						var litag = "<ul>";

						$.ajax({
							url : "taskWriteModal.do",
							success : function(data) {

								var departMent = "";

								$('#myModal6').modal();
								$.each(data, function(index) {

									departMent = data[index];
								});

								console.log("departMent : " + departMent);

								$.each(departMent, function(index) {
									litag += "<li onclick='seeDepart(this)'>"
											+ departMent[index].branch_name
											+ "</li>";
								});

								litag += "</ul>";

								$('#organization').html(litag);

							}
						})
					});
		});

		//부서 출력 하는 아작스
		function seeDepart(obj) {

			alert("지점 리스트 클릭 !");
			var name = $(obj).text();

			$.ajax({
				url : "taskDeptModal.do",
				type : "GET",
				data : {
					branch_name : name
				},
				success : function(data) {
					var dept;
					console.log(data);
					$.each(data, function(index) {
						dept = data[index];
					});

					$.each(dept, function(index) {
						$(obj).append(
								"<br>&nbsp;&nbsp;<span onclick='seelow_Depart(this)'>"
										+ dept[index].dept_name + "</span>");
					});

				}
			});
		}

		function seelow_Depart(obj) {

			var low_dept = $(obj).text();

			$.ajax({
				url : "tasklow_deptModal.do",
				data : {
					dept_name : low_dept
				},

				success : function(data) {

					var low_dept = "";
					$.each(data, function(index) {
						low_dept = data[index];
					});

					$.each(low_dept, function(index) {
						$(obj).append(
								"<br>&nbsp;&nbsp&nbsp;&nbsp;<span onclick='seeEmpMember(this)'>"
								+ low_dept[index].low_dept_name + "</span>");

					});
				}

			});
		}
		
		//사원 뽑아오기
		function seeEmpMember(obj){
			//클릭한 text 값 뽑아옴.
			var low_dept = $(obj).text();
			alert("seeEmpMember : "+low_dept);
			var makeTable = "<table class='table'><tr><th>사번</th><th>이름</th>";
			$.ajax(
					{
						url: "taskEmpModal.do",
						data:{
							    low_dept_name: low_dept
						     },
						success:function(data){
							var emp = "";
							$.each(data, function(index){
								emp = data[index];
							});
							
							$.each(emp, function(index){
								makeTable += "<tr><td>"+emp[index].emp_no+"</td><td>"+emp[index].emp_name+"</td></tr>";
							});
							makeTable += "</table>";
							$('#empList').empty();
							$('#empList').append(makeTable);
						 }    
						
					}
			      );
		}
		
	</script>
</body>
</html>