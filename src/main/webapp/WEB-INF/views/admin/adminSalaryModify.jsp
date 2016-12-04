<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--급여 기본정보 수정 페이지  -->
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
			<h2 class="font-light m-b-xs">
			<i onclick="location.href='adminSalaryManage.do'"
					class="fa fa-chevron-circle-left"></i>&nbsp;&nbsp;급여 기본 정보 수정</h2>
		</div>
	</div>
</div>


<div class="content animate-panel">
	<div class="row">
		<div class="col-lg-12">
			<div class="hpanel">
				 <div class="panel-body">
				 	<h4>상세 정보</h4>
				 	  <br/>
				 	  <div class="table-responsive">
                		<form class="inline" action="adminSalary_Modify.do" method="post">
	                		<table cellpadding="1" cellspacing="1" class="table table-bordered ">
	                    		<tbody>
	                    			<tr>
	                    				<th style="width:10%; text-align: right; background-color:#f5f5f5">사번</th>
	                    				<td><input type="text" class="form-control input-sm" id="emp_no" name="emp_no" readonly="readonly" value="${pay.emp_no}"></td>
	                    				<th style="width:10%; text-align: right; background-color:#f5f5f5">이름</th>
	                    				<td><input type="text" class="form-control input-sm" id="emp_name" name="emp_name" readonly="readonly" value="${pay.emp_name}"></td>
	                    				<th style="width:10%; text-align: right; background-color:#f5f5f5"><font style="color:#f05050">*</font>연봉</th>
	                    			    <td colspan="3"><input type="text" class="form-control input-sm" id="salary" name="salary" value="${pay.salary}"></td>
	                    			</tr>
	                    				<tr>
	                    				<th style="width:10%; text-align: right; background-color:#f5f5f5">지점</th>
	                    				<td>
	                    					
	                    						<input type="text" class="form-control input-sm" id="branch" name="branch" readonly="readonly" value="${pay.branch_name}">
	                    					
	                    				</td>
	                    				<th style="width:10%; text-align: right; background-color:#f5f5f5">부서</th>
	                    				<td>
	                    					
	                    						<input type="text" class="form-control input-sm" id="dept" name="dept" readonly="readonly" value="${pay.dept_name}" >
	                    					
	                    				</td>
	                    				<th style="width:10%; text-align: right; background-color:#f5f5f5">하위부서</th>
	                    				<td>
	                    					
	                    						<input type="text" class="form-control input-sm"  id="low_dept" name="low_dept" readonly="readonly" value="${pay.low_dept_name}">
	                    					
	                    				</td>
	                    			</tr>
	                    		
	                    			<tr>
	                    				
	                    				<th style="width:10%; text-align: right; background-color:#f5f5f5"><font style="color:#f05050">*</font>은행</th>
	                    				<td><input type="text" class="form-control input-sm" id="bank" name="bank" value="${pay.bank}"></td>
	                    					<th style="width:10%; text-align: right; background-color:#f5f5f5"><font style="color:#f05050">*</font>계좌번호</th>
	                    				<td colspan="3"><input type="text" class="form-control input-sm" id="account" name="account" value="${pay.account}"></td>
	                    			</tr>

	                    		</tbody>
	                    	</table>
	                    	<div class="form-group" style="text-align:center">
	                    		<input type="submit" class="btn btn-success btn-sm" value="저장" style="margin-right:10px">
	                    		<input type="reset" class="btn btn-default btn-sm" onclick="location.href='adminSalaryManage.do'" value="취소">
	                    	</div>
                    	</form>
                    </div>
				 </div>
			</div>
		</div>
	</div>
</div>