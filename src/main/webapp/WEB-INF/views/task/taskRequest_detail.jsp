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
			<h2 class="font-light m-b-xs">업무 요청 송신 상세페이지</h2>
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
								<table cellpadding="1" cellspacing="1"
									class="table table-bordered ">
									<tr>
										<th
											style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">제목</th>
										<td style="width: 40%">${task.task_name}</td>
										<th
											style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">승인상태</th>
										<td style="width: 40%"><button
												class="btn btn-xs btn-warning2">${task.step_no}</button></td>
									</tr>
									<tr>
										<th
											style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">수신자</th>
										<td>${task.rec_name}</td>
										<th
											style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">지시부서</th>
										<td>개발팀</td>
									</tr>
									<tr>
										<th
											style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">담당자</th>
										<td>${task.emp_name}</td>
										<th
											style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">업무기한</th>
										<td>${task.deadline}</td>
									</tr>
									<tr>
										<th
											style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">업무
											참여자</th>
										<td colspan="3">
											
										</td>
									</tr>

									<tr>
										<th
											style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">첨부파일</th>
										<td colspan="3">${task.file_name }</td>
									</tr>

									<tr>
										<th
											style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">내용</th>
										<td colspan="3">
											${task.content}
										</td>
									</tr>
								</table>
							</div>
						</form>
						<div  class=" pull-right" style="text-align: center; margin-right: 10px;">
							<input type="button" class="btn btn-sm btn-success"
								onclick="window.location.href='taskRequest.do'"
								style="padding-right: 15px; padding-left: 15px; font-weight: 600; font-size: 13px"
								value="뒤로 가기">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

