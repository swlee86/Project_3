<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 기지급 급여 목록 페이지 -->
<div class="normalheader transition animated fadeIn">
	<div class="hpanel">
		<div class="panel-body">
			<a class="small-header-action" href="">
				<div class="clip-header">
					<i class="fa fa-arrow-up"></i>
				</div>
			</a>

			<h2 class="font-light m-b-xs">
				<i onclick="location.href='adminSalaryView.do'"
					class="fa fa-chevron-circle-left"></i>&nbsp;&nbsp;급여 내역 조회
			</h2>
			<div class="row">
				<div class="col-md-offset-4 col-md-8">
					<form action="" class="form-inline ">
						<div class="col-md-6">
							<span class="form-control">기준 월</span> <input type="text"
								class="form-control" id="totalSalListdate">
							<button type="button" class="btn btn-sm btn-default"
								id="TotalSalbtn">
								<span id="searchicon" class="fa fa-search"></span>
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="content animate-panel">
	<div class="row">
		<c:forEach var="pay" items="${list}">
		<div class="col-md-3">
			<div class="hpanel">
				<div class="panel-body">
					<div class="stats-title pull-left">
						<span>${pay.give_date} 급여 지급액</span>
					</div>
					<div class="stats-icon pull-right">
						<i class="pe-7s-ticket fa-4x"></i>
					</div>
					<div class="m-t-xl">
						<h4 class="text-success text-center">총금액 : ${pay.total_pay} 만원</h4>
					</div>
					<div class="m-t-xl text-center">
						<input type="button" class="btn btn-success" onclick="detailPay(this);" id="${pay.give_date}" value="상세보기">
					</div>
				</div>
			</div>
		</div>
		</c:forEach>
	
	</div>

</div>
