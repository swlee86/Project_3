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
                		<form class="inline">
	                		<table cellpadding="1" cellspacing="1" class="table table-bordered ">
	                    		<tbody>
	                    			<tr>
	                    				<th style="width:10%; text-align: right; background-color:#f5f5f5"><font style="color:#f05050">*</font>사번</th>
	                    				<td><input type="text" class="form-control input-sm"></td>
	                    				<th style="width:10%; text-align: right; background-color:#f5f5f5">구분번호</th>
	                    				<td><input type="text" class="form-control input-sm"></td>
	                    			</tr>
	                    			<tr>
	                    				<th style="width:10%; text-align: right; background-color:#f5f5f5">직위번호</th>
	                    				<td><input type="text" class="form-control input-sm"></td>
	                    				<th style="width:10%; text-align: right; background-color:#f5f5f5">하위부서번호</th>
	                    				<td><input type="text" class="form-control input-sm"></td>
	                    			</tr>
	                    			<tr>
	                    				<th style="width:10%; text-align: right; background-color:#f5f5f5"><font style="color:#f05050">*</font>이름</th>
	                    				<td><input type="text" class="form-control input-sm"></td>
	                    				<th style="width:10%; text-align: right; background-color:#f5f5f5"><font style="color:#f05050">*</font>생년월일</th>
	                    				<td>
	                    					<div class="form-inline">
											<select  class="form-control input-sm">
												<c:forEach begin="1960" end="1999" var="i" >
													<option value="i">${i}</option>
												</c:forEach>
											</select>
											년 &nbsp;
											<select  class="form-control input-sm">
												<c:forEach begin="1" end="12" var="i">
													<option value="i">${i}</option>
												</c:forEach>
											</select>
											월&nbsp;
											<select  class="form-control input-sm">
												<c:forEach begin="1" end="12" var="i">
													<option value="i">${i}</option>
												</c:forEach>
											</select>
											일
											</div>
	                    				</td>
	                    			</tr>
	                    			<tr>
	                    				<th style="width:10%; text-align: right; background-color:#f5f5f5"><font style="color:#f05050">*</font>연봉</th>
	                    				<td>
	                    					<div class="form-inline">
	                    						<input type="text" class="form-control input-sm"> 만원
	                    					</div>
	                    				</td>
	                    				<th style="width:10%; text-align: right; background-color:#f5f5f5">잔여 휴가일수</th>
	                    				<td>
	                    					<div class="form-inline">
	                    						<input type="text" class="form-control input-sm"> 일
	                    					</div>
	                    				</td>
	                    			</tr>
	                    		</tbody>
	                    	</table>
	                    	<div class="form-group" style="text-align:center">
	                    		<input type="submit" class="btn btn-success" value="등록" style="margin-right:10px">
	                    		<input type="button" class="btn btn-default" value="취소">
	                    	</div>
                    	</form>
                    </div>
				 </div>
			</div>
		</div>
	</div>
</div>