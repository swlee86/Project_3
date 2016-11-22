<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
.ui-datepicker-calendar {
	display: none;
}
</style>

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
						<li><a href="index.html">Dashboard</a></li>
						<li><span>App views</span></li>
						<li class="active"><span>월별 근태 현황</span></li>
					</ol>
				</div>
				<h2 class="font-light m-b-xs">월별 근태 현황</h2>
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
					<div class="row" style="background-color: #f3f3f3; height: 60px;">
					<br>
						<form class="form-inline" action="CommuteMonth.do" method="post">
							<div class="col-md-offset-1 col-md-1">
								<b>근무년월</b>
							</div>
							<div class=" col-md-4">
								<input type="text" class="form-control input-sm" id="select_date" name="select_date" value="${select_year}-${select_month}">
								<button type="submit" class="btn btn-sm btn-default" id="addCommute" style="background-color: #f07070; color:white" >
									<span id="searchicon" class="fa fa-search"></span>&nbsp;검색&nbsp;
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		
		<div class="col-lg-12">
			<div class="hpanel">
				<div class="panel-body">
			
					<br />
					<div class="table-responsive">
						
						<div class="table-responsive">
							<table cellpadding="1" cellspacing="1" class="table table-bordered table-hover"">
								<tr colspan="9" height="20px;"><h4>${select_year}년 ${select_month}월 근태현황</h4></tr>
								<tr style="background-color: #f6f6f6;">
									<th style="text-align: center;">사번</th>
									<th style="text-align: center;">성명</th>
									<th style="text-align: center;">일시</th>
									<th style="text-align: center;">출근시간</th>
									<th style="text-align: center;">퇴근시간</th>
									<th style="text-align: center;">근무시간</th>
									<th style="text-align: center;">추가근무시간</th>
									<th style="text-align: center;">총 누적 근무시간</th>
									<th style="text-align: center;">총 누적 추가근무시간</th>
								</tr>
								
								<c:forEach var="list" items="${CommuteList}">
									<tr>
										<td style="text-align: center;">${list.emp_no}</td>
										<td style="text-align: center;">${list.emp_name}</td>
										<td style="text-align: center;">${list.regdate}</td>
										<td style="text-align: center;">${list.in_time}</td>
										<td style="text-align: center;">${list.out_time}</td>
										<td style="text-align: center;">${list.commute_time}</td>
										<td style="text-align: center;">${list.add_time}</td>
										<td style="text-align: center;">${list.acc_commute_time}</td>
										<td style="text-align: center;">${list.acc_add_time}</td>
									</tr>
								</c:forEach>
							</table>
						</div>	
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="vendor/jquery/dist/jquery.min.js"></script>
