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
							${list.content}

							
							<!-- 리플 -->
							<div class="forum-comments">
							
								<c:forEach items="${relist}" var="n">
									<div class="media">
										<a class="pull-left"> <img src="${pageContext.request.contextPath}/images/a1.jpg" alt="이미지">
										</a>
	
										<div class="media-body">
											<span class="font-bold">${n.emp_name}</span> 
											<small class="text-muted">${n.regdate}</small>
	
											<div class="social-content">
												${n.content}
											</div>
										</div>
									</div>
								</c:forEach>
							


								<form>
									<div class="input-group">
										<input type="text" class="form-control " placeholder="Your comment"> <span class="input-group-btn"> 
										<input type="submit" class="btn  btn-default" value=" 댓글 달기 ">
										</span>
									</div>
								</form>

							</div>
							<br>
								<button type="button" onclick="location.href='history.back();'" class="btn btn-sm btn-success" style="padding-right:15px;padding-left:15px;font-weight:600;font-size:13px">뒤로 가기</button>
							</div>
						</div>
					</div>
				</div>


			</div>

		</div>
	</div>

