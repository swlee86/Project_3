<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
					<div class="row" style="background-color: #f3f3f3; height: 60px;">
						<br>
						<form class="form-inline" action="" method="post">
							<div class="col-md-offset-1 col-md-1">
								<b>근무년월</b>
							</div>
							<div class=" col-md-4">
								<input type="text" class="form-control input-sm"
									id="select_date" name="select_date"
									value="${select_year} ${select_month}">
								<button type="submit" class="btn btn-sm btn-default"
									id="addCommute" style="background-color: #f07070; color: white">
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
							<table cellpadding="1" cellspacing="1"
								class="table table-hover table-bordered table-condensed">
								<thead>
									<tr style="background-color: #f9fafc">
										<th style="text-align: center;"></th>
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
									<tr>
										<td style="text-align: center;">
											<input type="checkbox" class="i-checks" name="checkbox">
										</td>
										<td style="text-align: center;">1</td>
										<td style="text-align: center;">1</td>
										<td style="text-align: center;">1</td>
										<td style="text-align: center;">1</td>
										<td style="text-align: center;">1</td>
										<td style="text-align: center;">1</td>
										<td style="text-align: center;">1</td>
										<td style="text-align: center;">1</td>
										<td style="text-align: center;">1</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="col-md-offset-11 col-md-1">
									<input type="button" class="btn btn-success" value="마감하기">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>