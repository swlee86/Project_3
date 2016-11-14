<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--프로젝트 상세 카드형식-->
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
					<li><a href="projects.do">진행중인 프로젝트(1.내가 하고있는 것만 ) (2.내가
							속한 부서의 프로젝트)</a></li>
				</ol>
			</div>
			<h2 class="font-light m-b-xs">진행중인 프로젝트</h2>
			<small>부서에서 진행 중인 프로젝트를 확인하실 수 있습니다</small>
		</div>
	</div>
</div>

<div class="content animate-panel">

	<div class="row projects">
		<div class="col-lg-6">
			<div class="hpanel hgreen">
				<div class="panel-body">

					<!--프로젝트 상세 히든 번호-->
					<input type="hidden" class="hiddenValue" value="${1}"> <span
						class="label label-success pull-right" style="margin-top: -5px;">NEW</span>
					<div class="row">
						<div class="col-sm-8">
							<div class="row">
								<div class="col-sm-4">
									<h4 class="projectName">프로젝트 제목</h4>
								</div>
								<div class="col-sm-4">
									<h4 class="makeUser">박성준</h4>
								</div>
							</div>


							<br />

							<div class="row">
								<div class="col-sm-4">
									<div class="project-label">시작일</div>
									<small>12.06.2015</small>
								</div>
								<div class="col-sm-4">
									<div class="project-label">종료일</div>
									<small>12.06.2015</small>
								</div>
								<div class="col-sm-4">
									<div class="project-label">PROGRESS</div>
									<div class="progress m-t-xs full progress-small">
										<div style="width: 12%" aria-valuemax="100" aria-valuemin="0"
											aria-valuenow="12" role="progressbar"
											class=" progress-bar progress-bar-success"></div>
									</div>
								</div>

							</div>
							<br />
							<p>이 프로젝트는 내가 하고 너가하고 너와나의 연결고리</p>
						</div>

						<div class="col-sm-4 project-info">
							<div class="project-value" style="margin-top: 5px;">
								<small>참여자</small>
							</div>
							<br />
							<div class="project-people">
								<a href="#myModal" data-target="#myModal" data-toggle="modal"><img
									alt="logo" class="img-circle" src="images/a1.jpg"></a> <img
									alt="logo" class="img-circle" src="images/a2.jpg"> <img
									alt="logo" class="img-circle" src="images/a3.jpg"> <img
									alt="logo" class="img-circle" src="images/a4.jpg"> <img
									alt="logo" class="img-circle" src="images/a5.jpg"> <img
									alt="logo" class="img-circle" src="images/a6.jpg"> <img
									alt="logo" class="img-circle" src="images/a7.jpg">
							</div>
						</div>
					</div>
				</div>
				<div class="panel-footer">
					<button class="btn btn-success"
						onclick="detailProjectCheckList(this)">상세보기</button>
				</div>
			</div>
		</div>
		<div class="col-lg-6">
			<div class="hpanel hgreen">
				<div class="panel-body">
					<!--프로젝트 상세 히든 번호-->
					<input type="hidden" class="hiddenValue" value="${2}"> <span
						class="label label-success pull-right" style="margin-top: -5px;">NEW</span>
					<div class="row">
						<div class="col-sm-8">

							<h4>
								프로젝트 제목 - <small>연결고리</small>
							</h4>
							<br />
							<div class="row">
								<div class="col-sm-4">
									<div class="project-label">시작일</div>
									<small>12.06.2015</small>
								</div>
								<div class="col-sm-4">
									<div class="project-label">종료일</div>
									<small>12.06.2015</small>
								</div>
								<div class="col-sm-4">
									<div class="project-label">PROGRESS</div>
									<div class="progress m-t-xs full progress-small">
										<div style="width: 12%" aria-valuemax="100" aria-valuemin="0"
											aria-valuenow="12" role="progressbar"
											class=" progress-bar progress-bar-success"></div>
									</div>
								</div>

							</div>
							<br />
							<p>이 프로젝트는 내가 하고 너가하고 너와나의 연결고리</p>
						</div>

						<div class="col-sm-4 project-info">
							<div class="project-value" style="margin-top: 5px;">
								<small>참여자</small>
							</div>
							<br />
							<div class="project-people">
								<img alt="logo" class="img-circle" src="images/a1.jpg"> <img
									alt="logo" class="img-circle" src="images/a2.jpg"> <img
									alt="logo" class="img-circle" src="images/a3.jpg"> <img
									alt="logo" class="img-circle" src="images/a4.jpg"> <img
									alt="logo" class="img-circle" src="images/a5.jpg"> <img
									alt="logo" class="img-circle" src="images/a6.jpg"> <img
									alt="logo" class="img-circle" src="images/a7.jpg">
							</div>
						</div>
					</div>
				</div>
				<div class="panel-footer">
					<button class="btn btn-success"
						onclick="detailProjectCheckList(this)">상세보기</button>
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
							<h4>
								<a href=""> Website project</a>
							</h4>
							<p>Lorem Ipsum as their default model text, and a search for
								'lorem ipsum' will uncover many web sites still in their
								infancy. Various versions have evolved over the years, sometimes
								by accident, sometimes on purpose (injected humour and the
								like).</p>
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
										<div style="width: 43%" aria-valuemax="100" aria-valuemin="0"
											aria-valuenow="43" role="progressbar"
											class=" progress-bar progress-bar-info"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-4 project-info">
							<div class="project-action m-t-md">
								<div class="btn-group">
									<button class="btn btn-xs btn-default">View</button>
									<button class="btn btn-xs btn-default">Edit</button>
									<button class="btn btn-xs btn-default">Delete</button>
								</div>
							</div>
							<div class="project-value">
								<h2 class="text-info">$456,20</h2>
							</div>
							<div class="project-people">
								<img alt="logo" class="img-circle" src="images/a8.jpg"> <img
									alt="logo" class="img-circle" src="images/a2.jpg"> <img
									alt="logo" class="img-circle" src="images/a1.jpg"> <img
									alt="logo" class="img-circle" src="images/a4.jpg"> <img
									alt="logo" class="img-circle" src="images/a6.jpg">
							</div>
						</div>
					</div>
				</div>
				<div class="panel-footer">Additional information about project
					in footer</div>
			</div>
		</div>
		<div class="col-lg-6">
			<div class="hpanel hgreen">
				<div class="panel-body">
					<span class="label label-success pull-right"
						style="margin-top: -5px;">NEW</span>
					<div class="row">
						<div class="col-sm-8">
							<h4>
								<a href=""> Desing project</a>
							</h4>
							<p>It is a long established fact that a reader will be
								distracted by the readable content of a page when looking at its
								layout. The point of using Lorem Ipsum is that it has a
								more-or-less normal distribution of letters, as opposed to
								using.</p>
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
										<div style="width: 12%" aria-valuemax="100" aria-valuemin="0"
											aria-valuenow="12" role="progressbar"
											class=" progress-bar progress-bar-success"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-4 project-info">
							<div class="project-action m-t-md">
								<div class="btn-group">
									<button class="btn btn-xs btn-default">View</button>
									<button class="btn btn-xs btn-default">Edit</button>
									<button class="btn btn-xs btn-default">Delete</button>
								</div>
							</div>
							<div class="project-value">
								<h2 class="text-success">$1 206,40</h2>
							</div>
							<div class="project-people">
								<img alt="logo" class="img-circle" src="images/a1.jpg"> <img
									alt="logo" class="img-circle" src="images/a2.jpg"> <img
									alt="logo" class="img-circle" src="images/a3.jpg"> <img
									alt="logo" class="img-circle" src="images/a4.jpg"> <img
									alt="logo" class="img-circle" src="images/a5.jpg"> <img
									alt="logo" class="img-circle" src="images/a6.jpg"> <img
									alt="logo" class="img-circle" src="images/a7.jpg">
							</div>
						</div>
					</div>
				</div>
				<div class="panel-footer">Additional information about project
					in footer</div>
			</div>
		</div>
	</div>


	<div class="row projects">
		<div class="col-lg-6">
			<div class="hpanel hgreen">
				<div class="panel-body">
					<div class="row">
						<div class="col-sm-8">
							<h4>
								<a href=""> New branding</a>
							</h4>

							<p>There are many variations of passages of Lorem Ipsum
								available, but the majority have suffered alteration in some
								form, by injected humour, or randomised words which</p>

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
										<div style="width: 22%" aria-valuemax="100" aria-valuemin="0"
											aria-valuenow="22" role="progressbar"
											class=" progress-bar progress-bar-success"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-4 project-info">
							<div class="project-action m-t-md">
								<div class="btn-group">
									<button class="btn btn-xs btn-default">View</button>
									<button class="btn btn-xs btn-default">Edit</button>
									<button class="btn btn-xs btn-default">Delete</button>
								</div>
							</div>
							<div class="project-value">
								<h2 class="text-success">$680,00</h2>
							</div>
							<div class="project-people">
								<img alt="logo" class="img-circle" src="images/a5.jpg"> <img
									alt="logo" class="img-circle" src="images/a3.jpg"> <img
									alt="logo" class="img-circle" src="images/a6.jpg"> <img
									alt="logo" class="img-circle" src="images/a8.jpg">
							</div>
						</div>
					</div>
				</div>
				<div class="panel-footer">Additional information about project
					in footer</div>
			</div>
		</div>
		<div class="col-lg-6">
			<div class="hpanel hgreen">
				<div class="panel-body">
					<div class="row">
						<div class="col-sm-8">
							<h4>
								<a href=""> New branding</a>
							</h4>

							<p>There are many variations of passages of Lorem Ipsum
								available, but the majority have suffered alteration in some
								form, by injected humour, or randomised words which</p>

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
										<div style="width: 22%" aria-valuemax="100" aria-valuemin="0"
											aria-valuenow="22" role="progressbar"
											class=" progress-bar progress-bar-success"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-4 project-info">
							<div class="project-action m-t-md">
								<div class="btn-group">
									<button class="btn btn-xs btn-default">View</button>
									<button class="btn btn-xs btn-default">Edit</button>
									<button class="btn btn-xs btn-default">Delete</button>
								</div>
							</div>
							<div class="project-value">
								<h2 class="text-success">$680,00</h2>
							</div>
							<div class="project-people">
								<img alt="logo" class="img-circle" src="images/a5.jpg"> <img
									alt="logo" class="img-circle" src="images/a3.jpg"> <img
									alt="logo" class="img-circle" src="images/a6.jpg"> <img
									alt="logo" class="img-circle" src="images/a8.jpg">
							</div>
						</div>
					</div>
				</div>
				<div class="panel-footer">Additional information about project
					in footer</div>
			</div>
		</div>
	</div>


	<div class="row projects">
		<div class="col-lg-6">
			<div class="hpanel hgreen">
				<div class="panel-body">
					<div class="row">
						<div class="col-sm-8">
							<h4>
								<a href=""> Project manager app</a>
							</h4>

							<p>It is a long established fact that a reader will be
								distracted by the readable content of a page when looking at its
								layout. The point of using Lorem Ipsum..</p>

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
										<div style="width: 65%" aria-valuemax="100" aria-valuemin="0"
											aria-valuenow="65" role="progressbar"
											class=" progress-bar progress-bar-success"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-4 project-info">
							<div class="project-action m-t-md">
								<div class="btn-group">
									<button class="btn btn-xs btn-default">View</button>
									<button class="btn btn-xs btn-default">Edit</button>
									<button class="btn btn-xs btn-default">Delete</button>
								</div>
							</div>
							<div class="project-value">
								<h2 class="text-success">$3 600,20</h2>
							</div>
							<div class="project-people">
								<img alt="logo" class="img-circle" src="images/a7.jpg"> <img
									alt="logo" class="img-circle" src="images/a8.jpg"> <img
									alt="logo" class="img-circle" src="images/a3.jpg"> <img
									alt="logo" class="img-circle" src="images/a2.jpg"> <img
									alt="logo" class="img-circle" src="images/a5.jpg">
							</div>
						</div>
					</div>
				</div>
				<div class="panel-footer">Additional information about project
					in footer</div>
			</div>
		</div>
		<div class="col-lg-6">
			<div class="hpanel hred">
				<div class="panel-body">
					<span class="label label-danger pull-right">DEDLINE</span>

					<div class="row">
						<div class="col-sm-8">
							<h4>
								<a href=""> Ilustration project</a>
							</h4>

							<p>All the Lorem Ipsum generators on the Internet tend to
								repeat predefined chunks as necessary, making this the first
								true generator on the Internet. It uses a dictionary of over 200
								Latin words</p>

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
										<div style="width: 23%" aria-valuemax="100" aria-valuemin="0"
											aria-valuenow="23" role="progressbar"
											class=" progress-bar progress-bar-danger"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-4 project-info">
							<div class="project-action m-t-md">
								<div class="btn-group">
									<button class="btn btn-xs btn-default">View</button>
									<button class="btn btn-xs btn-default">Edit</button>
									<button class="btn btn-xs btn-default">Delete</button>
								</div>
							</div>
							<div class="project-value">
								<h2 class="text-danger">$456,20</h2>
							</div>
							<div class="project-people">
								<img alt="logo" class="img-circle" src="images/a5.jpg"> <img
									alt="logo" class="img-circle" src="images/a3.jpg"> <img
									alt="logo" class="img-circle" src="images/a1.jpg"> <img
									alt="logo" class="img-circle" src="images/a6.jpg">
							</div>
						</div>
					</div>
				</div>
				<div class="panel-footer">Additional information about project
					in footer</div>
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
							<h4>
								<a href=""> Ilustration project</a>
							</h4>

							<p>All the Lorem Ipsum generators on the Internet tend to
								repeat predefined chunks as necessary, making this the first
								true generator on the Internet. It uses a dictionary of over 200
								Latin words</p>

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
										<div style="width: 23%" aria-valuemax="100" aria-valuemin="0"
											aria-valuenow="23" role="progressbar"
											class=" progress-bar progress-bar-danger"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-4 project-info">
							<div class="project-action m-t-md">
								<div class="btn-group">
									<button class="btn btn-xs btn-default">View</button>
									<button class="btn btn-xs btn-default">Edit</button>
									<button class="btn btn-xs btn-default">Delete</button>
								</div>
							</div>
							<div class="project-value">
								<h2 class="text-danger">$456,20</h2>
							</div>
							<div class="project-people">
								<img alt="logo" class="img-circle" src="images/a5.jpg"> <img
									alt="logo" class="img-circle" src="images/a3.jpg"> <img
									alt="logo" class="img-circle" src="images/a1.jpg"> <img
									alt="logo" class="img-circle" src="images/a6.jpg">
							</div>
						</div>
					</div>
				</div>
				<div class="panel-footer">Additional information about project
					in footer</div>
			</div>
		</div>
		<div class="col-lg-6">
			<div class="hpanel hblue">
				<div class="panel-body">
					<span class="label label-info pull-right">NEW</span>

					<div class="row">
						<div class="col-sm-8">
							<h4>
								<a href=""> Website project</a>
							</h4>

							<p>Lorem Ipsum as their default model text, and a search for
								'lorem ipsum' will uncover many web sites still in their
								infancy. Various versions have evolved over the years, sometimes
								by accident, sometimes on purpose (injected humour and the
								like).</p>

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
										<div style="width: 43%" aria-valuemax="100" aria-valuemin="0"
											aria-valuenow="43" role="progressbar"
											class=" progress-bar progress-bar-info"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-4 project-info">
							<div class="project-action m-t-md">
								<div class="btn-group">
									<button class="btn btn-xs btn-default">View</button>
									<button class="btn btn-xs btn-default">Edit</button>
									<button class="btn btn-xs btn-default">Delete</button>
								</div>
							</div>
							<div class="project-value">
								<h2 class="text-info">$456,20</h2>
							</div>
							<div class="project-people">
								<img alt="logo" class="img-circle" src="images/a8.jpg"> <img
									alt="logo" class="img-circle" src="images/a2.jpg"> <img
									alt="logo" class="img-circle" src="images/a1.jpg"> <img
									alt="logo" class="img-circle" src="images/a4.jpg"> <img
									alt="logo" class="img-circle" src="images/a6.jpg">
							</div>
						</div>
					</div>
				</div>
				<div class="panel-footer">Additional information about project
					in footer</div>
			</div>
		</div>
	</div>

