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
    <link rel="stylesheet" href="vendor/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" />

    <!-- App styles -->
    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css" />
    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/css/helper.css" />
    <link rel="stylesheet" href="styles/static_custom.css">
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
                        <li><a href="index.html">Dashboard</a></li>
                        <li>
                            <span>App views</span>
                        </li>
                        <li class="active">
                            <span>Mailbox</span>
                        </li>
                    </ol>
                </div>
                <h2 class="font-light m-b-xs">
                    Mailbox
                </h2>
                <small>Mailbox - Email list.</small>
            </div>
        </div>
    </div>
    <div class="content animate-panel">

        <div class="row">
            <div class="col-md-3">
                <div class="hpanel">
                    <div class="panel-body">

                        <ul class="mailbox-list">
                            <li class="active">
                                <a href="#">
                                    <span class="pull-right">12</span>
                                    <i class="fa fa-envelope"></i> Inbox
                                </a>
                            </li>
                            <li>
                                <a href="mailbox_compose.do"><i class="fa fa-paper-plane"></i> Sent</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-pencil"></i> Draft</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-trash"></i> Trash</a>
                            </li>
                        </ul>
                        <hr>
                        <ul class="mailbox-list">
                            <li>
                                <a href="#"><i class="fa fa-plane text-danger"></i> Travel</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-bar-chart text-warning"></i> Finance</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-users text-info"></i> Social</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-tag text-success"></i> Promos</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-flag text-primary"></i> Updates</a>
                            </li>
                        </ul>
                        <hr>
                        <ul class="mailbox-list">
                            <li>
                                <a href="#"><i class="fa fa-gears"></i> Settings</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-info-circle"></i> Support</a>
                            </li>
                        </ul>


                    </div>

                </div>
            </div>
            <div class="col-md-9">
                <div class="hpanel">
                    <div class="panel-heading hbuilt">
                        <div class="text-center p-xs font-normal">
                            <div class="input-group"><input type="text" class="form-control input-sm" placeholder="Search email in your inbox..."> <span class="input-group-btn"> <button type="button" class="btn btn-sm btn-default">Search
                            </button> </span></div>
                        </div>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-6 m-b-md">
                                <div class="btn-group">
                                    <button class="btn btn-default btn-sm"><i class="fa fa-refresh"></i> Refresh</button>
                                    <button class="btn btn-default btn-sm"><i class="fa fa-eye"></i></button>
                                    <button class="btn btn-default btn-sm"><i class="fa fa-exclamation"></i></button>
                                    <button class="btn btn-default btn-sm"><i class="fa fa-trash-o"></i></button>
                                    <button class="btn btn-default btn-sm"><i class="fa fa-check"></i></button>
                                    <button class="btn btn-default btn-sm"><i class="fa fa-tag"></i></button>
                                </div>
                            </div>
                            <div class="col-md-6 mailbox-pagination m-b-md">
                                <div class="btn-group">
                                    <button class="btn btn-default btn-sm"><i class="fa fa-arrow-left"></i></button>
                                    <button class="btn btn-default btn-sm"><i class="fa fa-arrow-right"></i></button>
                                </div>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-hover table-mailbox">
                                <tbody>
                                <tr class="unread">
                                    <td class="">
                                        <div class="checkbox checkbox-single checkbox-success">
                                            <input type="checkbox" checked>
                                            <label></label>
                                        </div>
                                    </td>
                                    <td><a href="#">Jeremy Massey</a></td>
                                    <td><a href="#">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</a>
                                    </td>
                                    <td><i class="fa fa-paperclip"></i></td>
                                    <td class="text-right mail-date">Tue, Nov 25</td>
                                </tr>
                                <tr>
                                    <td class="">
                                        <div class="checkbox">
                                            <input type="checkbox">
                                            <label></label>
                                        </div>
                                    </td>
                                    <td><a href="#">Marshall Horne</a></td>
                                    <td><a href="#">Praesent nec nisl sed neque ornare maximus at ac enim.</a>
                                    </td>
                                    <td></td>
                                    <td class="text-right mail-date">Wed, Jan 13</td>
                                </tr>
                                <tr class="active">
                                    <td class="">
                                        <div class="checkbox">
                                            <input type="checkbox">
                                            <label></label>
                                        </div>
                                    </td>
                                    <td><a href="#">Grant Franco</a> <span
                                            class="label label-warning">Finance</span></td>
                                    <td><a href="#">Etiam maximus tellus a turpis tempor mollis.</a></td>
                                    <td></td>
                                    <td class="text-right mail-date">Mon, Oct 19</td>
                                </tr>
                                <tr class="unread active">
                                    <td class="">
                                        <div class="checkbox checkbox-single">
                                            <input type="checkbox" checked>
                                            <label></label>
                                        </div>
                                    </td>
                                    <td><a href="#">Ferdinand Meadows</a></td>
                                    <td><a href="#">Aenean hendrerit ligula eget augue gravida semper.</a></td>
                                    <td><i class="fa fa-paperclip"></i></td>
                                    <td class="text-right mail-date">Sat, Aug 29</td>
                                </tr>
                                <tr>
                                    <td class="">
                                        <div class="checkbox checkbox-single">
                                            <input type="checkbox">
                                            <label></label>
                                        </div>
                                    </td>
                                    <td><a href="#">Ivor Rios</a> <span class="label label-info">Social</span>
                                    </td>
                                    <td><a href="#">Sed quis augue in nunc venenatis finibus.</a></td>
                                    <td><i class="fa fa-paperclip"></i></td>
                                    <td class="text-right mail-date">Sat, Dec 12</td>
                                </tr>
                                <tr>
                                    <td class="">
                                        <div class="checkbox">
                                            <input type="checkbox">
                                            <label></label>
                                        </div>
                                    </td>
                                    <td><a href="#">Maxwell Murphy</a></td>
                                    <td><a href="#">Quisque eu tortor quis justo viverra cursus.</a></td>
                                    <td></td>
                                    <td class="text-right mail-date">Sun, May 17</td>
                                </tr>
                                <tr>
                                    <td class="">
                                        <div class="checkbox">
                                            <input type="checkbox">
                                            <label></label>
                                        </div>
                                    </td>
                                    <td><a href="#">Henry Patterson</a></td>
                                    <td><a href="#">Aliquam nec justo interdum, ornare mi non, elementum
                                        lacus.</a></td>
                                    <td><i class="fa fa-paperclip"></i></td>
                                    <td class="text-right mail-date">Thu, Aug 06</td>
                                </tr>
                                <tr>
                                    <td class="">
                                        <div class="checkbox">
                                            <input type="checkbox">
                                            <label></label>
                                        </div>
                                    </td>
                                    <td><a href="#">Brent Rasmussen</a></td>
                                    <td><a href="#">Nam nec turpis sed quam tristique sodales.</a></td>
                                    <td></td>
                                    <td class="text-right mail-date">Sun, Nov 15</td>
                                </tr>
                                <tr class="unread">
                                    <td class="">
                                        <div class="checkbox checkbox-single checkbox-success">
                                            <input type="checkbox" checked>
                                            <label></label>
                                        </div>
                                    </td>
                                    <td><a href="#">Joseph Hurley</a></td>
                                    <td><a href="#">Nullam tempus leo id urna sagittis blandit.</a></td>
                                    <td><i class="fa fa-paperclip"></i></td>
                                    <td class="text-right mail-date">Sun, Aug 10</td>
                                </tr>
                                <tr>
                                    <td class="">
                                        <div class="checkbox">
                                            <input type="checkbox">
                                            <label></label>
                                        </div>
                                    </td>
                                    <td><a href="#">Alan Matthews</a></td>
                                    <td><a href="#">Quisque quis turpis ac quam sagittis scelerisque vel ut
                                        urna.</a></td>
                                    <td></td>
                                    <td class="text-right mail-date">Sun, Mar 27</td>
                                </tr>
                                <tr class="active">
                                    <td class="">
                                        <div class="checkbox">
                                            <input type="checkbox">
                                            <label></label>
                                        </div>
                                    </td>
                                    <td><a href="#">Colby Lynch</a> <span
                                            class="label label-danger">Travel</span></td>
                                    <td><a href="#">Donec non enim pulvinar, ultrices metus eget, condimentum
                                        mi.</a></td>
                                    <td></td>
                                    <td class="text-right mail-date">Thu, Dec 31</td>
                                </tr>
                                <tr class="unread">
                                    <td class="">
                                        <div class="checkbox checkbox-single checkbox-success">
                                            <input type="checkbox" checked>
                                            <label></label>
                                        </div>
                                    </td>
                                    <td><a href="#">Jeremy Massey</a></td>
                                    <td><a href="#">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</a>
                                    </td>
                                    <td><i class="fa fa-paperclip"></i></td>
                                    <td class="text-right mail-date">Tue, Nov 25</td>
                                </tr>
                                <tr>
                                    <td class="">
                                        <div class="checkbox">
                                            <input type="checkbox">
                                            <label></label>
                                        </div>
                                    </td>
                                    <td><a href="#">Marshall Horne</a></td>
                                    <td><a href="#">Praesent nec nisl sed neque ornare maximus at ac enim.</a>
                                    </td>
                                    <td></td>
                                    <td class="text-right mail-date">Wed, Jan 13</td>
                                </tr>
                                <tr class="active">
                                    <td class="">
                                        <div class="checkbox">
                                            <input type="checkbox">
                                            <label></label>
                                        </div>
                                    </td>
                                    <td><a href="#">Grant Franco</a> <span
                                            class="label label-warning">Finance</span></td>
                                    <td><a href="#">Etiam maximus tellus a turpis tempor mollis.</a></td>
                                    <td></td>
                                    <td class="text-right mail-date">Mon, Oct 19</td>
                                </tr>
                                <tr class="unread active">
                                    <td class="">
                                        <div class="checkbox checkbox-single">
                                            <input type="checkbox" checked>
                                            <label></label>
                                        </div>
                                    </td>
                                    <td><a href="#">Ferdinand Meadows</a></td>
                                    <td><a href="#">Aenean hendrerit ligula eget augue gravida semper.</a></td>
                                    <td><i class="fa fa-paperclip"></i></td>
                                    <td class="text-right mail-date">Sat, Aug 29</td>
                                </tr>
                                <tr>
                                    <td class="">
                                        <div class="checkbox checkbox-single">
                                            <input type="checkbox">
                                            <label></label>
                                        </div>
                                    </td>
                                    <td><a href="#">Ivor Rios</a> <span class="label label-info">Social</span>
                                    </td>
                                    <td><a href="#">Sed quis augue in nunc venenatis finibus.</a></td>
                                    <td><i class="fa fa-paperclip"></i></td>
                                    <td class="text-right mail-date">Sat, Dec 12</td>
                                </tr>
                                <tr>
                                    <td class="">
                                        <div class="checkbox">
                                            <input type="checkbox">
                                            <label></label>
                                        </div>
                                    </td>
                                    <td><a href="#">Maxwell Murphy</a></td>
                                    <td><a href="#">Quisque eu tortor quis justo viverra cursus.</a></td>
                                    <td></td>
                                    <td class="text-right mail-date">Sun, May 17</td>
                                </tr>
                                <tr>
                                    <td class="">
                                        <div class="checkbox">
                                            <input type="checkbox">
                                            <label></label>
                                        </div>
                                    </td>
                                    <td><a href="#">Henry Patterson</a></td>
                                    <td><a href="#">Aliquam nec justo interdum, ornare mi non, elementum
                                        lacus.</a></td>
                                    <td><i class="fa fa-paperclip"></i></td>
                                    <td class="text-right mail-date">Thu, Aug 06</td>
                                </tr>
                                <tr>
                                    <td class="">
                                        <div class="checkbox">
                                            <input type="checkbox">
                                            <label></label>
                                        </div>
                                    </td>
                                    <td><a href="#">Brent Rasmussen</a></td>
                                    <td><a href="#">Nam nec turpis sed quam tristique sodales.</a></td>
                                    <td></td>
                                    <td class="text-right mail-date">Sun, Nov 15</td>
                                </tr>
                                <tr class="unread">
                                    <td class="">
                                        <div class="checkbox checkbox-single checkbox-success">
                                            <input type="checkbox" checked>
                                            <label></label>
                                        </div>
                                    </td>
                                    <td><a href="#">Joseph Hurley</a></td>
                                    <td><a href="#">Nullam tempus leo id urna sagittis blandit.</a></td>
                                    <td><i class="fa fa-paperclip"></i></td>
                                    <td class="text-right mail-date">Sun, Aug 10</td>
                                </tr>
                                <tr>
                                    <td class="">
                                        <div class="checkbox">
                                            <input type="checkbox">
                                            <label></label>
                                        </div>
                                    </td>
                                    <td><a href="#">Alan Matthews</a></td>
                                    <td><a href="#">Quisque quis turpis ac quam sagittis scelerisque vel ut
                                        urna.</a></td>
                                    <td></td>
                                    <td class="text-right mail-date">Sun, Mar 27</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="panel-footer">
                        <i class="fa fa-eye"> </i> 6 unread
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
<script src="vendor/slimScroll/jquery.slimscroll.min.js"></script>
<script src="vendor/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="vendor/metisMenu/dist/metisMenu.min.js"></script>
<script src="vendor/iCheck/icheck.min.js"></script>
<script src="vendor/peity/jquery.peity.min.js"></script>
<script src="vendor/sparkline/index.js"></script>

<!-- App scripts -->
<script src="scripts/homer.js"></script>

</body>
</html>