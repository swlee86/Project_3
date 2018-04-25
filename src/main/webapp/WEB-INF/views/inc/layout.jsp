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
    <link rel="stylesheet" href="vendor/chartist/custom/chartist.css" />

    <!-- App styles -->
    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css" />
    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/css/helper.css" />
    <link rel="stylesheet" href="styles/style.css">
    <link rel="stylesheet" href="styles/layer.css">
</head>
<body class="fixed-navbar fixed-sidebar">

<!-- Simple splash screen-->
<div class="splash"> <div class="color-line"></div><div class="splash-title"><h1>ToInfra</h1><p>Now loading...</p><div class="spinner"> <div class="rect1"></div> <div class="rect2"></div> <div class="rect3"></div> <div class="rect4"></div> <div class="rect5"></div> </div> </div> </div>
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

<!-- POPUP -->
<div id="divpop" style="position:absolute;left:395px;top:190px;z-index:200;visibility:hidden;">
    <table width=200 height=400 cellpadding=2 cellspacing=0>
        <tr>
            <td style="border:1px #666666 solid" height=360 align=center bgcolor=white>
                <ul>
                    <li>해당 사이트는 현재 구축 중인 사이트입니다.</li>
                    현재 일부의 메뉴만 오픈되어 있는 상태로<br/>
                    오픈된 메뉴들도 개발 및 테스트 작업이 진행 중에 있습니다.<br/>

                    따라서 사이트 이용이 정상적이지 않을 수 있으며 <br/>
                    메뉴 이용 가능 여부에 대해서는 머지않아 개설 될 전체 공지사항 게시판으로 안내 드리겠습니다<br/><br/>
                    ※해당 홈페이지는 별도로 사용료를 받지 않는 사이트입니다.<br/>
                    감사합니다.
                </ul>
            </td>
        </tr>
        <tr>
            <form name="notice_form">
                <td align=right bgcolor=white>
                    <input type="checkbox" name="chkbox" value="checkbox">오늘 하루 이 창을 열지 않음
                    <a href="javascript:closeWin();"><B>[닫기]</B></a>
                </td>
        </tr>
        </form>
    </table>
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
<script src="vendor/chartjs/Chart.min.js"></script>
<script src="vendor/chartist/dist/chartist.min.js"></script>
<script src="vendor/slimScroll/jquery.slimscroll.min.js"></script>
<!-- App scripts -->
<script src="scripts/homer.js"></script>
<script src="scripts/charts.js"></script>
<script src="js/layer/layerpop.js"></script>

<script type="application/javascript">
    function setCookie( name, value, expiredays ) {
        var todayDate = new Date();
        todayDate.setDate( todayDate.getDate() + expiredays );
        document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
    }
    function closeWin() {
        if ( document.notice_form.chkbox.checked ){
            setCookie( "maindiv", "done" , 1 );
        }
        document.all['divpop'].style.visibility = "hidden";
    }

    cookiedata = document.cookie;
    if ( cookiedata.indexOf("maindiv=done") < 0 ){
        document.all['divpop'].style.visibility = "visible";
    }
    else {
        document.all['divpop'].style.visibility = "hidden";
    }


</script>



</body>
</html>