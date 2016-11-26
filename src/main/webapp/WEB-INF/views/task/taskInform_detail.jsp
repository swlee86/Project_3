<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
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
					<li><a href="index.do">Dashboard</a></li>
					<li><span>App views</span></li>
					<li class="active"><span>Contacts</span></li>
				</ol>
			</div>
			<h2 class="font-light m-b-xs">업무 보고 송신 상세페이지</h2>
			<small>Show users list in nice and color panels</small>
		</div>
	</div>
</div>


<div class="content animate-panel">
	<div class="row">
		<div class="col-lg-12">
			<div class="hpanel">
				<div class="panel-body">
					<div class="table-responsive">
						<form>
							<input type="hidden" name="task_no" value="${detail.task_no}">
						<div class="table-responsive">
							<table cellpadding="1" cellspacing="1" class="table table-bordered " >
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%">제목</th>
										<td style="width:40%">${detail.content}</td>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%">승인상태</th>
										<td style="width:40%">
											<c:choose>
										        	<c:when test="${detail.step_no=='1'}"><button class="btn btn-xs btn-info">승인</button></c:when>
										        	<c:when test="${detail.step_no=='2'}"><button class="btn btn-xs btn-warning2">승인 거부</button></c:when>
										        	<c:when test="${detail.step_no=='3'}">보류</c:when>
										     	    <c:otherwise><button class="btn btn-xs btn-warning2">미승인</button></c:otherwise>
										   </c:choose>
										</td>
									</tr>
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%">지시자</th>
										<td>${detail.rec_name}</td>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%">지시부서</th>
										<td></td>
									</tr>	
									<tr>
										<th style="background-color:#f5f5f5;text-align:right;padding-right:10px; width:10%">담당자</th>
										<td>${detail.emp_name}</td>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%">업무기한</th>
										<td >${detail.deadline}</td>
									</tr>	
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%">업무 참여자</th>
										<td colspan="3"></td>
									</tr>	
																									
									<tr>
										<th style="background-color:#f5f5f5;text-align:right;padding-right:10px; width:10%">첨부파일</th>
										<td colspan="3">
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
										<th style="background-color:#f5f5f5;text-align:right;padding-right:10px; width:10%">내용</th>
										<td colspan="3">${detail.content}</td>
									</tr>
								</table>

					
								
								<div class="row" style="text-align:center;margin-right:10px;">		
									<input type="button"  class="btn btn-sm btn-success" style="padding-right:15px;padding-left:15px;font-weight:600;font-size:13px" value="뒤로가기">		
								</div>
							</div>
						</form>	
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

