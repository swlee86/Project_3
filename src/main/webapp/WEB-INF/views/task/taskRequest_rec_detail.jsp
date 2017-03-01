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
			<h2 class="font-light m-b-xs">수신 업무</h2>
			<small>&nbsp;&nbsp;&nbsp;수신 업무에 대한 상세를 볼 수 있습니다^^</small>
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
										<td style="width: 40%" colspan="3" name="task_no">${ detail.task_no }</td>
										<input type="hidden" name="task_no" value="${ detail.task_no }">
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
								
								<c:if test="${ session_emp_no == db_rec_emp_no }">
								<table class="table table-bordered" style="margin-top: 0px; border: 6px solid #e9ecef;">
									<tr>
										<th colspan="2" 
											style="background-color: #f9fafc; font-weight: bold; color: #111; 
												   font-size: 1.2em; padding-left: 20px;">
											승인 처리
										</th>
									</tr>
									<tr>
										<th
											style="background-color: #f5f5f5; text-align: right; padding-right: 10px; 
												   width: 10%; padding-top: 40px;">
											승인 단계
										</th>
										<td>
											<div class="form-inline">
												<span class="sty">
													<input type="radio" name="step_no" id="approv" value="1" class="radio radioa" 
													<c:if test="${ detail.step_no == '1' }"> checked </c:if> /> 
													<label class="sty" for="approv"> 승인</label>
												</span> 
												<span class="sty"> 
													<input type="radio" name="step_no" id="reject" value="2" class="radio radiob"
													<c:if test="${ detail.step_no == '2' }"> checked </c:if> />
													<label class="sty" for="reject">반려</label>
												</span> 
												<span class="sty"> 
													<input type="radio" name="step_no" id="wait" value="3" class="radio radioc"
													<c:if test="${ detail.step_no == '3' }"> checked </c:if> />
													<label class="sty" for="wait">보류</label>
												</span>
												<span class="sty"> 
													<input type="radio" name="step_no" id="yet" value="4" class="radio radiod"
													<c:if test="${ detail.step_no == '4' }"> checked </c:if> />
													<label class="sty" for="yet">미승인</label>
												</span>
											</div>
										</td>
									</tr>
								</table>
								</c:if>
								
								<!-- 업무에 따라서 아래에 나오는 처리 버튼 등을 다르게 표기하도록 c:if 처리 할 것 -->
								
								<c:if test="${detail.cg_no=='1' } }">
								<c:out value="${detail.cg_no }"></c:out>
								<div class="pull-right" style="text-align: center;">
									<input type="submit" class="btn btn-sm btn-success" value="처리하기"
										   style="padding-right: 15px; padding-left: 15px; font-weight: 600; font-size: 13px">
									<input type="button" onclick="location.href='taskRequest.do'"
										   class="btn btn-sm btn-default" value="뒤로가기"
										   style="padding-right: 15px; padding-left: 15px; font-weight: 600; font-size: 13px">
										   		   
									<input type="button" onclick="location.href='deleteTask_rec.do?task_no=${detail.task_no}'"
										   class="btn btn-sm btn-danger" value="삭제"
										   style="padding-right: 15px; padding-left: 15px; font-weight: 600; font-size: 13px">
								
								</div>
								</c:if>
								
								
								<c:if test="${detail.cg_no=='2' }">
								<c:out value="${detail.cg_no }"></c:out>
								<div class="pull-right" style="text-align: center;">
									<input type="submit" class="btn btn-sm btn-success" value="22222222222222"
										   style="padding-right: 15px; padding-left: 15px; font-weight: 600; font-size: 13px">
									<input type="button" onclick="location.href='taskRequest.do'"
										   class="btn btn-sm btn-default" value="뒤로가기"
										   style="padding-right: 15px; padding-left: 15px; font-weight: 600; font-size: 13px">
										   		   
									<input type="button" onclick="location.href='deleteTask_rec.do?task_no=${detail.task_no}'"
										   class="btn btn-sm btn-danger" value="삭제"
										   style="padding-right: 15px; padding-left: 15px; font-weight: 600; font-size: 13px">
								
								</div>
								</c:if>
								
								<c:if test="${detail.cg_no=='3' }">
								<c:out value="${detail.cg_no }"></c:out>
								<div class="pull-right" style="text-align: center;">
									<input type="submit" class="btn btn-sm btn-success" value="33333333333333333333"
										   style="padding-right: 15px; padding-left: 15px; font-weight: 600; font-size: 13px">
									<input type="button" onclick="location.href='taskRequest.do'"
										   class="btn btn-sm btn-default" value="뒤로가기"
										   style="padding-right: 15px; padding-left: 15px; font-weight: 600; font-size: 13px">
										   		   
									<input type="button" onclick="location.href='deleteTask_rec.do?task_no=${detail.task_no}'"
										   class="btn btn-sm btn-danger" value="삭제"
										   style="padding-right: 15px; padding-left: 15px; font-weight: 600; font-size: 13px">
								
								</div>
								</c:if>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>