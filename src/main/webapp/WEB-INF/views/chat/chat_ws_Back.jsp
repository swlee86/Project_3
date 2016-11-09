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
					<div class="panel-tools">
						<a class="closebox"><i class="fa fa-times"></i></a>
					</div>
					Chat room
				</div>
				<div class="panel-body no-padding">


					<div class="row">

						<div class="col-md-9 ">
							<div class="chat-discussion">
								<textarea id="messageWindow" rows="25" cols="100" readonly="readonly"></textarea>
							</div>
						</div>
						<div class="col-md-3">
							<div class="chat-users">

								<div class="users-list">

									<div class="chat-user">
										<span class="pull-right label label-success">Online</span> <img
											class="chat-avatar" src="images/a3.jpg" alt="">
										<div class="chat-user-name">
											<a href="#">Janet Smith</a>
										</div>
									</div>
									<div class="chat-user">
										<img class="chat-avatar" src="images/a1.jpg" alt="">
										<div class="chat-user-name">
											<a href="#">Monica Smith</a>
										</div>
									</div>
									<div class="chat-user">
										<span class="pull-right label label-success">Online</span> <img
											class="chat-avatar" src="images/a2.jpg" alt="">
										<div class="chat-user-name">
											<a href="#">Michael Smith</a>
										</div>
									</div>
									<div class="chat-user">
										<img class="chat-avatar" src="images/a4.jpg" alt="">
										<div class="chat-user-name">
											<a href="#">Karl Jordan</a>
										</div>
									</div>
									<div class="chat-user">
										<img class="chat-avatar" src="images/a5.jpg" alt="">
										<div class="chat-user-name">
											<a href="#">Alice Smith</a>
										</div>
									</div>
									<div class="chat-user">
										<img class="chat-avatar" src="images/a6.jpg" alt="">
										<div class="chat-user-name">
											<a href="#">Monica Cale</a>
										</div>
									</div>
									<div class="chat-user">
										<img class="chat-avatar" src="images/a2.jpg" alt="">
										<div class="chat-user-name">
											<a href="#">Mark Jordan</a>
										</div>
									</div>
									<div class="chat-user">
										<span class="pull-right label ">Online</span> <img
											class="chat-avatar" src="images/a3.jpg" alt="">
										<div class="chat-user-name">
											<a href="#">Janet Smith</a>
										</div>
									</div>
									<div class="chat-user">
										<img class="chat-avatar" src="images/a4.jpg" alt="">
										<div class="chat-user-name">
											<a href="#">Karl Jordan</a>
										</div>
									</div>
									<div class="chat-user">
										<img class="chat-avatar" src="images/a5.jpg" alt="">
										<div class="chat-user-name">
											<a href="#">Alice Smith</a>
										</div>
									</div>
									<div class="chat-user">
										<img class="chat-avatar" src="images/a6.jpg" alt="">
										<div class="chat-user-name">
											<a href="#">Monica Cale</a>
										</div>
									</div>
									<div class="chat-user">
										<img class="chat-avatar" src="images/a2.jpg" alt="">
										<div class="chat-user-name">
											<a href="#">Mark Jordan</a>
										</div>
									</div>


								</div>

							</div>
						</div>

					</div>
				</div>
				<div class="panel-footer">
					<div class="input-group">
						<input type="text" class="form-control"	placeholder="Type your message here..." id="inputMessage">
						<span class="input-group-btn">
							<button class="btn btn-success" onclick="send()" value="send" id="send">Send</button>
						</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
