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
<link rel="stylesheet"
	href="vendor/fullcalendar/dist/fullcalendar.print.css" media='print' />
<link rel="stylesheet"
	href="vendor/fullcalendar/dist/fullcalendar.min.css" />
<link rel="stylesheet" href="vendor/select2-3.5.2/select2.css" />
<link rel="stylesheet"
	href="vendor/select2-bootstrap/select2-bootstrap.css" />
<link rel="stylesheet"
	href="vendor/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.css" />
<link rel="stylesheet"
	href="vendor/bootstrap-datepicker-master/dist/css/bootstrap-datepicker3.min.css" />
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
	<script src="vendor/metisMenu/dist/metisMenu.min.js"></script>
	<script src="vendor/iCheck/icheck.min.js"></script>
	<script src="vendor/sparkline/index.js"></script>
	<script src="vendor/moment/min/moment.min.js"></script>
	<script src="vendor/fullcalendar/dist/fullcalendar.min.js"></script>
	<script
		src="vendor/bootstrap-datepicker-master/dist/js/bootstrap-datepicker.min.js"></script>
	<script src="vendor/select2-3.5.2/select2.min.js"></script>
	<script src="vendor/moment/moment.js"></script>
	<script
		src="vendor/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js"></script>

	<!--월별 캘린더.-->
	<script src="<c:url value="/js/jquery.mtz.monthpicker.js"/>"></script>

	<!-- App scripts -->
	<script src="scripts/homer.js"></script>

	<script>
		/* 
		 $('#student').click(function(){      
		 $('#studentForm').css('display','block');
		 $('#schoolForm').css('display','none');
		 $('#student').attr('class','btn btn-primary active');
		 $('#school').attr('class','btn btn-primary');
		 });

		 $('#school').click(function(){
		 $('#studentForm').css('display','none');
		 $('#schoolForm').css('display','block');
		 $('#school').attr('class','btn btn-primary active');
		 $('#student').attr('class','btn btn-primary');

		 }); */
		 
		 
		//select box에서 월별 조회 선택시 나타날 div(monthpicker)
		$('#selectedMonth').css('display', 'none');
		//select box에서 연도별 조회 선택시 나타날 div
		$('#selectedYear').css('display', 'none');

		
		
	
		$(function() {
			
			$('#salarysearch').change(function(){
		        var selectOption = $('#salarysearch option:selected').val();
		        if(selectOption == "연도별"){
		        	alert("연도별");
		        	$('#selectedYear').css('display', 'block');
					$('#selectedMonth').css('display', 'none');	
		        }else if(selectOption =="월별"){
		        	alert('월별');
		        	$('#selectedYear').css('display', 'none');
					$('#selectedMonth').css('display', 'block');
		        }
		    });
			
			var currentYear = (new Date()).getFullYear();
			var startYear = currentYear - 10;
			var options = {
				startYear : startYear,
				finalYear : currentYear,
				pattern : 'yyyy-mm',
				monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
						'9월', '10월', '11월', '12월' ]
			};

			//월별 급여 조회
			$('#Monthly').monthpicker(options);
			
			//월별 급여 조회
			$('#MonthlySal').click(function() {
				var date = $('#Monthly').val();
				var option = $("#salarysearch option:selected").val();

				alert("선택한 날짜 : " + date);
				
				$.ajax(

				{
					url : "MonthlysalSearch.do",
					data : {
						date : date,
						option : option
					},
					success : function(data) {
						$('#payResultDiv').empty();
						console.log(data.payDTO);
						var table = "";
						table += "<tr><th style='background-color:#f9fafc'>지급기준일</th>";			
	  					table +="<td>"+data.payDTO.give_date+"</td>"
	  					table+="<th style='background-color:#f9fafc'>지급총액</th>";
	  					table+="<td>"+data.payDTO.total_pay+"</td>";
	  					table+="<th style='background-color:#f9fafc'>공제총액</th>";
	  					table+="<td></td>";
	  					table+="<th style='background-color:#f9fafc'>실지급액</th>";
	  					table+="<td></td>";
	  					table +="</tr>";
					
	  					$('#payResultDiv').html(table);
					},error : function(){
						alert("조회하신 데이터가 없습니다.");
					}
				}

				);

			});
		//연도별 급여 조회
			$('#YearlySal').click(function(){
				alert("연도별 선택");
				var date =  $("#Yearly option:selected").val();
				var option = $("#salarysearch option:selected").val();

				$.ajax(
						{
							url:"YearlysalSearch.do",
							data:{
								date: date,
								option:option
							     },
							success:function(data){
								alert("ajax Year success 선택한 날짜: "+data.date);
							}     
						}
					  );
				
			});
			
			//퇴직금 계산 조회시 사용하는 datepicker
			$('#selectDate').datepicker();
			
			//퇴직금 계산 조회버튼 클릭
			$('#sevSearchbtn').click(function() {
				var option = $("#selected option:selected").val();

				var date = $('#selectDate').val();

				if (option == '' || date == '') {
					alert("조회할 조건을 선택하세요");
				} else {

					$.ajax({
						url : "sevSearch.do",
						data : {
							select : option,
							date : date
						},
						success : function(data) {
							alert('퇴직금 조회');
							$('#sevResult').html("data: " + data.select);
						}

					});
				}
			});

		});
	</script>

</body>
</html>