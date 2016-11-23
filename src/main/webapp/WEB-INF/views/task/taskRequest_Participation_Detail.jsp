<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<h2 class="font-light m-b-xs">업무 요청 참여 페이지</h2>
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
						<form method="POST">
							<input type="hidden" name="hidden_task_no" value="${hidden}">
						<div class="table-responsive">
							<table cellpadding="1" cellspacing="1" class="table table-bordered " style="margin-bottom:0px" >
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%">제목</th>
										<td style="width:40%">${partictask.task_name}</td>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%">승인상태</th>
										<td style="width:40%">
											<c:choose>
										        	<c:when test="${partictask.step_no==1}"><button class="btn btn-xs btn-info">승인</button></c:when>
										        	<c:when test="${partictask.step_no==2}"><button class="btn btn-xs btn-warning2">승인 거부</button></c:when>
										        	<c:when test="${partictask.step_no==3}">보류</c:when>
										     	    <c:otherwise><button class="btn btn-xs btn-warning2">미승인</button></c:otherwise>
										   </c:choose>
									    </td>
									</tr>
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%">지시자</th>
										<td>${partictask.rec_name}</td>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%">지시부서</th>
										<td>개발팀</td>
									</tr>	
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%">업무기한</th>
										<td colspan="3">${partictask.deadline}</td>
									</tr>	
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%">업무 참여자</th>
										<td colspan="3">
											<c:forEach var="list" items="${taskPeople}">
												 <span>${list}</span><br/>
											</c:forEach>
										</td>
									</tr>	
																									
									<tr>
										<th style="background-color:#f5f5f5;text-align:right;padding-right:10px; width:10%">첨부파일</th>
										<td colspan="3">
										<c:choose>
												<c:when test="${partictask.file_name != null}">
													${partictask.file_name}	
												</c:when>
												<c:otherwise>
													<small>첨부파일 없음</small>
												</c:otherwise>
											</c:choose>
										</td>
									</tr>
							
									<tr>
										<th style="background-color:#f5f5f5;text-align:right;padding-right:10px; width:10%">담당자</th>
										<td colspan="3">${partictask.emp_name}</td>
									</tr>
									
									<tr>
										<th style="background-color:#f5f5f5;text-align:right;padding-right:10px; width:10%">내용</th>
										<td colspan="3">${partictask.content}</td>
									</tr>
								</table>							
								
								<table class="table table-bordered" style="margin-top:0px;border:6px solid #e9ecef" >
									<tr>
										<th colspan="2" style="background-color:#f9fafc;font-weight:bold;color:#111;font-size:1.2em;padding-left:20px;">처리 내역</th>
									</tr>
									<tr>
										<th style="background-color:#f5f5f5;text-align:right;padding-right:10px; width:10%;padding-top:20px;">진행 단계</th>
										<td>
											<div class="form-inline">
										     	<span class="sty"> 
													<input type="radio" name="approval" id="approv" value="1" class="radio radioa" /> 
													<label class="sty" for="approv">진행</label>
												</span> 
												<span  class="sty"> 
													<input type="radio" name="approval" id="reject" value="2" class="radio radior" /> 
													<label class="sty" for="reject" >미진행</label>
												</span> 
												<span  class="sty"> 
													<input type="radio" name="approval" id="wait" value="3" class="radio radiow" /> 
													<label class="sty" for="wait">보류</label>
												</span>
												<span  class="sty"> 
													<input type="radio" name="approval" id="finish" value="4" class="radio radiow" /> 
													<label class="sty" for="finish">완료</label>
												</span>
												<span  class="sty"> 
													<input type="radio" name="approval" id="stop" value="5" class="radio radiow" /> 
													<label class="sty" for="stop">중단</label>
												</span>
											
											
											</div>
										</td>
									</tr>
								</table>



								<div  class=" pull-right" style="text-align: center; margin-right: 10px;">
									<input type="submit" class="btn btn-sm btn-success" style="padding-right: 15px; padding-left: 15px; font-weight: 600; font-size: 13px" value="처리하기"> 
									<input type="button" class="btn btn-sm btn-default" style="padding-right: 15px; padding-left: 15px; font-weight: 600; font-size: 13px" value="뒤로가기">
								</div>
								
							</div>
						</form>	
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

