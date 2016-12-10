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
		<div class="col-lg-12">
			<div class="hpanel forum-box">
				<div class="panel-heading">
					<span class="pull-right"> <i class="fa fa-clock-o"> </i> :
							${company.regdate}
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-eye"> </i> ${company.hit}
					</span> <span class="f"> 게시판 > <span class="text-success">사내 공지사항</span>
					</span>
				</div>
				
				<div class="panel-body">
					<div class="media clearfix">
						<div class="media-image pull-left">
							<img src="${pageContext.request.contextPath}/img/upload/${company.pic}" alt="logo">
							<div class="author-info">
								<strong>${company.emp_name}</strong><br> ${company.regdate}
							</div>
						</div>
						<div class="media-body">
							<h5>${company.title}</h5>
							<c:if test="${not empty company.file_name}">
								<span class="pull-right">첨부파일 >
									<a href="info_board_fileDown.do?name=${company.file_name}">${company.file_name}</a>
								</span>
<%-- 									<img src="${pageContext.request.contextPath}/img/upload/${list.file_name}"  style="max-width: 80%;height: auto;  border-radius: 0%; width: inherit;" alt="기사이미지" width="70%">
 --%>							<br>
							</c:if>
							<hr>
							
							<%-- <hr>
							<c:if test="${not empty company.file_name}">
								<!-- <img src="C:\images\${list.file_name}" alt="이미지" width="500px"> -->
								<img src="${pageContext.request.contextPath}/img/upload/${company.file_name}"  style="max-width: 80%;height: auto;  border-radius: 0%; width: inherit;" alt="첨부파일" width="70%">
								 <br><br>
							</c:if> --%>
							${company.content}
							
							<br>
							<div class="pull-right">
								<a href="info_board_list.do?currentpage=${currentpage}&pagesize=${pagesize}" class="btn btn-sm btn-success" style="padding-right:15px;padding-left:15px;font-weight:600;font-size:13px">뒤로 가기</a>
								<c:if test="${company.emp_no==rec_emp_no}">
									<a href="info_board_update.do?no=${company.no}" class="btn btn-sm btn-success" style="padding-right:15px;padding-left:15px;font-weight:600;font-size:13px">수정하기</a>
									<a class="btn btn-sm btn-default deletechk" style="padding-right:15px;padding-left:15px;font-weight:600;font-size:13px">삭제하기</a>
								</c:if>								
							</div>
						</div>
					</div>
				
				
				<%-- <div class="panel-footer">
					 <span class="pull-right">
					 	<a href="info_board_list.do?currentpage=${currentpage}&pagesize=${pagesize}"><button type="button" class="btn btn-xs btn-success">뒤로 가기</button></a>
	                </span>
					<i class="fa fa-eye"> </i> ${company.hit}
				
				</div> --%>
				
	
		<%-- 			<div class=" pull-right">
						<a href="info_board_list.do?currentpage=${currentpage}&pagesize=${pagesize}" class="btn btn-sm btn-success" style="padding-right:15px;padding-left:15px;font-weight:600;font-size:13px">뒤로가기</a>
							<c:if test="${company.emp_no ==rec_emp_no}">
								<a href="info_board_update.do?no=${company.no}" class="btn btn-sm btn-success" style="padding-right:15px;padding-left:15px;font-weight:600;font-size:13px">수정하기</a>
								<a class="btn btn-sm btn-default deletechk" style="padding-right:15px;padding-left:15px;font-weight:600;font-size:13px">삭제하기</a>
							</c:if>
					</div>
		 --%>		</div>
			</div>
		</div>
	</div>
</div>