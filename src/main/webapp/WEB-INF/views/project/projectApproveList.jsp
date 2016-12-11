<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<script>
$(function(){

	if($('#pj_approval_search').val() == 'step_no'){
		$('#pj_approval_search_keyword').empty();
		$('#pj_approval_search_keyword').append('<select class="form-control input-sm" name="q">'+
														'<option value="2">승인거부</option>'+
														'<option value="3">보류</option>'+
														'<option value="4">미승인</option>'+
													'</select>'
													);
	}
	$('#pj_approval_search').change(function(){
		console.log('select 체인지');
		console.log($('#pj_approval_search').val());
		if($('#pj_approval_search').val() == 'step_no'){
			$('#pj_approval_search_keyword').empty();
			$('#pj_approval_search_keyword').append('<select class="form-control input-sm" name="q">'+
															'<option value="2">승인거부</option>'+
															'<option value="3">보류</option>'+
															'<option value="4">미승인</option>'+
														'</select>'
														);
		}else{
			$('#pj_approval_search_keyword').empty();
			$('#pj_approval_search_keyword').append('<input type="text" class="form-control input-sm" name="q" />');
		}
	});
	


});

</script>
<!--프로젝트 승인처리 페이지-->
<div class="normalheader transition animated fadeIn">
	<div class="hpanel">
		<div class="panel-body">
			<a class="small-header-action" href="#">
				<div class="clip-header">
					<i class="fa fa-arrow-up"></i>
				</div>
			</a>
			<div id="hbreadcrumb" class="pull-right m-t-lg">
				<ol class="hbreadcrumb breadcrumb">
					<li><a href="index.do">홈</a></li>
					<li><span>프로젝트 관리</span></li>
					<li class="active"><span>프로젝트 대기함</span></li>
				</ol>
			</div>
			<h2 class="font-light m-b-xs">프로젝트 대기함</h2>
			<small>수신,송신 대기중인 프로젝트 리스트</small>
		</div>
	</div>
</div>

