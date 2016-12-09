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
						<option value="금월 지급 예정 급여">금월 지급 예정 급여</option>
						<option value="전체">전체</option>
						<option value="연도별">연도별 조회</option>
						<option value="월별">월별 조회</option>
					</select> 
				</div>
				<div class="form-group">
					<div id="selectedYear">
						<select class="form-control" id="Yearly">
							<c:forEach begin="1960" end="2016" var="i" >
									<option value=${i}>${i}</option>
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
					<div class="table-responsive"  id="payResultDiv">
						<input type="hidden" name="${date}">
						<table cellpadding="1" cellspacing="1"
							class="table table-bordered table-condensed">
						 
				 <c:choose>
					<c:when test="${!empty list}">
					    <c:forEach var="list" items="${list}" varStatus="status">
							<tr>
							  <th style="background-color:#f9fafc">총근무시간</th>
								<td>${list.acc_commute_time}</td>
								<th style="background-color:#f9fafc">추가근무시간</th>
								<td>${list.acc_add_time}</td>
								<th style="background-color:#f9fafc">기본급여</th>
								<td>${list.basic_pay}</td>
								<th style="background-color:#f9fafc">추가근무수당</th>
								<td>${list.add_pay}</td>
								<th style="background-color:#f9fafc">상여금</th>
								<td>${list.bonus}</td>
								<th style="background-color:#f9fafc">총지급액</th>
								<td>${list.total_pay}</td>
							</tr>
						 
						 </c:forEach>
					</c:when>
					<c:otherwise>
					<tr>
						<td></td>
						<td colspan="11" style="text-align: center;">급여 목록이 없습니다.</td>
					</tr>
					</c:otherwise>
				</c:choose>
   						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>