</div>


<!--이미지 클릭시 뜨는 모달 페이지-->
<div class="modal fade hmodal-success" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog  modal-sm">
		<div class="modal-content">
			<div class="color-line"></div>
			<div class="modal-header text-center">
		 	<h4 class="modal-title"><img alt="logo" class="img-circle m-b" src="images/a3.jpg" style="width: 82px;height: 82px;"></h4> <br>
				<font class="font-bold" size="2em">
					<font style="color:gray;">박성준</font><br>
					<font style="color:#9d9fa2">(사단)한국소프트웨어기술진흥협회 > <br>개발부 > 팀장</font> <br>
					<font style="color:gray;">01020768626</font>
				</font>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default btn-sm" data-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary btn-sm demo2">주소록 등록</button>
			</div>
		</div>
	</div>
</div>


<!-- <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="color-line"></div>
			<div class="modal-header">
				<h4 class="modal-title">정보보기</h4>
			</div>
			<div class="modal-body">
			<form method="post" class="form-horizontal text-center">				
				<div class="form-group">
					<label class="control-label col-sm-4">아이디  </label>
					<div class="col-sm-6">
						<input type="text" name="id" class="form-control">
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-4 control-label">이름 </label>
					<div class="col-sm-6">
						<input type="text" placeholder="placeholder" class="form-control">
					</div>
                </div>
				
				<div class="form-group">
					<label class="col-sm-4 control-label">부서 </label>
					<div class="col-sm-6">
						<input type="text" placeholder="placeholder" class="form-control">
					</div>
                </div>
				
				<div class="form-group">
					<label class="col-sm-4 control-label">직급 </label>
					<div class="col-sm-6">
						<input type="text" placeholder="placeholder" class="form-control">
					</div>
                </div>
				
			</form>
			
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div> -->