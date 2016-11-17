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
			<h2 class="font-light m-b-xs">매출 등록</h2>
		</div>
	</div>
</div>


<div class="content animate-panel">
	<div class="row">
		<div class="col-lg-12">
			<div class="hpanel">
				 <div class="panel-body">
				 	<h4>수익 및 비용 등록</h4>
				 	  <br/>
				 	  <div class="table-responsive col-lg-8">
                		<form class="inline" action="">
	                		<table cellpadding="1" cellspacing="1" class="table table-bordered ">
	                    		<tbody>
	                    			<tr>
	                    				<th style="width:15%; text-align: right; background-color:#f5f5f5">연월 선택</th>
	                    				<td><input type="text" class="form-control input-sm" id="selectSalesdate" name="month">
     									</td>
	                    			</tr>
	                    			<tr>
	                    				<th style="width:15%; text-align: right; background-color:#f5f5f5">수익</th>
	                    				<td><input type="text" class="form-control input-sm" id="profit"></td>
	                    			</tr>
	                    			<tr>
	                    				<th style="width:15%; text-align: right; background-color:#f5f5f5">비용</th>
	                    				<td><input type="text" class="form-control input-sm" id="expense"></td>
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