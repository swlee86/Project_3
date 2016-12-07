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
                    <li><a href="index.html">홈</a></li>
                    <li>
                        <span>게시판</span>
                    </li>
                    <li class="active">
                        <span>언론 게시판</span>
                    </li>
                </ol>
            </div>
            <h2 class="font-light m-b-xs">
                	언론 게시판
            </h2>
            <small>회사의 언론정보를 공유하는 게시판입니다.</small>
		</div>
	</div>
</div>
<div class="content animate-panel">

	<div class="row">
		<div class="col-md-12">
			<div class="hpanel email-compose">
			<form method="post" action="" class="form-horizontal"  enctype="multipart/form-data">  
				<div class="panel-heading hbuilt">
					<div class="p-xs h4">글쓰기</div>
				</div>
				<div class="panel-heading hbuilt">
					<div class="p-xs">

						
							<div class="form-group">
								<label class="col-sm-1 control-label text-left"> 제 목 : </label>
								<div class="col-sm-11">
									<input type="text" class="form-control input-sm" name="title">
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
										
								<!-- 		<button class="btn btn-default" id="img" type="button">
											<i class="fa fa-image"></i>
										</button>
										<input type="file" name="file_name[1]"  id="imgfile"style="display:none" class="form-control input-xs"> -->
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
							<button class="btn btn-default" type="submit">
								<i class="fa fa-edit"></i> 글 등록
							</button>
							<button class="btn btn-default" type="button" onclick="location.href='media_board_list.do'">
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
