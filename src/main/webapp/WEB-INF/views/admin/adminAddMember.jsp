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
					<li>홈</li>
					<li><span>관리자</span></li>
					<li class="active"><span>사원 등록</span></li>
				</ol>
			</div>
			<h2 class="font-light m-b-xs">사원 등록</h2>
			<small>새로운 사원을 등록할 수 있습니다^^</small>
		</div>
	</div>
</div>

<div class="content animate-panel">
	<div class="row">
		<div class="col-lg-12">
			<div class="hpanel">
				 <div class="panel-body">
				 	  <div class="table-responsive">
                		<form class="inline" action="adminAddMember.do" method="post">
	                		<table cellpadding="1" cellspacing="1" class="table table-bordered ">
	                    		<tbody>
	                    			<tr>
	                    				<th style="width:10%; text-align: right; background-color:#f5f5f5"><font style="color:#f05050">*</font>사번</th>
	                    				<td colspan="5"><input type="text" class="form-control input-sm" readonly name="emp_no" value="${ emp_no }"></td>
	                    			</tr>
	                    			<tr>
	                    				<th style="width: 10%; text-align: right; background-color:#f5f5f5">근무상태</th>
	                    				<td style="width: 20%;">
	                    					<select class="form-control input-sm" name="cg_no">
	                    					<c:forEach var="empcg" items="${ emp_cg }">
	                    						<option value="${empcg.cg_no }">${empcg.cg_name}</option>
	                    					</c:forEach>
	                    					</select>
	                    				</td>
	                    				<th style="width:10%; text-align: right; background-color:#f5f5f5">직위</th>
	                    				<td colspan="3">
	                    					<select class="form-control input-sm" id="position" name="position_no">
	                    					<c:forEach var="plist" items="${ position }">
	                    						<option value="${plist.position_no }">${plist.position_name}</option>
	                    					</c:forEach>
	                    					</select>
	                    				</td>
	                    			</tr>
	                    			<tr>
	                    				<th style="text-align: right; background-color:#f5f5f5">지점</th>
	                    				<td>
	                    					<select class="form-control input-sm" id="branchlist" name="branch_no">
	                    						<c:forEach var='blist' items='${branch}'>
	                    							<option value='${blist.branch_no}'>${blist.branch_name}</option>
	                    						</c:forEach>
	                    					</select>
	                    				</td>
	                    				<th style="text-align: right; background-color:#f5f5f5">부서</th>
	                    				<td>
	                    					<select class="form-control input-sm" id="deptlist" name="dept_no">
	                    						<c:forEach var='blist' items='${branch}'>
	                    							<option value='${blist.branch_no}'>${blist.branch_name}</option>
	                    						</c:forEach>
	                    					</select>
	                    				</td>
	                    				<th style="text-align: right; background-color:#f5f5f5">하위 부서</th>
	                    				<td>
	                    					<select class="form-control input-sm" id="low_dept_list" name="low_dept_no">
	                    						<c:forEach var='blist' items='${branch}'>
	                    							<option value='${blist.branch_no}'>${blist.branch_name}</option>
	                    						</c:forEach>
	                    					</select>
	                    				</td>
	                    			</tr>
	                    			<tr>
	                    				<th style="text-align: right; background-color:#f5f5f5"><font style="color:#f05050">*</font>이름</th>
	                    				<td><input type="text" class="form-control input-sm" name="emp_name"></td>
	                    				<th style="width:10%; text-align: right; background-color:#f5f5f5"><font style="color:#f05050">*</font>생년월일</th>
	                    				<td colspan="3">
	                    					<div class="form-inline">
												<input type="text" class="form-control input-sm" name="birth"> 
											</div>
	                    				</td>
	                    			</tr>
	                    			<tr>
	                    				<th style="text-align: right; background-color:#f5f5f5"><font style="color:#f05050">*</font>개인 연락처</th>
	                    				<td>
	                    					<input type="text" class="form-control input-sm" name="cell_phone">
	                    				</td>
	                    				<th style="text-align: right; background-color:#f5f5f5"><font style="color:#f05050">*</font>연봉</th>
	                    				<td style="width:18%">
	                    					<div class="form-inline">
	                    						<input type="text" class="form-control input-sm" name="salary">&nbsp;&nbsp;만원
	                    					</div>
	                    				</td>
	                    				<th style="width:10%; text-align: right; background-color:#f5f5f5">잔여 휴가일수</th>
	                    				<td style="width:18%">
	                    					<div class="form-inline">
	                    						<input type="text" class="form-control input-sm" name="emp_break">&nbsp;&nbsp;일
	                    					</div>
	                    				</td>
	                    			</tr>

	                    		</tbody>
	                    	</table>
	                    	<div class="pull-right" style="text-align:center">
	                    		<input type="submit" class="btn btn-success btn-md" value="등록" style="margin-right:10px">
	                    		<input type="button" class="btn btn-default btn-md" value="돌아가기">
	                    	</div>
                    	</form>
                    </div>
				 </div>
			</div>
		</div>
	</div>
</div>