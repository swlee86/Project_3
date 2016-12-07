<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="systemdate" />
<!-- 채팅 테스트용 아이디 세션 -->
<div class="content animate-panel">
	<div class="row">
		<div class="col-lg-12 text-center m-t-md">
			<h2>Welcome to 2PM</h2>
			<p>
				스타트업 및 중소기업의 <strong>프로젝트 관리, 인사, 일정 관리</strong>를 위한 그 모든 프로그램
				
			</p>
			<h4>히밤 : </h4>${sessionScope.emp}
		</div>
	</div>
	
	<div class="row">
	&nbsp;
	</div>
	<hr style="border: 1px solid #ddd;">
	<div class="row">
	 <div class="col-lg-6">
			<div class="hpanel">
				<ul class="nav nav-tabs">
					<li class="active"><a data-toggle="tab" href="#pro-1"><b>진행중 프로젝트</b></a></li>
					<li class=""><a data-toggle="tab" href="#pro-2"><b>승인할 프로젝트 </b></a></li>
				</ul>
				<div class="tab-content">
					<div id="pro-1" class="tab-pane active">
						<div class="panel-body list">
							<div class="table-responsive project-list">
								<table class="table table-striped table-condensed">
									<thead>
										<tr>
											<th colspan="2">프로젝트명</th>
											<th style="text-align:center">진행률</th>
											<th style="text-align:center">진행단계</th>
											<th style="text-align:center">기 &nbsp;&nbsp; 간</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="pjlist" items="${pjlist}" begin="0" end="4">
											<tr>
												<td>
													<a href="projectDetail.do?pj_no=${pjlist.pj_no}">
														<c:choose>
															<c:when test="${fn:length(pjlist.pj_title) > 10}">${fn:substring(pjlist.pj_title,0,10)} ...</c:when>
															<c:otherwise>${fn:substring(pjlist.pj_title,0,10)}</c:otherwise>
														</c:choose>
													</a>
												</td>
												<td></td>
												<td style="text-align:center"><span class="pie">${pjlist.pj_progress}/100</span><small> ${pjlist.pj_progress}%</small></td>
												<td style="text-align:center">
													<c:choose>
														<c:when test="${pjlist.pj_step_no == 1}">
															<span class="label label-success" style="width: 60px;padding-left:15px;padding-right:15px;">진&nbsp;&nbsp;&nbsp;&nbsp;행</span>
														</c:when>
														<c:when test="${pjlist.pj_step_no == 2}">
															<span class="label label-info" style=" width: 60px;padding-left:15px;padding-right:15px;">미진행</span>
														</c:when>
														<c:when test="${pjlist.pj_step_no == 3}">
															<span class="label label-warning" style="width: 60px;padding-left:15px;padding-right:15px;">보&nbsp;&nbsp;&nbsp;&nbsp;류</span>
														</c:when>
														<c:when test="${pjlist.pj_step_no == 4}">
															<span class="label label-default" style=" width: 60px;padding-left:15px;padding-right:15px;">완&nbsp;&nbsp;&nbsp;&nbsp;료</span>
														</c:when>
														<c:when test="${pjlist.pj_step_no == 5}">
															<span class="label label-danger" style=" width: 60px;padding-left:15px;padding-right:15px;">중&nbsp;&nbsp;&nbsp;&nbsp;단</span>
														</c:when>
														<c:otherwise>오류</c:otherwise>
													</c:choose>
												</td>
												<td style="text-align:center"><small><i class="fa fa-clock-o"></i> </small> ${fn:substring(pjlist.pj_start,5, fn:length(pjlist.pj_start))} ~ ${fn:substring(pjlist.pj_end,5, fn:length(pjlist.pj_end))}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div id="pro-2" class="tab-pane">
						<div class="panel-body list">
							<div class="table-responsive project-list">
								<table class="table table-striped table-condensed">
									<thead>
										<tr >
											<th colspan="2">프로젝트명</th>
											<th style="text-align:center">책임자</th>
											<th style="text-align:center">기 &nbsp;&nbsp; 간</th>
											<th style="text-align:center">승인여부</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="approve_pjlist" items="${approve_pjlist}" >
											<tr >
												<td>
													<a href="project_approve_detailview.do?pj_no=${approve_pjlist.pj_no}">
														<c:choose>
															<c:when test="${fn:length(approve_pjlist.pj_title) > 10}">${fn:substring(approve_pjlist.pj_title,0,10)} ...</c:when>
															<c:otherwise>${fn:substring(approve_pjlist.pj_title,0,10)}</c:otherwise>
														</c:choose><%-- ${approve_pjlist.pj_title} --%>
													</a>
												</td>
												<td></td>
												<td style="text-align:center">${approve_pjlist.emp_name }</td>
												<td style="text-align:center">
													<small><i class="fa fa-clock-o"></i> </small>  
													${fn:substring(approve_pjlist.pj_start,5, fn:length(approve_pjlist.pj_start))} ~ ${fn:substring(approve_pjlist.pj_end,5, fn:length(approve_pjlist.pj_end))} 
													<%-- ${approve_pjlist.pj_start} ~ ${approve_pjlist.pj_end} --%>
												</td>
												<td style="text-align:center">
													<c:choose>
														<c:when test="${approve_pjlist.step_no == '2'}">
															<button class="btn btn-xs btn-danger" disabled>
																<b>승인거부</b>
															</button>
														</c:when>
														<c:when test="${approve_pjlist.step_no == '3'}">
															<button class="btn btn-xs btn-primary2" disabled>
																&nbsp;&nbsp;&nbsp;<b>보&nbsp;&nbsp;류</b>&nbsp;&nbsp;&nbsp;
															</button>
														</c:when>
														<c:when test="${approve_pjlist.step_no == '4'}">
															<button class="btn btn-xs btn-warning2" disabled>
																&nbsp;&nbsp;<b>미승인</b>&nbsp;&nbsp;
															</button>
														</c:when>
													</c:choose>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	
	
	    <div class="col-lg-6">
			<div class="hpanel">
				<ul class="nav nav-tabs">
					<li class="active"><a data-toggle="tab" href="#task-1"><b>진행중 업무</b></a></li>
					<li class=""><a data-toggle="tab" href="#task-2"><b>미확인 업무</b></a></li>
				</ul>
				<div class="tab-content">
					<div id="task-1" class="tab-pane active">	
						<div class="panel-body list">
							<div class="table-responsive project-list">
								<table class="table table-striped table-condensed">
									<thead>
										<tr>
											<th>업무명</th>
											<th style="text-align:center">마감일</th>
											<th style="text-align:center">진행단계</th>
											<th style="text-align:center">요청자명</th>
											<th style="text-align:center">중 &nbsp;&nbsp; 요</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="mytasklist" items="${mytasklist}" > 
											<tr>
												<c:choose>
													<c:when test="${mytasklist.deadline < systemdate}">
														<td><a style="color: red"
															href="taskRequest_participation_detail.do?task_no=${mytasklist.task_no}">${mytasklist.task_name}</a><br />
															<small><i class="fa fa-clock-o"></i> 요청날.&nbsp;
																${mytasklist.send_date}</small></td>
													</c:when>
													<c:when test="${mytasklist.deadline == systemdate}">
														<td><a style="color: blue"
															href="taskRequest_participation_detail.do?task_no=${mytasklist.task_no}">${mytasklist.task_name}</a><br />
															<small><i class="fa fa-clock-o"></i> 요청날.&nbsp;
																${mytasklist.send_date}</small></td>
													</c:when>
													<c:otherwise>
														<td><a
															href="taskRequest_participation_detail.do?task_no=${mytasklist.task_no}">${mytasklist.task_name}</a><br />
															<small><i class="fa fa-clock-o"></i> 요청날.&nbsp;
																${mytasklist.send_date}</small></td>
													</c:otherwise>
												</c:choose>
												<td style="text-align:center">${mytasklist.deadline}</td>
												<td style="text-align:center">
												 <c:choose>
												<c:when test="${mytasklist.task_step_no == '1'}">
														<button class="btn btn-xs btn-warning" disabled><small>&nbsp;&nbsp;진&nbsp;행&nbsp;&nbsp;</small></button>
													</c:when>
													<c:when test="${mytasklist.task_step_no == '2'}">
														<button class="btn btn-xs btn-warning2" disabled><small>&nbsp;미진행&nbsp;</small></button>
													</c:when>
													<c:when test="${mytasklist.task_step_no == '3' }">
														<button class="btn btn-xs btn-primary2" disabled><small>&nbsp;&nbsp;보&nbsp;류&nbsp;&nbsp;</small></button>
													</c:when>
													<c:when test="${mytasklist.task_step_no== '4'}">
														<button class="btn btn-xs btn-info" disabled><small>&nbsp;&nbsp;완&nbsp;료&nbsp;&nbsp;</small></button>
													</c:when>
													<c:when test="${mytasklist.task_step_no== '5'}">
														<button class="btn btn-xs btn-danger" disabled><small>&nbsp;&nbsp;중&nbsp;단&nbsp;&nbsp;</small></button>
													</c:when>
												</c:choose> 
												
												</td>
												<td style="text-align:center">${mytasklist.emp_name}</td>
												<td style="text-align:center">
													<c:if test="${mytasklist.sign == 1}">
														<i class="fa fa-check text-success"></i>
													</c:if>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div class="pull-right">
								<span><small><a href="taskRequest.do">[업무 요청 리스트 바로가기]</a></small></span>
							</div>	
						</div>	
									
					</div>
				
					<div id="task-2" class="tab-pane "> <!-- 미확인 -->
						<div class="panel-body list">	
							
							<!-- <div class="panel-body"> -->
								<div class="table-responsive project-list">
									<table class="table table-striped table-condensed">
										<thead>
											<tr>
												<th>업무명</th>
												<th style="text-align:center">마감일</th>
												<th style="text-align:center">요청자명</th>
											<!-- 	<th style="text-align:center">승인단계</th> -->
												<th style="text-align:center">첨부파일</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="tasklist" items="${tasklist}">
												<tr>
													<c:choose>
														<c:when test="${tasklist.send_date < systemdate}">
															<td><a style="color: red"
																href="taskRequest_rec_detail.do?task_no=${tasklist.task_no}">${tasklist.task_name}</a><br />
																<small><i class="fa fa-clock-o"></i> 요청날.&nbsp;
																	${tasklist.send_date }</small></td>
														</c:when>
														<c:when test="${tasklist.send_date == systemdate}">
															<td><a style="color: blue"
																href="taskRequest_rec_detail.do?task_no=${tasklist.task_no}">${tasklist.task_name}</a><br />
																<small><i class="fa fa-clock-o"></i> 요청날.&nbsp;
																	${tasklist.send_date }</small></td>
														</c:when>
														<c:otherwise>
															<td><a
																href="taskRequest_rec_detail.do?task_no=${tasklist.task_no}">${tasklist.task_name}</a><br />
																<small><i class="fa fa-clock-o"></i> 요청날.&nbsp;
																	${tasklist.send_date }</small></td>
														</c:otherwise>
													</c:choose>
													<td style="text-align:center">${tasklist.deadline}</td>
													<td style="text-align:center">${tasklist.emp_name}</td>
												<%-- 	<td style="text-align:center">
														<c:choose>
															<c:when test="${ tasklist.step_no == '2' }">
																<button class="btn btn-xs btn-danger" disabled>승인거부</button>
															</c:when>
															<c:when test="${ tasklist.step_no == '3' }">
																<button class="btn btn-xs btn-primary2" disabled>보류</button>
															</c:when>
															<c:when test="${ tasklist.step_no == '4' }">
																<button class="btn btn-xs btn-warning2" disabled>미승인</button>
															</c:when>
														</c:choose>

													</td> --%>
													<td style="text-align:center">
														<c:if test="${not empty tasklist.file_name}">
															<b><i class="fa fa-paperclip text-success"></i></b>
														</c:if>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							<!-- </div> -->
							<div class="pull-right">
								<span><small><a href="taskRequest.do">[업무 요청 리스트 바로가기]</a></small></span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>










	<!-- chart 최근 근무현황 -->
	<div class="row" style="height: 350px;">
		<!-- <div class="col-lg-6" style="height: 400px;">
			<div class="hpanel">
				<div class="panel-heading">
					<div class="panel-tools">
						<a class="showhide"><i class="fa fa-chevron-up"></i></a> <a
							class="closebox"><i class="fa fa-times"></i></a>
					</div>
					현재까지의 추가 근무 현황(기준: 분)
				</div>
				<div class="panel-body" style="height: 350px;">
					<div>
						<div id="ct-chart4" class="ct-perfect-fourth"
							style="height: 300px; width: 98%;"></div>
					</div>
				</div>
			</div>
		</div> -->
		<div class="col-lg-6" style="height: 400px;">
			<div class="hpanel">
				<div class="panel-heading">
					<div class="panel-tools">
						<a class="showhide"><i class="fa fa-chevron-up"></i></a> <a
							class="closebox"><i class="fa fa-times"></i></a>
					</div>
					이번 달 우리 부서 평균 근무 시간(기준: 분)
				</div>
				<div class="panel-body" style="height: 350px;">
					<div>
						<div id="avgCommuteChart" class="ct-perfect-fourth"
							style="height: 300px; width: 98%;"></div>
					</div>
				</div>
			</div>
		</div>
					<div class="col-lg-6">
			<div class="hpanel">
				<div class="panel-heading">
					<div class="panel-tools">
						<a class="showhide"><i class="fa fa-chevron-up"></i></a> <a
							class="closebox"><i class="fa fa-times"></i></a>
					</div>
					전자 우편
				</div>
				<div class="panel-body list">
					<div class="table-responsive project-list">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>보낸 메일</th>
									<th>제목</th>
									<th>도착일시</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${null eq maillist }">
										<div>
											<h6>메일의 경우 보안 관계상 메일 읽기에서 한 번 더 로그인 후 조회 가능합니다</h6>
										</div>
									</c:when>
									<c:otherwise>
										<c:forEach var="maillist" items="${maillist}">
											<tr>
												<c:choose>
													<c:when
														test="${maillist.emp_no eq '=?UTF-8?Q?Google_=EC=BB=A4=EB=AE=A4=EB=8B=88=ED=8B=B0=ED=8C=80?= <googlecommunityteam-noreply@google.com>'}">
														<td><a href="#">googlecommunityteam-noreply@google.com</a></td>
													</c:when>
													<c:otherwise>
														<td><a href="#">${maillist.emp_no}</a></td>
													</c:otherwise>
												</c:choose>
												<td><a href="#"
													onClick="javascript:window.open('${pageContext.request.contextPath}/mail/data/${maillist.mail_content}.html','popup','scrollbars=no, resizable=no, width=500px,height=800px')">${maillist.title}</a></td>
												<td class="text-right mail-date">${maillist.rec_check}</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br/><br/>
	<%-- 	<div class="col-md-6">
			사내 공지사항
			<div class="hpanel">
				<div
					class="v-timeline vertical-container animate-panel table-responsive"
					data-child="vertical-timeline-block" data-delay="1">

					<c:forEach var="cplist" items="${companyList}">
						<div class="vertical-timeline-block">
							<div class="vertical-timeline-icon navy-bg">
								<i class="fa fa-calendar"></i>
							</div>
							<div class="vertical-timeline-content">
								<div class="p-sm">
									<span class="vertical-date pull-right">등록일 :
										${cplist.regdate}<br />
									<small>조회수 : ${cplist.hit}</small>
									</span>
									<h5>
										<a
											href="detailinfo_board_list.do?no=${cplist.no}&currentpage=1&pagesize=10">${cplist.title }</a>
									</h5>
								</div>
								<div class="panel-footer">작성자 : ${cplist.emp_name}</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
 --%>
	
	
	<c:forEach var="commutelist" items="${commutelist}">
		<input type="hidden" id="regdate" name="regdate[]"
			value="${commutelist.regdate}">
		<input type="hidden" id="add_time" name="add_time[]"
			value="${commutelist.add_time}">
	</c:forEach>

