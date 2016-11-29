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
			<h2 class="font-light m-b-xs">참여 업무</h2>
			<small>&nbsp;&nbsp;&nbsp;참여 업무에 대한 상세를 볼 수 있습니다^^</small>
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
											진행 상태
										</th>
										<td style="width: 40%; padding-left: 10px;">
										<c:choose>
											<c:when test="${ detail.task_step_no == '1' }">
												<button class="btn btn-xs btn-warning" disabled>진행</button>
											</c:when>
											<c:when test="${ detail.task_step_no == '2' }">
												<button class="btn btn-xs btn-warning2" disabled>미진행</button>
											</c:when>
											<c:when test="${ detail.task_step_no == '3' }">
												<button class="btn btn-xs btn-primary2" disabled>보류</button>
											</c:when>
											<c:when test="${ detail.task_step_no == '4' }">
												<button class="btn btn-xs btn-info" disabled>완료</button>
											</c:when>
											<c:when test="${ detail.task_step_no == '5' }">
												<button class="btn btn-xs btn-danger" disabled>중단</button>
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
											담당자 사번
										</th>
										<td style="width: 25%">
											${ detail.rec_emp_no }
										</td>
										<th style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">
											담당자 명
										</th>
										<td style="width: 25%" colspan="3">
											${ detail.rec_name }
										</td>
									</tr>

									<tr>
										<th style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">
											요청자 사번
										</th>
										<td style="width: 25%">
											${ detail.emp_no }
										</td>
										<th style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">
											요청자 명
										</th>
										<td style="width: 25%">
											${ detail.emp_name }
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
								
								<!-- 권한이 없으면 hidden -->
								<table class="table table-bordered" style="margin-top: 0px; border: 6px solid #e9ecef;">
									<tr>
										<th colspan="2" 
											style="background-color: #f9fafc; font-weight: bold; color: #111; 
												   font-size: 1.2em; padding-left: 20px;">
											진행 처리
										</th>
									</tr>
									<tr>
										<th
											style="background-color: #f5f5f5; text-align: right; padding-right: 10px; 
												   width: 10%; padding-top: 40px;">
											진행 단계
										</th>
										<td>
											<div class="form-inline">
												<span class="sty"> 
													<input type="radio" name="task_step_no" id="yet" value="2" class="radio radioaa"
													<c:if test="${ detail.task_step_no == '2' }"> checked </c:if> />
													<label class="sty" for="yet">미진행</label>
												</span>
												<span class="sty"> 
													<input type="radio" name="task_step_no" id="wait" value="3" class="radio radiobb"
													<c:if test="${ detail.task_step_no == '3' }"> checked </c:if> />
													<label class="sty" for="wait">보류</label>
												</span>
												<span class="sty">
													<input type="radio" name="task_step_no" id="approv" value="1" class="radio radiocc" 
													<c:if test="${ detail.task_step_no == '1' }"> checked </c:if> /> 
													<label class="sty" for="approv">진행</label>
												</span> 
												<span class="sty"> 
													<input type="radio" name="task_step_no" id="fin" value="4" class="radio radiodd"
													<c:if test="${ detail.task_step_no == '4' }"> checked </c:if> />
													<label class="sty" for="fin">완료</label>
												</span>
												<span class="sty"> 
													<input type="radio" name="task_step_no" id="reject" value="5" class="radio radioee"
													<c:if test="${ detail.task_step_no == '5' }"> checked </c:if> />
													<label class="sty" for="reject">중단</label>
												</span> 
											</div>
										</td>
									</tr>
								</table>
								<!-- ------------------------- -->

								<div class="pull-right" style="text-align: center;">
									<input type="submit" class="btn btn-sm btn-success" value="처리하기"
										   style="padding-right: 15px; padding-left: 15px; font-weight: 600; font-size: 13px">
									<input type="button" onclick="location.href='taskRequest.do'"
										   class="btn btn-sm btn-default" value="뒤로가기"
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