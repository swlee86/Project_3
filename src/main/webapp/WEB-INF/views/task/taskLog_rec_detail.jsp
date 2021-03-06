<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--업무 일지 상세보기-->
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
					<li class="active"><span>업무 일지</span></li>
				</ol>
			</div>
			<h2 class="font-light m-b-xs">수신 업무 일지</h2>
			<small>&nbsp;&nbsp;&nbsp;수신 업무 일지에 대한 상세를 볼 수 있습니다^^</small>
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
						<form action="" method="POST">
							<div class="table-responsive">
								<table cellpadding="1" cellspacing="1"
									class="table table-bordered" style="margin-bottom: 0px">
									<tr>
										<th style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">
											업무 번호
										</th>
										<td style="width: 40%" colspan="3">${ detail.task_no }</td>
									</tr>

									<tr>
										<th style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">
											업무 명
										</th>
										<td style="width: 90%" colspan="5">
											<div class="checkbox checkbox-danger" 
												 style="padding-left: 20px; margin: 0px;">
												<input type="checkbox" 
													<c:if test="${ detail.sign == '1' }"> checked </c:if>>
													<label></label>
													${ detail.task_name }
											</div>
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
											참여자 정보
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
											작성자 사번
										</th>
										<td style="width: 25%">
											${ detail.emp_no }
										</td>
										<th style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">
											작성자 명
										</th>
										<td style="width: 25%">
											${ detail.emp_name }
										</td>
										<th style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">
											작성일
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
									<input type="button" onclick="location.href='taskLog.do'"
										   class="btn btn-sm btn-default" value="뒤로가기"
										   style="padding-right: 15px; padding-left: 15px; font-weight: 600; font-size: 13px">
									<input type="button" onclick="location.href='deleteTask_rec.do?task_no=${detail.task_no}'"
										   class="btn btn-sm btn-danger" value="삭제"
										   style="padding-right: 15px; padding-left: 15px; font-weight: 600; font-size: 13px">
								
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>