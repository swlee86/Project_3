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
	                    				<th style="width:10%; text-align: right; background-color:#f5f5f5">근무상태</th>
	                    				<td colspan="3">
	                    					<select class="form-control input-sm" name="cg_no">
	                    					<c:forEach var="emphis" items="${emphis}">
	                    						<option value="${emphis.cg_no }">${emphis.cg_name}</option>
	                    					</c:forEach>
	                    					</select>
	                    				</td>
	                    			</tr>
	                    			<tr>
	                    				<th style="width:10%; text-align: right; background-color:#f5f5f5">직위</th>
	                    				<td>
	                    					<select class="form-control input-sm" id="position_no" name="position_no">
	                    					<c:forEach var="plist" items="${plist}">
	                    						<option value="${plist.position_no }">${plist.position_name}</option>
	                    					</c:forEach>
	                    					</select>
	                    				</td>
	                    				<th style="width:10%; text-align: right; background-color:#f5f5f5">하위부서</th>
	                    				<td colspan="3">
	                    					<select class="form-control input-sm" id="position_no" id="low_dept_no" name="low_dept_no">
	                    						<c:forEach var='dept'  items='${list}'>
	                    							<option value='${dept.low_dept_no}'>${dept.branch_name}&nbsp;${dept.dept_name}&nbsp;${dept.low_dept_name}</option>
	                    						</c:forEach>
	                    					</select>
	                    				</td>
	                    			</tr>
	                    			<tr>
	                    				<th style="width:10%; text-align: right; background-color:#f5f5f5"><font style="color:#f05050">*</font>이름</th>
	                    				<td><input type="text" class="form-control input-sm" name="emp_name"></td>
	                    				<th style="width:10%; text-align: right; background-color:#f5f5f5"><font style="color:#f05050">*</font>생년월일</th>
	                    				<td colspan="3">
	                    					<div class="form-inline">
												<input type="text" class="form-control input-sm" name="birth"  id="makeuserDate"> 
											</div>
	                    				</td>
	                    				<!-- <th style="width:10%; text-align: right; background-color:#f5f5f5">이메일</th> 
	                    				<td><input type="text" class="form-control input-sm" name="email"></td>-->
	                    			</tr>
	                    			
	                    			<tr>
	                    				<th style="width:10%; text-align: right; background-color:#f5f5f5"><font style="color:#f05050">*</font>개인 연락처</th>
	                    				<td>
	                    					<div class="form-inline">
	                    						<input type="text" class="form-control input-sm" name="cell_phone">
	                    					</div>
	                    				</td>
	                    				<th style="width:10%; text-align: right; background-color:#f5f5f5"><font style="color:#f05050">*</font>연봉</th>
	                    				<td style="width:20%">
	                    					<div class="form-inline">
	                    						<input type="text" class="form-control input-sm" name="salary"> 만원
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