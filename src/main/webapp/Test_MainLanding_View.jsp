<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
	
	<!--얼럿창 스타일 먹이기-->
	<link rel="stylesheet" href="vendor/sweetalert/lib/sweet-alert.css" />
    <link rel="stylesheet" href="vendor/toastr/build/toastr.min.css" />
	
	
    <!-- App styles -->
    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css" />
    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/css/helper.css" />
    <link rel="stylesheet" href="styles/style.css">

	

</head>
<body class="landing-page">

<!-- Simple splash screen-->
<div class="splash"> 
<div class="color-line"></div>
<div class="splash-title">
	<h1>Homer - Responsive Admin Theme</h1><p>Special Admin Theme for small and medium webapp with very clean and aesthetic style and feel. </p><div class="spinner"> <div class="rect1"></div> <div class="rect2"></div> <div class="rect3"></div> <div class="rect4"></div> <div class="rect5"></div> </div> </div> </div>
<!--[if lt IE 7]>
<p class="alert alert-danger">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
<![endif]-->
<header id="page-top">
    <div class="container">
        <div class="heading">
            <h1>
                2PM
            </h1>
            <span>인사, 메모, 일정, 프로젝트 관리 등 꼭 필요한 기능을 한곳에서!</span>
            <p class="small">
                	조금 더 편하게, 조금 더 쉽게, 업무에 필요한 모든 기능을 무료로 이용해보세요       
            </p>
            <a href="#" class="btn btn-success btn-sm" style="width:130px; height:40px; font-size: 15px;">사용하기</a>
        </div>
        <div class="heading-image animate-panel" data-child="img-animate" data-effect="fadeInRight">
            <p class="small">필요한 기능들만 쏙쏙 !!</p>
            <img class="img-animate" src="images/landing/c1.jpg">
            <img class="img-animate" src="images/landing/c2.jpg">
            <img class="img-animate" src="images/landing/c3.jpg">
            <img class="img-animate" src="images/landing/c4.jpg">
            <br/>
            <img class="img-animate" src="images/landing/c5.jpg">
            <img class="img-animate" src="images/landing/c6.jpg">
            <img class="img-animate" src="images/landing/c7.jpg">
            <img class="img-animate" src="images/landing/c8.jpg">
        </div>
    </div>
</header>
<section>
    <div class="container">
    <div class="row">
        <div class="col-md-4">
            <h4>찾기쉬운 기능!</h4>
            <p>너무나 많아서 어리둥절 하시던분들, 이제는 쉽게 원하는 기능을 찾아보세요!</p>
            <p><button class="btn btn-primary btn-sm demo1">Run example</button></p>
            
            <div class="modal fade hmodal-success" id="myModal7" tabindex="-1" role="dialog"  aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="color-line"></div>
                            <div class="modal-header">
                                <h4 class="modal-title">Modal title</h4>
                                <small class="font-bold">Lorem Ipsum is simply dummy text of the printing and typesetting industry.</small>
                            </div>
                            <div class="modal-body">
                                <p><strong>Lorem Ipsum is simply dummy</strong> text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown
                                    printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,
                                    remaining essentially unchanged.</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary">Save changes</button>
                            </div>
                        </div>
                    </div>
                </div>
            
        </div>
        <div class="col-md-4">
            <h4>사용하기 쉬운 기능!!</h4>
            <p>열심히 찾아서 사용하려했더니 , 복잡해서 어려우셨죠 ? 이제는 클릭몇번으로 쉽게 사용하세요!</p>
            <p><a class="navy-link btn btn-sm" href="#" role="button">Learn more</a></p>
        </div>
        <div class="col-md-4">
            <h4>사용자에게 친숙한 시각화 데이타!</h4>
            <p>테이블 + 테이블 + 테이블 ... 열심히 찾아 사용했더니 알아보기 힘든 데이터들, 이젠 좀더 쉽게 볼수있어요 !</p>
            <p><a class="navy-link btn btn-sm" href="#" role="button">Learn more</a></p>
        </div>
    </div>
    </div>
</section>


                


<!-- Vendor scripts -->
<script src="vendor/jquery/dist/jquery.min.js"></script>
<script src="vendor/jquery-ui/jquery-ui.min.js"></script>
<script src="vendor/slimScroll/jquery.slimscroll.min.js"></script>
<script src="vendor/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="vendor/metisMenu/dist/metisMenu.min.js"></script>
<script src="vendor/iCheck/icheck.min.js"></script>
<script src="vendor/sparkline/index.js"></script>
<!--버튼관련-->
<script src="vendor/sweetalert/lib/sweet-alert.min.js"></script>
<script src="vendor/toastr/build/toastr.min.js"></script>
<!-- App scripts -->
<script src="scripts/homer.js"></script>

<!-- Local script for menu handle -->
<!-- It can be also directive -->
<script>
    
    
    
    
    $(document).ready(function () {
		

    	$('.demo1').click(function(){
    		swal({
    			  title: "어서오세요!",
    			  text: "로그인이 필요합니다!",
    			  showCancelButton: true,
    			  confirmButtonText: "로그인 하러가기!",
    			  closeOnConfirm: false
    			},
    			function(Confirm){
					if(Confirm){
						location.href="Login.do";
					}
    			});	

            
        });
    	
    		
    	
     // Toastr options
        toastr.options = {
            "debug": false,
            "newestOnTop": false,
            "positionClass": "toast-top-center",
            "closeButton": true,
            "toastClass": "animated fadeInDown",
        };


        
        // Page scrolling feature
        $('a.page-scroll').bind('click', function(event) {
            var link = $(this);
            $('html, body').stop().animate({
                scrollTop: $(link.attr('href')).offset().top - 50
            }, 500);
            event.preventDefault();
        });

        $('body').scrollspy({
            target: '.navbar-fixed-top',
            offset: 80
        });

    });
</script>

</body>
</html>