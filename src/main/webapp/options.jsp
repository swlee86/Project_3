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

    <!-- App styles -->
    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css" />
    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/css/helper.css" />
    <link rel="stylesheet" href="styles/style.css">

</head>
<body class="fixed-navbar fixed-sidebar">

<!-- Simple splash screen-->
<div class="splash"> <div class="color-line"></div><div class="splash-title"><h1>Homer - Responsive Admin Theme</h1><p>Special Admin Theme for small and medium webapp with very clean and aesthetic style and feel. </p><div class="spinner"> <div class="rect1"></div> <div class="rect2"></div> <div class="rect3"></div> <div class="rect4"></div> <div class="rect5"></div> </div> </div> </div>
<!--[if lt IE 7]>
<p class="alert alert-danger">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
<![endif]-->

<div class="boxed-wrapper">
<!-- Header -->
<div id="header">
    <div class="color-line">
    </div>
    <div id="logo" class="light-version">
        <span>
            Homer Theme
        </span>
    </div>
    <nav role="navigation">
        <div class="header-link hide-menu"><i class="fa fa-bars"></i></div>
        <div class="small-logo">
            <span class="text-primary">HOMER APP</span>
        </div>
        <form role="search" class="navbar-form-custom" method="post" action="#">
            <div class="form-group">
                <input type="text" placeholder="Search something special" class="form-control" name="search">
            </div>
        </form>
        <div class="mobile-menu">
            <button type="button" class="navbar-toggle mobile-menu-toggle" data-toggle="collapse" data-target="#mobile-collapse">
                <i class="fa fa-chevron-down"></i>
            </button>
            <div class="collapse mobile-navbar" id="mobile-collapse">
                <ul class="nav navbar-nav">
                    <li>
                        <a class="" href="login.html">Login</a>
                    </li>
                    <li>
                        <a class="" href="login.html">Logout</a>
                    </li>
                    <li>
                        <a class="" href="profile.html">Profile</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="navbar-right">
            <ul class="nav navbar-nav no-borders">
                <li class="dropdown">
                    <a class="dropdown-toggle" href="#" data-toggle="dropdown">
                        <i class="pe-7s-speaker"></i>
                    </a>
                    <ul class="dropdown-menu hdropdown notification animated flipInX">
                        <li>
                            <a>
                                <span class="label label-success">NEW</span> It is a long established.
                            </a>
                        </li>
                        <li>
                            <a>
                                <span class="label label-warning">WAR</span> There are many variations.
                            </a>
                        </li>
                        <li>
                            <a>
                                <span class="label label-danger">ERR</span> Contrary to popular belief.
                            </a>
                        </li>
                        <li class="summary"><a href="#">See all notifications</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" href="#" data-toggle="dropdown">
                        <i class="pe-7s-keypad"></i>
                    </a>

                    <div class="dropdown-menu hdropdown bigmenu animated flipInX">
                        <table>
                            <tbody>
                            <tr>
                                <td>
                                    <a href="projects.html">
                                        <i class="pe pe-7s-portfolio text-info"></i>
                                        <h5>Projects</h5>
                                    </a>
                                </td>
                                <td>
                                    <a href="mailbox.html">
                                        <i class="pe pe-7s-mail text-warning"></i>
                                        <h5>Email</h5>
                                    </a>
                                </td>
                                <td>
                                    <a href="contacts.html">
                                        <i class="pe pe-7s-users text-success"></i>
                                        <h5>Contacts</h5>
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a href="forum.html">
                                        <i class="pe pe-7s-comment text-info"></i>
                                        <h5>Forum</h5>
                                    </a>
                                </td>
                                <td>
                                    <a href="analytics.html">
                                        <i class="pe pe-7s-graph1 text-danger"></i>
                                        <h5>Analytics</h5>
                                    </a>
                                </td>
                                <td>
                                    <a href="file_manager.html">
                                        <i class="pe pe-7s-box1 text-success"></i>
                                        <h5>Files</h5>
                                    </a>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle label-menu-corner" href="#" data-toggle="dropdown">
                        <i class="pe-7s-mail"></i>
                        <span class="label label-success">4</span>
                    </a>
                    <ul class="dropdown-menu hdropdown animated flipInX">
                        <div class="title">
                            You have 4 new messages
                        </div>
                        <li>
                            <a>
                                It is a long established.
                            </a>
                        </li>
                        <li>
                            <a>
                                There are many variations.
                            </a>
                        </li>
                        <li>
                            <a>
                                Lorem Ipsum is simply dummy.
                            </a>
                        </li>
                        <li>
                            <a>
                                Contrary to popular belief.
                            </a>
                        </li>
                        <li class="summary"><a href="#">See All Messages</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#" id="sidebar" class="right-sidebar-toggle">
                        <i class="pe-7s-upload pe-7s-news-paper"></i>
                    </a>
                </li>
                <li class="dropdown">
                    <a href="login.html">
                        <i class="pe-7s-upload pe-rotate-90"></i>
                    </a>
                </li>
            </ul>
        </div>
    </nav>
