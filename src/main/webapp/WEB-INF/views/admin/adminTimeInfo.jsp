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
			<h2 class="font-light m-b-xs">시간 정보 관리 페이지</h2>
		</div>
	</div>
</div>

<div class="normalheader transition animated fadeIn">
	<div class="row">
		<div class="col-lg-12">
			<div class="hpanel">
				 <div class="panel-body">
				 	<h4>출퇴근 시간 등록</h4>
				 	  <br/>
				 	  <div class="table-responsive">
                		<form class="inline">
	                		<table cellpadding="1" cellspacing="1" class="table table-bordered ">
	                    		<tbody>
	                    		 <th style="width:15%; text-align: right; background-color:#f5f5f5" colspan="1">지점/부서/하위부서</th>
	                    				<td>
	                    					<div class="form-inline">
	                    					지점 &nbsp;
											<select class="form-control input-sm">
											        <option>선택</option>
													<option>지점명</option>
												
											</select>
											</div>
										</td>
										<td>
										   <div class="form-inline">
											부서 &nbsp;
											<select  class="form-control input-sm">
												    <option>선택</option>
													<option >부서명</option>
												
											</select>
											</div>
							             </td>
							             <td>
							               <div class="form-inline">
										     하위부서 &nbsp;
											<select  class="form-control input-sm">
												    <option>선택</option>
													<option >하위부서명</option>
												
											</select>
											</div>
	                    				</td>
	                    		     <tr>
	                    				<th style="width:15%; text-align: right; background-color:#f5f5f5">출근시간</th>
	                    				<td> 
	                    				<div class="input-group clockpicker" data-autoclose="true">
                        					<input type="text" class="form-control" value="09:30" >
                               					 <span class="input-group-addon">
                                    			 <span class="fa fa-clock-o"></span>
                               					 </span>
                    					</div>
	                    				</td>
	                    				<th style="width:20%; text-align: right; background-color:#f5f5f5">퇴근시간</th>
	                    				<td>
	                    				  <div class="input-group clockpicker" data-autoclose="true">
                        					<input type="text" class="form-control" value="09:30" >
                               					 <span class="input-group-addon">
                                    			 <span class="fa fa-clock-o"></span>
                               					 </span>
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
	                
	                
<div class="normalheader transition animated fadeIn">
	<div class="row">
		<div class="col-lg-12">
			<div class="hpanel">
				 <div class="panel-body">
				 	<h4>홈페이지 접근 시간 설정</h4>
				 	  <br/>
				 	  <div class="table-responsive">
                		<form class="inline">
	                		<table cellpadding="1" cellspacing="1" class="table table-bordered ">
	                    		<tbody>
	                    		 <th style="width:15%; text-align: right; background-color:#f5f5f5" colspan="1">지점/부서/하위부서</th>
	                    				<td>
	                    					<div class="form-inline">
	                    					지점 &nbsp;
											<select  class="form-control input-sm">
											        <option>선택</option>
													<option>지점명</option>
												
											</select>
											</div>
										</td>
										<td>
										   <div class="form-inline">
											부서 &nbsp;
											<select  class="form-control input-sm">
												    <option>선택</option>
													<option >부서명</option>
												
											</select>
											</div>
							             </td>
							             <td>
							               <div class="form-inline">
										     하위부서 &nbsp;
											<select  class="form-control input-sm">
												    <option>선택</option>
													<option >하위부서명</option>
												
											</select>
											</div>
	                    				</td>
	                    		     <tr>
	                    				<th style="width:15%; text-align: right; background-color:#f5f5f5">시작시간</th>
	                    				<td>
	                    				    <div class="input-group clockpicker" data-autoclose="true">
                        					<input type="text" class="form-control" value="09:30" >
                               					 <span class="input-group-addon">
                                    			 <span class="fa fa-clock-o"></span>
                               					 </span>
                    					   </div>
	                    				</td>
	                    				<th style="width:20%; text-align: right; background-color:#f5f5f5">마감시간</th>
	                    				<td>
	                    				   <div class="input-group clockpicker" data-autoclose="true">
                        					<input type="text" class="form-control" value="09:30" >
                               					 <span class="input-group-addon">
                                    			 <span class="fa fa-clock-o"></span>
                               					 </span>
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
	                    			
