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
					<li><a href="index.html">Dashboard</a></li>
					<li><span>App views</span></li>
					<li class="active"><span>Calendar</span></li>
				</ol>
			</div>
			<h2 class="font-light m-b-xs">매출 관리 페이지</h2>
		</div>
	</div>
</div>

<div class="content animate-panel">
	<div class="row">
	
    <div class="col-lg-12">
        <div class="hpanel">
            <div class="panel-body">
            	<h4>매출 목록</h4>
				 	  <br/>
					<div class="row">
						<div class="col-md-8"></div>
						<form action="" class="form-inline ">
						    <div class="col-md-4">
						     <div class="form-group">
						        
						        <label class="form-control col-md-2">월별 조회</label>
								  <div class="col-md-6">
								   	<input type="text" class="form-control input-sm" id="salesdate">
								  </div>
								  <div class="col-md-2">
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
                <hr style="border:1px solid gray; margin-bottom:0px">
                <div class="table-responsive">
                <table cellpadding="1" cellspacing="1" class="table table-hover table-bordered table-condensed" >
                    <thead>
                    <tr style="background-color:#f9fafc">
                    	<th style="text-align:center;padding-bottom:10px;">
							<div class="checkbox checkbox-success">
                            	<input type="checkbox" class="i-checks" id="sales">
                               	<label for="checkbox"></label> 
                       		</div>
						</th>
                        <th  style="text-align:center;padding-bottom:20px;">날짜</th>
                        <th  style="text-align:center;padding-bottom:20px;">수익</th>
                        <th  style="text-align:center;padding-bottom:20px;">비용</th>
                     </tr>
                    </thead>
                    
                    <tbody>
                    <c:forEach var="list" items="${list}">
                    <tr style="height:10px;">
                    	<td  style="text-align:center">
                    		<div class="checkbox checkbox-success">
                            	<input type="checkbox" class="i-checks" id="sales">
                               	<label for="checkbox"></label> 
                       		</div>
						</td>
                        <td  style="text-align:center;padding-top:15px;">${list.month}</td>
                        <td  style="text-align:center;padding-top:15px;">${list.profit}</td>
                        <td  style="text-align:center;padding-top:15px;">${list.expense}</td>
                    </tr>
                    </c:forEach>
                    </tbody>
                </table>    
			</div>
		    <div class="row" style="text-align:right; margin-right:5px;">
            	<button type="button"  class="btn btn-sm btn-success" onclick="location.href='adminSales.do'">등록</button>
            	<button type="button"  class="btn btn-sm btn-default" >삭제</button>
            </div>

            </div>
             
        </div> 
            
         
   </div>  
</div>
</div>