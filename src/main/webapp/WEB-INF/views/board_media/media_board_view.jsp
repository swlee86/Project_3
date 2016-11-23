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
		<div class="col-lg-12">

			<div class="hpanel forum-box">
				<div class="panel-heading">
					<span class="pull-right"> <i class="fa fa-clock-o"> </i> :
						${list.regdate}
					</span> <span class="f"> 게시판 > <span class="text-success">언론
							게시판</span>
					</span>
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
								<!-- <img src="C:\images\${list.file_name}" alt="이미지" width="500px"> -->
								<img src="${pageContext.request.contextPath}/img/upload/${list.file_name}"  style="max-width: 80%;height: auto;  border-radius: 0%; width: inherit;" alt="기사이미지" width="70%">
								 <br><br>
							</c:if>
							 
							dgss
							${list.content}

							
							<!-- 리플 -->
							<div class="forum-comments">
							
								<c:forEach items="${relist}" var="n">
									<div class="media" >
										<a class="pull-left"> <img src="${pageContext.request.contextPath}/images/a1.jpg" alt="이미지">
										</a>
	
										<div class="media-body">
											<span class="font-bold">${n.emp_name}</span> 
											<small class="text-muted">${n.regdate}</small>
											<!-- <a href="#" id="replydelete">삭제</a> -->
											<div class="social-content">
												${n.content}
											</div>
										</div>
									</div>
								</c:forEach>
									<div  id="replybody">
									</div>


								
								<div class="input-group">
									<input type="text" class="form-control " id="replytext" placeholder="Your comment"> 
									<input type="hidden" id="no" value="${list.no}">
									<span class="input-group-btn"> 
										<input type="button" class="btn  btn-default" id="replysubmit" value=" 댓글 달기 ">
									</span>
								</div>
							

							</div>
							<br>
								<div class=" pull-right">
									<a href="media_board_list.do?pg=${pg}" class="btn btn-sm btn-success" style="padding-right:15px;padding-left:15px;font-weight:600;font-size:13px">뒤로가기</a>
									<%-- <c:if test="${list.empno ==pageContext.request.userPrincipal.name}"> --%>
										<a href="media_board_update.do?no=${list.no}" class="btn btn-sm btn-success deletechk" style="padding-right:15px;padding-left:15px;font-weight:600;font-size:13px">수정하기</a>
										<a href="media_board_delete.do?no=${list.no}" class="btn btn-sm btn-default" style="padding-right:15px;padding-left:15px;font-weight:600;font-size:13px">삭제하기</a>
									<%-- </c:if> --%>
								</div>
							</div>
						</div>
					</div>
				</div>


			</div>

		</div>
	</div>

