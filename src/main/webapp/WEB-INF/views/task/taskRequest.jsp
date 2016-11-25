<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
					<li class="active"><span>업무 요청</span></li>
				</ol>
			</div>
			<h2 class="font-light m-b-xs">업무 요청</h2>
			<small>Show users list in nice and color panels</small>
		</div>
	</div>
</div>

<div class="content animate-panel media-body">
	<div class="row">
		<div class="col-md-12">
			<div class="hpanel">
				<div class="panel-heading">
					전체 : <font color="coral">${ count }</font> 개
				</div>

				<ul class="nav nav-tabs">
					<li class="active"><a data-toggle="tab" href="#tab-1" id="recevieTab">수신</a></li>
					<li class=""><a data-toggle="tab" href="#tab-2" id="sendTab">송신</a></li>
					<li class=""><a data-toggle="tab" href="#tab-3" id="taskRequestpartnerTab">참여</a></li>
				</ul>

				<div class="tab-content">
				<!-- 수신 -->
					<div id="tab-1" class="tab-pane active">
						<div class="panel-body">
							<div class="row" style="background-color: #f3f3f3;">
								<form action="taskRequest.do" class="form-inline">
									<table style="margin-top: 10px; margin-bottom: 10px;"
										width="100%">

										<!-- 하나로 합쳐보기 -->
										<tr>
											<th style="text-align: right; padding-right: 20px;"><select
												class="form-control input-sm" name="selectSearch"
												id="selectSearch" onchange="search()">
													<option value="task_no">NO</option>
													<option value="task_name">업무명</option>
													<option value="deadline">업무기한</option>
													<option value="emp_no">송신자</option>
													<option value="send_date">송신일</option>
											</select></th>

											<td>
												<div id="searchInput">
													<input type="text" class="form-control input-sm"
														width="90%" style="height: 27px;" name="input" id="input">
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
													onclick="window.location.href='taskRequest.do'">
													<span class="fa fa-search"></span>&nbsp; 전체보기&nbsp;
												</button>
											</td>
										</tr>
									</table>
								</form>
							</div>



							<br>
							<hr style="border: 1px solid gray; margin-bottom: 0px">
							<div class="table-responsive">
								<table cellpadding="1" cellspacing="1" class="table table-hover">
									<thead>
										<tr>
											<th><input type="checkbox" style="margin-left:20px"></th>
											<th>NO</th>
											<th>중요</th>
											<th width="30%">업무명</th>
											<th>업무기한</th>
											<th>송신자</th>
											<th>송신일</th>
											<th>승인결과</th>
										</tr>
									</thead>
									<tbody>
								       <c:forEach var="list" items="${list}">
										<tr>
											<td style="padding-top:12px;">
												<input type="checkbox" style="margin-left:20px">
											</td>
											<td style="padding-top:12px;">${list.task_no}</td>
											<td style="padding-top:12px;">
												<div class="checkbox checkbox-danger" style="padding-top:0px;margin-top:0px;">
													<input id="checkbox1" type="checkbox" checked ><label ></label>
												</div>
											</td>
											<td style="padding-top:12px;"><a href="taskRequest_rec_detail.do?task_no=${list.task_no}">${list.task_name}</a></td>
											<td style="padding-top:12px;">${list.deadline}</td>
											<td style="padding-top:12px;">${list.emp_name}</td>
											<td style="padding-top:12px;">${list.send_date}</td>
                                        
											<td style="padding-top:12px;"><c:choose>
														<c:when test="${ list.step_no == '4'}">
															<button class="btn btn-xs btn-warning2">미승인</button>
														</c:when>
														<c:when test="${ list.step_no == '1'}">
															<button class="btn btn-xs btn-info">승인</button>
														</c:when>
														<c:when test="${ list.step_no == '3' }">
															<button class="btn btn-xs btn-primary2">보류</button>
														</c:when>
													</c:choose>
											
											</td>
										</tr>
										</c:forEach>
										<!-- <tr>
											<td style="padding-top:12px;"><input type="checkbox" style="margin-left:20px"></td>
											<td style="padding-top:12px;">4</td>
											<td style="padding-top:12px;">
												<div class="checkbox checkbox-danger"  style="padding-top:0px;margin-top:0px">
													<input id="checkbox2" type="checkbox"><label ></label>
												</div>
											</td>
											<td style="padding-top:12px;">DB 구현</td>
											<td style="padding-top:12px;">2016-11-16</td>
											<td style="padding-top:12px;" >김주희</td>
											<td style="padding-top:12px;">2016-11-15</td>
											<td style="padding-top:12px;"> <button class="btn btn-xs btn-info">&nbsp;&nbsp;승인&nbsp;&nbsp;</button></td>
										</tr> -->
									</tbody>
								</table>
								<div class="row" style="text-align: right; margin-right: 5px;">
									<button type="button" class="btn btn-sm btn-success "  style=" padding-right:15px;padding-left:15px; font-weight:bold; font-size:13px;" onclick="window.location.href='taskWrite.do'" >업무 등록</button>
									<button type="button" class="btn btn-sm btn-default demo4" style=" padding-right:15px;padding-left:15px; font-weight:bold; font-size:13px;" >업무삭제</button>
								</div>
							</div>
						</div>
						<div class="panel-footer" style="text-align: center;background-color:#f5f5f5">
							<div class="btn-group">
								<button type="button" class="btn btn-default">
									&nbsp;<i class="fa fa-chevron-left"></i>
								</button>
								<button class="btn btn-default active">1</button>
								<button class="btn btn-default">2</button>
								<button class="btn btn-default">3</button>
								<button class="btn btn-default">4</button>
								<button type="button" class="btn btn-default ">
									&nbsp;<i class="fa fa-chevron-right"></i>
								</button>
							</div>
						</div>
					</div>
					
