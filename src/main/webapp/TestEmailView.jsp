<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Page title -->
<title>이메일 글쓰기 뷰</title>

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
<link rel="stylesheet"
	href="fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css" />
<link rel="stylesheet" href="fonts/pe-icon-7-stroke/css/helper.css" />
<link rel="stylesheet" href="styles/style.css">

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

	<jsp:include page="/sidebar/header.jsp" />
	<jsp:include page="/sidebar/aside.jsp" />

	<div id="wrapper">

		<div class="small-header transition animated fadeIn">
			<div class="hpanel">
				<div class="panel-body">
					<div id="hbreadcrumb" class="pull-right">
						<ol class="hbreadcrumb breadcrumb">
							<li><a href="index.html">Dashboard</a></li>
							<li><span>Forms</span></li>
							<li class="active"><span>Text editor </span></li>
						</ol>
					</div>
					<h2 class="font-light m-b-xs">텍스트 에디터입니다.</h2>
					<small>이메일 에서 사용할 뷰입니다.</small>
				</div>
			</div>
		</div>

		<div class="content">

			<div>
				<div class="row">
					<div class="col-lg-12">
						<div class="hpanel">
							<div class="panel-heading">
								<div class="panel-tools">
									<a class="showhide"><i class="fa fa-chevron-up"></i></a> <a
										class="closebox"><i class="fa fa-times"></i></a>
								</div>
								메일쓰기
							</div>
							<div class="panel-body">
								<form>
									<div class="summernote">
										
									</div>
									<button type="submit" class="btn btn-default">글쓰기</button>
								</form>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>


	<!-- Vendor scripts -->
	<script src="vendor/jquery/dist/jquery.min.js"></script>
	<script src="vendor/jquery-ui/jquery-ui.min.js"></script>
	<script src="vendor/slimScroll/jquery.slimscroll.min.js"></script>
	<script src="vendor/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="vendor/metisMenu/dist/metisMenu.min.js"></script>
	<script src="vendor/iCheck/icheck.min.js"></script>
	<script src="vendor/sparkline/index.js"></script>
	
	<!--텍스트 에디터 쓰는 스크립트-->
	<script src="vendor/summernote/dist/summernote.min.js"></script>

	<!-- App scripts -->
	<script src="scripts/homer.js"></script>


	<script>

    $(function () {

        // Initialize summernote plugin
        $('.summernote').summernote({
        	
        	height: 500
        	
        });

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

        $('form').on('submit', function (e) {
            e.preventDefault();
            /* alert($('.summernote').code());
             */
            var text = $('.summernote').code();
            alert("입력하신 내용 : "+text);
            
          });
        
    });

</script>


</body>
</html>