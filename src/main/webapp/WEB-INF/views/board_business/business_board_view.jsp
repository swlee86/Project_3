<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<div class="col-lg-12">

			<div class="hpanel forum-box">

				<div class="panel-heading">
					<span class="pull-right"> <i class="fa fa-clock-o"> </i> :
						${list.regdate}
					</span> <span class="f"> 게시판 > 업무 정보 공유 게시판 > <span class="text-success">${list.low_dept_name}</span>
					</span>
				</div>


				<div class="panel-body">
					<div class="media">
						<div class="media-image pull-left">
							<img src="images/a6.jpg" alt="profile-picture">
							<div class="author-info">
								<strong>${list.emp_name}</strong><br> ${list.regdate}
							</div>
						</div>
						<div class="media-body" style="height: 1000px;">
							<h5>${list.title}</h5>
							 	${list.content}
							<!-- Comments -->
							<div class="forum-comments">
								<c:forEach var="re_list" items="${re_list}">
								<div class="media">
									<a class="pull-left"> <img src="images/a1.jpg" alt="profile-picture">
									</a>

									<div class="media-body">
										<span class="font-bold">${re_list.emp_name}</span> <small
											class="text-muted">${re_list.regdate }</small>

										<div class="social-content">
											${re_list.content}
										</div>
									</div>
								</div>
								</c:forEach>
								
								<form action="#" method="post">
									<div class="input-group">
										<input type="text" class="form-control " placeholder="Your comment" name="content">
										<span class="input-group-btn"> 
										<input type="submit" class="btn  btn-default" value=" 댓글 달기 ">
										</span>
									</div>
								</form>

							</div>
							<br>
							<div class="row" style="text-align:center">
								<a href="business_board_list.do?currentpage=${currentpage}&pagesize=${pagesize}"><button type="button" class="btn btn-sm btn-success" style="">뒤로 가기</button></a>
								<a href="answer.do?no=${list.no}&currentpage=${currentpage}&pagesize=${pagesize}"><button type="button" class="btn btn-sm btn-success" style="">답글 쓰기</button></a>							
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

</div>
