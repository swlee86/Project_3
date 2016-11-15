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
					<li class="active"><span>Mailbox</span></li>
				</ol>
			</div>
			<h2 class="font-light m-b-xs">메일함 보기</h2>
			<small>메일을 확인하세요!</small>
		</div>
	</div>
</div>
<div class="content animate-panel">

	<div class="row">
		<div class="col-md-3">
			<jsp:include page="/sidebar/mailLeftList_side.jsp"></jsp:include>
		</div>

		<div class="col-md-9">
			<div class="hpanel">
				<div class="panel-heading hbuilt">
					<div class="text-center p-xs font-normal">
						<div class="input-group">
							<input type="text" class="form-control input-sm"
								placeholder="Search email in your inbox..."> <span
								class="input-group-btn">
								<button type="button" class="btn btn-sm btn-default">Search
								</button>
							</span>
						</div>
					</div>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-md-6 m-b-md">
							<div class="btn-group">
								<button class="btn btn-default btn-sm">
									<i class="fa fa-refresh"></i> Refresh
								</button>
								<button class="btn btn-default btn-sm" >
									&nbsp;<i class="fa fa-eye"></i>
								</button>
								<button class="btn btn-default btn-sm" >
									&nbsp;<i class="fa fa-exclamation"></i>
								</button>
								<button class="btn btn-default btn-sm">
									&nbsp;<i class="fa fa-trash-o"></i>
								</button>
								<button class="btn btn-default btn-sm" >
									&nbsp;<i class="fa fa-check"></i>
								</button>
								<button class="btn btn-default btn-sm" >
									<i class="fa fa-tag"></i>
								</button>
							</div>
						</div>
						<div class="col-md-6 mailbox-pagination m-b-md">
							<div class="btn-group">
								<button class="btn btn-default btn-sm">
									<i class="fa fa-arrow-left"></i>
								</button>
								<button class="btn btn-default btn-sm">
									<i class="fa fa-arrow-right"></i>
								</button>
							</div>
						</div>
					</div>
					<div class="table-responsive">
						<!-- <hr style="border:1px solid gray; margin-bottom:0px"> -->
						<table class="table table-hover table-mailbox">
							<thead>
								<tr>
									<th>
										<div class="checkbox checkbox-single checkbox-success">
											<input type="checkbox"><label></label>
										</div>
									</th>
									<th>제목</th>
									<th>내용</th>
									<th>보낸사람</th>
									<th class="text-right mail-date">시간</th>
								</tr>
								<tr>
									<th colspan="5"></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="">
										<div class="checkbox checkbox-single checkbox-success">
											<input type="checkbox"> <label></label>
										</div>
									</td>
									<td><a href="#">Marshall Horne</a></td>
									<td><a href="mail_detail.do">클릭해보세여여여요요</a><span class="text-right mail-date"><i class="fa fa-paperclip"></i></span></td>
									<td>박성준</td>
									<td class="text-right mail-date">2016-11-14 23:15</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="panel-footer">
					<input type="button" class="btn btn-success" value="메일쓰기" id="writeMailBtn">
					<input type="button" class="btn btn-danger" value="삭제하기">
				</div>
			</div>
		</div>
	</div>
</div>