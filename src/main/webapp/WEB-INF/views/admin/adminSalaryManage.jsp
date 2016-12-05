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
				<ol class="hbreadcrumb breadcrumb">
					<li><a href="index.do">홈</a></li>
					<li><span>급여 관리</span></li>
					<li><a href="adminSalaryManage.do">급여 기본 정보 관리</a></li>
				</ol>
			</div>
			<h2 class="font-light m-b-xs"> <i onclick="location.href='adminSalaryView.do'" class="fa fa-chevron-circle-left"></i>&nbsp;&nbsp;급여 기본 정보 관리</h2>
		</div>
	</div>
</div>

<div class="content animate-panel">
	<div class="row">

		<div class="col-lg-12">
			<div class="hpanel">
				<div class="panel-heading">
					전체 사원: <font color="#ff757f">${count}</font> 명
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
									<th style="text-align: center;">입사일</th>
									<th style="text-align: center;">은행명</th>
									<th style="text-align: center;">계좌번호</th>
									<th style="text-align: center;">연봉</th>
									<th style="text-align: center;">수정</th>
								</tr>
							</thead>

							<tbody>
							
							<c:choose>
							  <c:when test="${!empty paylist}">
                               <c:forEach var="list" items="${paylist}" varStatus="status">
								<tr>
									<td style="text-align: center;">${status.count}</td>
									<td style="text-align: center;">${list.emp_no}</td>
									<td style="text-align: center;">${list.emp_name}</td>
									<td style="text-align: center;">${list.branch_name}</td>
									<td style="text-align: center;">${list.dept_name}</td>
									<td style="text-align: center;">${list.low_dept_name}</td>
									<td style="text-align: center;">${list.position_name}</td>
									<td style="text-align: center;">${list.regdate}</td>
									<td style="text-align: center;">${list.bank}</td>
									<td style="text-align: center;">${list.account}</td>
									<td style="text-align: center;">${list.salary}</td>
									<td style="text-align: center;">
									<button type="button" class="btn btn-sm btn-success"
											onclick="location.href='adminSalaryModify.do?emp_no='+${list.emp_no}">수정</button></td>
								</tr>
									</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="11" style="text-align: center;">
												<h4>데이터가 없습니다.</h4>
											</td>
										</tr>	
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
			    </div>
			    
			    <div class="panel-footer" style="text-align: center;">
					<div class="btn-group">
						<button type="button" class="btn btn-default">
							&nbsp;<i class="fa fa-chevron-left"></i>
						</button>
						<button class="btn btn-default active">1</button>
						<button class="btn btn-default">2</button>
						<button class="btn btn-default">3</button>
						<button class="btn btn-default">4</button>
						<button type="button" class="btn btn-default ">
							&nbsp;<i class="fa fa-chevron-right"></i>
						</button>
					</div>
				</div>
			    
			</div>
		</div>
	</div>
</div>

			
