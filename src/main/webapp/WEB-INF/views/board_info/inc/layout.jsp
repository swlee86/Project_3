<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!--  
	작성자	: 박성준
	작성일	: 2016-11-18
	목 적  	: 사내공지게시판 layout, css, script 기능
-->
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

    <!-- App styles -->
    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css" />
    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/css/helper.css" />
    <link rel="stylesheet" href="styles/style.css">
	<link rel="stylesheet" href="styles/layer.css">
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
			<h1>ToInfra</h1>
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
<script src="js/layer/layerpop.js"></script>
<!-- alert 창 -->
<link rel="stylesheet" href="vendor/sweetalert/lib/sweet-alert.css" />
<script src="vendor/sweetalert/lib/sweet-alert.min.js"></script>

<script>

    $(function () {
    	$('#clip').click(function(){
			$('#clipfile').css('display','block');
		});
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
				
				toastr.warning("제목을 입력해주세요");
				$('#title').focus();
				return false;
			}else{
				return true;
			}
		});
        
		 $('.deletechk').click(function () {
			 var no = '${company.no}';
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
	                        	 $.ajax({
	                        		url : "info_board_delete.do",
	                        		data : {
	                        			no : no,
	                        		},
	                        		success : function(data){
          								console.log(data);
	                        		}
	                        	}); 
	                        	swal("삭제되었습니다.", "", "success");
	                        	window.location.href='info_board_list.do';
	                        } else {
	                            swal("취소되었습니다.", "", "error");
	                        }
	                    }
				 );
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