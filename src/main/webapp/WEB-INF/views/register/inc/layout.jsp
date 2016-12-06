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
	
	<!-- App styles -->
	<link rel="stylesheet"
		href="fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css" />
	<link rel="stylesheet" href="fonts/pe-icon-7-stroke/css/helper.css" />
	<link rel="stylesheet" href="styles/style.css">

<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 외부 추가 js 파일 링크 -->
<script src="js/custom/register.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>
</head>
<body class="fixed-navbar fixed-sidebar">

<!-- Simple splash screen-->
<div class="splash"> <div class="color-line"></div><div class="splash-title"><h1>2PM</h1><p>Now loading...</p><div class="spinner"> <div class="rect1"></div> <div class="rect2"></div> <div class="rect3"></div> <div class="rect4"></div> <div class="rect5"></div> </div> </div> </div>

<!-- <body class="landing-page"> -->

<!-- Header -->
<tiles:insertAttribute name="header" />

<!-- Navigation -->
<tiles:insertAttribute name="sidebar" />

<!-- Main Wrapper -->
<div id="wrapper">
	<tiles:insertAttribute name="content" />
	
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

	<!-- App scripts -->
	<script src="scripts/homer.js"></script>
	<script src="js/custom/register.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#numchk').click(function() {
				$.ajax({
					type : "post",
					url : "numchk.do",
					data : "emp_no=" + $('#emp_no').val(),
					success : function(data) {
						console.log(data);
						$('#numchkresult').empty();
						$('#numchkresult').append(data.numcheck);
					}
				})
			});
			
			$('#idchk').click(function() {
				$.ajax({
					type : "post",
					url : "idchk.do",
					data : "id=" + $('#id').val(),
					success : function(data) {
						console.log(data);
						$('#idchkresult').empty();
						$('#idchkresult').append(data.idcheck);
					}
				})
			});
		});
	</script>
</body>
</html>