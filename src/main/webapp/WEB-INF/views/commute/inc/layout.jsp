<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
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
<link rel="stylesheet"
	href="vendor/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" />


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
	
	//날짜 차이 구하는 함수
    function calDateRange(val1, val2)
 {
     var FORMAT = "-";
     // FORMAT을 포함한 길이 체크
     if (val1.length != 10 || val2.length != 10)
         return null;
     // FORMAT이 있는지 체크
     if (val1.indexOf(FORMAT) < 0 || val2.indexOf(FORMAT) < 0)
         return null;
     // 년도, 월, 일로 분리
     var start_dt = val1.split(FORMAT);
     var end_dt = val2.split(FORMAT);
     // 월 - 1(자바스크립트는 월이 0부터 시작하기 때문에...)
     // Number()를 이용하여 08, 09월을 10진수로 인식하게 함.
     start_dt[1] = (Number(start_dt[1]) - 1) + "";
     end_dt[1] = (Number(end_dt[1]) - 1) + "";

     var from_dt = new Date(start_dt[0], start_dt[1], start_dt[2]);
     var to_dt = new Date(end_dt[0], end_dt[1], end_dt[2]);
     var result = (to_dt.getTime() - from_dt.getTime());
  	 alert("날짜 차이좀 보자 씨발탱아hhh : "+ result/1000/60/60/24);
  	 
     var result1 = result/1000/60/60/24;
     return result1;
 }

	
	
  //날짜 포맷팅 함수 - 현재 날짜 구함 
    function dateChek(){
	  	alert("그냥 날짜");
    	var date = new Date();
    	var year  = date.getFullYear();
        var month = date.getMonth() + 1; // 0부터 시작하므로 1더함 더함
        var day   = date.getDate();

        if (("" + month).length == 1) { month = "0" + month; }
        if (("" + day).length   == 1) { day   = "0" + day;   }
    	//오늘 날짜 전역변수에도 담음
        var today = year+"-"+month+"-"+day;
        return today;
    }
  
  
	//디비 에서 읽어온 날짜.  매월 25일 임
    function db_dateChek(){
		alert("디비 날짜");
    	var date = new Date();
    	var year  = date.getFullYear();
        var month = date.getMonth() + 1; // 0부터 시작하므로 1더함 더함
        var day   = "${25}";

        if (("" + month).length == 1) { month = "0" + month; }
        if (("" + day).length   == 1) { day   = "0" + day;   }
    	//오늘 날짜 전역변수에도 담음
        var today = year+"-"+month+"-"+day;
    	console.log("디비 날짜 : "+today);
        return today;
    }
  
	
	$(function() {
		
			$('#writeOtherAttendace').datepicker(
					{
						changeMonth : true,
						dayNames : [ '월요일', '화요일', '수요일', '목요일', '금요일', '토요일',
								'일요일' ],
						dayNamesMin : [ '월', '화', '수', '목', '금', '토', '일' ],
						monthNamesShort : [ '1', '2', '3', '4', '5', '6', '7',
								'8', '9', '10', '11', '12' ],
						monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월',
								'7월', '8월', '9월', '10월', '11월', '12월' ],
						dateFormat : 'yy-mm-dd',
						changeYear : true
					});
			$('#writeOtherAttendace2').datepicker(
					{
						changeMonth : true,
						dayNames : [ '월요일', '화요일', '수요일', '목요일', '금요일', '토요일',
								'일요일' ],
						dayNamesMin : [ '월', '화', '수', '목', '금', '토', '일' ],
						monthNamesShort : [ '1', '2', '3', '4', '5', '6', '7',
								'8', '9', '10', '11', '12' ],
						monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월',
								'7월', '8월', '9월', '10월', '11월', '12월' ],
						dateFormat : 'yy-mm-dd',
						changeYear : true
					});
			
		
		//Month 캘린더 실행
		
			var currentYear = (new Date()).getFullYear();
			var startYear = currentYear - 10;
			var options = {
				startYear : startYear,
				finalYear : currentYear,
				pattern : 'yyyy-mm',
				monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
						'9월', '10월', '11월', '12월' ]
			};
			//데이트피커
			$('#select_date').monthpicker(options);
			
			
			
			
			//근태 마감 전체선택 체크박스 
			$('#allCheck').click(function(){
				if($("#allCheck").prop("checked")) {
					$("input[type=checkbox]").prop("checked",true);
				}else{
					$("input[type=checkbox]").prop("checked",false);
				}				
			});
			
			
			//마감하기 버튼 클릭시 
			$('#commuteForm').submit(function(){
				//오늘 날짜 구함
				var today = dateChek();
				alert("알겠으니 오늘 날짜는 먼데 : "+today);
				var dbdate = db_dateChek();
				alert("디비 데이트 : "+ dbdate);
				var result2 = calDateRange(today,dbdate);
				
					
				//기간이 3일 이하
				if(result2 <= 3){
				
					var chkValue = '';
					 $('input:checkbox[name="checkbox"]').each(function() {
						 if(this.checked){
							 var chk = $(this).attr('value');
							 console.log("이것??: "+$(this).attr('value'));
							 chkValue += (chk+",");
						 }
					 });
	
					 if(chkValue != ''){
						 //번호값 뽑아서 셋팅해줌
						 $('#chkhidden').val(chkValue);
						 return true;
					 }else{
						 alert("체크박스 선택해주세요");
						 return false;	 
					 }
				}else{
					alert("마감 기간이 아닙니다.");
					return false;
					
				}
				
			});
			

		});
		
		
		
		
	</script>


</body>
</html>