<div class="content animate-panel">
	<div class="row">

		<div class="col-lg-12">
		
			<div class="hpanel">
				<ul class="nav nav-tabs tabstyle">
					<li class="<c:if test="${app_char == '1'}">active</c:if>"><a data-toggle="tab" href="#tab-1" id="songsin">송신</a></li>
					<li class="<c:if test="${app_char == '2'}">active</c:if>"><a data-toggle="tab" href="#tab-2" id="susin">수신</a></li>
					
				</ul>  


				<div class="tab-content">
					<div id="tab-2" class="tab-pane <c:if test="${app_char == '2'}">active</c:if>">
						<div class="panel-body">
							<div class="row text-right">
								<div class="col-md-6"></div>
								<form action="projectApprove.do" class="form-inline ">
								<input type="hidden" name="app_char" value="2">
									<div class="col-md-2">
										<div class="form-group">
											<select class="form-control input-sm" name="f"
												id="pj_approval_search">
												<option value="emp_name" <c:if test="${field == 'emp_name'}">selected</c:if>>책임자</option>
												<option value="step_no" <c:if test="${field == 'step_no'}">selected</c:if>>승인단계</option>
												<option value="pj_title" <c:if test="${field == 'pj_title'}">selected</c:if>>제목</option>
											</select>
										</div>
									</div>

									<div class="col-md-4">
										<div class="form-group">
											<div class="input-group">
												<span id="pj_approval_search_keyword"> <input type="text" class="form-control input-sm" name="q" value="" />
												</span> 
												<span class="input-group-btn">
													<button class="btn btn-default input-sm" type="submit" style="color: #f05050">
														<span class="fa fa-search"></span>
													</button>
												</span>
											</div>
										</div>
									</div>
								</form>
							</div>


							<hr style="border: 1px solid gray; margin-bottom: 0px">
							<div class="table-responsive">
								<table id="example2" class="footable table-stripped  table table-hover" >
									<thead>
										<tr>
											<th>책임자</th>
											<th>프로젝트명</th>
											<th>기 &nbsp; 간</th>
											<th>승인단계</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${list}" var="p">
											<tr>
												<td>${p.emp_name}</td>
												<td><a
													href="project_approve_detailview.do?pj_no=${p.pj_no}&pj_emp_no=${p.emp_no}">${p.pj_title}</a></td>
												<td>${p.pj_start}&nbsp;&nbsp;~&nbsp; &nbsp;${p.pj_end}</td>
												<td><c:choose>
														<c:when test="${p.step_no == '2'}">
															<button class="btn btn-xs btn-danger" disabled>
																<b>승인거부</b>
															</button>
														</c:when>
														<c:when test="${p.step_no == '3'}">
															<button class="btn btn-xs btn-primary2" disabled>
																&nbsp;&nbsp;&nbsp;<b>보&nbsp;&nbsp;류</b>&nbsp;&nbsp;&nbsp;
															</button>
														</c:when>
														<c:when test="${p.step_no == '4'}">
															<button class="btn btn-xs btn-warning2" disabled>
																&nbsp;&nbsp;<b>미승인</b>&nbsp;&nbsp;
															</button>
														</c:when>
													</c:choose></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<div class="row" style="text-align: right; margin-right: 5px;">
								</div>
							</div>

						</div>


						<div class="panel-footer" style="text-align: center; background-color:#f7f9fa" >
							<div class="btn-group">
								<c:if test="${pg>1}">
									<a class="btn btn-default" href="projectApprove.do?tapno=${tapno}&pg=${pg-1}&f=${field}&q=${query}&group=${group}">
										&nbsp;<i class="fa fa-chevron-left"></i>
									</a>
								</c:if>

								<c:forEach var="i" begin="1" end="${pagecount}">
									<c:choose>
										<c:when test="${pg==i}">
											<button class="btn btn-default active" style="background-color: #DAD9FF">
												<b>${i}</b>
											</button>
										</c:when>
										<c:otherwise>
											<a class="btn btn-default" href="projectApprove.do?pg=${i}&f=${field}&q=${query}">
												${i} </a>
										</c:otherwise>
									</c:choose>
								</c:forEach>

								<c:if test="${pg < pagecount}">
									<a class="btn btn-default" href="projectApprove.do?pg=${pg+1}&f=${field}&q=${query}">
										&nbsp;<i class="fa fa-chevron-right"></i>
									</a>
								</c:if>
							</div>
						</div>
					</div>

					
					
					
					
					
					<!-- 송신 -->
					<div id="tab-1" class="tab-pane <c:if test="${app_char == '1'}">active</c:if>">
						<div class="panel-body">
					<div class="row text-right">
								<div class="col-md-6"></div>
								<form action="projectApprove.do" class="form-inline ">
									<input type="hidden" name="app_char" value="1">
									<div class="col-md-2">
										<div class="form-group">
											<select class="form-control input-sm" name="f2" >
												<!-- <option value="emp_name" >수신자</option> -->
												<option value="pj_title">제목</option>
											</select>
										</div>
									</div>

									<div class="col-md-4">
										<div class="form-group">
											<div class="input-group">
												<span id="pj_approval_search_keyword"> <input type="text" class="form-control input-sm" name="q2" value="" />
												</span> 
												<span class="input-group-btn">
													<button class="btn btn-default input-sm" type="submit" style="color: #f05050">
														<span class="fa fa-search"></span>
													</button>
												</span>
											</div>
										</div>
									</div>
								</form>
							</div> 
							
						<hr style="border: 1px solid gray; margin-bottom: 0px">

							<table id="example1" class="footable table table-stripped toggle-arrow-tiny" data-page-size="8" data-filter=#filter>
								<thead>
									<tr>
										<th data-toggle="true">수신자</th>
										<th>프로젝트명</th>
										<th>기 간</th>
										<th>승인단계</th>
										<th  data-hide="all">제목</th>
										<th data-hide="all">내용</th>
									</tr>
								</thead>
								<tbody>

									<c:forEach items="${sendlist}" var="send">
										<tr>
											<td>${send.rec_emp_name}</td>
											<td>${send.pj_title}</td>
											<td>${send.pj_start}&nbsp;&nbsp;~&nbsp;&nbsp;${send.pj_end}</td>
											<td><c:choose>
													<c:when test="${send.step_no == '2'}">
														<button class="btn btn-xs btn-danger" disabled>
															<b>승인거부</b>
														</button>
													</c:when>
													<c:when test="${send.step_no == '3'}">
														<button class="btn btn-xs btn-primary2" disabled>
															&nbsp;&nbsp;&nbsp;<b>보&nbsp;&nbsp;류</b>&nbsp;&nbsp;&nbsp;
														</button>
													</c:when>
													<c:when test="${send.step_no == '4'}">
														<button class="btn btn-xs btn-warning2" disabled>
															&nbsp;&nbsp;<b>미승인</b>&nbsp;&nbsp;
														</button>
													</c:when>
												</c:choose></td>
											<td><span class="pie">${send.pj_title}</span></td>
											<td>${send.pj_content}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>















							<%-- 								<table id="example1" class="footable table-stripped toggle-arrow-tiny table table-hover" data-page-size="8" data-filter=#filter>
									<thead>
										<tr>
											<th data-toggle="true">수신자</th>
											<th>프로젝트명</th>
											<th>기 &nbsp; 간</th>
											<th>승인단계</th>
											<th data-hide="all">제 목</th>
                            				<th data-hide="all">내 용</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${sendlist}" var="p">
											<tr>
												<td>${p.rec_emp_name}</td>
												<td>${p.pj_title}</td>
												<td>${p.pj_start}&nbsp;&nbsp;~&nbsp; &nbsp;${p.pj_end}</td>
												<td><c:choose>
														<c:when test="${p.step_no == '2'}">
															<button class="btn btn-xs btn-danger" disabled>
																<b>승인거부</b>
															</button>
														</c:when>
														<c:when test="${p.step_no == '3'}">
															<button class="btn btn-xs btn-primary2" disabled>
																&nbsp;&nbsp;&nbsp;<b>보&nbsp;&nbsp;류</b>&nbsp;&nbsp;&nbsp;
															</button>
														</c:when>
														<c:when test="${p.step_no == '4'}">
															<button class="btn btn-xs btn-warning2" disabled>
																&nbsp;&nbsp;<b>미승인</b>&nbsp;&nbsp;
															</button>
														</c:when>
													</c:choose>
												</td>
												<td><span class="pie">6,9</span></td>
                            					<td>40%</td>
											</tr>
										</c:forEach>
									</tbody>
								</table> --%>
						

						</div>

						<div class="panel-footer" style="text-align: center; background-color:#f7f9fa" >
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

