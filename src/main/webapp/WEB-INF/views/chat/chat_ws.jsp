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
<jsp:include page="/sidebar/header.jsp"></jsp:include>

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
                    <li><a href="index.do">Dashboard</a></li>
                    <li>
                        <span>App views</span>
                    </li>
                    <li class="active">
                        <span>Chat view</span>
                    </li>
                </ol>
            </div>
            <h2 class="font-light m-b-xs">
                Chat view
            </h2>
            <small>Create a chat rooom in your app</small>
        </div>
    </div>
</div>

<div class="content animate-panel">

    <div class="row">
        <div class="col-md-12">
            <div class="hpanel ">
                <div class="panel-heading hbuilt">
                    <div class="panel-tools">
                        <a class="closebox"><i class="fa fa-times"></i></a>
                    </div>
                    Chat room
                </div>
                <div class="panel-body no-padding">


                    <div class="row">

                        <div class="col-md-9 ">
                            <div class="chat-discussion">
								<textarea id="messageWindow" rows="25" cols="100" readonly="readonly"></textarea>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="chat-users">

                                <div class="users-list">

                                    <div class="chat-user">
                                        <span class="pull-right label label-success">Online</span>
                                        <img class="chat-avatar" src="images/a3.jpg" alt="" >
                                        <div class="chat-user-name">
                                            <a href="#">Janet Smith</a>
                                        </div>
                                    </div>
                                    <div class="chat-user">
                                        <img class="chat-avatar" src="images/a1.jpg" alt="" >
                                        <div class="chat-user-name">
                                            <a href="#">Monica Smith</a>
                                        </div>
                                    </div>
                                    <div class="chat-user">
                                        <span class="pull-right label label-success">Online</span>
                                        <img class="chat-avatar" src="images/a2.jpg" alt="" >
                                        <div class="chat-user-name">
                                            <a href="#">Michael Smith</a>
                                        </div>
                                    </div>
                                    <div class="chat-user">
                                        <img class="chat-avatar" src="images/a4.jpg" alt="" >
                                        <div class="chat-user-name">
                                            <a href="#">Karl Jordan</a>
                                        </div>
                                    </div>
                                    <div class="chat-user">
                                        <img class="chat-avatar" src="images/a5.jpg" alt="" >
                                        <div class="chat-user-name">
                                            <a href="#">Alice Smith</a>
                                        </div>
                                    </div>
                                    <div class="chat-user">
                                        <img class="chat-avatar" src="images/a6.jpg" alt="" >
                                        <div class="chat-user-name">
                                            <a href="#">Monica Cale</a>
                                        </div>
                                    </div>
                                    <div class="chat-user">
                                        <img class="chat-avatar" src="images/a2.jpg" alt="" >
                                        <div class="chat-user-name">
                                            <a href="#">Mark Jordan</a>
                                        </div>
                                    </div>
                                    <div class="chat-user">
                                        <span class="pull-right label ">Online</span>
                                        <img class="chat-avatar" src="images/a3.jpg" alt="" >
                                        <div class="chat-user-name">
                                            <a href="#">Janet Smith</a>
                                        </div>
                                    </div>
                                    <div class="chat-user">
                                        <img class="chat-avatar" src="images/a4.jpg" alt="" >
                                        <div class="chat-user-name">
                                            <a href="#">Karl Jordan</a>
                                        </div>
                                    </div>
                                    <div class="chat-user">
                                        <img class="chat-avatar" src="images/a5.jpg" alt="" >
                                        <div class="chat-user-name">
                                            <a href="#">Alice Smith</a>
                                        </div>
                                    </div>
                                    <div class="chat-user">
                                        <img class="chat-avatar" src="images/a6.jpg" alt="" >
                                        <div class="chat-user-name">
                                            <a href="#">Monica Cale</a>
                                        </div>
                                    </div>
                                    <div class="chat-user">
                                        <img class="chat-avatar" src="images/a2.jpg" alt="" >
                                        <div class="chat-user-name">
                                            <a href="#">Mark Jordan</a>
                                        </div>
                                    </div>


                                </div>

                            </div>
                        </div>

                    </div>
                </div>
                <div class="panel-footer">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Type your message here..." id="inputMessage">
                        <span class="input-group-btn">
                            <button class="btn btn-success" onclick="send()" value="send">Send</button>
                        </span>
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
  <script type="text/javascript">
        var textarea = document.getElementById("messageWindow");
        var webSocket = new WebSocket('ws://localhost:8090/epm/broadcasting');
        var inputMessage = document.getElementById('inputMessage');
    webSocket.onerror = function(event) {
      onError(event)
    };
    webSocket.onopen = function(event) {
      onOpen(event)
    };
    webSocket.onmessage = function(event) {
      onMessage(event)
    };
    function onMessage(event) {
        textarea.value += "상대 : " + event.data + "\n";
    }
    function onOpen(event) {
        textarea.value += "연결 성공\n";
    }
    function onError(event) {
      alert(event.data);
    }
    function send() {
        textarea.value += "나 : " + inputMessage.value + "\n";
        webSocket.send(inputMessage.value);
        inputMessage.value = "";
    }
    
  </script>
</body>
</html>