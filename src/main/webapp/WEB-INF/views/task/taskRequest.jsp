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
					<li><a href="index.html">홈</a></li>
					<li><span>업무 관리</span></li>
					<li class="active"><span>업무 요청</span></li>
				</ol>
			</div>
			<h2 class="font-light m-b-xs">업무 요청</h2>
			<small>Show users list in nice and color panels</small>
		</div>
	</div>
</div>

<div class="content animate-panel media-body">
	<div class="row">
		<div class="col-md-12">
			<div class="hpanel">
				<div class="panel-heading">
					전체 : <font color="coral">10</font> 개
				</div>

				<ul class="nav nav-tabs">
					<li class="active"><a data-toggle="tab" href="#tab-1">수신</a></li>
					<li class=""><a data-toggle="tab" href="#tab-2">송신</a></li>
					<li class=""><a data-toggle="tab" href="#tab-2">참여</a></li>
				</ul>

				<div class="tab-content">
					<div id="tab-1" class="tab-pane active">
						<div class="panel-body">
							<div class="row" style="background-color: #f3f3f3">
								<form action="" class="form-inline">
									<table style="margin-top: 10px; margin-bottom: 10px;"
										width="100%">
										<tr>
											<td width="10%"></td>
											<th style="text-align: right; padding-right: 20px;">요청자
											</th>
											<td><input type="text" class="form-control input-sm"
												style="width: 60%; height: 27px;"></td>
											<td width="10%"></td>
											<th style="text-align: right; padding-right: 20px;">업무기한
											</th>
											<td>
												<div class="input-group date">
													<input type="text" class="form-control" id="start"
														size="20px"> <span class="input-group-addon"><i
														class="glyphicon glyphicon-calendar"></i></span>
												</div>
											</td>
										</tr>
										<tr>
											<td colspan="7">&nbsp;</td>
										</tr>
										<tr>
											<td></td>
											<th style="text-align: right; padding-right: 20px;">업무명
											</th>
											<td><input type="text" class="form-control input-sm"
												width="100%" style="width: 100%; height: 27px;"></td>
											<td></td>
											<td></td>
											<td><button class="btn btn-sm"
													style="background-color: #68a84b; color: white"
													type="submit">
													<span class="fa fa-search"></span>&nbsp; 검색 &nbsp;
												</button></td>
											<td></td>
										</tr>
									</table>
								</form>
							</div>


							<br>
							<hr style="border: 1px solid gray; margin-bottom: 0px">
							<div class="table-responsive">
								<table cellpadding="1" cellspacing="1" class="table table-hover">
									<thead>
										<tr>
											<th></th>
											<th>NO</th>
											<th>중요</th>
											<th width="30%">업무명</th>
											<th>업무기한</th>
											<th>요청자</th>
											<th>요청일</th>
											<th>승인단계</th>
											<th>진행단계</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><input type="checkbox" class="i-checks"></td>
											<td>4</td>
											<td><i class="fa fa-star"
												style="color: #ffc02b; border-color: black;"></i></td>
											<td><a href="taskRequest_rec_detail.do">UI/UX 구현</a></td>
											<td>2016-11-16</td>
											<td>김주희</td>
											<td>2016-11-15</td>

											<td><button class="btn btn-sm"
													style="background-color: #68a84b; color: white">미승인</button></td>
											
											<td>
												<div class="progress m-t-xs full progress-striped">
													<div style="width: 75%" aria-valuemax="100"
														aria-valuemin="0" aria-valuenow="75" role="progressbar"
														class=" progress-bar progress-bar-warning">75%</div>
												</div>
											</td>
										</tr>
										<tr>
											<td><input type="checkbox" class="i-checks"></td>
											<td>4</td>
											<td>★</td>
											<td>DB 구현</td>
											<td>2016-11-16</td>
											<td>김주희</td>
											<td>2016-11-15</td>
											<td><button class="btn btn-sm"
													style="background-color: #68a84b; color: white">미승인</button></td>
											<!-- <td><a class="btn btn-danger" href="#">미승인</a></td> -->
											<td>
												<div class="progress m-t-xs full progress-striped">
													<div style="width: 75%" aria-valuemax="100"
														aria-valuemin="0" aria-valuenow="75" role="progressbar"
														class=" progress-bar progress-bar-warning">75%</div>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
								<div class="row" style="text-align: right; margin-right: 5px;">
									<button type="button" class="btn w-xs btn-primary"
										onclick="window.location.href='#'">업무 등록</button>
									<button type="button" class="btn w-xs btn-default"
										data-dismiss="modal" data-toggle="modal"
										data-target="#myModal1">삭제</button>
								</div>
							</div>
						</div>
						<div class="panel-footer" style="text-align: center;background-color:##f5f5f5">
							<div class="btn-group">
								<button type="button" class="btn btn-default">
									&nbsp;<i class="fa fa-chevron-left"></i>
								</button>
								<button class="btn btn-default active">1</button>
								<button class="btn btn-default  ">2</button>
								<button class="btn btn-default">3</button>
								<button class="btn btn-default">4</button>
								<button type="button" class="btn btn-default ">
									&nbsp;<i class="fa fa-chevron-right"></i>
								</button>
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


<div class="modal fade hmodal-success" id="myModal1" tabindex="-1"
	role="dialog" aria-hidden="true">
	<div class="modal-dialog  modal-sm">
		<div class="modal-content">
			<div class="color-line"></div>
			<div class="modal-header text-center">
				확인을 누르시면 선택하신 ㅇㅇ 요청이 취소 처리가 됩니다.<br> 정말 처리하시겠습니까?
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default btn-sm"
					data-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary btn-sm demo2"
					data-dismiss="modal" data-toggle="modal" data-target="">확인</button>
			</div>
		</div>
	</div>
</div>
