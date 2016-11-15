<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>    
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
	
	<!--jQuery UI CSS-->
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />   
	
	<style>
.ui-datepicker-calendar {
    display: none;
 }
    
</style>

</head>
<body class="fixed-navbar fixed-sidebar">

<!-- Simple splash screen-->
<div class="splash"> <div class="color-line"></div><div class="splash-title"><h1>Homer - Responsive Admin Theme</h1><p>Special Admin Theme for small and medium webapp with very clean and aesthetic style and feel. </p><div class="spinner"> <div class="rect1"></div> <div class="rect2"></div> <div class="rect3"></div> <div class="rect4"></div> <div class="rect5"></div> </div> </div> </div>
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

<!--월별 캘린더.-->  
<script src="<c:url value="/js/jquery.mtz.monthpicker.js"/>"></script> 


<!-- App scripts -->
<script src="scripts/homer.js"></script>

<script>
$(function(){
	var currentYear = (new Date()).getFullYear();
    var startYear = currentYear-10;
	var options = {
	           startYear: startYear,
	           finalYear: currentYear,
	           pattern: 'yyyy-mm',
	           monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
	   };
	//데이트피커
	$('#Monthly').monthpicker(options);
	//$('#sevdate1').monthpicker(options);
	
	$('#searchicon').click(function(){
		var date = $('#Monthly').val();
		alert("선택한 날짜 : "+date);
		
	});
	$('#searchicon_sevdate1').click(function(){
		var date = $('#sevdate1').val();
		alert("선택한 날짜 : "+date);
		
	});

	$('#sevdate1').datepicker({
	     changeMonth: true, 
        dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
        monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        dateFormat: 'yy-mm-dd'
});	
	
	
});
</script>

</body>
</html>