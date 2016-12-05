<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--기지급 급여 특정 월 상세 페이지  -->
<div class="normalheader transition animated fadeIn">
	<div class="hpanel">
		<div class="panel-body">
			<a class="small-header-action" href="">
				<div class="clip-header">
					<i class="fa fa-arrow-up"></i>
				</div>
			</a>

			<div id="hbreadcrumb" class="pull-right m-t-lg">
				<div class="p-sm">
					<span class="vertical-date pull-right"> Saturday <br /> <small>12:17:43
							PM</small>
					</span>
				</div>
			</div>
			<h2 class="font-light m-b-xs">
			<i onclick="location.href='adminSalaryView.do'"
					class="fa fa-chevron-circle-left"></i>&nbsp;&nbsp;급여 내역 상세 조회</h2>
		</div>
	</div>
</div>

<div class="content animate-panel">
	<div class="row">

		<div class="col-lg-12">
			<div class="hpanel">
				<div class="panel-heading">
					급여 지급 인원 : <font color="#ff757f">${count}</font> 명
				</div>
				<div class="panel-body">

					<br>
					<hr style="border: 1px solid gray; margin-bottom: 0px">
					<div class="table-responsive">
						<table cellpadding="1" cellspacing="1"
							class="table table-hover table-bordered table-condensed">
							<thead>
								<tr style="background-color: #f9fafc">
									<th style="text-align: center;">NO</th>
									<th style="text-align: center;">사 번</th>
									<th style="text-align: center;">이 름</th>
									<th style="text-align: center;">지점</th>
									<th style="text-align: center;">부서</th>
									<th style="text-align: center;">하위 부서</th>
									<th style="text-align: center;">직위</th>
									<th style="text-align: center;">총 근무시간</th>
									<th style="text-align: center;">총 추가 근무시간</th>
									<th style="text-align: center;">실지급액</th>
									<th style="text-align: center;">지급일자</th>
								</tr>
							</thead>


							<tbody>

								<c:choose>
									<c:when test="${!empty paylist}">
										<c:forEach var="list" items="${paylist}" varStatus="status">
											<tr>
												<td style="text-align: center;">${status.count}</td>
												<td style="text-align: center;">${list.emp_no}</td>
												<td style="text-align: center;">${list.emp_name}</td>
												<td style="text-align: center;">${list.branch_name}</td>
												<td style="text-align: center;">${list.dept_name}</td>
												<td style="text-align: center;">${list.low_dept_name}</td>
												<td style="text-align: center;">${list.position_name}</td>
												<td style="text-align: center;">${list.acc_commute_time}</td>
												<td style="text-align: center;">${list.acc_add_time}</td>
												<td style="text-align: center;">${list.total_pay}</td>
												<td style="text-align: center;">${list.give_date}</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="11" style="text-align: center;">
												<h4>데이터가 없습니다.</h4>
											</td>
										</tr>	
									</c:otherwise>
								</c:choose>

							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
