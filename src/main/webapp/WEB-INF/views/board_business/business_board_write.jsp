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
			<h2 class="font-light m-b-xs">업무 정보 공유 게시판</h2>
			<small>Show users list in nice and color panels</small>
		</div>
	</div>
</div>
<div class="content animate-panel">

	<div class="row">
		<div class="col-md-12">
			<div class="hpanel email-compose">
				<div class="panel-heading hbuilt">
					<div class="p-xs h4">글쓰기</div>
				</div>
				<div class="panel-heading hbuilt">
					<div class="p-xs">

						<form method="get" class="form-horizontal">
							<div class="form-group">
								<label class="col-sm-1 control-label text-left"> 제 목 : </label>
								<div class="col-sm-11">
									<input type="text" class="form-control input-sm"
										placeholder="안녕하세요">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-1 control-label text-left"> 첨부 파일 :
								</label>
								<div class="col-sm-11">
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

						</form>


					</div>
				</div>
				<div class="panel-body no-padding">
					<div class="summernote">


						<p>
							dummy text of the printing and typesetting industry. <strong>Lorem
								Ipsum has been the dustrys</strong> standard dummy text ever since the
							1500s, when an unknown printer took a galley of type and
							scrambled it to make a type specimen book. It has survived not
							only five centuries, but also the leap into electronic
							typesetting, remaining essentially unchanged. It was popularised
							in the 1960s with the release of Letraset sheets containing Lorem
							Ipsum passages, and more <br />
							<br />All the Lorem Ipsum generators on the Internet tend to
							repeat predefined chunks as necessary, making this the first true
							generator on the Internet. It uses a dictionary of over 200 Latin
							words, combined with a handful of model sentence structures, to
							generate Lorem Ipsum which looks reasonable. recently with.
						</p>

						<p>Mark Smith</p>
					</div>
				</div>


				<div class="panel-footer">
					<div class="pull-right">
						<div class="btn-group">
							<button class="btn btn-default">
								<i class="fa fa-edit"></i> 글 등록
							</button>
							<button class="btn btn-default">
								<i class="fa fa-refresh"></i> 목록으로
							</button>
						</div>
					</div>
					<br>
					<br>

				</div>
			</div>
		</div>
	</div>

</div>

