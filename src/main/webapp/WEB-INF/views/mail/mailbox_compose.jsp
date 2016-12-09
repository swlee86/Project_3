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
						<form class="form-inline" action="mailsend.do" method="post">
							<div class="table-responsive">
								<table cellpadding="1" cellspacing="1"
									class="table table-bordered ">
									<tr>
										<th
											style="background-color: #34495e; text-align: right; padding-right: 30px; width: 15%"><font
											color="coral">*</font> <span style="color:white">제목</span></th>
										<td>
											<div class="form-group">
												<div class="input-group date">
													<input type="text" class="form-control input-sm" size="100%" name="subjects">
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<th style="background-color: #34495e; text-align: right; padding-right: 30px; width: 10%"><font
											color="coral"></font><span style="color:white">수신자 메일</span></th>
										<td><input type="email" class="form-control input-sm" placeholder="example@naver.com" size="100%" name="recipients"></td>
									</tr>
									<tr>
										<th
											style="background-color: #34495e; text-align: right; padding-right: 30px; width: 10%">
											<font color="coral">*</font><span style="color:white">내용</span>
										</th>
										<td><textarea class="form-control" cols="10" rows="10" style="width: 100%" name="bodys"></textarea></td>
									</tr>
								</table>
								
							
							<div class="btn-group pull-right" >
									<button class="btn btn-success btn-sm"  style="padding-right:15px;padding-left:15px;font-weight:600;font-size:13px">
										<i class="fa fa-arrow-right"></i> 보내기
									</button>	
									<input type="button" class="btn btn-default  btn-sm"  data-toggle="modal" data-target="#myModal5" value="미리 보기"  style="padding-right:15px;padding-left:15px;font-weight:600;font-size:13px">
								 	<input type="button" class="btn btn-default  btn-sm" value="취소"  style="padding-right:15px;padding-left:15px;font-weight:600;font-size:13px"> 
							</div>	
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="modal fade hmodal-success" id="myModal5" tabindex="-1" role="dialog" aria-hidden="true" > 
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="color-line"></div>
			<div class="modal-header" style="height:50px;padding-top:10px;padding-bottom:10px">
				<h4 class="modal-title"><font size=5em>미리보기</font></h4>
			</div>
			<div class="modal-body">
				<table class="table"style="border:1px solid #f0f0f0; ">
					<tr>
						<td>
							<div style="font-size:16px;font-weight:bold; padding-top:5px;padding-left:20px">제목입력</div><br>
							<div style="padding-left:20px">보낸사람 : 박지은&nbsp; &lt;wong_303@naver.com&gt;</div><br>
							<div style="padding-left:20px">받는사람 : 송중기&nbsp; &lt;wong123@naver.com&gt;</div><br>
						</td>
					</tr>
					<tr>
						<td>
							<span style="padding-left:20px"> 첨부파일 : <font color="#00ba2e">첨부된 파일이 없습니다.</font></span>
						</td>
					</tr>
					<tr>
						<td>
							<div style="padding-left:20px">
								내용<br>
								내용내용<br>내용<br>내용내용<br>내용내용내용내용내용내용
							</div>
						</td>
					</tr>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">close</button>
			</div>
		</div>
	</div>
</div>