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
                    <li><a href="index.html">Home</a></li>
                    <li>
                        <span>Board</span>
                    </li>
                    <li class="active">
                        <span>Media Board</span>
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
				<div class="panel-heading hbuilt">
					<div class="p-xs h4">글쓰기</div>
				</div>
				<div class="panel-heading hbuilt">
					<div class="p-xs">

						<form method="get" class="form-horizontal">
							<div class="form-group">
								<label class="col-sm-1 control-label text-left"> 제 목 : </label>
								<div class="col-sm-11">
									<input type="text" class="form-control input-sm" name="title">
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
					<div class="summernote" >
					
					</div>
				</div>


				<div class="panel-footer">
					<div class="pull-right">
						<div class="btn-group">
							<button class="btn btn-default" type="submit">
								<i class="fa fa-edit"></i> 글 등록
							</button>
							<button class="btn btn-default" onclick="location.href='media_board_list.do'">
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