</div>
<!-- 	<div class="row">
		<div class="col-lg-3">
			<div class="hpanel" >
				<div class="panel-body text-center h-200">
					<i class="pe-7s-graph1 fa-4x"></i>

					<h1 class="m-xs">$1 206,90</h1>

					<h3 class="font-extra-bold no-margins text-success">All Income
					</h3>
					<small>Lorem ipsum dolor sit amet, consectetur adipiscing
						elit vestibulum.</small>
				</div>
				<div class="panel-footer">This is standard panel footer</div>
			</div>
		</div>
		<div class="col-lg-3">
			<div class="hpanel stats">
				<div class="panel-body h-200">
					<div class="stats-title pull-left">
						<h4>Users Activity</h4>
					</div>
					<div class="stats-icon pull-right">
						<i class="pe-7s-share fa-4x"></i>
					</div>
					<div class="m-t-xl">
						<h3 class="m-b-xs">210</h3>
						<span class="font-bold no-margins"> Social users </span>

						<div class="progress m-t-xs full progress-small">
							<div style="width: 55%" aria-valuemax="100" aria-valuemin="0"
								aria-valuenow="55" role="progressbar"
								class=" progress-bar progress-bar-success">
								<span class="sr-only">35% Complete (success)</span>
							</div>
						</div>

						<div class="row">
							<div class="col-xs-6">
								<small class="stats-label">Pages / Visit</small>
								<h4>7.80</h4>
							</div>

							<div class="col-xs-6">
								<small class="stats-label">% New Visits</small>
								<h4>76.43%</h4>
							</div>
						</div>
					</div>
				</div>
				<div class="panel-footer">This is standard panel footer</div>
			</div>
		</div>
		<div class="col-lg-3">
			<div class="hpanel stats">
				<div class="panel-body h-200">
					<div class="stats-title pull-left">
						<h4>Page Views</h4>
					</div>
					<div class="stats-icon pull-right">
						<i class="pe-7s-monitor fa-4x"></i>
					</div>
					<div class="m-t-xl">
						<h1 class="text-success">860k+</h1>
						<span class="font-bold no-margins"> Social users </span> <br /> <small>
							Lorem Ipsum is simply dummy text of the printing and <strong>typesetting
								industry</strong>. Lorem Ipsum has been.
						</small>
					</div>
				</div>
				<div class="panel-footer">This is standard panel footer</div>
			</div>
		</div>
		<div class="col-lg-3">
			<div class="hpanel stats">
				<div class="panel-body h-200">
					<div class="stats-title pull-left">
						<h4>Today income</h4>
					</div>
					<div class="stats-icon pull-right">
						<i class="pe-7s-cash fa-4x"></i>
					</div>
					<div class="clearfix"></div>
					<div class="flot-chart">
						<div class="flot-chart-content" id="flot-income-chart"></div>
					</div>
					<div class="m-t-xs">
						<div class="row">
							<div class="col-xs-5">
								<small class="stat-label">Today</small>
								<h4>$230,00</h4>
							</div>
							<div class="col-xs-7">
								<small class="stat-label">Last week</small>
								<h4>
									$7 980,60 <i class="fa fa-level-up text-success"></i>
								</h4>
							</div>
						</div>
					</div>
				</div>
				<div class="panel-footer">This is standard panel footer</div>
			</div>
		</div>
	</div> -->
