<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
					<li><a href="index.do">Dashboard</a></li>
					<li><span>App views</span></li>
					<li class="active"><span>Chat view</span></li>
				</ol>
			</div>
			<h2 class="font-light m-b-xs">Chat view</h2>
			<small>Create a chat rooom in your app</small>
		</div>
	</div>
</div>

<div class="content animate-panel">

	<div class="row">
		<div class="col-md-12">
			<div class="hpanel ">
				<div class="panel-heading hbuilt">
					<div class="panel-tools">&nbsp;&nbsp;&nbsp;&nbsp;</div>
					Chat room
				</div>
				<div class="panel-body no-padding">
					<div class="row">
						<div class="col-md-9 ">
							<div class="chat-discussion">
								<textarea id="messageWindow" class="form-control" style="height:90%;"
									readonly="readonly"></textarea>
							</div>
						</div>
						<div class="col-md-3">
							<div class="chat-users">
								<div class="users-list">
									<div class="chat-user">
										<input type="button" class="btn btn-success"
											data-toggle="modal" data-target="#myModal6" value="초대하기"
											style="margin-top: -5px;">
									</div>
									<div class="chat-user">
										<span class="pull-right label label-success">Online</span> <img
											class="chat-avatar" src="images/a3.jpg" alt="">
										<div class="chat-user-name">
											<a href="#">관리자</a>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
					<div class="panel-footer">
						<div class="input-group">
							<input type="text" class="form-control"
								placeholder="Type your message here..." id="inputMessage">
							<span class="input-group-btn">
								<button class="btn btn-success" onclick="send()" value="send"
									id="send">Send</button>
							</span>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="myModal6" tabindex="-1" role="dialog"
	aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="color-line"></div>
			<div class="modal-header">
				<h4 class="modal-title">유저리스트</h4>
				<small class="font-bold">초대하실 유저를 선택해주세요</small>
			</div>
			<div class="modal-body">
				<div class="hpanel panel-group" id="accordion" role="tablist"
					aria-multiselectable="true">

					<div class="panel-body">
						<a data-toggle="collapse" data-parent="#accordion" href="#q1"
							aria-expanded="true"> <i
							class="fa fa-chevron-down pull-right text-muted"></i> 첫번쨰 주소록 그룹
						</a>
						<div id="q1" class="panel-collapse collapse">
							<hr>
							그룹
						</div>
					</div>	
					<div class="panel-body">	
						<a data-toggle="collapse" data-parent="#accordion" href="#q2"
							aria-expanded="true"> <i
							class="fa fa-chevron-down pull-right text-muted"></i> 두번째 주소록 그룹
						</a>
						<div id="q2" class="panel-collapse collapse">
							<hr>
							그룹
						</div>
					</div>
					
					<div class="panel-body">	
						<a data-toggle="collapse" data-parent="#accordion" href="#q3"
							aria-expanded="true"> <i
							class="fa fa-chevron-down pull-right text-muted"></i> 세번째 주소록 그룹
						</a>
						<div id="q3" class="panel-collapse collapse">
							<hr>
							그룹
						</div>
					</div>
					
					<div class="panel-body">	
						<a data-toggle="collapse" data-parent="#accordion" href="#q4"
							aria-expanded="true"> <i
							class="fa fa-chevron-down pull-right text-muted"></i> 세번째 주소록 그룹
						</a>
						<div id="q4" class="panel-collapse collapse">
							<hr>
							그룹
						</div>
					</div>
					
				</div>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-success">초대하기</button>
			</div>
		</div>
	</div>
</div>