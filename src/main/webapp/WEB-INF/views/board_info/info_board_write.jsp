<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--  
	작성자	: 박성준,하재현
	작성일	: 2016-11-18
	목 적  	: 사내공지사항 수정 view
-->
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
					<li><span>게시판</span></li>
					<li class="active"><span>사내 공지사항</span></li>
				</ol>
			</div>
			<h2 class="font-light m-b-xs">사내 공지사항</h2>
			<small>회사의 정보를 확인하는 게시판입니다.</small>
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
				<form method="POST" class="form-horizontal" id="writeForm" action="CompanyBoardWrite.do" enctype="multipart/form-data">
				<div class="panel-heading hbuilt">
					<div class="p-xs">
						
							<div class="form-group">
								<label class="col-sm-1 control-label text-left"> 제 목 : </label>
								<div class="col-sm-11">
									<input type="text" class="form-control input-sm" id="title" name="title"
										placeholder="안녕하세요">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-1 control-label text-left"> 첨부<br>파일 :
								</label>
								<div class="col-sm-11">
									<div class="btn-group">
										<button class="btn btn-default" id="clip" type="button">
											<i class="fa fa-paperclip"></i>
										</button>
										<input type="file" name="uploadfile" id="clipfile" style="display:none;float:left" class="form-control input-xs">
									</div>
								</div>
							</div>
					</div>
				</div>
				<div class="panel-body no-padding">
					<textarea class="summernote" name="content" id="content"></textarea>
				</div>
		

				<div class="panel-footer">
					<div class="pull-right">
						<div class="btn-group">
							<button class="btn btn-default" id="sendWriteBtn" type="submit">
								<i class="fa fa-edit"></i> 글 등록
							</button>
							<a href="info_board_list.do" class="btn btn-default" >
								<i class="fa fa-refresh"></i> 목록으로
							</a>
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