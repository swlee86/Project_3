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
		        var result1 = result/1000/60/60/24;
		        return result1;
		    }
		
		
	
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
					},
					success : function(data) {
						$('#payResultDiv').empty();				
						var table = "";
						table+="<table cellpadding='1' cellspacing='1' class='table table-bordered table-condensed'>"
						table += "<tr><th style='background-color:#f9fafc'>지급일</th>";			
	  					table +="<td>"+data.payDTO.give_date+"</td>"
	  					table+="<th style='background-color:#f9fafc'>기본급여</th>";
	  					table+="<td>"+data.payDTO.basic_pay+"</td>";
	  					table+="<th style='background-color:#f9fafc'>추가근무수당</th>";
	  					table+="<td>"+data.payDTO.add_pay+"</td>";
	  					table+="<th style='background-color:#f9fafc'>상여금</th>";
	  					table+="<td>"+data.payDTO.bonus+"</td>";
	  					table+="<th style='background-color:#f9fafc'>총지급액</th>";
	  					table+="<td>"+data.payDTO.total_pay+"</td>";
	  					table +="</tr></table>";
					
	  					$('#payResultDiv').html(table);
					},error : function(){
						alert("조회하신 데이터가 없습니다.");
						$('#payResultDiv').empty();				
						
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
							    },
							success:function(data){
								$('#payResultDiv').empty();
								console.log(data.YearlyPay.length);
								//alert("ajax Year success 선택한 날짜: "+data.YearlyPay[0].give_date);
								
								if(data.YearlyPay.length !=0){
									
								var table = "";
								table+="<table cellpadding='1' cellspacing='1'class='table table-bordered table-condensed'>"
	    			 			for(var i = 0; i < data.YearlyPay.length; i++){

	    			 				table += "<tr><th style='background-color:#f9fafc'>지급일</th>";	
	    		  					table +="<td>"+data.YearlyPay[i].give_date+"</td>"
	    		  					table+="<th style='background-color:#f9fafc'>기본급여</th>";
	    		  					table+="<td>"+data.YearlyPay[i].basic_pay+"</td>";
	    		  					table+="<th style='background-color:#f9fafc'>추가근무수당</th>";
	    		  					table+="<td>"+data.YearlyPay[i].add_pay+"</td>";
	    		  					table+="<th style='background-color:#f9fafc'>상여금</th>";
	    		  					table+="<td>"+data.YearlyPay[i].bonus+"</td>";
	    		  					table+="<th style='background-color:#f9fafc'>총지급액</th>";
	    		  					table+="<td>"+data.YearlyPay[i].total_pay+"</td>";
	    		  					
	    			 			}
								table +="</tr></table>";
	    			 			$('#payResultDiv').html(table);
	    			 			}else{
	    			 				alert("조회하신 데이터가 없습니다.");
									$('#payResultDiv').empty();	
	    			 			}
								
							},
							error:function(){
								alert("조회하신 데이터가 없습니다.");
								$('#payResultDiv').empty();		
							} 
						}
					  );
				
			});
			
			//퇴직금 계산 조회시 사용하는 datepicker
			$('#selectDate').datepicker({
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
			
			//퇴직금 계산 조회버튼 클릭
			$('#sevSearchbtn').click(function() {
				var option = $("#selected option:selected").val();

				var date = $('#selectDate').val();
				
				var ardate = date.split("-");
				var makeDate = new Date(ardate[0],ardate[1],ardate[2]);				
				makeDate=getFormatDate(makeDate);
				
				console.log("#########minus : "+makeDate + " ##### date : "+date);
				
				
				//3개월 뺀 날짜 결과
				var result = calDateRange(makeDate,date);
				
				
				if (option == '' || date == '') {
					alert("조회할 조건을 선택하세요");
				} else {
					alert("option: "+option +" /date "+date);
					$.ajax({
						url : "sevSearch.do",
						data : {
							select : option,
							date : date,
							minusDate : result
						},
						success : function(data) {
							console.log(data);
							$('#jung').html();
							$('#total').html();
							$('#severance_pay').html();
							
							if(data.day>=365){
							$('#jung').html(data.date);
							$('#total').html(data.day);
							$('#severance_pay').html(data.dayMoney +"만원");
							
							}else{
								alert('근속연수가 1년이상일 경우만 조회가능합니다.');
							}
							
							
						}

					});
				}
			});
			
			//급여 마감 조회
			$('#salaryCloseForm').submit(function(){
				alert("테스트!!");
				//var pay_no = new Array();
				var pay_no2='';
				$("input[name=checkbox]:checked").each(function() {
					//pay_no.push($(this).val());
					pay_no2+=$(this).val() +",";
				});
				
				
				if(pay_no2 != ''){
					$('#hiddenPay').val(pay_no2);
					return true;
				}else{
					alert("선택 요망!");
					return false;
				}
				
			});
			

		});
		
		//날짜 포맷 형식 맞출때 사용 하는 첫번째 함수.
		function getFormatDate(date){
			var year = date.getFullYear();                               
			var month = date.getMonth()-3;
			
			if(month <= 0){
				year = year -1;
				month = (12+date.getMonth())-3;
				month = month >= 10 ? month : '0' + month; 
			}

			month = month >= 10 ? month : '0' + month; 
			
			var day = date.getDate();  
			day = day >= 10 ? day : '0' + day;       
			return  year + '-' + month + '-' + day;
		}
		
		
	</script>

</body>
</html>