</div>

<!-- Navigation -->
<jsp:include page="/sidebar/aside.jsp"></jsp:include>

<!-- Main Wrapper -->
<div id="wrapper">

    <div class="small-header transition animated fadeIn">
        <div class="hpanel">
            <div class="panel-body">
                <div id="hbreadcrumb" class="pull-right">
                    <ol class="hbreadcrumb breadcrumb">
                        <li><a href="index.html">Dashboard</a></li>
                        <li class="active">
                            <span>Options </span>
                        </li>
                    </ol>
                </div>
                <h2 class="font-light m-b-xs">
                    Options
                </h2>
                <small>Example small header for demo purpose.</small>
            </div>
        </div>
    </div>

<div class="content animate-panel">

        <div class="row">
            <div class="col-md-12">
                <div class="hpanel">
                    <div class="panel-body">
                        <h1>Options</h1>
                        <p class="lead">
                            Homer admin theme gives you few configure options for your application layout. Each of the layout element: navigation, navbar, small header and footer can be fixed positioning.
                        </p>
                        <p>
                            Use below buttons to enable/disable available options.
                        </p>
                        <div>
                            <dl class="dl-horizontal">
                                <dt style="text-align: left">Fixed sidebar</dt>
                                <dd class="status-fixed-sidebar"><span class='text-success font-bold'>On</span></dd>

                                <dt style="text-align: left">Fixed navbar</dt>
                                <dd class="status-fixed-navbar"><span class='text-success font-bold'>On</span></dd>

                                <dt style="text-align: left">Fixed footer</dt>
                                <dd class="status-fixed-footer">Off</dd>

                                <dt style="text-align: left">Fixed small header</dt>
                                <dd class="status-fixed-small-header">Off</dd>

                                <dt style="text-align: left">Boxed layout</dt>
                                <dd class="status-boxed-layout">Off</dd>
                            </dl>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <div class="row">
        <div class="col-lg-6">
            <div class="hpanel">
                <div class="panel-heading">
                    <div class="panel-tools">
                        <a class="showhide"><i class="fa fa-chevron-up"></i></a>
                        <a class="closebox"><i class="fa fa-times"></i></a>
                    </div>
                    Fixed navbar
                </div>
                <div class="panel-body">
                    <p>
                        Fixed navbar is a top navbar that is sticked on screen.
                    </p>
                    <p>
                        To add fixed navbar you need to add .fixed-navbar class to body element.
                    </p>
                    <div class="text-center">
                        <button id="fixed-navbar" type="button" class="btn btn-success" >
                            Toggle fixed navbar
                        </button>

                    </div>

                    <div class="m-t-md">
                    <pre>

&lt;body class="fixed-navbar"&gt;
                    </pre>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="hpanel">
                <div class="panel-heading">
                    <div class="panel-tools">
                        <a class="showhide"><i class="fa fa-chevron-up"></i></a>
                        <a class="closebox"><i class="fa fa-times"></i></a>
                    </div>
                    Fixed navbar
                </div>
                <div class="panel-body">
                    <p>
                        Fixed sidebar is a (left menu) sidebar that is sticked on screen.
                    </p>
                    <p>
                        To add fixed sidebar you need to add .fixed-sidebar class to body. Fixed sidebar works with fixed-navbar.
                    </p>
                    <div class="text-center">
                        <button id="fixed-sidebar" type="button" class="btn btn-success" >
                            Toggle fixed sidebar
                        </button>

                    </div>

                    <div class="m-t-md">
                    <pre>

&lt;body class="fixed-sidebar fixed-navbar"&gt;
                    </pre>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <div class="row">
        <div class="col-lg-6">
            <div class="hpanel">
                <div class="panel-heading">
                    <div class="panel-tools">
                        <a class="showhide"><i class="fa fa-chevron-up"></i></a>
                        <a class="closebox"><i class="fa fa-times"></i></a>
                    </div>
                    Fixed footer
                </div>
                <div class="panel-body">
                    <p>
                        Fixed footer is a bottom footer that is sticked on screen.
                    </p>
                    <p>
                        To add fixed footer you need to add .fixed-footer class to body element.
                    </p>
                    <div class="text-center">
                        <button id="fixed-footer" type="button" class="btn btn-success" >
                            Toggle footer footer
                        </button>

                    </div>

                    <div class="m-t-md">
                    <pre>

