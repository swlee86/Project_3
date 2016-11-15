<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
					<form class="form-inline">
						<label class="form-control">월근태 사원 정보</label> <input type="text"
							class="form-control" id="mydate2">
						<button type="button" class="btn btn-sm btn-default"
							id="addAttendace">
							<span id="searchicon" class="fa fa-search"></span>
						</button>
					</form>
				</div>
			</div>
		</div>

		
		<div class="col-lg-12">
			<div class="hpanel">
				<div class="panel-body">
					<div class="row">
						<div class="col-sm-8">
							<label>첫번쨰</label>
						</div>
						<div class="col-sm-2">
							<label>두번째</label>
						</div>
						<div class="col-sm-2">
							<label>세번째</label>
						</div>
					</div>
					<br />
					<div class="table-responsive">
						<table cellpadding="1" cellspacing="1"
							class="table table-bordered table-striped"">
							<tr>
								<th>사번</th>
								<th>성명</th>
								<th>직급</th>
								<th>부서</th>
							</tr>
							<tr>
								<td>001</td>
								<td>박성준</td>
								<td>관리자</td>
								<td>우리부서</td>
							</tr>

						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="vendor/jquery/dist/jquery.min.js"></script>
<script>
	//Month 캘린더 실행
	$(function() {
		var currentYear = (new Date()).getFullYear();
		var startYear = currentYear - 10;
		var options = {
			startYear : startYear,
			finalYear : currentYear,
			pattern : 'yy-mm',
			monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
					'9월', '10월', '11월', '12월' ]
		};
		//데이트피커
		$('#mydate2').monthpicker(options);
		$('#searchicon').click(function() {
			var date = $('#mydate2').val();
			alert("선택한 날짜 : " + date);

		});

	});
</script>