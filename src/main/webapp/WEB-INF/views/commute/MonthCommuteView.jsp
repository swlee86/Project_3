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
					<form class="form-inline" action="CommuteMonth.do" method="post">
						<label class="form-control">월별 근태 내역 검색하기</label> 
						<input type="text" class="form-control" id="select_date" name="select_date" value="${select_year}-${select_month}">
						<button type="submit" class="btn btn-sm btn-default" id="addCommute">
							<span id="searchicon" class="fa fa-search"></span>
						</button>
					</form>
				</div>
			</div>
		</div>

		
		<div class="col-lg-12">
			<div class="hpanel">
				<div class="panel-body">
			
					<br />
					<div class="table-responsive">
						<div>
							<label>${select_year}년 ${select_month}월 근태내역</label>
						</div>
						<table cellpadding="1" cellspacing="1" class="table table-bordered table-striped"">
							<tr>
								<th style="text-align: center;">사번</th>
								<th >성명</th>
								<th>일시</th>
								<th>출근시간</th>
								<th>퇴근시간</th>
								<th>근무시간</th>
								<th>추가근무시간</th>
								<th>총 누적 근무시간</th>
								<th>총 누적 추가근무시간</th>
							</tr>
							
							<c:forEach var="list" items="${CommuteList}">
								<tr>
									<td>${list.emp_no}</td>
									<td>${list.emp_name}</td>
									<td>${list.regdate}</td>
									<td>${list.in_time}</td>
									<td>${list.out_time}</td>
									<td>${list.commute_time}</td>
									<td>${list.add_time}</td>
									<td>${list.acc_commute_time}</td>
									<td>${list.acc_add_time}</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="vendor/jquery/dist/jquery.min.js"></script>