&lt;body class="fixed-footer"&gt;
                    </pre>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="hpanel">
                <div class="panel-heading">
                    <div class="panel-tools">
                        <a class="showhide"><i class="fa fa-chevron-up"></i></a>
                        <a class="closebox"><i class="fa fa-times"></i></a>
                    </div>
                    Fixed small header
                </div>
                <div class="panel-body">
                    <p>
                        Fixed small header is a top page header that is sticked on screen (only small version).
                    </p>
                    <p>
                        To add fixed small header you need to add .fixed-small-header class to body. Fixed sidebar works with fixed-navbar and fiexd sidebar.
                    </p>
                    <div class="text-center">
                        <button id="fixed-small-header" type="button" class="btn btn-success" >
                            Toggle fixed small header
                        </button>

                    </div>

                    <div class="m-t-md">
                    <pre>

&lt;body class="fixed-small-header fixed-sidebar fixed-navbar"&gt;
                    </pre>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <div class="row">
        <div class="col-lg-6">
            <div class="hpanel">
                <div class="panel-heading">
                    <div class="panel-tools">
                        <a class="showhide"><i class="fa fa-chevron-up"></i></a>
                        <a class="closebox"><i class="fa fa-times"></i></a>
                    </div>
                    Boxed layout
                </div>
                <div class="panel-body">
                    <p>
                        Boxed layout is an option for fixed width and centered layout on desktop resolution.
                    </p>
                    <p>
                        To add boxed layout you need to add .boxed class to body element and special additional div wrapper after body tag with .boxed-wrapper class.
                    </p>
                    <div class="text-center">
                        <button id="boxed-layout" type="button" class="btn btn-success" >
                            Toggle boxed layout
                        </button>

                    </div>

                    <div class="m-t-md">
                    <pre>
&lt;body class="boxed"&gt;
    &lt;div class="boxed-wrapper"&gt;
        â¦.
        â¦.
    &lt;/div&gt;
&lt;/body&gt;
                    </pre>
                    </div>
                </div>
            </div>
        </div>

    </div>



    </div>
    <!-- Right sidebar -->
    <div id="right-sidebar" class="animated fadeInRight">

        <div class="p-m">
            <button id="sidebar-close" class="right-sidebar-toggle sidebar-button btn btn-default m-b-md"><i class="pe pe-7s-close"></i>
            </button>
            <div>
                <span class="font-bold no-margins"> Analytics </span>
                <br>
                <small> Lorem Ipsum is simply dummy text of the printing simply all dummy text.</small>
            </div>
            <div class="row m-t-sm m-b-sm">
                <div class="col-lg-6">
                    <h3 class="no-margins font-extra-bold text-success">300,102</h3>

                    <div class="font-bold">98% <i class="fa fa-level-up text-success"></i></div>
                </div>
                <div class="col-lg-6">
                    <h3 class="no-margins font-extra-bold text-success">280,200</h3>

                    <div class="font-bold">98% <i class="fa fa-level-up text-success"></i></div>
                </div>
            </div>
            <div class="progress m-t-xs full progress-small">
                <div style="width: 25%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="25" role="progressbar"
                     class=" progress-bar progress-bar-success">
                    <span class="sr-only">35% Complete (success)</span>
                </div>
            </div>
        </div>
        <div class="p-m bg-light border-bottom border-top">
            <span class="font-bold no-margins"> Social talks </span>
            <br>
            <small> Lorem Ipsum is simply dummy text of the printing simply all dummy text.</small>
            <div class="m-t-md">
                <div class="social-talk">
                    <div class="media social-profile clearfix">
                        <a class="pull-left">
                            <img src="images/a1.jpg" alt="profile-picture">
                        </a>

                        <div class="media-body">
                            <span class="font-bold">John Novak</span>
                            <small class="text-muted">21.03.2015</small>
                            <div class="social-content small">
                                Injected humour, or randomised words which don't look even slightly believable.
                            </div>
                        </div>
                    </div>
                </div>
                <div class="social-talk">
                    <div class="media social-profile clearfix">
                        <a class="pull-left">
                            <img src="images/a3.jpg" alt="profile-picture">
                        </a>

                        <div class="media-body">
                            <span class="font-bold">Mark Smith</span>
                            <small class="text-muted">14.04.2015</small>
                            <div class="social-content">
                                Many desktop publishing packages and web page editors.
                            </div>
                        </div>
                    </div>
                </div>
                <div class="social-talk">
                    <div class="media social-profile clearfix">
                        <a class="pull-left">
                            <img src="images/a4.jpg" alt="profile-picture">
                        </a>

                        <div class="media-body">
                            <span class="font-bold">Marica Morgan</span>
                            <small class="text-muted">21.03.2015</small>

                            <div class="social-content">
                                There are many variations of passages of Lorem Ipsum available, but the majority have
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="p-m">
            <span class="font-bold no-margins"> Sales in last week </span>
            <div class="m-t-xs">
                <div class="row">
                    <div class="col-xs-6">
                        <small>Today</small>
                        <h4 class="m-t-xs">$170,20 <i class="fa fa-level-up text-success"></i></h4>
                    </div>
                    <div class="col-xs-6">
                        <small>Last week</small>
                        <h4 class="m-t-xs">$580,90 <i class="fa fa-level-up text-success"></i></h4>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-6">
                        <small>Today</small>
                        <h4 class="m-t-xs">$620,20 <i class="fa fa-level-up text-success"></i></h4>
                    </div>
                    <div class="col-xs-6">
                        <small>Last week</small>
                        <h4 class="m-t-xs">$140,70 <i class="fa fa-level-up text-success"></i></h4>
                    </div>
                </div>
            </div>
            <small> Lorem Ipsum is simply dummy text of the printing simply all dummy text.
                Many desktop publishing packages and web page editors.
            </small>
        </div>

    </div>

    <!-- Footer-->
    <footer class="footer">
        <span class="pull-right">
            Example text
        </span>
        Company 2015-2020
    </footer>

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

