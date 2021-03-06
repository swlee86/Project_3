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

			<div id="hbreadcrumb" class="pull-right m-t-lg">
				<ol class="hbreadcrumb breadcrumb">
					<li><a href="index.do">관리자</a></li>
					<li><span>사원 정보 관리</span></li>
					<li class="active"><span>사원 정보 상세 페이지</span></li>
				</ol>
			</div>
			<h2 class="font-light m-b-xs">사원 정보  상세 페이지</h2>
			<small>사원 정보를 입니다.</small>
		</div>
	</div>
</div>

<div class="content animate-panel">
	<div class="row">
		<div class="col-lg-12">
			<div class="hpanel">
				 <div class="panel-body">
				 	<h4>사원정보</h4>
				 	  <br/>
				 	  <div class="table-responsive">
                		<form class="inline" action="" method="post">
                		<table cellpadding="1" cellspacing="1" class="table table-bordered ">
	                    		<tbody>
	                    			<tr>
	                    				<th style="width:10%; text-align: right; background-color:#f5f5f5"><font style="color:#f05050">*</font>사번</th>
	                    				<td ><input type="text" class="form-control input-sm" id="emp_no" name="emp_no" value="${result.emp_no}" readonly="readonly"></td>
	                    				<th style="width:10%; text-align: right; background-color:#f5f5f5">근무 상태</th>
	                    				<td colspan="3">
	                    					<select class="form-control input-sm" name="cg_no">
	                    					<c:forEach var="empcg" items="${empCg}">
	                    						<option value="${empcg.cg_no}" <c:if test="${ result.cg_no == empcg.cg_no }"> selected </c:if> >${empcg.cg_name}</option>
	                    					</c:forEach>
	                    					</select>
	                    				</td>
	                    			</tr>
	                    			<tr>
	                    				<th style="width:10%; text-align: right; background-color:#f5f5f5">직위</th>
	                    				<td>
	                    					<select class="form-control input-sm" id="position_no" name="position_no">
	                    					<c:forEach var="plist" items="${plist}">
	                    						<option value="${ plist.position_no }" <c:if test="${ result.position_no == plist.position_no }"> selected </c:if> > ${plist.position_name} </option>
	                    					</c:forEach>
	                    					</select>
	                    				</td>
	                    				<th style="width:10%; text-align: right; background-color:#f5f5f5">하위부서</th>
	                    				<td colspan="3">
											<select class="form-control input-sm" id="low_dept_no" name="low_dept_no">
	                    						<c:forEach var='dept'  items='${list}'>
	                    							<option value='${dept.low_dept_no}' <c:if test="${ result.low_dept_no == dept.low_dept_no }"> selected </c:if> >${dept.branch_name}&nbsp;${dept.dept_name}&nbsp;${dept.low_dept_name}</option>
	                    						</c:forEach>
	                    					</select>

	                    				</td>
	                    			</tr>
	                    			<tr>
	                    				<th style="width:10%; text-align: right; background-color:#f5f5f5"><font style="color:#f05050">*</font>이름</th>
	                    				<td><input type="text" class="form-control input-sm" id="emp_name" name="emp_name" value="${result.emp_name}"></td>
	                    				<th style="width:10%; text-align: right; background-color:#f5f5f5"><font style="color:#f05050">*</font>생년월일</th>
	                    				<td colspan="3">
	                    					<div class="form-inline">
												<input type="text" class="form-control input-sm" id="birth" name="birth" value="${result.birth}"> 
											</div>
	                    				</td>
	                    			</tr>
	                    			<tr>
	                    				<th style="width:10%; text-align: right; background-color:#f5f5f5"><font style="color:#f05050">*</font>개인 연락처</th>
	                    				<td>
	                    					<div class="form-inline">
	                    						<input type="text" class="form-control input-sm" name="cell_phone" value="${result.cell_phone}">
	                    					</div>
	                    				</td>
	                    				<th style="width:10%; text-align: right; background-color:#f5f5f5"><font style="color:#f05050">*</font>연봉</th>
	                    				<td style="width:20%">
	                    					<div class="form-inline">
	                    						<input type="text" class="form-control input-sm" name="salary" value="${result.salary}"> 만원
	                    					</div>
	                    				</td>
	                    				<th style="width:10%; text-align: right; background-color:#f5f5f5">잔여 휴가일수</th>
	                    				<td style="width:20%">
	                    					<div class="form-inline">
	                    						<input type="text" class="form-control input-sm" name="emp_break" value="${result.emp_break}"> 일
	                    					</div>
	                    				</td>
	                    			</tr>
	                    		</tbody>
	                    	</table>
							
	                    	<div class="form-group" style="text-align:center">
								<input type="submit" class="btn btn-success btn-sm" value="등 록" style="margin-right:10px;">
	                    		<input type="button" class="btn btn-default btn-sm" value="뒤로가기">
	                    	</div>
                    	</form>
                    </div>
				 </div>
			</div>
		</div>
	</div>
</div>