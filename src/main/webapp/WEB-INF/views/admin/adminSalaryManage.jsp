<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--급여 기본 정보 관리 페이지  -->
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
			<h2 class="font-light m-b-xs"> <i onclick="location.href='adminSalaryView.do'" class="fa fa-chevron-circle-left"></i>&nbsp;&nbsp;급여 기본 정보 관리</h2>
		</div>
	</div>
</div>


<div class="content animate-panel">
<input type="hidden" id="dayJudgement" value=${result}>
		<div class="hpanel">
			<div class="panel-body">
				
				<h4><i class="pe-7s-angle-right"></i><span class="font-icon-name"></span>&nbsp;&nbsp;&nbsp;
					현재 급여일 : <span id="dbAddDate">${pay_date}일</span><input type="button" id="showBtn" class="col-md-offset-1 btn btn-default" value="설정하기">	</h4>
				<hr/>			
				
				<div id="settingAddDate">	
				<h4>
					<i class="pe-7s-angle-right"></i><span class="font-icon-name"></span>&nbsp;&nbsp;&nbsp;급여일
					설정
				</h4>
				<div class="col-md-1">
					<span class="form-control">지급일</span>
				</div>
				<div class="col-md-4">
					<select class="form-control" id="daySelect">
						<c:forEach begin="1" end="31" var="i">
							<option value=${i}>${i}</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<button type="button" class="btn btn-md btn-default" id="savepayDateBtn">
						<span class="fa fa-search"></span>&nbsp;&nbsp;저장
					</button>
				</div>
				
				</div>
				
				
		  </div>
	 </div>
</div>


<div class="content animate-panel">
	<div class="row">

		<div class="col-lg-12">
			<div class="hpanel">
				<div class="panel-heading">
					전체 사원: <font color="#ff757f">100</font> 명
				</div>
				<div class="panel-body">
					<div class="row text-right">
						<div class="col-md-7"></div>
						<form action="" class="form-inline ">
							<div class="col-md-2">
								<div class="form-group">
									<select class="form-control input-sm">
										<option>지점</option>
										<option>부서</option>
										<option>하위부서</option>
										<option>사번</option>
										<option>이름</option>
									</select>
								</div>
							</div>

							<div class="col-md-3">
								<div class="form-group">
									<div class="input-group">
										<input type="text" class="form-control input-sm" name="salaryManageinput" /> 
										<span class="input-group-btn">
											<button class="btn btn-default input-sm" type="submit">
												<span class="fa fa-search"></span>
											</button>
										</span>
									</div>
								</div>
							</div>
						</form>
					</div>


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
									<th style="text-align: center;">은행명</th>
									<th style="text-align: center;">계좌번호</th>
									<th style="text-align: center;">연봉</th>
									<th />
								</tr>
							</thead>

							<tbody>

								<tr>
									<td style="text-align: center;">1</td>
									<td style="text-align: center;">11111111</td>
									<td style="text-align: center;">브라운</td>
									<td style="text-align: center;">제주</td>
									<td style="text-align: center;">영업부</td>
									<td style="text-align: center;">영업1팀</td>
									<td style="text-align: center;">계장</td>
									<td style="text-align: center;">계장</td>
									<td style="text-align: center;">2016-01-01</td>
									<td style="text-align: center;">01011111111</td>
									<td style="text-align: center;">
									<button type="button" class="btn btn-sm btn-success"
											onclick="location.href='adminSalaryModify.do'">수정</button></td>
								</tr>
							</tbody>
						</table>
					</div>
			    </div>
			</div>
		</div>
	</div>
</div>