<!-- App scripts -->
<script src="scripts/homer.js"></script>

<script>

    $(function () {

        $('#fixed-navbar').click(function(){
            if($('body').hasClass('fixed-navbar')) {
                $('body').removeClass('fixed-navbar');
                $('.status-fixed-navbar').html("Off");

                if($('body').hasClass('fixed-sidebar')) {
                    $('body').removeClass('fixed-sidebar');
                    $('.status-fixed-sidebar').html("Off")
                }

                if($('body').hasClass('fixed-small-header')) {
                    $('body').removeClass('fixed-small-header');
                    $('.status-fixed-small-header').html("Off")
                }

            } else {
                $('body').addClass('fixed-navbar');
                $('.status-fixed-navbar').html("<span class='text-success font-bold'>On</span>");
                $('body').removeClass('boxed');
                $('.status-boxed-layout').html("Off")
            }
        });

        $('#fixed-sidebar').click(function(){

            if($('body').hasClass('fixed-sidebar')) {
                $('body').removeClass('fixed-sidebar');
                $('.status-fixed-sidebar').html("Off")
            } else {
                $('body').addClass('fixed-navbar');
                $('body').addClass('fixed-sidebar');
                $('.status-fixed-navbar').html("<span class='text-success font-bold'>On</span>");
                $('.status-fixed-sidebar').html("<span class='text-success font-bold'>On</span>");
                $('body').removeClass('boxed');
                $('.status-boxed-layout').html("Off")
            }
        });

        $('#fixed-footer').click(function(){
            if($('body').hasClass('fixed-footer')) {
                $('body').removeClass('fixed-footer');
                $('.status-fixed-footer').html("Off");
            } else {
                $('body').addClass('fixed-footer');
                $('.status-fixed-footer').html("<span class='text-success font-bold'>On</span>");
                $('body').removeClass('boxed');
                $('.status-boxed-layout').html("Off")
            }
        });

        $('#fixed-small-header').click(function(){

            if($('body').hasClass('fixed-small-header')) {
                $('body').removeClass('fixed-small-header');
                $('body').removeClass('fixed-sidebar');
                $('body').removeClass('fixed-navbar');
                $('.status-fixed-small-header').html("Off");
                $('.status-fixed-sidebar').html("Off");
                $('.status-fixed-navbar').html("Off")
            } else {
                $('body').addClass('fixed-navbar');
                $('body').addClass('fixed-sidebar');
                $('body').addClass('fixed-small-header');
                $('.status-fixed-navbar').html("<span class='text-success font-bold'>On</span>");
                $('.status-fixed-sidebar').html("<span class='text-success font-bold'>On</span>");
                $('.status-fixed-small-header').html("<span class='text-success font-bold'>On</span>");
                $('body').removeClass('boxed');
                $('.status-boxed-layout').html("Off")
            }
        });

        $('#boxed-layout').click(function(){
            if($('body').hasClass('boxed')) {
                $('body').removeClass('boxed');
                $('.status-boxed-layout').html("Off")
            } else {
                $('body').addClass('boxed');
                $('.status-boxed-layout').html("<span class='text-success font-bold'>On</span>");
                $('body').removeClass('fixed-small-header');
                $('body').removeClass('fixed-sidebar');
                $('body').removeClass('fixed-navbar');
                $('body').removeClass('fixed-footer');
                $('.status-fixed-small-header').html("Off");
                $('.status-fixed-footer').html("Off");
                $('.status-fixed-sidebar').html("Off");
                $('.status-fixed-navbar').html("Off");
            }
        });

    });

</script>

</body>
</html>