<div class="row">
	<!-- 		<div class="col-lg-3">
			<div class="hpanel stats">
				<div class="panel-heading">
					<div class="panel-tools">
						<a class="showhide"><i class="fa fa-chevron-up"></i></a> <a
							class="closebox"><i class="fa fa-times"></i></a>
					</div>
					Last active
				</div>
				<div class="panel-body list">
					<div class="stats-title pull-left">
						<h4>Activity</h4>
					</div>
					<div class="stats-icon pull-right">
						<i class="pe-7s-science fa-4x"></i>
					</div>
					<div class="m-t-xl">
						<span class="font-bold no-margins"> Social users </span> <br /> <small>
							Lorem Ipsum is simply dummy text of the printing simply all dummy
							text. Lorem Ipsum is simply dummy text of the printing and
							typesetting industry. Lorem Ipsum has been. </small>
					</div>
					<div class="row m-t-md">
						<div class="col-lg-6">
							<h3 class="no-margins font-extra-bold text-success">300,102</h3>

							<div class="font-bold">
								98% <i class="fa fa-level-up text-success"></i>
							</div>
						</div>
						<div class="col-lg-6">
							<h3 class="no-margins font-extra-bold text-success">280,200</h3>

							<div class="font-bold">
								98% <i class="fa fa-level-up text-success"></i>
							</div>
						</div>
					</div>
					<div class="row m-t-md">
						<div class="col-lg-6">
							<h3 class="no-margins font-extra-bold ">120,108</h3>

							<div class="font-bold">
								38% <i class="fa fa-level-down"></i>
							</div>
						</div>
						<div class="col-lg-6">
							<h3 class="no-margins font-extra-bold ">450,600</h3>

							<div class="font-bold">
								28% <i class="fa fa-level-down"></i>
							</div>
						</div>

					</div>
				</div>
				<div class="panel-footer">This is standard panel footer</div>
			</div>
		</div> -->

	<!-- 		<div class="col-lg-3">
			<div class="hpanel">
				<div class="panel-heading">
					<div class="panel-tools">
						<a class="showhide"><i class="fa fa-chevron-up"></i></a> <a
							class="closebox"><i class="fa fa-times"></i></a>
					</div>
					Activity
				</div>
				<div class="panel-body list">

					<div class="pull-right">
						<a href="#" class="btn btn-xs btn-default">Today</a> <a href="#"
							class="btn btn-xs btn-default">Month</a>
					</div>
					<div class="panel-title">Last Activity</div>
					<small class="fo">This is simple example</small>
					<div class="list-item-container">
						<div class="list-item">
							<h3 class="no-margins font-extra-bold text-success">2,773</h3>
							<small>Tota Messages Sent</small>
							<div class="pull-right font-bold">
								98% <i class="fa fa-level-up text-success"></i>
							</div>
						</div>
						<div class="list-item">
							<h3 class="no-margins font-extra-bold text-color3">4,422</h3>
							<small>Last activity</small>
							<div class="pull-right font-bold">
								13% <i class="fa fa-level-down text-color3"></i>
							</div>
						</div>
						<div class="list-item">
							<h3 class="no-margins font-extra-bold text-color3">9,180</h3>
							<small>Monthly income</small>
							<div class="pull-right font-bold">
								22% <i class="fa fa-bolt text-color3"></i>
							</div>
						</div>
						<div class="list-item">
							<h3 class="no-margins font-extra-bold text-success">1,450</h3>
							<small>Tota Messages Sent</small>
							<div class="pull-right font-bold">
								44% <i class="fa fa-level-up text-success"></i>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div> -->
