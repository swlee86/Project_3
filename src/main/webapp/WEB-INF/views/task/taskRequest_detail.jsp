<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--업무요청 상세보기-->
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
					<li><a href="index.do">홈</a></li>
					<li><span>업무 관리</span></li>
					<li class="active"><span>업무 요청</span></li>
				</ol>
			</div>
			<h2 class="font-light m-b-xs">보낸 업무</h2>
			<small>&nbsp;&nbsp;&nbsp;보낸 업무에 대한 상세를 볼 수 있습니다^^</small>
		</div>
	</div>
</div>

<!-- 데이터 테이블 -->
<div class="content animate-panel">
	<div class="row">
		<div class="col-lg-12">
			<div class="hpanel">
				<div class="panel-body">
					<div class="table-responsive">
						<form action="request_approval.do" method="POST">
							<div class="table-responsive">
								<table cellpadding="1" cellspacing="1"
									class="table table-bordered" style="margin-bottom: 0px">
									<tr>
										<th style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">
											업무 번호
										</th>
										<td style="width: 40%" colspan="3">${ detail.task_no }</td>
										<th style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">
											승인 결과
										</th>
										<td style="width: 40%; padding-left: 10px;">
										<c:choose>
											<c:when test="${ detail.step_no == '1' }">
												<button class="btn btn-xs btn-info" disabled>승인</button>
											</c:when>
											<c:when test="${ detail.step_no == '2' }">
												<button class="btn btn-xs btn-danger" disabled>반려</button>
											</c:when>
											<c:when test="${ detail.step_no == '3' }">
												<button class="btn btn-xs btn-primary2" disabled>보류</button>
											</c:when>
											<c:when test="${ detail.step_no == '4' }">
												<button class="btn btn-xs btn-warning2" disabled>미승인</button>
											</c:when>
										</c:choose>
										</td>
									</tr>

									<tr>
										<th style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">
											업무 명
										</th>
										<td style="width: 90%" colspan="5">
											${ detail.task_name }
										</td>
									</tr>
									
									<tr>
										<th style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">
											업무 기한
										</th>
										<td>
											${ detail.deadline }
										</td>
										<th style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">
											참조자 명
										</th>
										<td colspan="3">
										<c:forEach var="list" items="${peopledetail}" varStatus="status">
											<c:out value="${ list.emp_name }">
											<c:if test="${ !status.last }">,</c:if>
											</c:out>
										</c:forEach>
										</td>
									</tr>

									<tr>
										<th style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">
											수신자 사번
										</th>
										<td style="width: 25%">
											${ detail.rec_emp_no }
										</td>
										<th style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">
											수신자 명
										</th>
										<td style="width: 25%">
											${ detail.rec_name }
										</td>
										<th style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">
											요청일
										</th>
										<td style="width: 25%">
											${ detail.send_date }
										</td>
									</tr>

									<tr>
										<th style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">
											첨부 파일
										</th>
										<td colspan="5">
										<c:choose>
											<c:when test="${detail.file_name != null}">
												${detail.file_name}
											</c:when>
											<c:otherwise>
												<small>첨부파일 없음</small>
											</c:otherwise>
										</c:choose>
										</td>
									</tr>

									<tr>
										<th style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">
											내용
										</th>
										<td colspan="5" height="300px" style="overflow:auto;">${detail.content}</td>
									</tr>
								</table>
								
								<br><br>

								<div class="pull-right" style="text-align: center;">
									<input type="button" onclick="location.href='taskRequest.do'"
										   class="btn btn-sm btn-default" value="뒤로가기"
										   style="padding-right: 15px; padding-left: 15px; font-weight: 600; font-size: 13px">
											   
								<c:choose>	
								<c:when test="${ detail.step_no =='1'}">		   
									<input type="button" onclick="#"
										   class="btn btn-sm btn-danger" value="승인후 삭제 불가"
										   style="padding-right: 15px; padding-left: 15px; font-weight: 600; font-size: 13px" disabled="disabled">
								</c:when>
								<c:otherwise>
									<input type="button" onclick="location.href='taskDelete.do?task_no=${detail.task_no}'"
										   class="btn btn-sm btn-danger" value="삭제"
										   style="padding-right: 15px; padding-left: 15px; font-weight: 600; font-size: 13px">
								</c:otherwise>
								</c:choose>
								
								</div>
							</div>
						</form>
						
						<br><br>
						<span>업무 처리 의견</span>
						<div class="forum-comments">
								<c:forEach var="re_list" items="${re_list}">
									<div class="media">
										<a class="pull-left"> <img src="${pageContext. request.contextPath}/images/Reply_Basic_Pic.jpg" alt="profile-picture">
										</a>
	
										<div class="media-body">
											<span class="font-bold">${re_list.emp_name}</span> <small
												class="text-muted">${re_list.create_date }</small>
											<div class="social-content">
												${re_list.contents}
											</div>
										</div>
									</div>
								</c:forEach>
						<form action=task_reply_insert_song.do method="post">
									<div class="input-group" style="margin-left: 100px; margin-right: 100px;">
										<input type="text" class="form-control " placeholder="Your comment" name="contents">	
										<input type="hidden" name="task_no" value="${detail.task_no}">						
										<span class="input-group-btn"> 
										<input type="submit" class="btn  btn-default" value=" 댓글 달기 ">
										</span>
									</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>