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

<!-- 드래그앤드롭? -->
<link rel="stylesheet" href="vendor/jquery-ui/themes/base/all.css">

<!--jQuery UI CSS-->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />

<style type="text/css">
	#tr {
		vertical-align: middle;
	}
	
	#dataTable th {
		text-align:center;
	}
	
	#dataTable td {
		text-align:center;
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

<!--우편번호 API-->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<!-- 사원 관리 메뉴 js-->
<script src="js/admin/adminEmp/admin_emp.js"></script>

<script>
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
    
		$.ajax(
				   {
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
                            
                            window.location.reload();
						}
		           }
		      );
	});
</script>
</body>
</html>