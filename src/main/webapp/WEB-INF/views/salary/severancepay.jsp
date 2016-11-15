<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--근태 관리 메인 페이지-->
<div class="normalheader transition animated fadeIn">
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
					<li class="active"><span>Calendar</span></li>
				</ol>
			</div>
			<h2 class="font-light m-b-xs">퇴직금 계산</h2>
		</div>
	</div>
</div>
<div class="normalheader transition animated fadeIn">
	<div class="row">
		<div class="col-lg-12">
			<div class="hpanel">
				<div class="panel-body">
					
					<form class="form-inline">
						<div class="form-group col-md-4">
							<select id="selected" class="form-control">
								<option value="">선택</option>
								<option value="퇴직정산" >퇴직정산</option>
								<option value="중도정산">중도정산</option>
							</select>
						</div>
						<div class="form-group col-md-8">
							<label class="form-control col-md-4">기준일 선택</label>
							<div class="input-group date">
								<input type="text" class="form-control" size="20px" id="selectDate"> 
								<span class="input-group-addon">
								  <i class="glyphicon glyphicon-calendar"></i></span>
							</div>
							<input type="button" class="btn btn-primary" id="sevSearchbtn" value="조회하기">
						</div>
					</form>
				</div>
			</div>
		</div>
		
		<div class="col-lg-12">
			<div class="hpanel">
				<div class="panel-body">
					<h3>퇴직금 소득 계산</h3>
					<div id="sevResult"></div>
					<div class="table-responsive">
						<table cellpadding="1" cellspacing="1" class="table table-bordered table-striped">
						    <tr>
							    <td>정산기간</td>	  
								<td>입사일-퇴사일</td>
							</tr>
						    <tr>
							    <td>퇴직연월</td>
								<td>5년6개월</td>
							</tr>
							<tr>
							    <td>퇴직금</td>
								<td>10.000.000</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>