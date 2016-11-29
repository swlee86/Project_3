<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
					<li><span>업무 관리</span></li>
					<li class="active"><span>업무 일지</span></li>
				</ol>
			</div>
			<h2 class="font-light m-b-xs">업무 일지</h2>
			<small>&nbsp;&nbsp;&nbsp;금일의 업무를 작성하거나 받을 수 있습니다^^</small>
		</div>
	</div>
</div>

<div class="content animate-panel media-body">
	<div class="row">
		<div class="col-md-12">
			<div class="hpanel">
				<!-- 탭 -->
				<ul class="nav nav-tabs">
					<li class="active"><a data-toggle="tab" href="#tab-1">수신</a></li>
					<li class=""><a data-toggle="tab" href="#tab-2">송신</a></li>
				</ul>
				
				<div class="tab-content">
				
				<!-- 수신 -->
					<div id="tab-1" class="tab-pane active">
						<div class="panel-body">
						<div class="panel-heading">
							전체 : <font color="coral"> ${count1}</font> 개
						</div>
						<br>
							
						<!-- 검색 기준-->
							<div class="row" style="background-color: #f3f3f3;">
								<form action="" class="form-inline">
									<table style="margin-top: 10px; margin-bottom: 10px;" width="100%">
										<tr>
											<th style="text-align: right; padding-right: 20px;">
											<select class="form-control input-sm" 
													name="selectSearch"
													id="selectSearch" onchange="search()">
												<option value="task_no">NO</option>
												<option value="task_name">업무 명</option>
												<option value="deadline">업무 기한</option>
												<option value="emp_no">작성자</option>
												<option value="send_date">작성일</option>
											</select>
											</th>
											<!-- 검색 input 창 -->
											<td>
												<div id="searchInput">
													<input type="text" class="form-control input-sm"
														   width="90%" style="height: 27px;" 
														   name="input" id="input">
												</div>
											</td>

											<td>
												<button class="btn btn-sm"
														style="background-color: #f07070; color: white"
														type="submit">
												<span class="fa fa-search"></span>&nbsp; 검색 &nbsp;
												</button>

												<button class="btn btn-sm"
														style="background-color: #f07070; color: white"
														onclick="window.location.href='taskLog.do'">
												<span class="fa fa-search"></span>&nbsp; 전체보기&nbsp;
												</button>
											</td>
										</tr>
									</table>
								</form>
							</div>
							
							<!-- 데이터 테이블 -->
							<hr style="border: 1px solid gray; margin-bottom: 0px">
							<div class="table-responsive">
								<table cellpadding="1" cellspacing="1" class="table table-hover">
									<thead>
										<tr>
											<th>
												<input type="checkbox" style="margin-left: 20px">
											</th>
											<th>NO</th>
											<th>중요</th>
											<th width="30%">업무 명</th>
											<th>업무 기한</th>
											<th>작성자</th>
											<th>작성일</th>
										</tr>
									</thead>
									<tbody id="firstTable">
										<c:forEach var="list1" items="${list1}">
											<tr>
												<td style="padding-top: 12px;">
													<input type="checkbox" style="margin-left: 20px">
												</td>
												<td style="padding-top: 12px;">${list1.task_no}</td>
												<td style="padding-top: 12px;">
													<div class="checkbox checkbox-danger" 
														 style="padding-top: 0px; margin-top: 0px;">
														<input id="checkbox1" type="checkbox" 
																<c:if test="${ list1.sign == '1' }"> checked </c:if> >
														<label></label>
													</div>
												</td>
												<td style="padding-top: 12px; text-weight: bold;">
													<a href="taskLog_rec_detail.do?task_no=${list1.task_no}"
														<c:if test="${ list1.rec_date == null }"> style="text-decoration:underline; color:blue;" </c:if>>
														${list1.task_name}
													</a>
												</td>
												<td style="padding-top: 12px;">${list1.deadline}</td>
												<td style="padding-top: 12px;">${list1.emp_name}</td>
												<td style="padding-top: 12px;">${list1.send_date}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<div class="row" style="text-align: right; margin-right: 5px;">
									<button type="button" class="btn btn-sm btn-success "
											style="padding-right: 15px; padding-left: 15px; 
											font-weight: bold; font-size: 13px;"
											onclick="window.location.href='taskWrite.do'">일지 등록</button>
									&nbsp;&nbsp;
									<button type="button" class="btn btn-sm btn-default demo4"
											style="padding-right: 15px; padding-left: 15px; 
											font-weight: bold; font-size: 13px;">일지 삭제</button>
								</div>
							</div>
						</div>
						
						<!-- 페이징 처리 -->
						<div class="panel-footer" style="text-align: center; background-color: #f5f5f5">
							<div class="btn-group">
								<button type="button" class="btn btn-default"> &nbsp;
									<i class="fa fa-chevron-left"></i>
								</button>
								<button class="btn btn-default active">1</button>
								<button class="btn btn-default">2</button>
								<button class="btn btn-default">3</button>
								<button class="btn btn-default">4</button>
								<button type="button" class="btn btn-default "> &nbsp;
									<i class="fa fa-chevron-right"></i>
								</button>
							</div>
						</div>
					</div>
					
					
					<!-- 송신 -->
					<div id="tab-2" class="tab-pane">
						<div class="panel-body">
							<div class="panel-heading">
								전체 : <font color="coral"> ${count2}</font> 개
							</div>
							<br>

							<!-- 검색 기준-->
							<div class="row" style="background-color: #f3f3f3;">
								<form action="" class="form-inline">
									<table style="margin-top: 10px; margin-bottom: 10px;" width="100%">
										<tr>
											<th style="text-align: right; padding-right: 20px;">
											<select class="form-control input-sm" 
													name="selectSearch"
													id="selectSearch" onchange="search()">
												<option value="task_no">NO</option>
												<option value="task_name">업무 명</option>
												<option value="deadline">업무 기한</option>
												<option value="emp_no">수신자</option>
												<option value="send_date">작성일</option>
											</select>
											</th>
											<!-- 검색 input 창 -->
											<td>
												<div id="searchInput">
													<input type="text" class="form-control input-sm"
														   width="90%" style="height: 27px;" 
														   name="input" id="input">
												</div>
											</td>

											<td>
												<button class="btn btn-sm"
														style="background-color: #f07070; color: white"
														type="submit">
												<span class="fa fa-search"></span>&nbsp; 검색 &nbsp;
												</button>

												<button class="btn btn-sm"
														style="background-color: #f07070; color: white"
														onclick="window.location.href='taskLog.do'">
												<span class="fa fa-search"></span>&nbsp; 전체보기&nbsp;
												</button>
											</td>
										</tr>
									</table>
								</form>
							</div>
							
							<!-- 데이터 테이블 -->
							<hr style="border: 1px solid gray; margin-bottom: 0px">
							<div class="table-responsive">
								<table cellpadding="1" cellspacing="1" class="table table-hover">
									<thead>
										<tr>
											<th><input type="checkbox" style="margin-left: 20px"></th>
											<th>NO</th>
											<th width="30%">업무 명</th>
											<th>업무 기한</th>
											<th>수신자</th>
											<th>작성일</th>
											<th>수신 확인</th>
										</tr>
									</thead>
									<tbody id="secondTable">
										<c:forEach var="list2" items="${list2}">
											<tr>
												<td style="padding-top: 12px;">
													<input type="checkbox" style="margin-left: 20px">
												</td>
												<td style="padding-top: 12px;">${list2.task_no}</td>
												<td style="padding-top: 12px;">
													<a href="taskLog_detail.do?task_no=${list2.task_no}">
														${list2.task_name}
													</a>
												</td>
												<td style="padding-top: 12px;">${list2.deadline}</td>
												<td style="padding-top: 12px;">${list2.rec_name}</td>
												<td style="padding-top: 12px;">${list2.send_date}</td>
												<td>
												<c:choose>
													<c:when test="${list2.rec_date == null }">
														<font color="red"><b>미확인</b></font>
													</c:when>
													<c:when test="${list2.rec_date != null }">
														<font color="blue"><b>확인</b></font>
													</c:when>
												</c:choose>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<div class="row" style="text-align: right; margin-right: 5px;">
									<button type="button" class="btn btn-sm btn-success "
											style="padding-right: 15px; padding-left: 15px; 
											font-weight: bold; font-size: 13px;"
											onclick="window.location.href='taskWrite.do'">일지 등록</button>
									&nbsp;&nbsp;
									<button type="button" class="btn btn-sm btn-default demo4"
											style="padding-right: 15px; padding-left: 15px; 
											font-weight: bold; font-size: 13px;">일지 삭제</button>
								</div>
							</div>
						</div>
						
						<!-- 페이징 처리 -->
						<div class="panel-footer"
							style="text-align: center; background-color: #f5f5f5">
							<div class="btn-group">
								<button type="button" class="btn btn-default">
									&nbsp;<i class="fa fa-chevron-left"></i>
								</button>
								<button class="btn btn-default active">1</button>
								<button class="btn btn-default  ">2</button>
								<button class="btn btn-default">3</button>
								<button class="btn btn-default">4</button>
								<button type="button" class="btn btn-default ">
									&nbsp;<i class="fa fa-chevron-right"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>