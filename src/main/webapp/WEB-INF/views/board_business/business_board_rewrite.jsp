<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!--  
	작성자	: 이상원, 김주희
	작성일	: 2016-11-18
	목 적  	: 업무정보게시판 글 수정 view
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
                    <li>
                        <span>게시판</span>
                    </li>
                    <li class="active">
                        <span>업무 정보 공유 게시판</span>
                    </li>
                </ol>
            </div>
            <h2 class="font-light m-b-xs">
                	업무 정보 공유 게시판
            </h2>
            <small>회사의 업무를 정보들을 공유하는 게시판입니다.</small>
		</div>
	</div>
</div>
<div class="content animate-panel">

	<div class="row">
		<div class="col-md-12">
			<div class="hpanel email-compose">
			<form method="post" action="" id="writeForm" class="form-horizontal"  enctype="multipart/form-data">
				<div class="panel-heading hbuilt">
					<div class="p-xs h4">글쓰기</div>
				</div>
				<div class="panel-heading hbuilt">
					<div class="p-xs">

							<div class="form-group">
								<label class="col-sm-1 control-label text-left"> 제 목 : </label>
								<div class="col-sm-11">
									<input type="text" class="form-control input-sm" name="title" id="title" value="${list.title}">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-1 control-label text-left">첨부파일 :
								</label>
								<%-- <div class="col-sm-11">
									<div class="btn-group">
										<input type="file" class="btn btn-default" name="uploadfile" value="${list.file_name}">
									</div>
								</div> --%>
								<div class="col-sm-11">
									<div class="btn-group">
										<button class="btn btn-default" id="clip" type="button">
											<i class="fa fa-paperclip"></i>
										</button>
										<input type="file" name="uploadfile" id="clipfile" value="${list.file_name}" style="display:none;float:left" class="form-control input-xs">
									</div>
								</div>
							</div>
					</div>
				</div>
				<div class="panel-body no-padding">
					<div>
					<textarea rows="20" cols="20" id="content" name="content"  class="summernote">${list.content}</textarea>
					</div>
				</div>


				<div class="panel-footer">
					<div class="pull-right">
						<div class="btn-group">
							<button class="btn btn-default" type="submit">
								<i class="fa fa-edit"></i> 글 수정
							</button>
							<button class="btn btn-default" type="button" onclick="location.href='business_board_list.do'">
								<i class="fa fa-refresh"></i> 목록으로
							</button>
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
