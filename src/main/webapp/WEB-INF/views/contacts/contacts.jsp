<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					<li class="active"><span>Contacts</span></li>
				</ol>
			</div>
			<h2 class="font-light m-b-xs">전체 주소록</h2>
			<small>Show users list in nice and color panels</small>
		</div>
	</div>
</div>

<div class="content animate-panel">
	<div class="row">
		<div class="col-md-3">
			<div class="hpanel panel-group" id="accordion" role="tablist" aria-multiselectable="true">
				<div class="panel-body">
					<button type="button" class="btn w-xs btn-success btn-block"onclick="location.href='enroll.do'">주소록 등록</button>
				</div>
				<div class="panel-body">
					<h4 class="m-t-none m-b-none">
						<a href="#">전체 주소록</a>
					</h4>
				</div>
				<div class="panel-body">
					<a data-toggle="collapse" data-parent="#accordion" href="#q1" aria-expanded="true"> <i class="fa fa-chevron-down pull-right text-muted"></i> 사내 주소록 그룹
					</a>
					<div id="q1" class="panel-collapse collapse">
						<hr>
						그룹
					</div>
				</div>
				<div class="panel-body">
					<a data-toggle="collapse" data-parent="#accordion" href="#q2" aria-expanded="true"> <i class="fa fa-chevron-down pull-right text-muted"></i> 개인 주소록 그룹
					</a>
					<div id="q2" class="panel-collapse collapse">
						<hr>
						그룹
					</div>
				</div>
				<div class="panel-body" style="text-align: center">
					<button type="button" class="btn w-xs btn-outline btn-success btn-block"onclick="location.href='contaacts_group.do'">
						주소록 그룹 관리
					</button>
				</div>
			</div>
		</div>




		<div class="col-md-9">
			<div class="hpanel">
				<ul class="nav nav-tabs">
					<li class="active"><a data-toggle="tab" href="#tab-1"> ALL</a></li>
					<li class=""><a data-toggle="tab" href="#tab-2">가</a></li>
					<li class=""><a data-toggle="tab" href="#tab-2">나</a></li>
					<li class=""><a data-toggle="tab" href="#tab-2">다</a></li>
					<li class=""><a data-toggle="tab" href="#tab-2">라</a></li>
					<li class=""><a data-toggle="tab" href="#tab-2">마</a></li>
					<li class=""><a data-toggle="tab" href="#tab-2">바</a></li>
					<li class=""><a data-toggle="tab" href="#tab-2">사</a></li>
					<li class=""><a data-toggle="tab" href="#tab-2">아</a></li>
					<li class=""><a data-toggle="tab" href="#tab-2">자</a></li>
					<li class=""><a data-toggle="tab" href="#tab-2">차</a></li>
					<li class=""><a data-toggle="tab" href="#tab-2">카</a></li>
					<li class=""><a data-toggle="tab" href="#tab-2">타</a></li>
					<li class=""><a data-toggle="tab" href="#tab-2">파</a></li>
					<li class=""><a data-toggle="tab" href="#tab-2">하</a></li>
					<li class=""><a data-toggle="tab" href="#tab-2">A-Z</a></li>
					<li class=""><a data-toggle="tab" href="#tab-2">0-9</a></li>
				</ul>
				<div class="tab-content">
					<div id="tab-1" class="tab-pane active">
						<div class="panel-body">
							<div class="hpanel">
								<div class="panel-heading hbuilt">
									<div class="row">
										<div class="col-md-8"></div>
										<div class="col-md-4">
										
											<form action="" class="form-inline">
										
												<select class="form-control input-sm">
													<option>이름</option>
													<option>회사명</option>
													<option>메일</option>
												</select>
														
												<div class="input-group">
													<input type="text" class="form-control input-sm" name="s" />
													<span class="input-group-btn">
														<button class="btn btn-default input-sm" type="submit">
															<span class="fa fa-search"></span>
														</button>
													</span>
												</div>
											</form>
										
										</div>
									</div>
									<hr>
								</div>

								<div class="panel-body">

									<div class="row">
										<div class="col-lg-6">
											<div class="hpanel hgreen contact-panelt">
												<div class="panel-body">
													<img alt="logo" class="img-circle m-b" src="images/profile.jpg" align="left">
													<h4>
														<a href="" data-toggle="modal" data-target="#myModal"><B>박지은</B></a>
													</h4>
													<p>
														핸드폰 : 01012345678<br> 회사명 : 코스타<br> 메일 :
														123@naver.com
													</p>
												</div>
											</div>
										</div>
										<div class="col-lg-6">
											<div class="hpanel hyellow contact-panelt">
												<div class="panel-body">
													<img alt="logo" class="img-circle m-b" src="images/a4.jpg" align="left">
													<h4>
														<B>박지은</B>
													</h4>
													<p>
														핸드폰 : 01012345678<br> 회사명 : 코스타<br> 메일 :
														123@naver.com
													</p>
												</div>
											</div>
										</div>
									</div>


									<div class="row">
										<div class="col-lg-6">
											<div class="hpanel hblue contact-panelt">
												<div class="panel-body">
													<img alt="logo" class="img-circle m-b" src="images/a9.jpg" align="left">
													<h4>
														<B>박지은</B>
													</h4>
													<p>
														핸드폰 : 01012345678<br> 회사명 : 코스타<br> 메일 :
														123@naver.com
													</p>
												</div>
											</div>
										</div>
										<div class="col-lg-6">
											<div class="hpanel hviolet contact-panelt">
												<div class="panel-body">
													<img alt="logo" class="img-circle m-b" src="images/a5.jpg" align="left">
													<h4>
														<B>박지은</B>
													</h4>
													<p>
														핸드폰 : 01012345678<br> 회사명 : 코d스타<br> 메일 :
														123@naver.com
													</p>
												</div>
											</div>
										</div>
									</div>

								</div>



								<div class="panel-footer" style="text-align: center">
									<div class="btn-group">
										<button type="button" class="btn btn-default">
											&nbsp;<i class="fa fa-chevron-left"></i>
										</button>
										<button class="btn btn-default active">1</button>
										<button class="btn btn-default">2</button>
										<button class="btn btn-default">3</button>
										<button class="btn btn-default">4</button>
										<button class="btn btn-default">5</button>
										<button class="btn btn-default">6</button>
										<button class="btn btn-default">7</button>
										<button class="btn btn-default">8</button>
										<button type="button" class="btn btn-default">
											&nbsp;<i class="fa fa-chevron-right"></i>
										</button>
									</div>
								</div>
							
							
							</div>

						</div>
					</div>
					<div id="tab-2" class="tab-pane">
						<div class="panel-body">
							<strong>Donec quam felis</strong>

							<p>Thousand unknown plants are noticed by me: when I hear the
								buzz of the little world among the stalks, and grow familiar
								with the countless indescribable forms of the insects and flies,
								then I feel the presence of the Almighty, who formed us in his
								own image, and the breath</p>

							<p>I am alone, and feel the charm of existence in this spot,
								which was created for the bliss of souls like mine. I am so
								happy, my dear friend, so absorbed in the exquisite sense of
								mere tranquil existence, that I neglect my talents. I should be
								incapable of drawing a single stroke at the present moment; and
								yet.</p>
						</div>
					</div>
				</div>


			</div>
		</div>
	</div>
</div>

<div class="modal fade hmodal-success" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="color-line"></div>
			<div class="modal-header text-center">
				<h4 class="modal-title"><img alt="logo" class="img-circle m-b" src="images/a4.jpg"></h4>
				<small class="font-bold">Lorem Ipsum is simply dummy text of the printing and typesetting industry.</small>
			</div>
			<div class="modal-body">
				<table class="table">
					<tr>
						<td>이름</td>
						<td>박지은</td>
					</tr>
					<tr>
						<td>나이</td>
						<td>24세</td>
					</tr>
					<tr>
						<td>생년월일</td>
						<td>1993.3.3</td>
					</tr>
					<tr>
						<td>연락처</td>
						<td>010-2808-1024</td>
					</tr>
					<tr>
						<td>회사명</td>
						<td>코스타</td>
					</tr>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary">수정</button>
				<button type="button" class="btn btn-primary">삭제</button>
			</div>
		</div>
	</div>
</div>