</div>


<link rel="stylesheet" href="vendor/c3/c3.min.css" />
<script src="vendor/d3/d3.min.js"></script>
<script src="vendor/c3/c3.min.js"></script>

<script>
	$(function() {
		/*
		var datereg = [];
		var add_time = [];
		var check_obj = document.getElementsByName('regdate[]');
		var check_add_time = document.getElementsByName('add_time[]');

		for (var i = 0; i <= check_obj.length - 1; i++) {
			datereg.push(check_obj.item(i).value);

		}

		for (var i = 0; i <= check_add_time.length - 1; i++) {
			console.log("for문 1차 통과");
			var data = check_add_time.item(i).value
			var hour = data.substring(0, 2);
			var minute = data.substring(3, 6);
			var hourtominute = hour * 60;
			var resultdata = Number(minute) + Number(hourtominute);
			console.log(hourtominute);
			console.log(minute);
			console.log(resultdata);
			add_time.push(resultdata);

		}

		console.log(datereg);
		console.log(add_time);

		 new Chartist.Bar('#ct-chart4', {
			labels : datereg,
			series : [ add_time ]
		}, {
			seriesBarDistance : 10,
			reverseData : true,
			horizontalBars : true,
			axisY : {
				offset : 70
			}
		}); */
		
		var deptavg = ${deptavg};
		var myavg = ${myavg};

		//console.log("dept : "+deptavg +"/ myavg : "+ myavg);
		
 		c3.generate({
			 bindto: '#avgCommuteChart',
			 
	         data:{
	             columns: [
	            	 ['평균 근무 시간',deptavg, myavg],
	            	 
	             ], 
	             colors:{
	            	'평균 근무 시간' : '#62cb31',
	             },
	             type: 'bar',
	             
	         },
	         bar:{
	        	width : 25	 
	         },
	         
	         axis : {
	        	 rotated : true,
	        	 x:{
	        		 type: 'category',
	        		 categories:['부서 평균','나의 평균'],
	        	 },
	         
	             y:{
	            	 tick:{
	            		 format : function(d){return d+'분';}
	            	 }
	             }
	         }
		}); 


	});
</script>