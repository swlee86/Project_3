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
			<h2 class="font-light m-b-xs">회사정보게시판</h2>
			<small>Show users list in nice and color panels</small>
		</div>
	</div>
</div>


<div class="content animate-panel">

	<div class="row">
		<div class="col-md-12">
			<div class="hpanel blog-box">
				<div class="panel-heading">
					<div class="media clearfix">
						<a class="pull-left"> <img src="images/a3.jpg"
							alt="profile-picture">
						</a>
						<div class="media-body">
							<small>작성자 : <span class="font-bold">관리자
									</span>
							</small><br/><span>제목 : ${company.title}(<small class="text-muted">${company.regdate}</small>)</span> <br/> 
						</div>
					</div>
				</div>
				<div class="panel-body">
						<a href="info_board_fileDown.do?name=${company.file_name}">첨부파일 : ${company.file_name}</a><br/>
						${company.content}
				</div>
				<div class="panel-footer">
					 <span class="pull-right">
					 	<a href="info_board_list.do?currentpage=${currentpage}&pagesize=${pagesize}"><button type="button" class="btn btn-xs btn-success">뒤로 가기</button></a>
	                </span>
					<i class="fa fa-eye"> </i> ${company.hit}
				
				</div>
			</div>


		</div>
	</div>
</div>