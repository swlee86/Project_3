<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--월별 근태 보기-->
<div class="normalheader transition animated fadeIn">
	<div class="row">
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
						<li><span>근태관리</span></li>
						<li class="active"><span>(관리자) 근태마감</span></li>
					</ol>
				</div>
				<h2 class="font-light m-b-xs">근태 마감</h2>
			</div>
		</div>
	</div>
</div>

<!--월별 근태 보기-->
<div class="normalheader transition animated fadeIn">
	<div class="row">
		<div class="col-lg-12">
			<div class="hpanel">
				<div class="panel-body">
					<h4>
						<i class="pe-7s-angle-right"></i><span class="font-icon-name"></span>&nbsp;&nbsp;&nbsp;${date} 근태정보
					</h4>
					 <hr style="border:1px solid gray; margin-bottom:0px">
					<div class="table-responsive">
						<form action="commuteAdminEnd.do" method="POST" id="commuteForm">
						<div class="table-responsive">
							<table cellpadding="1" cellspacing="1"
								class="table table-hover table-bordered table-condensed">
								<thead>
									<tr style="background-color: #f9fafc">
										<th style="text-align: center;">
										<input type="checkbox" id="allCheck" 
											name="Allcheckbox" style="width:20px; height:20px;">
										</th>
										<th style="text-align: center;">N O</th>
										<th style="text-align: center;">사 번</th>
										<th style="text-align: center;">이 름</th>
										<th style="text-align: center;">지점</th>
										<th style="text-align: center;">부서</th>
										<th style="text-align: center;">하위 부서</th>
										<th style="text-align: center;">직위</th>
										<th style="text-align: center;">총 근무시간</th>
										<th style="text-align: center;">총 추가 근무시간</th>
										<th style="text-align: center;">확정 여부</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${!empty Commutelist}">
										<%-- <c:when test="${Commutelist != null || Commutelist != ''}"> --%>
											<c:forEach var="list" items="${Commutelist}" varStatus="status">
												<tr>
													<td style="text-align: center;"><input type="checkbox" 
														name="checkbox" value="${list.commute_no}" style="width:20px; height:20px;">
													</td>
													<td style="text-align: center;">${status.count}</td>
													<td style="text-align: center;">${list.emp_no}</td>
													<td style="text-align: center;">${list.emp_name}</td>
													<td style="text-align: center;">${list.branch_name}</td>
													<td style="text-align: center;">${list.dept_name}</td>
													<td style="text-align: center;">${list.low_dept_name}</td>
													<td style="text-align: center;">${list.position_name}</td>
													<td style="text-align: center;">${list.acc_commute_time}</td>
													<td style="text-align: center;">${list.acc_add_time}</td>

													<c:if test="${list.mgr_check ==1}">
														<td style="text-align: center;"><span
															class="form-control">확정</span></td>
													</c:if>
													<c:if test="${list.mgr_check ==0}">
														<td style="text-align: center;"><span
															class="form-control">미확정</span></td>
													</c:if>

												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
										<tr>
											<td colspan="10" style="text-align: center;">근태 목록이
												없습니다.</td>
										</tr>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</div>
						<input type="hidden" id="payDate">
						<input type="hidden" id="emp_no" name="emp_no"> 
						<input type="hidden" id="hiddenCommute" name="hiddenCommute">
						<div class="col-md-offset-11 col-md-1">
							<input type="submit" class="btn btn-success" value="마감하기">
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<br />
<br />
