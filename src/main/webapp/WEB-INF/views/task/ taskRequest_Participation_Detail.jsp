<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="normalheader transition animated fadeIn media-body">
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
					<li><span>App views</span></li>
					<li class="active"><span>Contacts</span></li>
				</ol>
			</div>
			<h2 class="font-light m-b-xs">업무 요청 참여 페이지</h2>
			<small>Show users list in nice and color panels</small>
		</div>
	</div>
</div>


<div class="content animate-panel">
	<div class="row">
		<div class="col-lg-12">
			<div class="hpanel">
				<div class="panel-body">
					<div class="table-responsive">
						<form>
						<div class="table-responsive">
							<table cellpadding="1" cellspacing="1" class="table table-bordered " style="margin-bottom:0px" >
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:30px; width:10%">제목</th>
										<td style="width:40%">UI/UX 구현</td>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:30px; width:10%">승인상태</th>
										<td style="width:40%"><button class="btn btn-xs btn-warning2"  >미승인</button></td>
									</tr>
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:30px; width:10%">지시자</th>
										<td>김주희 사원</td>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:30px; width:10%">지시부서</th>
										<td>개발팀</td>
									</tr>	
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:30px; width:10%">업무기한</th>
										<td colspan="3">2016-11-16 </td>
									</tr>	
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:30px; width:10%">업무 참여자</th>
										<td colspan="3">이지은 대리<br>김지은 주임</td>
									</tr>	
																									
									<tr>
										<th style="background-color:#f5f5f5;text-align:right;padding-right:30px; width:10%">첨부파일</th>
										<td colspan="3">업무 내용.hwp</td>
									</tr>
							
									<tr>
										<th style="background-color:#f5f5f5;text-align:right;padding-right:30px; width:10%">담당자</th>
										<td colspan="3">박지은</td>
									</tr>
									
									<tr>
										<th style="background-color:#f5f5f5;text-align:right;padding-right:30px; width:10%">내용</th>
										<td colspan="3">업무 내용</td>
									</tr>
								</table>							
								
								<table class="table table-bordered" style="margin-top:0px;border:6px solid #e9ecef" >
									<tr>
										<th colspan="2" style="background-color:#f9fafc;font-weight:bold;color:#111;font-size:1.2em;padding-left:20px;">처리 내역</th>
									</tr>
									<tr>
										<th style="background-color:#f5f5f5;text-align:right;padding-right:10px; width:10%;padding-top:40px;">진행 단계</th>
										<td>
											<div class="form-inline">
													<input type="button"  class="btn btn-sm btn-primary" data-toggle="modal" data-target="#myModal1"  value="진행" style="margin-right:5px;width:70px;">
													<input type="button"  class="btn btn-sm btn-default" data-toggle="modal" data-target="#myModal2" value="미진행"style="margin-right:5px;width:70px;" >
													<input type="button"  class="btn btn-sm btn-default" data-toggle="modal" data-target="#myModal3" value="보류" style="margin-right:5px;width:70px;">
													<input type="button"  class="btn btn-sm btn-default" data-toggle="modal" data-target="#myModal4"  value="완료" style="margin-right:5px;width:70px;">
													<input type="button"  class="btn btn-sm btn-default" data-toggle="modal" data-target="#myModal5" value="중단"style="margin-right:5px;width:70px;" >
											</div>
											<div class="progress m-t-xs full progress-striped">
								                        <div style="width: 75%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="75" role="progressbar" class=" progress-bar progress-bar-warning active ">
								                            75%
								                        </div>
								            </div>
										</td>
									</tr>
								</table>



								<div class="row" style="text-align: center; margin-right: 10px;">
									<input type="submit" class="btn btn-sm btn-success" onclick="window.location.href='taskRequest.do'" style="padding-right: 15px; padding-left: 15px; font-weight: 600; font-size: 13px" value="처리하기"> 
									<input type="button" class="btn btn-sm btn-default" onclick="window.location.href='taskRequest.do'" style="padding-right: 15px; padding-left: 15px; font-weight: 600; font-size: 13px" value="뒤로가기">
								</div>
								
							</div>
						</form>	
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

