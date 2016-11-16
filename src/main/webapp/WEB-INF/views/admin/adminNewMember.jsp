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
					<li><a href="index.do">Dashboard</a></li>
					<li><span>Tables</span></li>
					<li class="active"><span>DataTables</span></li>
				</ol>
			</div>
			<h2 class="font-light m-b-xs">사원 정보 등록 페이지</h2>
			<small>등록하실 사원 정보를 입력하세요.</small>
		</div>
	</div>
</div>

<div class="content animate-panel">
	<div class="row">
		<div class="col-lg-12">
			<div class="hpanel">
				 <div class="panel-body">
				 	<h4>사원등록</h4>
				 	  <br/>
				 	  <div class="table-responsive">
                		<form class="inline" action="adminAddMember.do" method="post">
	                		<table cellpadding="1" cellspacing="1" class="table table-bordered ">
	                    		<tbody>
	                    			<tr>
	                    				<th style="width:10%; text-align: right; background-color:#f5f5f5"><font style="color:#f05050">*</font>사번</th>
	                    				<td><input type="text" class="form-control input-sm" name="emp_no"></td>
	                    				<th style="width:10%; text-align: right; background-color:#f5f5f5">구분번호</th>
	                    				<td colspan="3">
	                    					<select class="form-control input-sm" name="cg_no">
	                    						<option value="1" >정상근무</option>
	                    						<option value="2" >연차휴가</option>
	                    						<option value="3" >육아휴직</option>
	                    						<option value="4" >출산휴가</option>
	                    						<option value="5" >특별휴가</option>
	                    					</select>
	                    				</td>
	                    			</tr>
	                    			<tr>
	                    				<th style="width:10%; text-align: right; background-color:#f5f5f5">직위번호</th>
	                    				<td>
	                    					<select class="form-control input-sm" id="position_no" name="position_no">
	                    						<option value="0" <c:if test="${0 == 2}">selected</c:if>>대표</option>
	                    						<option value="1" <c:if test="${1 == 2}">selected</c:if>>지점장</option>
	                    						<option value="2" <c:if test="${2 == 2}">selected</c:if>>부장</option>
	                    						<option value="3" <c:if test="${3 == 2}">selected</c:if>>차장</option>
	                    						<option value="4" <c:if test="${4 == 2}">selected</c:if>>과장</option>
	                    						<option value="5" <c:if test="${5 == 2}">selected</c:if>>대리</option>
	                    						<option value="6" <c:if test="${6 == 2}">selected</c:if>>주임</option>
	                    						<option value="7" <c:if test="${7 == 2}">selected</c:if>>사원</option>
	                    					</select>
	                    				</td>
	                    				<th style="width:10%; text-align: right; background-color:#f5f5f5">하위부서번호</th>
	                    				<td colspan="3">
	                    					<select class="form-control input-sm" id="position_no" id="low_dept_no" name="low_dept_no">
	                    						<option value="0" <c:if test="${0 == 6}">selected</c:if>>개발1팀</option>
	                    						<option value="1" <c:if test="${1 == 6}">selected</c:if>>개발2팀</option>
	                    						<option value="2" <c:if test="${2 == 6}">selected</c:if>>엽업1팀</option>
	                    						<option value="3" <c:if test="${3 == 6}">selected</c:if>>엽업2팀</option>
	                    						<option value="4" <c:if test="${4 == 6}">selected</c:if>>관리1팀</option>
	                    						<option value="5" <c:if test="${5 == 6}">selected</c:if>>관리2팀</option>
	                    						<option value="6" <c:if test="${6 == 6}">selected</c:if>>전문경영</option>
	                    					</select>
	                    				</td>
	                    			</tr>
	                    			<tr>
	                    				<th style="width:10%; text-align: right; background-color:#f5f5f5"><font style="color:#f05050">*</font>이름</th>
	                    				<td><input type="text" class="form-control input-sm" name="emp_name"></td>
	                    				<th style="width:10%; text-align: right; background-color:#f5f5f5"><font style="color:#f05050">*</font>생년월일</th>
	                    				<td colspan="3">
	                    					<div class="form-inline">
												<input type="text" class="form-control input-sm" name="birth" id="makeuserDate"> 
											</div>
	                    				</td>
	                    			</tr>
	                    			
	                    			<tr>
	                    				<th style="width:10%; text-align: right; background-color:#f5f5f5"><font style="color:#f05050">*</font>사내 연락처</th>
	                    				<td>
	                    					<div class="form-inline">
	                    						<input type="text" class="form-control input-sm" name="cell_phone">
	                    					</div>
	                    				</td>
	                    				<th style="width:10%; text-align: right; background-color:#f5f5f5"><font style="color:#f05050">*</font>연봉</th>
	                    				<td style="width:20%">
	                    					<div class="form-inline">
	                    						<input type="text" class="form-control input-sm" value="5000"  name="salary"> 만원
	                    					</div>
	                    				</td>
	                    				<th style="width:10%; text-align: right; background-color:#f5f5f5">잔여 휴가일수</th>
	                    				<td style="width:20%">
	                    					<div class="form-inline">
	                    						<input type="text" class="form-control input-sm"  name="emp_break"> 일
	                    					</div>
	                    				</td>
	                    			</tr>

	                    		</tbody>
	                    	</table>
	                    	<div class="form-group" style="text-align:center">
	                    		<input type="submit" class="btn btn-success btn-sm" value="등록" style="margin-right:10px">
	                    		<input type="button" class="btn btn-default btn-sm" value="취소">
	                    	</div>
                    	</form>
                    </div>
				 </div>
			</div>
		</div>
	</div>
</div>