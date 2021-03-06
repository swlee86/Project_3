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
    <title>ToInfra</title>

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
    <link rel="stylesheet" href="styles/layer.css">
    <!-- alert 창 -->
	<link rel="stylesheet" href="vendor/sweetalert/lib/sweet-alert.css" />

<!--jQuery UI CSS-->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />

  <link rel="stylesheet" href="vendor/toastr/build/toastr.min.css" />
	<style>
		.detailSpan{
		
		}
		
		#sortable{
			padding-left:0px;
		 	list-style:none;
			width : 100%;
			height : 100px;
		}
		
		#sortable li{
			font-size : 15px;
			margin:20px;
		}
		
		#branchUl{
			 list-style:none;
			 	
		}
		
		.toast-message{
			color :black;
		}
		
	</style>



</head>
<body class="fixed-navbar fixed-sidebar">

<!-- Simple splash screen-->
<div class="splash"> <div class="color-line"></div><div class="splash-title"><h1>ToInfra</h1><p>Now loading...</p><div class="spinner"> <div class="rect1"></div> <div class="rect2"></div> <div class="rect3"></div> <div class="rect4"></div> <div class="rect5"></div> </div> </div> </div>

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
<script src="js/layer/layerpop.js"></script>
	<!--월별 캘린더.-->
	<script src="<c:url value="/js/jquery.mtz.monthpicker.js"/>"></script>


<!-- App scripts -->
<script src="scripts/homer.js"></script>

<!-- alert -->
<script src="vendor/sweetalert/lib/sweet-alert.min.js"></script>
<script src="vendor/toastr/build/toastr.min.js"></script>

<!--부서관리 메뉴 js  --> 
<script src="js/admin/adminBranch/admin_branch.js"></script>

<!--직위관리 메뉴 js -->
<script src="js/admin/adminPosition/adminGrade.js"></script>

<!--급여 관리 메뉴 js  -->
<script src="js/admin/adminPay/adminPay.js"></script>

<!--우편번호 API-->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<!--근태 관리 메뉴 js-->
<script src="js/admin/adminCommute/adminCommute.js"></script>

<!-- 사원 관리 메뉴 js-->
<script src="js/admin/adminEmp/admin_emp.js"></script>

<script>


toastr.options = {    
        "closeButton": true,
         "debug": false,
         "newestOnTop": false,
         "progressBar": false,
         "positionClass": "toast-top-center",
         "preventDuplicates": false,
         "onclick": null,
         "showDuration": "1000",
         "hideDuration": "1000",
         "timeOut": "5000",
         "extendedTimeOut": "1000",
         "showEasing": "swing",
         "hideEasing": "linear",
         "showMethod": "fadeIn",
         "hideMethod": "fadeOut"
         };
	

	$(function(){
		
		
		//드래그 앤 드롭
		$( "#sortable" ).sortable();
	 
		//시계
	    $('.clockpicker').clockpicker({autoclose: true});

		
		var currentYear = (new Date()).getFullYear();
		var startYear = currentYear - 10;
		var options = {
			startYear : startYear,
			finalYear : currentYear,
			pattern : 'yyyy-mm',
			monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
					'9월', '10월', '11월', '12월' ]
		};
	
		//기지급 급여 목록페이지의 월별 조회시 사용
		$('#totalSalListdate').monthpicker(options);	

	});
	

	//근태 마감 전체선택 체크박스 
	$('#allCheck').click(function(){
		if($("#allCheck").prop("checked")) {
			$("input[type=checkbox]").prop("checked",true);
		}else{
			$("input[type=checkbox]").prop("checked",false);
		}				
	});
	
	
	//급여관리- 당월 지급 예정 급여 목록보기 페이지로 이동
	$('#moveSalaryPlanList').click(function(){
		location.href="adminSalary.do"
	})
	//급여관리 - 기지급 급여 목록보기 페이지로 이동
	$('#movetotalSalaryList').click(function(){
		location.href="adminSalaryList.do";
	});
	//급여관리-급여 기본 정보 관리 페이지로 이동
	$('#moveSalaryManage').click(function(){
		location.href="adminSalaryManage.do";
	});
	//급여관리 - 급여 설정 관리 페이지로 이동
	$('#moveSalarySetting').click(function(){
		location.href="adminSalarySetting.do";
	});
	
	
	// 시간 딜레이 함수
	function wait(msecs) {
		var start = new Date().getTime();
		var cur = start;
		
		while(cur - start < msecs) {
			cur = new Date().getTime();
		}
	};
	
	$('#giveBtn').click(function(){
		
    	var arr = new Array();

    // 사원 권한 부여
	$("input[name='checkbox']:checked").each(function(i) {
		
        var obj = new Object();

		console.log("사번 : " + $(this).parent().parent().next().next().next().text());
		
		var id = $(this).attr('id');
		console.log("권한 : " + $("#selectRole"+id+" option:selected").text());
		
		obj.emp_no = $(this).parent().parent().next().next().next().text();
		obj.role_name = $("#selectRole"+id+" option:selected").text();
		
        arr.push(obj);

	});
	
    var param = JSON.stringify(arr);
    
		$.ajax({
						url : "give_authority.do",
						type: "post",
						data : {
									param : param
						       },
						success : function(data){
                            swal({
                                title: "권한부여",
                                text: "권한부여에 성공하였습니다",
                                type: "success"
                            });	
                            
                            wait(3000);
                            window.location.reload();
						}
		           });
	});
</script>
</body>
</html>