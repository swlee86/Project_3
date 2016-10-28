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

<div class="normalheader transition animated fadeIn">
    <div class="hpanel">
        <div class="panel-body">
            <a class="small-header-action" href="">
                <div class="clip-header">
                    <i class="fa fa-arrow-up"></i>
                </div>
            </a>

            <div id="hbreadcrumb" class="pull-right m-t-lg">
                    <ol class="hbreadcrumb breadcrumb">
                    <li><a href="index.do">홈</a></li>
                    <li><span>프로젝트 관리</span></li>
                	<li><a href="projects.do">진행중인 프로젝트</a></li>
                </ol>
            </div>
            <h2 class="font-light m-b-xs">
                진행중인 프로젝트
            </h2>
            <small>부서에서 진행 중인 프로젝트를 확인하실 수 있습니다</small>
        </div>
    </div>
</div>

    <div class="content animate-panel">

        <div class="row projects">
            <div class="col-lg-6">
                <div class="hpanel hgreen">
                    <div class="panel-body">
                        <span class="label label-success pull-right">NEW</span>
                        <div class="row">
                            <div class="col-sm-8">
                                <h4><a href=""> Desing project</a></h4>

                                <p>
                                    It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has..
                                </p>

                                <div class="row">
                                    <div class="col-sm-3">
                                        <div class="project-label">CLIENT</div>
                                        <small>Hendrix Corp</small>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="project-label">VERSION</div>
                                        <small>1.5.2</small>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="project-label">DEDLINE</div>
                                        <small>12.06.2015</small>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="project-label">PROGRESS</div>
                                        <div class="progress m-t-xs full progress-small">
                                            <div style="width: 12%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="12" role="progressbar" class=" progress-bar progress-bar-success">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4 project-info">
                                <div class="project-action m-t-md">
                                    <div class="btn-group">
                                        <button class="btn btn-xs btn-default"> View</button>
                                        <button class="btn btn-xs btn-default"> Edit</button>
                                        <button class="btn btn-xs btn-default"> Delete</button>
                                    </div>
                                </div>
                                <div class="project-value">
                                    <h2 class="text-success">
                                        $1 206,40
                                    </h2>
                                </div>
                                <div class="project-people">
                                    <img alt="logo" class="img-circle" src="images/a1.jpg">
                                    <img alt="logo" class="img-circle" src="images/a2.jpg">
                                    <img alt="logo" class="img-circle" src="images/a3.jpg">
                                    <img alt="logo" class="img-circle" src="images/a4.jpg">
                                    <img alt="logo" class="img-circle" src="images/a5.jpg">
                                    <img alt="logo" class="img-circle" src="images/a6.jpg">
                                    <img alt="logo" class="img-circle" src="images/a7.jpg">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel-footer">
                        Additional information about project in footer
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="hpanel hyellow">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-sm-8">
                                <h4><a href=""> Project manager app</a></h4>
                                <p>
                                    It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum..
                                </p>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <div class="project-label">CLIENT</div>
                                        <small>Vito Company</small>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="project-label">VERSION</div>
                                        <small>3.0.0</small>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="project-label">DEDLINE</div>
                                        <small>16.10.2015</small>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="project-label">PROGRESS</div>
                                        <div class="progress m-t-xs full progress-small">
                                            <div style="width: 65%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="65" role="progressbar" class=" progress-bar progress-bar-warning">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4 project-info">
                                <div class="project-action m-t-md">
                                    <div class="btn-group">
                                        <button class="btn btn-xs btn-default"> View</button>
                                        <button class="btn btn-xs btn-default"> Edit</button>
                                        <button class="btn btn-xs btn-default"> Delete</button>
                                    </div>
                                </div>
                                <div class="project-value">
                                    <h2 class="text-warning">
                                        $3 600,20
                                    </h2>
                                </div>
                                <div class="project-people">
                                    <img alt="logo" class="img-circle" src="images/a7.jpg">
                                    <img alt="logo" class="img-circle" src="images/a8.jpg">
                                    <img alt="logo" class="img-circle" src="images/a3.jpg">
                                    <img alt="logo" class="img-circle" src="images/a2.jpg">
                                    <img alt="logo" class="img-circle" src="images/a5.jpg">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel-footer">
                        Additional information about project in footer
                    </div>
                </div>
            </div>
        </div>

        <div class="row projects">
            <div class="col-lg-6">
                <div class="hpanel hblue">
                    <div class="panel-body">
                        <span class="label label-info pull-right">NEW</span>
                        <div class="row">
                            <div class="col-sm-8">
                                <h4><a href=""> Website project</a></h4>
                                <p>
                                    Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years,
                                    sometimes by accident, sometimes on purpose (injected humour and the like).
                                </p>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <div class="project-label">CLIENT</div>
                                        <small>Morph Company</small>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="project-label">VERSION</div>
                                        <small>2.5.2</small>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="project-label">DEDLINE</div>
                                        <small>10.01.2015</small>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="project-label">PROGRESS</div>
                                        <div class="progress m-t-xs full progress-small">
                                            <div style="width: 43%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="43" role="progressbar" class=" progress-bar progress-bar-info">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4 project-info">
                                <div class="project-action m-t-md">
                                    <div class="btn-group">
                                        <button class="btn btn-xs btn-default"> View</button>
                                        <button class="btn btn-xs btn-default"> Edit</button>
                                        <button class="btn btn-xs btn-default"> Delete</button>
                                    </div>
                                </div>
                                <div class="project-value">
                                    <h2 class="text-info">
                                        $456,20
                                    </h2>
                                </div>
                                <div class="project-people">
                                    <img alt="logo" class="img-circle" src="images/a8.jpg">
                                    <img alt="logo" class="img-circle" src="images/a2.jpg">
                                    <img alt="logo" class="img-circle" src="images/a1.jpg">
                                    <img alt="logo" class="img-circle" src="images/a4.jpg">
                                    <img alt="logo" class="img-circle" src="images/a6.jpg">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel-footer">
                        Additional information about project in footer
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="hpanel hgreen">
                    <div class="panel-body">
                        <span class="label label-success pull-right">NEW</span>
                        <div class="row">
                            <div class="col-sm-8">
                                <h4><a href=""> Desing project</a></h4>
                                <p>
                                    It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a
                                    more-or-less normal distribution of letters, as opposed to using.
                                </p>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <div class="project-label">CLIENT</div>
                                        <small>Hendrix Corp</small>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="project-label">VERSION</div>
                                        <small>1.5.2</small>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="project-label">DEDLINE</div>
                                        <small>12.06.2015</small>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="project-label">PROGRESS</div>
                                        <div class="progress m-t-xs full progress-small">
                                            <div style="width: 12%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="12" role="progressbar" class=" progress-bar progress-bar-success">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4 project-info">
                                <div class="project-action m-t-md">
                                    <div class="btn-group">
                                        <button class="btn btn-xs btn-default"> View</button>
                                        <button class="btn btn-xs btn-default"> Edit</button>
                                        <button class="btn btn-xs btn-default"> Delete</button>
                                    </div>
                                </div>
                                <div class="project-value">
                                    <h2 class="text-success">
                                        $1 206,40
                                    </h2>
                                </div>
                                <div class="project-people">
                                    <img alt="logo" class="img-circle" src="images/a1.jpg">
                                    <img alt="logo" class="img-circle" src="images/a2.jpg">
                                    <img alt="logo" class="img-circle" src="images/a3.jpg">
                                    <img alt="logo" class="img-circle" src="images/a4.jpg">
                                    <img alt="logo" class="img-circle" src="images/a5.jpg">
                                    <img alt="logo" class="img-circle" src="images/a6.jpg">
                                    <img alt="logo" class="img-circle" src="images/a7.jpg">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel-footer">
                        Additional information about project in footer
                    </div>
                </div>
            </div>
        </div>


        <div class="row projects">
            <div class="col-lg-6">
                <div class="hpanel hgreen">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-sm-8">
                                <h4><a href=""> New branding</a></h4>

                                <p>
                                    There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which
                                </p>

                                <div class="row">
                                    <div class="col-sm-3">
                                        <div class="project-label">CLIENT</div>
                                        <small>Red Agency</small>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="project-label">VERSION</div>
                                        <small>1.2.1</small>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="project-label">DEDLINE</div>
                                        <small>22.04.2015</small>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="project-label">PROGRESS</div>
                                        <div class="progress m-t-xs full progress-small">
                                            <div style="width: 22%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="22" role="progressbar" class=" progress-bar progress-bar-success">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4 project-info">
                                <div class="project-action m-t-md">
                                    <div class="btn-group">
                                        <button class="btn btn-xs btn-default"> View</button>
                                        <button class="btn btn-xs btn-default"> Edit</button>
                                        <button class="btn btn-xs btn-default"> Delete</button>
                                    </div>
                                </div>
                                <div class="project-value">
                                    <h2 class="text-success">
                                        $680,00
                                    </h2>
                                </div>
                                <div class="project-people">
                                    <img alt="logo" class="img-circle" src="images/a5.jpg">
                                    <img alt="logo" class="img-circle" src="images/a3.jpg">
                                    <img alt="logo" class="img-circle" src="images/a6.jpg">
                                    <img alt="logo" class="img-circle" src="images/a8.jpg">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel-footer">
                        Additional information about project in footer
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="hpanel hgreen">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-sm-8">
                                <h4><a href=""> New branding</a></h4>

                                <p>
                                    There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which
                                </p>

                                <div class="row">
                                    <div class="col-sm-3">
                                        <div class="project-label">CLIENT</div>
                                        <small>Red Agency</small>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="project-label">VERSION</div>
                                        <small>1.2.1</small>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="project-label">DEDLINE</div>
                                        <small>22.04.2015</small>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="project-label">PROGRESS</div>
                                        <div class="progress m-t-xs full progress-small">
                                            <div style="width: 22%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="22" role="progressbar" class=" progress-bar progress-bar-success">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4 project-info">
                                <div class="project-action m-t-md">
                                    <div class="btn-group">
                                        <button class="btn btn-xs btn-default"> View</button>
                                        <button class="btn btn-xs btn-default"> Edit</button>
                                        <button class="btn btn-xs btn-default"> Delete</button>
                                    </div>
                                </div>
                                <div class="project-value">
                                    <h2 class="text-success">
                                        $680,00
                                    </h2>
                                </div>
                                <div class="project-people">
                                    <img alt="logo" class="img-circle" src="images/a5.jpg">
                                    <img alt="logo" class="img-circle" src="images/a3.jpg">
                                    <img alt="logo" class="img-circle" src="images/a6.jpg">
                                    <img alt="logo" class="img-circle" src="images/a8.jpg">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel-footer">
                        Additional information about project in footer
                    </div>
                </div>
            </div>
        </div>


        <div class="row projects">
            <div class="col-lg-6">
                <div class="hpanel hgreen">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-sm-8">
                                <h4><a href=""> Project manager app</a></h4>

                                <p>
                                    It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum..
                                </p>

                                <div class="row">
                                    <div class="col-sm-3">
                                        <div class="project-label">CLIENT</div>
                                        <small>Vito Company</small>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="project-label">VERSION</div>
                                        <small>3.0.0</small>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="project-label">DEDLINE</div>
                                        <small>16.10.2015</small>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="project-label">PROGRESS</div>
                                        <div class="progress m-t-xs full progress-small">
                                            <div style="width: 65%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="65" role="progressbar" class=" progress-bar progress-bar-success">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4 project-info">
                                <div class="project-action m-t-md">
                                    <div class="btn-group">
                                        <button class="btn btn-xs btn-default"> View</button>
                                        <button class="btn btn-xs btn-default"> Edit</button>
                                        <button class="btn btn-xs btn-default"> Delete</button>
                                    </div>
                                </div>
                                <div class="project-value">
                                    <h2 class="text-success">
                                        $3 600,20
                                    </h2>
                                </div>
                                <div class="project-people">
                                    <img alt="logo" class="img-circle" src="images/a7.jpg">
                                    <img alt="logo" class="img-circle" src="images/a8.jpg">
                                    <img alt="logo" class="img-circle" src="images/a3.jpg">
                                    <img alt="logo" class="img-circle" src="images/a2.jpg">
                                    <img alt="logo" class="img-circle" src="images/a5.jpg">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel-footer">
                        Additional information about project in footer
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="hpanel hred">
                    <div class="panel-body">
                        <span class="label label-danger pull-right">DEDLINE</span>

                        <div class="row">
                            <div class="col-sm-8">
                                <h4><a href=""> Ilustration project</a></h4>

                                <p>
                                    All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of
                                    over 200 Latin words
                                </p>

                                <div class="row">
                                    <div class="col-sm-3">
                                        <div class="project-label">CLIENT</div>
                                        <small>Taco Fresh Company</small>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="project-label">VERSION</div>
                                        <small>1.0.4</small>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="project-label">DEDLINE</div>
                                        <small>26.02.2015</small>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="project-label">PROGRESS</div>
                                        <div class="progress m-t-xs full progress-small">
                                            <div style="width: 23%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="23" role="progressbar" class=" progress-bar progress-bar-danger">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4 project-info">
                                <div class="project-action m-t-md">
                                    <div class="btn-group">
                                        <button class="btn btn-xs btn-default"> View</button>
                                        <button class="btn btn-xs btn-default"> Edit</button>
                                        <button class="btn btn-xs btn-default"> Delete</button>
                                    </div>
                                </div>
                                <div class="project-value">
                                    <h2 class="text-danger">
                                        $456,20
                                    </h2>
                                </div>
                                <div class="project-people">
                                    <img alt="logo" class="img-circle" src="images/a5.jpg">
                                    <img alt="logo" class="img-circle" src="images/a3.jpg">
                                    <img alt="logo" class="img-circle" src="images/a1.jpg">
                                    <img alt="logo" class="img-circle" src="images/a6.jpg">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel-footer">
                        Additional information about project in footer
                    </div>
                </div>
            </div>
        </div>


        <div class="row projects">
            <div class="col-lg-6">
                <div class="hpanel hred">
                    <div class="panel-body">
                        <span class="label label-danger pull-right">DEDLINE</span>

                        <div class="row">
                            <div class="col-sm-8">
                                <h4><a href=""> Ilustration project</a></h4>

                                <p>
                                    All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of
                                    over 200 Latin words
                                </p>

                                <div class="row">
                                    <div class="col-sm-3">
                                        <div class="project-label">CLIENT</div>
                                        <small>Taco Fresh Company</small>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="project-label">VERSION</div>
                                        <small>1.0.4</small>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="project-label">DEDLINE</div>
                                        <small>26.02.2015</small>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="project-label">PROGRESS</div>
                                        <div class="progress m-t-xs full progress-small">
                                            <div style="width: 23%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="23" role="progressbar" class=" progress-bar progress-bar-danger">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4 project-info">
                                <div class="project-action m-t-md">
                                    <div class="btn-group">
                                        <button class="btn btn-xs btn-default"> View</button>
                                        <button class="btn btn-xs btn-default"> Edit</button>
                                        <button class="btn btn-xs btn-default"> Delete</button>
                                    </div>
                                </div>
                                <div class="project-value">
                                    <h2 class="text-danger">
                                        $456,20
                                    </h2>
                                </div>
                                <div class="project-people">
                                    <img alt="logo" class="img-circle" src="images/a5.jpg">
                                    <img alt="logo" class="img-circle" src="images/a3.jpg">
                                    <img alt="logo" class="img-circle" src="images/a1.jpg">
                                    <img alt="logo" class="img-circle" src="images/a6.jpg">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel-footer">
                        Additional information about project in footer
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="hpanel hblue">
                    <div class="panel-body">
                        <span class="label label-info pull-right">NEW</span>

                        <div class="row">
                            <div class="col-sm-8">
                                <h4><a href=""> Website project</a></h4>

                                <p>
                                    Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years,
                                    sometimes by accident, sometimes on purpose (injected humour and the like).
                                </p>

                                <div class="row">
                                    <div class="col-sm-3">
                                        <div class="project-label">CLIENT</div>
                                        <small>Morph Company</small>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="project-label">VERSION</div>
                                        <small>2.5.2</small>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="project-label">DEDLINE</div>
                                        <small>10.01.2015</small>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="project-label">PROGRESS</div>
                                        <div class="progress m-t-xs full progress-small">
                                            <div style="width: 43%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="43" role="progressbar" class=" progress-bar progress-bar-info">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4 project-info">
                                <div class="project-action m-t-md">
                                    <div class="btn-group">
                                        <button class="btn btn-xs btn-default"> View</button>
                                        <button class="btn btn-xs btn-default"> Edit</button>
                                        <button class="btn btn-xs btn-default"> Delete</button>
                                    </div>
                                </div>
                                <div class="project-value">
                                    <h2 class="text-info">
                                        $456,20
                                    </h2>
                                </div>
                                <div class="project-people">
                                    <img alt="logo" class="img-circle" src="images/a8.jpg">
                                    <img alt="logo" class="img-circle" src="images/a2.jpg">
                                    <img alt="logo" class="img-circle" src="images/a1.jpg">
                                    <img alt="logo" class="img-circle" src="images/a4.jpg">
                                    <img alt="logo" class="img-circle" src="images/a6.jpg">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel-footer">
                        Additional information about project in footer
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

</body>
</html>
