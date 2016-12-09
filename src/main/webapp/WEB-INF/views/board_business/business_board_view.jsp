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
		<div class="col-lg-12">

			<div class="hpanel forum-box">
				<div class="panel-heading">
					<span class="pull-right"> <i class="fa fa-clock-o"> </i> :
						${list.regdate}
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-eye"> </i> ${list.hit}	
					</span> 
					<span class="f"> 게시판 > 
						<span class="text-success">업무 정보 공유 게시판
						</span>
					</span>
					<%-- </span> 
					<br/>
					<span class="pull-right">첨부파일 ><a href="info_board_fileDown.do?name=${list.file_name}">${list.file_name}</a></span>
					<span class="f"> 게시판 > 업무 정보 공유 게시판 > <span class="text-success">${list.low_dept_name}</span>
					</span> --%>
				</div>


				<div class="panel-body">
					<div class="media">
						<div class="media-image pull-left">
							<img src="${pageContext.request.contextPath}/images/a6.jpg" alt="이미지">
							<div class="author-info">
								<strong>${list.emp_name}</strong><br> ${list.regdate}
							</div>
						</div>
						<div class="media-body">
							<h5>${list.title}</h5>
							<hr>
							<c:if test="${not empty list.file_name}">
								<img src="${pageContext.request.contextPath}/img/upload/${list.file_name}"  style="max-width: 80%;height: auto;  border-radius: 0%; width: inherit;" alt="기사이미지" width="70%">
								 <br><br>
							</c:if>
							
							 
							 	${list.content}
							<!-- Comments -->
							<div class="forum-comments">
								<c:forEach var="re_list" items="${re_list}">
									<div class="media">
										<a class="pull-left"> <img src="${pageContext.request.contextPath}/images/a1.jpg" alt="profile-picture">
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
								
								<form action="business_reply_insert.do" method="post">
									<div class="input-group">
										<input type="text" class="form-control " placeholder="Your comment" name="content">
										<input type="hidden" name="currentpage" value="${currentpage}">
										<input type="hidden" name="pagesize" value="${pagesize}">
										<input type="hidden" name="no" value="${list.no}">
										<span class="input-group-btn"> 
										<input type="submit" class="btn  btn-default" value=" 댓글 달기 ">
										</span>
									</div>
								</form>

							</div>
							<br>
							<div class="pull-right">
								<a href="business_board_list.do?currentpage=${currentpage}&pagesize=${pagesize}" class="btn btn-sm btn-success" style="padding-right:15px;padding-left:15px;font-weight:600;font-size:13px">뒤로 가기</a>
								<a href="answer.do?no=${list.no}&currentpage=${currentpage}&pagesize=${pagesize}" class="btn btn-sm btn-success" style="padding-right:15px;padding-left:15px;font-weight:600;font-size:13px">답글 쓰기</a>							
								<c:if test="${list.emp_no==rec_emp_no}">
									<a href="business_board_update.do?no=${list.no}" class="btn btn-sm btn-success" style="padding-right:15px;padding-left:15px;font-weight:600;font-size:13px">수정하기</a>
									<a href="business_board_delete.do?no=${list.no}" class="btn btn-sm btn-default deletechk" style="padding-right:15px;padding-left:15px;font-weight:600;font-size:13px">삭제하기</a>
								</c:if>								
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

</div>
