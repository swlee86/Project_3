<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="systemdate" />
<!--  
	작성자	: 이상원
	작성일	: 2018-04-25
	목 적  	: 메인 화면 프로젝트,전자결재, 업무 탭별 리스트

-->
<div class="content animate-panel">
	<div class="row">
		<div class="col-lg-12 text-center m-t-md">
			<h3><span style="font-family:Arial ">Welcome to <b>ToInfra</b></span></h3>
			<p>
				스타트업 및 중소기업의 <strong>프로젝트 관리, 인사, 일정 관리</strong>를 위한 그 모든 프로그램
				
			</p>
		</div>
	</div>
	
	<div class="row">&nbsp;</div>
	
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
							<div class="table-responsive project-list ">
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
							<div class="pull-right">
								<span><small><a href="project_list.do">[프로젝트 리스트 바로가기]</a></small></span>
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
														</c:choose>
													</a>
												</td>
												<td></td>
												<td style="text-align:center">${approve_pjlist.emp_name }</td>
												<td style="text-align:center">
													<small><i class="fa fa-clock-o"></i> </small>  
													${fn:substring(approve_pjlist.pj_start,5, fn:length(approve_pjlist.pj_start))} ~ ${fn:substring(approve_pjlist.pj_end,5, fn:length(approve_pjlist.pj_end))} 
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
							<div class="pull-right">
								<span><small><a href="projectApprove.do?app_char=2">[프로젝트 승인 대기함 바로가기]</a></small></span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	
	
		<div class="col-lg-6">
			<div class="hpanel">
				<ul class="nav nav-tabs">
					<li class="active"><a data-toggle="tab" href="#draft-1"><b>미승인 대외발신공문</b></a></li>
					<li class=""><a data-toggle="tab" href="#draft-2"><b>미승인 협조문</b></a></li>
					<li class=""><a data-toggle="tab" href="#draft-3"><b>미승인 휴가신청서</b></a></li>
					<li class=""><a data-toggle="tab" href="#draft-4"><b>참조된 대외발신공문</b></a></li>
					<li class=""><a data-toggle="tab" href="#draft-5"><b>참조된 협조문</b></a></li>
					<li class=""><a data-toggle="tab" href="#draft-6"><b>참조된 휴가신청서</b></a></li>
				</ul>
				<div class="tab-content">

					<div id="draft-1" class="tab-pane active">	
						<div class="panel-body list">
							<div class=" project-list">
								<table class="table table-striped table-condensed ">
									<thead>
										<tr>
											<th>기안 제목</th>
											<th style="text-align:center">수신처</th>
											<th style="text-align:center">기안자</th>
											<th style="text-align:center">승인결과</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="office" items="${officelist}" > 
											<tr>
												<td><a href="office_detail.do?draft_no=${ office.draft_no }">${ office.draft_title }</a><br />
													<small><i class="fa fa-clock-o"></i>.&nbsp;
													${office.draft_date}</small>
												</td>



												<td style="text-align:center"><small><c:if test="${fn:length(office.rec_addr) > 15}"></c:if>${fn:substring(office.rec_addr,0,15)} ...</small></td>
												<td style="text-align:center">
												 ${ office.emp_name }  <br><small>${ office.emp_no }</small>
												</td>
												<td style="text-align:center">
													<c:choose>
														<c:when test="${ office.step_no == '1' }">
															<button class="btn btn-info btn-circle"
																style="width: 30px; height: 30px;"><small><b>승 인</b></small></button>
														</c:when>
														<c:when test="${ office.step_no == '2' }">
															<button class="btn btn-danger btn-circle"
																style="width: 30px; height: 30px;"><small><b>반 려</b></small></button>
														</c:when>
														<c:when test="${ office.step_no == '3' }">
															<button class="btn btn-primary2 btn-circle"
																style="width: 30px; height: 30px;"><small><b>보 류</b></small></button>
														</c:when>
														<c:when test="${ office.step_no == '4' }">
															<button class="btn btn-warning2 btn-circle"
																style="width: 30px; height: 30px;"><small><b>미승인</b></small></button>
														</c:when>
													</c:choose>


												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div class="pull-right">
								<span><small><a href="draft_rec.do">[전자결재 리스트 바로가기]</a></small></span>
							</div>	
						</div>				
					</div>
				
					<div id="draft-2" class="tab-pane "> 
						<div class="panel-body list">	
								<div class=" project-list">
									<table class="table table-striped table-condensed">
										<thead>
											<tr>
												<th>기안 제목</th>
												<th style="text-align:center">수신 부서</th>
												<th style="text-align:center">기안자</th>
												<th style="text-align:center">승인 결과</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="cooper" items="${cooperationlist}">
												<tr>
													
												<td><a href="cooperation_detail.do?draft_no=${cooper.draft_no}">${cooper.draft_title }</a><br />
													<small><i class="fa fa-clock-o"></i>.&nbsp;
														${cooper.draft_date}</small>
													</td>
													
													<td style="text-align:center">${cooper.low_dept_name} <small>${ cooper.branch_name } ${ cooper.dept_name }</small></td>
													<td style="text-align:center">${cooper.emp_name}<br><small>${ cooper.emp_no }</small></td>
													<td style="text-align:center"><c:choose>
														<c:when test="${ cooper.step_no == '1' }">
															<button class="btn btn-info btn-circle"
																style="width: 30px; height: 30px;"><small><b>승 인</b></small></button>
														</c:when>
														<c:when test="${ cooper.step_no == '2' }">
															<button class="btn btn-danger btn-circle"
																style="width: 30px; height: 30px;"><small><b>반 려</b></small></button>
														</c:when>
														<c:when test="${ cooper.step_no == '3' }">
															<button class="btn btn-primary2 btn-circle"
																style="width: 30px; height: 30px;"><small><b>보 류</b></small></button>
														</c:when>
														<c:when test="${ cooper.step_no == '4' }">
															<button class="btn btn-warning2 btn-circle"
																style="width: 30px; height: 30px;"><small><b>미승인</b></small></button>
														</c:when>
													</c:choose></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							<div class="pull-right">
								<span><small><a href="draft_rec.do">[전자결재 리스트 바로가기]</a></small></span>
							</div>
						</div>
					</div>
					
					
					
					
					<div id="draft-3" class="tab-pane "> 
						<div class="panel-body list">	
								<div class=" project-list">
									<table class="table table-striped table-condensed">
										<thead>
											<tr>
												<th >기안 제목</th>
												<th style="text-align:center">휴가기간</th>
												<th style="text-align:center">기안자</th>
												<th style="text-align:center">승인 결과</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="br" items="${breaklist}">
												<tr>
													
													<td  ><a href="break_detail.do?draft_no=${ br.draft_no }">${ br.draft_title }</a><br />
														<small><i class="fa fa-clock-o"></i>.&nbsp;
															${br.draft_date }</small>
													</td>
														
													<td style="text-align:center">${ br.break_cg_name } <small>${ br.break_term } 일</small></td>
													<td style="text-align:center"> ${ br.emp_name }<br><small>${ br.emp_no }</small></td>
													<td style="text-align:center">
														<c:choose>
														<c:when test="${ br.step_no == '1' }">
															<button class="btn btn-info btn-circle"
																style="width: 30px; height: 30px;"><small><b>승 인</b></small></button>
														</c:when>
														<c:when test="${ br.step_no == '2' }">
															<button class="btn btn-danger btn-circle"
																style="width: 30px; height: 30px;"><small><b>반 려</b></small></button>
														</c:when>
														<c:when test="${ br.step_no == '3' }">
															<button class="btn btn-primary2 btn-circle"
																style="width: 30px; height: 30px;"><small><b>보 류</b></small></button>
														</c:when>
														<c:when test="${ br.step_no == '4' }">
															<button class="btn btn-warning2 btn-circle"
																style="width: 30px; height: 30px;"><small><b>미승인</b></small></button>
														</c:when>
													</c:choose></td>
														
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							<div class="pull-right">
								<span><small><a href="draft_rec.do">[전자결재 리스트 바로가기]</a></small></span>
							</div>
						</div>
					</div>
					
					
					
					
					
					<div id="draft-4" class="tab-pane">	
						<div class="panel-body list">
							<div class=" project-list">
								<table class="table table-striped table-condensed ">
									<thead>
										<tr>
											<th>기안 제목</th>
											<th style="text-align:center">수신처</th>
											<th style="text-align:center">기안자</th>
											<th style="text-align:center">승인결과</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="office" items="${officelist}" > 
											<tr>
												<td><a href="office_detail.do?draft_no=${ office.draft_no }">${ office.draft_title }</a><br />
													<small><i class="fa fa-clock-o"></i>.&nbsp;
													${office.draft_date}</small>
												</td>



												<td style="text-align:center"><small><c:if test="${fn:length(office.rec_addr) > 15}"></c:if>${fn:substring(office.rec_addr,0,15)} ...</small></td>
												<td style="text-align:center">
												 ${ office.emp_name }  <br><small>${ office.emp_no }</small>
												</td>
												<td style="text-align:center">
													<c:choose>
														<c:when test="${ office.step_no == '1' }">
															<button class="btn btn-info btn-circle"
																style="width: 30px; height: 30px;"><small><b>승 인</b></small></button>
														</c:when>
														<c:when test="${ office.step_no == '2' }">
															<button class="btn btn-danger btn-circle"
																style="width: 30px; height: 30px;"><small><b>반 려</b></small></button>
														</c:when>
														<c:when test="${ office.step_no == '3' }">
															<button class="btn btn-primary2 btn-circle"
																style="width: 30px; height: 30px;"><small><b>보 류</b></small></button>
														</c:when>
														<c:when test="${ office.step_no == '4' }">
															<button class="btn btn-warning2 btn-circle"
																style="width: 30px; height: 30px;"><small><b>미승인</b></small></button>
														</c:when>
													</c:choose>


												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div class="pull-right">
								<span><small><a href="draft_rec.do">[전자결재 리스트 바로가기]</a></small></span>
							</div>	
						</div>				
					</div>
				
					<div id="draft-5" class="tab-pane "> 
						<div class="panel-body list">	
								<div class=" project-list">
									<table class="table table-striped table-condensed">
										<thead>
											<tr>
												<th>기안 제목</th>
												<th style="text-align:center">수신 부서</th>
												<th style="text-align:center">기안자</th>
												<th style="text-align:center">승인 결과</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="cooper_cham" items="${cooperationlist_chaam}">
												<tr>
													
												<td><a href="cooperation_detail.do?draft_no=${cooper_cham.draft_no}">${cooper_cham.draft_title }</a><br />
													<small><i class="fa fa-clock-o"></i>.&nbsp;
														${cooper_cham.draft_date}</small>
													</td>
													
													<td style="text-align:center">${cooper_cham.low_dept_name} <small>${ cooper_cham.branch_name } ${ cooper_cham.dept_name }</small></td>
													<td style="text-align:center">${cooper_cham.emp_name}<br><small>${ cooper_cham.emp_no }</small></td>
													<td style="text-align:center"><c:choose>
														<c:when test="${ cooper_cham.step_no == '1' }">
															<button class="btn btn-info btn-circle"
																style="width: 30px; height: 30px;"><small><b>승 인</b></small></button>
														</c:when>
														<c:when test="${ cooper_cham.step_no == '2' }">
															<button class="btn btn-danger btn-circle"
																style="width: 30px; height: 30px;"><small><b>반 려</b></small></button>
														</c:when>
														<c:when test="${ cooper_cham.step_no == '3' }">
															<button class="btn btn-primary2 btn-circle"
																style="width: 30px; height: 30px;"><small><b>보 류</b></small></button>
														</c:when>
														<c:when test="${ cooper_cham.step_no == '4' }">
															<button class="btn btn-warning2 btn-circle"
																style="width: 30px; height: 30px;"><small><b>미승인</b></small></button>
														</c:when>
													</c:choose></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							<div class="pull-right">
								<span><small><a href="draft_rec.do">[전자결재 리스트 바로가기]</a></small></span>
							</div>
						</div>
					</div>
					
					
					
					
					<div id="draft-6" class="tab-pane "> 
						<div class="panel-body list">	
								<div class=" project-list">
									<table class="table table-striped table-condensed">
										<thead>
											<tr>
												<th >기안 제목</th>
												<th style="text-align:center">휴가기간</th>
												<th style="text-align:center">기안자</th>
												<th style="text-align:center">승인 결과</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="br" items="${breaklist}">
												<tr>
													
													<td  ><a href="break_detail.do?draft_no=${ br.draft_no }">${ br.draft_title }</a><br />
														<small><i class="fa fa-clock-o"></i>.&nbsp;
															${br.draft_date }</small>
													</td>
														
													<td style="text-align:center">${ br.break_cg_name } <small>${ br.break_term } 일</small></td>
													<td style="text-align:center"> ${ br.emp_name }<br><small>${ br.emp_no }</small></td>
													<td style="text-align:center">
														<c:choose>
														<c:when test="${ br.step_no == '1' }">
															<button class="btn btn-info btn-circle"
																style="width: 30px; height: 30px;"><small><b>승 인</b></small></button>
														</c:when>
														<c:when test="${ br.step_no == '2' }">
															<button class="btn btn-danger btn-circle"
																style="width: 30px; height: 30px;"><small><b>반 려</b></small></button>
														</c:when>
														<c:when test="${ br.step_no == '3' }">
															<button class="btn btn-primary2 btn-circle"
																style="width: 30px; height: 30px;"><small><b>보 류</b></small></button>
														</c:when>
														<c:when test="${ br.step_no == '4' }">
															<button class="btn btn-warning2 btn-circle"
																style="width: 30px; height: 30px;"><small><b>미승인</b></small></button>
														</c:when>
													</c:choose></td>
														
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							<div class="pull-right">
								<span><small><a href="draft_rec.do">[전자결재 리스트 바로가기]</a></small></span>
							</div>
						</div>
					</div>
					
					
					
					
					
					
					
					
					
				</div>
			</div>
		</div>
	</div>



	<div class="row" > 
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
				
					<div id="task-2" class="tab-pane ">
						<div class="panel-body list">	
								<div class="table-responsive project-list">
									<table class="table table-striped table-condensed">
										<thead>
											<tr>
												<th>업무명</th>
												<th style="text-align:center">마감일</th>
												<th style="text-align:center">요청자명</th>
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
				</div>
			</div>
		</div>
		
	</div>
	<br/><br/>
	
	<c:forEach var="commutelist" items="${commutelist}">
		<input type="hidden" id="regdate" name="regdate[]"
			value="${commutelist.regdate}">
		<input type="hidden" id="add_time" name="add_time[]"
			value="${commutelist.add_time}">
	</c:forEach>

</div>



<link rel="stylesheet" href="vendor/c3/c3.min.css" />
<script src="vendor/d3/d3.min.js"></script>
<script src="vendor/c3/c3.min.js"></script>

<script>
	$(function() {	
		var deptavg = ${deptavg};
		var myavg = ${myavg};
	
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