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
			<h2 class="font-light m-b-xs">업무 요청 수신</h2>
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
							<table cellpadding="1" cellspacing="1" class="table table-bordered "  >
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:30px; width:10%">제목</th>
										<td style="width:40%">UI/UX 구현</td>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:30px; width:10%">승인상태</th>
										<td style="width:40%"><button class="btn btn-sm" style="background-color: #68a84b;color:white">미승인</button></td>
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
										<th style="background-color:#f5f5f5;text-align:right;padding-right:30px; width:10%">내용</th>
										<td colspan="3">업무 내용</td>
									</tr>
									
									
									<tr>
										<th style="background-color:#f5f5f5;text-align:right;padding-right:30px; width:10%">담당자</th>
										<td colspan="3">박지은</td>
										
									</tr>
									
									 <tr>
										<th style="background-color:#f5f5f5; text-align:center;padding-right:30px; width:100%" colspan="4">진행 단계</th>
									</tr>
									
								
									<tr>
										<td colspan="4">
												<div class="row" style="text-align:center;margin-right:10px;">
												<br><br><br>
													<input type="button"  class="btn w-xs btn-primary" data-toggle="modal" data-target="#myModal1"  value="진행" style="margin-right:5px;">
													<input type="button"  class="btn w-xs btn-default" data-toggle="modal" data-target="#myModal2" value="미진행"style="margin-right:5px;" >
													<input type="button"  class="btn w-xs btn-default" data-toggle="modal" data-target="#myModal3" value="보류" style="margin-right:5px;">
													<input type="button"  class="btn w-xs btn-default" data-toggle="modal" data-target="#myModal4"  value="완료" style="margin-right:5px;">
													<input type="button"  class="btn w-xs btn-default" data-toggle="modal" data-target="#myModal5" value="중단"style="margin-right:5px;" >
												<br><br><br>
												</div>
										</td>
									</tr>
									
								
								</table>	
								<div class="row" style="text-align:center;margin-right:10px;">
								
								<input type="button"  class="btn w-xs btn-default"  onclick="window.location.href='taskRequest_rec.do'" value="목록">
							</div>
						</div>
						</form>	
					</div>
				</div>
			</div>
		</div>
	</div>
</div>




<div class="modal fade hmodal-success" id="myModal1" tabindex="-2" role="dialog" aria-hidden="true">
	<div class="modal-dialog  modal-sm">
		<div class="modal-content">
			<div class="color-line"></div>
			<div class="modal-header text-center">
		 		업무처리 안내
			</div>
			<div class="modal-body">
				<font class="font-bold" size="2em">
					<font style="color:gray;">승인처리하시겠습니까?</font><br>
				</font>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default btn-sm" data-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary btn-sm demo2" data-dismiss="modal" data-toggle="modal" data-target="">확인</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade hmodal-success" id="myModal2" tabindex="-2" role="dialog" aria-hidden="true">
	<div class="modal-dialog  modal-sm">
		<div class="modal-content">
			<div class="color-line"></div>
			<div class="modal-header text-center">
		 		업무처리 안내
			</div>
			<div class="modal-body">
				<font class="font-bold" size="2em">
					<font style="color:gray;">반려처리하시겠습니까?</font><br>
				</font>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default btn-sm" data-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary btn-sm demo2" data-dismiss="modal" data-toggle="modal" data-target="#">승인</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade hmodal-success" id="myModal3" tabindex="-2" role="dialog" aria-hidden="true">
	<div class="modal-dialog  modal-sm">
		<div class="modal-content">
			<div class="color-line"></div>
			<div class="modal-header text-center">
		 		업무처리 안내
			</div>
			<div class="modal-body">
				<font class="font-bold" size="2em">
					<font style="color:gray;">보류처리하시겠습니까?</font><br>
				</font>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default btn-sm" data-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary btn-sm demo2" data-dismiss="modal" data-toggle="modal" data-target="#">보류</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade hmodal-success" id="myModal2" tabindex="-2" role="dialog" aria-hidden="true">
	<div class="modal-dialog  modal-sm">
		<div class="modal-content">
			<div class="color-line"></div>
			<div class="modal-header text-center">
		 		업무 요청 승인안내
			</div>
			<div class="modal-body">
				<font class="font-bold" size="2em">
					<font style="color:gray;">기재하신 업무는 ㅇㅇ 입니다.</font><br>
					<font style="color:#9d9fa2"> 정말 처리하시겠습니까?</font> <br>
				</font>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default btn-sm" data-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary btn-sm demo2" data-dismiss="modal" data-toggle="modal" data-target="#myModal5">승인</button>
			</div>
		</div>
	</div>
</div>

