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
				<form method="post" class="form-horizontal">
				<div class="panel-heading hbuilt">
					<div class="p-xs">

							<div class="form-group">
								<label class="col-sm-1 control-label text-left"> 제 목 : </label>
								<div class="col-sm-11">
									<input type="text" class="form-control input-sm" placeholder="제목" name="title">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-1 control-label text-left"> 첨부 파일 :
								</label>
								<div class="col-sm-11">
									<div class="btn-group">
										<input type="button" class="btn btn-default" value="파일">
										
										<button class="btn btn-default">
											<i class="fa fa-image"></i>
										</button>
									</div>
								</div>
							</div>
					</div>
				</div>
				<div class="panel-body no-padding">
					<div>
					<textarea rows="20" cols="20" id="content" name="content"  class="summernote"></textarea>
					</div>
				</div>
				
				<div class="panel-footer">
					<div class="pull-right">
						<div class="btn-group">
							<input type="submit" class="btn btn-default fa fa-edit" value="글쓰기">
							<button class="btn btn-default"><i class="fa fa-refresh"></i> 목록으로</button>
						</div>
					</div>
					<br>
					<br>
				</div>
			</form>				
			</div>
		</div>
	</div>

</div>

