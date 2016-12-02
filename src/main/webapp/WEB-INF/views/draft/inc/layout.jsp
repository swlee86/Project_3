<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">

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
<link rel="stylesheet"
	  href="fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css" />
<link rel="stylesheet" href="fonts/pe-icon-7-stroke/css/helper.css" />
<link rel="stylesheet" href="styles/style.css">


<!--jQuery UI CSS-->
<link rel="stylesheet"
	  href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	  type="text/css" />
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
<![endif]

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
	<script src="vendor/metisMenu/dist/metisMenu.min.js"></script>
	<script src="vendor/iCheck/icheck.min.js"></script>
	<script src="vendor/sparkline/index.js"></script>

	<!--전자결재 script  -->
	<script src="js/electronic_sanction/electronic_sanction.js"></script>

	<!--우편번호 API-->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

	<!-- App scripts -->
	<script src="scripts/homer.js"></script>
	
	<!--월별 캘린더.-->
	<script src="<c:url value="/js/jquery.mtz.monthpicker.js"/>"></script>

	<script type="text/javascript">
		// 결재 유형을 변경할 때마다
		
		
		function checkDraft() {
			$('#document_table').empty();
			
			var choose = $("input[name='cg_no']:checked").val();

			$.ajax({
				url : "draftForm.do",
				type : "get",
				data : {
						cg_no : choose
					   },
				success : function(result) {
					$("#document_table").html(result);
				}
			});
		};
		
		$("#submitBtn").click(function() {
			var choose = $("input[name='cg_no']:checked").val();
			console.log("check1");
			console.log(choose);
			
			draft.method = "post";
			
			if(choose == '1') {
				draft.action = "draftOffice.do";
			} else if(choose == '2') {
				draft.action = "draftOffice.do";
			} else if(choose == '3') {
				draft.action = "draftOffice.do";
			}
			
			draft.submit();
		});
	</script>
</body>
</html>