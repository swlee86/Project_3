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
    <title>HOMER | WebApp admin theme</title>

    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
    <!--<link rel="shortcut icon" type="image/ico" href="favicon.ico" />-->

    <!-- Vendor styles -->
    <link rel="stylesheet" href="vendor/fontawesome/css/font-awesome.css" />
    <link rel="stylesheet" href="vendor/metisMenu/dist/metisMenu.css" />
    <link rel="stylesheet" href="vendor/animate.css/animate.css" />
    <link rel="stylesheet" href="vendor/bootstrap/dist/css/bootstrap.css" />
    <link rel="stylesheet" href="vendor/summernote/dist/summernote.css" />
    <link rel="stylesheet" href="vendor/summernote/dist/summernote-bs3.css" />

    <!-- App styles -->
    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css" />
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
<script src="vendor/summernote/dist/summernote.min.js"></script>

<!-- App scripts -->
<script src="scripts/homer.js"></script>

<script src="vendor/toastr/build/toastr.min.js"></script>
<link rel="stylesheet" href="vendor/toastr/build/toastr.min.css" />

<script>

    $(function () {
    	//alert창
    	toastr.options = {	 
    			 "closeButton": true,
    			  "debug": false,
    			  "newestOnTop": false,
    			  "progressBar": false,
    			  "positionClass": "toast-top-center",
    			  "preventDuplicates": false,
    			  "onclick": null,
    			  "showDuration": "300",
    			  "hideDuration": "1000",
    			  "timeOut": "3000",
    			  "extendedTimeOut": "1000",
    			  "showEasing": "swing",
    			  "hideEasing": "linear",
    			  "showMethod": "fadeIn",
    			  "hideMethod": "fadeOut"
    	};
    	
    	
        // Initialize summernote plugin
        $('.summernote').summernote();

        var sHTML = $('.summernote').code();

        console.log(sHTML);

        $('.summernote1').summernote({
            toolbar: [
                ['headline', ['style']],
                ['style', ['bold', 'italic', 'underline', 'superscript', 'subscript', 'strikethrough', 'clear']],
                ['textsize', ['fontsize']],
                ['alignment', ['ul', 'ol', 'paragraph', 'lineheight']],
            ]
        });

        $('.summernote2').summernote({
            airMode: true,
        });
        
        //제목 검색 버튼 클릭 이벤트
		$('#searchForm').submit(function(){
			if($('#title').val() == ''){
				alert("제목을 입력해주세요 !!");
				$('#title').focus();
				return false;
			}else{
				return true;
			}
		});
        
		 $('.deletechk').click(function () {
	            swal({
	                        title: "삭제하시겠습니까?",
	                        text: "확인을 클릭할시 글이 삭제 됩니다.",
	                        type: "warning",
	                        showCancelButton: true,
	                        confirmButtonColor: "#DD6B55",
	                        confirmButtonText: "확인",
	                        cancelButtonText: "취소",
	                        closeOnConfirm: false,
	                        closeOnCancel: false },
	                    function (isConfirm) {
	                        if (isConfirm) {
	                            swal("삭제되었습니다.", "Your imaginary file has been deleted.", "success");
	                        } else {
	                            swal("취소되었습니다.", "Your imaginary file is safe :)", "error");
	                        }
	                    });
	        });
    
	    $('#writeForm').submit(function(){
			if($('#title').val() == ''){
				toastr.warning("제목을 입력해주세요");
				$('#title').focus();
				
				return false;
			}if($('#content').val() == ''){
				toastr.warning("내용을 입력해주세요");
				$('#content').focus();
				return false;
			}else{
				return true;
			}
		});
    });
</script>
	
</body>
</html>