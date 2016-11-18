<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="normalheader transition animated fadeIn">
	<div class="hpanel">
		<div class="panel-body">
			<a class="small-header-action" href="">
				<div class="clip-header">
					<i class="fa fa-arrow-up"></i>
				</div>
			</a>
			<div class="row">
				<div class="form-group col-sm-4">
					<h2 class="font-light m-b-xs">급여 조회</h2>
				</div>
			</div>
			<form class="form-inline">

				<div class="form-group">
					<select id="salarysearch" class="form-control">
						<option value="">선택</option>
						<option value="연도별">연도별 조회</option>
						<option value="월별">월별 조회</option>
					</select>
				</div>
				<div class="form-group">
					<div id="selectedYear">
						<select class="form-control" id="Yearly">
							<c:forEach begin="1960" end="2016" var="i" >
									<option value=i>${i}</option>
							</c:forEach>
						</select>
						<button type="button" class="btn btn-sm btn-default" id="YearlySal">
							<span id="searchiconYear" class="fa fa-search"></span>&nbsp;&nbsp;검색
						</button>
					</div>
					<div id="selectedMonth">
						<input type="text" class="form-control" id="Monthly">
						<button type="button" class="btn btn-sm btn-default"
							id="MonthlySal">
							<span id="searchicon" class="fa fa-search"></span>
						</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>


<!--월별 급여 보기-->
<div class="normalheader transition animated fadeIn">
	<div class="row">
		<div class="col-sm-12">
			<div class="hpanel style=" text-align:center">
				<div class="panel-body">
					<h4>
						<i class="pe-7s-angle-right"></i><span class="font-icon-name"></span>&nbsp;&nbsp;&nbsp;급여정보
					</h4>
					 <hr style="border:1px solid gray; margin-bottom:0px">
					<div class="table-responsive">
						<table cellpadding="1" cellspacing="1"
							class="table table-bordered table-condensed">
							<tr style="background-color:#f9fafc">
								<th>지급기준일</th>
								<td>2016-11-25</td>
								<th>지급총액</th>
								<td>20.000.000</td>
								<th>공제총액</th>
								<td>1.000.000</td>
								<th>실지급액</th>
								<td>19.000.000</td>
							</tr>
   						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="content animate-panel">
	<div class="row">

		<div class="col-sm-12">
			<div class="hpanel">

				<div class="panel-body">
					<h4>
						<i class="pe-7s-angle-right"></i><span class="font-icon-name"></span>&nbsp;&nbsp;&nbsp;급여 상세 정보
					</h4>
					 <hr style="border:1px solid gray; margin-bottom:0px">
					<div class="table-responsive">
						<table cellpadding="1" cellspacing="1"
							class="table table-bordered table-condensed">
							<tr style="background-color:#f9fafc">
								<th colspan="1" style="text-align: center">No</th>
								<th colspan="2" style="text-align: center">지급항목</th>
								<th colspan="2" style="text-align: center">공제항목</th>
							</tr>
							<tr>
								<td>1</td>
								<td>기본급</td>
								<td>100</td>
								<td>소득세</td>
								<td>10</td>
							</tr>
							<tr>
								<td>2</td>
								<td>휴일근무수당</td>
								<td>100</td>
								<td>주민세</td>
								<td>10</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>



	</div>
</div>






