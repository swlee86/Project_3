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
		<div class="col-lg-6">
			<div class="hpanel">
				<div class="panel-body">
					<h3>정산 조건 선택</h3>
					 <hr style="border:1px solid gray; margin-bottom:0px">
					 </br>
					<form class="form-inline">
						    <label class="form-control">정산 구분</label>
							<select id="selected" class="form-control">
								<option value="">선택</option>
								<option value="퇴직정산" >퇴직정산</option>
								<option value="중도정산">중도정산</option>
							</select>
						   </br>
						
							<label class="form-control">기준일 선택</label>
							<div class="input-group date">
								<input type="text" class="form-control" id="selectDate"> 
								<span class="input-group-addon">
								  <i class="glyphicon glyphicon-calendar"></i></span>
							</div>
							</br>
							<div class="col-lg-10"></div>
							<input type="button" class="btn btn-primary" id="sevSearchbtn" value="조회하기">
						
					</form>
				</div>
			</div>
		</div>
		
		<div class="col-lg-6">
			<div class="hpanel">
				<div class="panel-body">
					<h3>퇴직금 소득 계산</h3>
					
					 <hr style="border:1px solid gray; margin-bottom:0px">
                <div class="table-responsive">
           
                <table cellpadding="1" cellspacing="1" class="table table-hover table-bordered table-condensed" >
                       <tr style="background-color:#f9fafc">
                         <th style="width:15%; style="text-align:center;">정산일자</th>
                         <td><span id="jung"></span></td>
                         </tr>
                         <tr>
                         <th style="width:15%; style="text-align:center;">총근무일수</th>
                         <td><span id="total"></span></td>
                         </tr>
                         <tr>
                         <th style="width:15%; style="text-align:center;">퇴직금</th>
                         <td><span id="severance_pay"></span></td>
                         </tr>
                         
				</table>
						
					</div>
				</div>
			</div>
		</div>	
	</div>
	<br><br>
	<div class="panel-footer">

			<p>
				<i class="pe-7s-attention"></i><span class="font-icon-name"></span>
				퇴직금 = 1일 평균임금  * 30(일) * (재직일수/365)
			</p>
			<p>
				<i class="pe-7s-attention"></i><span class="font-icon-name"></span>
				1일 평균임금 = 퇴직일 이전 3개월 간에 지급받은 임금 총액/퇴직일 이전 3개월 간의 총 일 수
			</p>
		</div>
</div>

	