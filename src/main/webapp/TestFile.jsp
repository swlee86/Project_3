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

	<!-- Navigation -->
	<jsp:include page="/sidebar/aside.jsp" />
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
							<li><span>App views</span></li>
							<li class="active"><span>File manager</span></li>
						</ol>
					</div>
					<h2 class="font-light m-b-xs">파일 관리</h2>
					<small>내게 꼭 필요한 파일을 관리하세요!</small>
				</div>
			</div>
		</div>

		<div class="content animate-panel">
			<div class="row">
				<div class="col-md-3">
					<div class="hpanel">
						<div class="panel-body">
							<!--드롭다운 버튼 클릭-->
							<div class="dropdown">
								<a class="dropdown-toggle btn btn-primary btn-block" href="#"
									data-toggle="dropdown"> NEW </a>
								<ul class="dropdown-menu filedropdown m-l">
									<li><a href="#"><i class="fa fa-folder-o"></i> Folder</a></li>
									<li id="file"><a href="#"><i class="fa fa-file"></i>File</a></li>
									<li><a href="#"><i class="fa fa-file-excel-o"></i>
											Sheet</a></li>
									<li><a href="#"><i class="fa fa-file-audio-o"></i>
											Music</a></li>
									<li><a href="#"><i class="fa fa-file-movie-o"></i>
											Movie</a></li>
								</ul>
							</div>

							<ul class="h-list m-t">
								<li class="active"><a href="#"><i class="fa fa-folder"></i>
										Files</a></li>
								<li><a href="#"><i class="fa fa-user text-info"></i>
										Shared with me</a></li>
								<li><a href="#"><i class="fa fa-clock-o text-success"></i>
										Recent</a></li>
								<li><a href="#"><i class="fa fa-star text-warning"></i>
										Starred</a></li>
								<li><a href="#"><i class="fa fa-trash text-danger"></i>
										Trash</a></li>
							</ul>
						</div>

					</div>
					<div class="hpanel">
						<div class="panel-body">
							<h3>6 GB used</h3>
							<p>It is 65% of all your storage</p>
							<div class="progress full m-t-xs">
								<div style="width: 65%" aria-valuemax="100" aria-valuemin="0"
									aria-valuenow="65" role="progressbar"
									class=" progress-bar progress-bar-info">65%</div>
							</div>
							<small>Lorem ipsum dolor sit amet, consectetur adipiscing
								elit vestibulum adipiscing elit.</small>
						</div>

					</div>
				</div>


				<div class="col-md-9">
					<div class="row">
						<div class="col-md-3">
							<div class="hpanel">
								<div class="panel-body file-body">
									<i class="fa fa-file-pdf-o text-info"></i>
								</div>
								<div class="panel-footer">
									<a href="#">Document_2016.doc</a>
								</div>
							</div>
						</div>


						<div class="col-md-3">
							<div class="hpanel">
								<div class="panel-body file-body">
									<i class="fa fa-file-audio-o text-warning"></i>
								</div>
								<div class="panel-footer">
									<a href="#">Audio_2016.doc</a>
								</div>
							</div>
						</div>

						<div class="col-md-3">
							<div class="hpanel">
								<div class="panel-body file-body">
									<i class="fa fa-file-excel-o text-success"></i>
								</div>
								<div class="panel-footer">
									<a href="#">Sheets_2016.doc</a>
								</div>
							</div>
						</div>

						<div class="col-md-3">
							<div class="hpanel">
								<div class="panel-body file-body">
									<i class="fa fa-file-powerpoint-o text-danger"></i>
								</div>
								<div class="panel-footer">
									<a href="#">Presentation_2016.doc</a>
								</div>
							</div>
						</div>
					</div>


				</div>
			</div>


		</div>

		<!-- Right sidebar -->
		<div id="right-sidebar" class="animated fadeInRight">

			<div class="p-m">
				<button id="sidebar-close"
					class="right-sidebar-toggle sidebar-button btn btn-default m-b-md">
					<i class="pe pe-7s-close"></i>
				</button>
				<div>
					<span class="font-bold no-margins"> Analytics </span> <br> <small>
						Lorem Ipsum is simply dummy text of the printing simply all dummy
						text.</small>
				</div>
				<div class="row m-t-sm m-b-sm">
					<div class="col-lg-6">
						<h3 class="no-margins font-extra-bold text-success">300,102</h3>

						<div class="font-bold">
							98% <i class="fa fa-level-up text-success"></i>
						</div>
					</div>
					<div class="col-lg-6">
						<h3 class="no-margins font-extra-bold text-success">280,200</h3>

						<div class="font-bold">
							98% <i class="fa fa-level-up text-success"></i>
						</div>
					</div>
				</div>
				<div class="progress m-t-xs full progress-small">
					<div style="width: 25%" aria-valuemax="100" aria-valuemin="0"
						aria-valuenow="25" role="progressbar"
						class=" progress-bar progress-bar-success">
						<span class="sr-only">35% Complete (success)</span>
					</div>
				</div>
			</div>
			<div class="p-m bg-light border-bottom border-top">
				<span class="font-bold no-margins"> Social talks </span> <br> <small>
					Lorem Ipsum is simply dummy text of the printing simply all dummy
					text.</small>
				<div class="m-t-md">
					<div class="social-talk">
						<div class="media social-profile clearfix">
							<a class="pull-left"> <img src="images/a1.jpg"
								alt="profile-picture">
							</a>

							<div class="media-body">
								<span class="font-bold">John Novak</span> <small
									class="text-muted">21.03.2015</small>
								<div class="social-content small">Injected humour, or
									randomised words which don't look even slightly believable.</div>
							</div>
						</div>
					</div>
					<div class="social-talk">
						<div class="media social-profile clearfix">
							<a class="pull-left"> <img src="images/a3.jpg"
								alt="profile-picture">
							</a>

							<div class="media-body">
								<span class="font-bold">Mark Smith</span> <small
									class="text-muted">14.04.2015</small>
								<div class="social-content">Many desktop publishing
									packages and web page editors.</div>
							</div>
						</div>
					</div>
					<div class="social-talk">
						<div class="media social-profile clearfix">
							<a class="pull-left"> <img src="images/a4.jpg"
								alt="profile-picture">
							</a>

							<div class="media-body">
								<span class="font-bold">Marica Morgan</span> <small
									class="text-muted">21.03.2015</small>

								<div class="social-content">There are many variations of
									passages of Lorem Ipsum available, but the majority have</div>
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
							<h4 class="m-t-xs">
								$170,20 <i class="fa fa-level-up text-success"></i>
							</h4>
						</div>
						<div class="col-xs-6">
							<small>Last week</small>
							<h4 class="m-t-xs">
								$580,90 <i class="fa fa-level-up text-success"></i>
							</h4>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6">
							<small>Today</small>
							<h4 class="m-t-xs">
								$620,20 <i class="fa fa-level-up text-success"></i>
							</h4>
						</div>
						<div class="col-xs-6">
							<small>Last week</small>
							<h4 class="m-t-xs">
								$140,70 <i class="fa fa-level-up text-success"></i>
							</h4>
						</div>
					</div>
				</div>
				<small> Lorem Ipsum is simply dummy text of the printing
					simply all dummy text. Many desktop publishing packages and web
					page editors. </small>
			</div>

		</div>

		<!-- Footer-->
		<footer class="footer">
			<span class="pull-right"> Example text </span> Company 2015-2020
		</footer>
	</div>

	<div class="modal fade" id="myModal6" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="color-line"></div>
				<div class="modal-header">
					<h4 class="modal-title">Modal title</h4>
					<small class="font-bold">Lorem Ipsum is simply dummy text.</small>
				</div>
				<div class="modal-body">
					<p>
						<strong>Lorem Ipsum is simply dummy</strong> text of the printing
						and typesetting industry. Lorem Ipsum has been the industry's
						standard dummy text ever since the 1500s, when an unknown printer
						took a galley of type and scrambled it to make a type specimen
						book. It has survived not only five centuries, but also the leap
						into electronic typesetting, remaining essentially unchanged.
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
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

	<!-- App scripts -->
	<script src="scripts/homer.js"></script>

	<script>
		$(function(){
			$('#file').click(function(){
				$('#myModal6').modal();
			});
		});
	</script>

</body>
</html>