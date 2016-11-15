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
			<h2 class="font-light m-b-xs">메일 쓰기</h2>
			<small>Mailbox - Email list.</small>
		</div>
	</div>
</div>
<div class="content animate-panel">

	<div class="row">
		<div class="col-md-3">
			<jsp:include page="/sidebar/mailLeftList_side.jsp"></jsp:include>
		</div>
		<div class="col-lg-9">
			<div class="hpanel">
				<div class="panel-body">
					<div class="table-responsive">
						<form class="form-inline">
							<div class="table-responsive">
								<table cellpadding="1" cellspacing="1"
									class="table table-bordered ">
									<tr>
										<th
											style="background-color: #34495e; text-align: right; padding-right: 30px; width: 10%"><font
											color="coral">*</font> <span style="color: white;">제목</span></th>
										<td>
											<div class="form-group">
												<div class="input-group date">
													<input type="text" class="form-control" size="20px">
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<th style="background-color: #34495e; text-align: right; padding-right: 30px; width: 10%"><font
											color="coral"></font><span style="color:white">파일 첨부</span></th>
										<td><input type="file" class="form-control"></td>
									</tr>
									<tr>
										<th style="background-color: #34495e; text-align: right; padding-right: 30px; width: 10%"><font
											color="coral"></font><span style="color:white">수신자 명</span></th>
										<td><input type="text" class="form-control"></td>
									</tr>
									<tr>
										<th style="background-color: #34495e; text-align: right; padding-right: 30px; width: 10%"><font
											color="coral"></font><span style="color:white">수신자 메일</span></th>
										<td><input type="email" class="form-control" placeholder="example@naver.com"></td>
									</tr>
									<tr>
										<th
											style="background-color: #34495e; text-align: right; padding-right: 30px; width: 10%">
											<font color="coral">*</font><span style="color:white">내용</span>
										</th>
										<td><textarea class="form-control" cols="10" rows="10"
												style="width: 100%"></textarea></td>
									</tr>
								</table>
									<button class="btn btn-success btn-sm">
										<i class="pe pe-7s-mail"> </i>메일보내기
									</button>	
									
									<input type="button" class="btn btn-danger" value="취소">
							
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>
</body>
</html>