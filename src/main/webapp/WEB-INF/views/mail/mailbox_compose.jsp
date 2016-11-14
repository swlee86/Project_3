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
			<h2 class="font-light m-b-xs">Mailbox</h2>
			<small>Mailbox - Email list.</small>
		</div>
	</div>
</div>
<div class="content animate-panel">

	<div class="row">
		<div class="col-md-3">
			<jsp:include page="/sidebar/mailLeftList_side.jsp"></jsp:include>
		</div>
		<div class="col-md-9">
			<div class="hpanel email-compose">
				<div class="panel-heading hbuilt">
					<div class="p-xs h4">메일 쓰기</div>
				</div>
			
					<div class="panel-body no-padding">
						<br/>
						<form method="get" class="form-horizontal">
							<div class="form-group">
								<label class="col-sm-2 control-label text-left">제목:</label>
								<div class="col-sm-9">
									<input type="text" class="form-control input-sm" id="aa">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label text-left">수신자:</label>
								<div class="col-sm-9">
									<input type="text" class="form-control input-sm" id="bb">
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-2 control-label text-left">내용 : </label>
								<div class="col-sm-9">
									<textarea class="form-control" cols="5" rows="5" id="note"></textarea>
								</div>
							</div>

						</form>
					</div>
			
				<br />
				<div class="panel-footer">
					<div class="pull-right">
						<div class="btn-group">
							<button class="btn btn-default">
								<i class="fa fa-edit"></i> Save
							</button>
							<button class="btn btn-default">
								<i class="fa fa-trash"></i> Discard
							</button>
						</div>
					</div>
					<button class="btn btn-success" id="sendMailBtn">메일 보내기</button>
					<div class="btn-group">
						<button class="btn btn-default">
							<i class="fa fa-paperclip"></i>
						</button>
						<button class="btn btn-default">
							<i class="fa fa-image"></i>
						</button>
					</div>

				</div>
			</div>
		</div>
	</div>

</div>


</body>
</html>