<%-- 


					<!-- 송신 -->
					<div id="tab-2" class="tab-pane">
						<div class="panel-body">
								<div class="row" style="background-color: #f3f3f3;">
								<form action="taskLog_Request.do" class="form-inline">
									<table style="margin-top: 10px; margin-bottom: 10px;"
										width="100%">

										<!-- 하나로 합쳐보기 -->
										<tr>
											<th style="text-align: right; padding-right: 20px;"><select
												class="form-control input-sm" name="selectSearch"
												id="selectSearch" onchange="search()">
													<option value="task_no">NO</option>
													<option value="task_name">업무명</option>
													<option value="deadline">업무기한</option>
													<option value="emp_no">송신자</option>
													<option value="send_date">송신일</option>
											</select></th>

											<td>
												<div id="searchInput">
													<input type="text" class="form-control input-sm"
														width="90%" style="height: 27px;" name="input" id="input">
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

							


							<br>
							<hr style="border: 1px solid gray; margin-bottom: 0px">
							<div class="table-responsive">
								<table cellpadding="1" cellspacing="1" class="table table-hover">
									<thead>
										<tr>
											<th><input type="checkbox" style="margin-left:20px"></th>
											<th>NO</th>
											<th width="30%">업무명</th>
											<th>업무기한</th>
											<th>수신자</th>
											<th>요청일</th>
											<th>승인단계</th>
										</tr>
									</thead>
									<tbody id="secondTbody">
									
										<tr>
											<td><input type="checkbox" style="margin-left:20px"></td>
											<td><span id=""></span></td>
											<td><a href="taskRequest_Transmit_Detail.do">${list.task_name}</a></td>
											<td>${list.deadline}</td>
											<td>${list.emp_name}</td>
											<td>${list.send_date}</td>
											<td><button class="btn btn-xs btn-warning2">${list.send_date}</button></td>
										</tr>
										
										
									</tbody>
								</table>
								<div class="row" style="text-align: right; margin-right: 5px;">
									<button type="button" class="btn btn-sm btn-success "  style=" padding-right:15px;padding-left:15px; font-weight:bold; font-size:13px;" onclick="window.location.href='taskWrite.do'" >업무 등록</button>
									<button type="button" class="btn btn-sm btn-default demo4" style=" padding-right:15px;padding-left:15px; font-weight:bold; font-size:13px;" >업무삭제</button>
								</div>
							</div>
						</div>
							<div class="panel-footer" style="text-align: center;background-color:#f5f5f5">
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
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<!-- 참여 -->
					<div id="tab-3" class="tab-pane">
						<div class="panel-body">
								<div class="row" style="background-color: #f3f3f3;">
								<form action="taskLog_Request.do" class="form-inline">
									<table style="margin-top: 10px; margin-bottom: 10px;"
										width="100%">

										<!-- 하나로 합쳐보기 -->
										<tr>
											<th style="text-align: right; padding-right: 20px;"><select
												class="form-control input-sm" name="selectSearch"
												id="selectSearch" onchange="search()">
													<option value="task_no">NO</option>
													<option value="task_name">업무명</option>
													<option value="deadline">업무기한</option>
													<option value="emp_no">송신자</option>
													<option value="send_date">송신일</option>
											</select></th>

											<td>
												<div id="searchInput">
													<input type="text" class="form-control input-sm"
														width="90%" style="height: 27px;" name="input" id="input">
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

							


							<br>
							<hr style="border: 1px solid gray; margin-bottom: 0px">
							<div class="table-responsive">
								<table cellpadding="1" cellspacing="1" class="table table-hover">
									<thead>
										<tr>
											<th><input type="checkbox" style="margin-left:20px"></th>
											<th>NO</th>
											<th width="30%">업무명</th>
											<th>업무기한</th>
											<th>수신자</th>
											<th>요청일</th>
											<th>진행단계</th>
										</tr>
									</thead>
									<tbody id="thirdBody">
										
									</tbody>
								</table>
								<div class="row" style="text-align: right; margin-right: 5px;">
									<button type="button" class="btn btn-sm btn-success "  style=" padding-right:15px;padding-left:15px; font-weight:bold; font-size:13px;" onclick="window.location.href='taskWrite.do'" >업무 등록</button>
									<button type="button" class="btn btn-sm btn-default demo4" style=" padding-right:15px;padding-left:15px; font-weight:bold; font-size:13px;" >업무삭제</button>
								</div>
							</div>
						</div>
							<div class="panel-footer" style="text-align: center;background-color:#f5f5f5">
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
					
					
					
					 --%>
					 
					 
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 
<div class="modal fade hmodal-success" id="myModal1" tabindex="-1"
	role="dialog" aria-hidden="true">
	<div class="modal-dialog  modal-sm">
		<div class="modal-content">
			<div class="color-line"></div>
			<div class="modal-header text-center">
				확인을 누르시면 선택하신 ㅇㅇ 요청이 취소 처리가 됩니다.<br> 정말 처리하시겠습니까?
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default btn-sm"
					data-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary btn-sm demo2"
					data-dismiss="modal" data-toggle="modal" data-target="">확인</button>
			</div>
		</div>
	</div>
</div>
 -->