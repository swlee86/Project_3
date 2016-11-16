<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>    
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
    <link rel="stylesheet" href="vendor/summernote/dist/summernote.css" />
    <link rel="stylesheet" href="vendor/summernote/dist/summernote-bs3.css" />
    <link rel="stylesheet" href="vendor/clockpicker/dist/bootstrap-clockpicker.min.css" />
    <link rel="stylesheet"
	href="vendor/bootstrap-datepicker-master/dist/css/bootstrap-datepicker3.min.css" />
    
    <!-- App styles -->
    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css" />
    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/css/helper.css" />
    <link rel="stylesheet" href="styles/style.css">
    <link rel="stylesheet" href="styles/static_custom.css">

<!--jQuery UI CSS-->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />





</head>
<body class="fixed-navbar fixed-sidebar">

<!-- Simple splash screen-->
<div class="splash"> <div class="color-line"></div><div class="splash-title"><h1>2PM</h1><p>Now loading...</p><div class="spinner"> <div class="rect1"></div> <div class="rect2"></div> <div class="rect3"></div> <div class="rect4"></div> <div class="rect5"></div> </div> </div> </div>

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
<script src="vendor/clockpicker/dist/bootstrap-clockpicker.min.js"></script>
	<!--월별 캘린더.-->
	<script src="<c:url value="/js/jquery.mtz.monthpicker.js"/>"></script>


<!-- App scripts -->
<script src="scripts/homer.js"></script>
<script>
	$(function(){
		
	
		
		var currentYear = (new Date()).getFullYear();
		var startYear = currentYear - 10;
		var options = {
			startYear : startYear,
			finalYear : currentYear,
			pattern : 'yyyy-mm',
			monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
					'9월', '10월', '11월', '12월' ]
		};
		
		//매출 등록시 월 선택
		$('#selectSalesdate').monthpicker(options);
		//매출 목록에서 날짜로 검색시 사용
		$('#salesdate').monthpicker(options);
		
		//개발부서 클릭시 아작스 이용
		$('#depart').click(function(){
			
			$.ajax(
					 {
						url:"adminDepart_depart.do",
						data : 
						{
							"depart" : $('#depart').html()	
						},
						success : function(data){
							console.log(data);
							var text = "<h3>"+$('#depart').html()+"</h3>";
							text += "<table class='table'><tr><th></th><th>이름</th><th>나이</th>";
							
							$.each(data, function(index){
								console.log(index);
								text += "<tr><td><input type='checkbox'></td><td>"+data[index].name +"</td><td>"+data[index].age+"</td><tr/>";
							});
							
							text+="</table>";
							text+="<input type='button' class='btn btn-default' value='버튼입니다'>";
							$('#departList').html('');
							$('#departList').html(text);
						}
				     }
				  ); 
			
		});
	});
	
	// 시간정보 관리 페이지 - ClockPicker
    $('.clockpicker').clockpicker({autoclose: true});

</script>
</body>
</html>