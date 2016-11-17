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
					<li class=""><a data-toggle="tab" href="#tab-3">참여</a></li>
				</ul>

				<div class="tab-content">
				<!-- 수신 -->
					<div id="tab-1" class="tab-pane active">
						<div class="panel-body">
							<div class="row" style="background-color: #f3f3f3;">
								<form action="" class="form-inline">
									<table style="margin-top: 10px; margin-bottom: 10px;" width="100%">
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
												<div class="form-inline">
													<div class="input-group date">
														<input type="text" class="form-control input-sm"  id="makeuserUpdateDate"> 
														<span class="input-group-addon" style="color:#fd7d86 "><i class="fa fa-calendar"></i></span>
													</div>
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
													style="background-color: #f07070; color: white"
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
											<th><input type="checkbox" style="margin-left:20px"></th>
											<th>NO</th>
											<th>중요</th>
											<th width="30%">업무명</th>
											<th>업무기한</th>
											<th>요청자</th>
											<th>요청일</th>
											<th>승인단계</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>
												<input type="checkbox" style="margin-left:20px">
											</td>
											<td>4</td>
											<td>
												<div class="checkbox checkbox-danger" style="padding-top:0px;margin-top:0px;">
													<input id="checkbox1" type="checkbox" checked ><label ></label>
												</div>
											</td>
											<td><a href="taskRequest_Receive_Detail.do">UI/UX 구현(클릭하세요)</a></td>
											<td>2016-11-16</td>
											<td>김주희</td>
											<td>2016-11-15</td>

											<td><button class="btn btn-xs btn-warning2" >미승인</button></td>
										</tr>
										<tr>
											<td><input type="checkbox" style="margin-left:20px"></td>
											<td>4</td>
											<td>
												<div class="checkbox checkbox-danger"  style="padding-top:0px;margin-top:0px">
													<input id="checkbox2" type="checkbox"><label ></label>
												</div>
											</td>
											<td>DB 구현</td>
											<td>2016-11-16</td>
											<td>김주희</td>
											<td>2016-11-15</td>
											<td><button class="btn btn-xs btn-info">&nbsp;&nbsp;승인&nbsp;&nbsp;</button></td>
										</tr>
									</tbody>
								</table>
								<div class="row" style="text-align: right; margin-right: 5px;">
									<button type="button" class="btn btn-sm btn-success "  style=" padding-right:15px;padding-left:15px; font-weight:bold; font-size:13px;" onclick="window.location.href='#'" >업무 등록</button>
									<button type="button" class="btn btn-sm btn-default demo4" style=" padding-right:15px;padding-left:15px; font-weight:bold; font-size:13px;" >업무삭제</button>
								</div>
							</div>
						</div>
						<div class="panel-footer" style="text-align: center;background-color:#f5f5f5">
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














					<!-- 송신 -->
					<div id="tab-2" class="tab-pane">
						<div class="panel-body">
							<div class="row" style="background-color: #f3f3f3;">
								<form action="" class="form-inline">
									<table style="margin-top: 10px; margin-bottom: 10px;" width="100%">
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
												<div class="form-inline">
													<div class="input-group date">
														<input type="text" class="form-control input-sm"  id="makeuserUpdateDate"> 
														<span class="input-group-addon" style="color:#fd7d86 "><i class="fa fa-calendar"></i></span>
													</div>
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
													style="background-color: #f07070; color: white"
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
											<th><input type="checkbox" style="margin-left:20px"></th>
											<th>NO</th>
											<th width="30%">업무명</th>
											<th>업무기한</th>
											<th>요청자</th>
											<th>요청일</th>
											<th>승인단계</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><input type="checkbox" style="margin-left:20px"></td>
											<td>4</td>
											<td><a href="taskRequest_Transmit_Detail.do">UI/UX 구현(클릭하세요)</a></td>
											<td>2016-11-16</td>
											<td>김주희</td>
											<td>2016-11-15</td>

											<td><button class="btn btn-xs btn-warning2" >미승인</button></td>
										</tr>
										<tr>
											<td><input type="checkbox" style="margin-left:20px"></td>
											<td>4</td>
											<td>DB 구현</td>
											<td>2016-11-16</td>
											<td>김주희</td>
											<td>2016-11-15</td>
											<td><button class="btn btn-xs btn-primary2">&nbsp;&nbsp;보류&nbsp;&nbsp;</button></td>
										</tr>
									</tbody>
								</table>
								<div class="row" style="text-align: right; margin-right: 5px;">
									<button type="button" class="btn btn-sm btn-success "  style=" padding-right:15px;padding-left:15px; font-weight:bold; font-size:13px;" onclick="window.location.href='#'" >업무 등록</button>
									<button type="button" class="btn btn-sm btn-default demo4" style=" padding-right:15px;padding-left:15px; font-weight:bold; font-size:13px;" >업무삭제</button>
								</div>
							</div>
						</div>
							<div class="panel-footer" style="text-align: center;background-color:#f5f5f5">
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
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<!-- 참여 -->
					<div id="tab-3" class="tab-pane">
						<div class="panel-body">
							<div class="row" style="background-color: #f3f3f3;">
								<form action="" class="form-inline">
									<table style="margin-top: 10px; margin-bottom: 10px;" width="100%">
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
												<div class="form-inline">
													<div class="input-group date">
														<input type="text" class="form-control input-sm"  id="makeuserUpdateDate"> 
														<span class="input-group-addon" style="color:#fd7d86 "><i class="fa fa-calendar"></i></span>
													</div>
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
													style="background-color: #f07070; color: white"
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
											<th><input type="checkbox" style="margin-left:20px"></th>
											<th>NO</th>
											<th width="30%">업무명</th>
											<th>업무기한</th>
											<th>요청자</th>
											<th>요청일</th>
											<th>진행율</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><input type="checkbox" style="margin-left:20px"></td>
											<td>4</td>
											<td><a href="taskRequest_Participation_Detail.do">UI/UX 구현</a></td>
											<td>2016-11-16</td>
											<td>김주희</td>
											<td>2016-11-15</td>
											<td>
												<div class="progress m-t-xs full progress-striped progress-small" >
													<div style="width: 75%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="75" role="progressbar" class=" progress-bar progress-bar-warning active"></div>
												</div>
											</td>
										</tr>
										<tr>
											<td><input type="checkbox" style="margin-left:20px"></td>
											<td>4</td>
											<td>DB 구현</td>
											<td>2016-11-16</td>
											<td>김주희</td>
											<td>2016-11-15</td>
											<td>
												<div class="progress m-t-xs full progress-striped progress-small">
													<div style="width: 25%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="25" role="progressbar" class=" progress-bar progress-bar-warning active "></div>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
								<div class="row" style="text-align: right; margin-right: 5px;">
									<button type="button" class="btn btn-sm btn-success "  style=" padding-right:15px;padding-left:15px; font-weight:bold; font-size:13px;" onclick="window.location.href='#'" >업무 등록</button>
									<button type="button" class="btn btn-sm btn-default demo4" style=" padding-right:15px;padding-left:15px; font-weight:bold; font-size:13px;" >업무삭제</button>
								</div>
							</div>
						</div>
							<div class="panel-footer" style="text-align: center;background-color:#f5f5f5">
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
					
					
					
					
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 
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
 -->