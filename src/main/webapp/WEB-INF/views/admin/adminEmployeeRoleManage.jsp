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
			<h2 class="font-light m-b-xs">사원 권한 관리</h2>
		</div>
	</div>
</div>




<div class="content animate-panel">
	<div class="row">
	
    <div class="col-lg-12">
        <div class="hpanel">
            <div class="panel-heading">
                	전체 사원: <font color="#ff757f">100</font> 명
            </div>
            <div class="panel-body">
					<div class="row text-right">
						<div class="col-md-7"></div>
						<form action="" class="form-inline ">
							<div class="col-md-2">
								<div class="form-group">
									<select class="form-control input-sm">
										<option>사번</option>
										<option>이름</option>
										<option>부서</option>
										<option>하위부서</option>
										<option>직위</option>
									</select>
								</div>
							</div>

							<div class="col-md-3">
								<div class="form-group">
									<div class="input-group">
										<input type="text" class="form-control input-sm" name="s" />
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
                    	<th></th>
                        <th  style="text-align:center;"> NO </th>
                        <th  style="text-align:center;"> ID </th>
                        <th  style="text-align:center;">사 번</th>
                        <th  style="text-align:center;">이 름</th>                   
                        <th  style="text-align:center;">지 점</th>
                        <th  style="text-align:center;">부 서</th>
                        <th  style="text-align:center;">하위 부서</th>
                        <th  style="text-align:center;">직 위</th>
                        <th  style="text-align:center;">권한</th>
                    </tr>
                    </thead>
                    
                    <tbody>
                  
                    <tr>
                    	<td style="text-align:center;padding-top:10px;"><input type="checkbox" class="i-checks" id="checkbox3"></td>
                        <td  style="text-align:center;padding-top:10px;">2</td>
                        <td  style="text-align:center;padding-top:10px;">wong303</td>
                        <td  style="text-align:center;padding-top:10px;">91001111</td>
                        <td  style="text-align:center;padding-top:10px;">박지은</td>
                        <td  style="text-align:center;padding-top:10px;">본사</td>
                        <td  style="text-align:center;padding-top:10px;">경영부</td>
                        <td  style="text-align:center;padding-top:10px;">전문경영</td>
                        <td  style="text-align:center;padding-top:10px;">부장</td>
                        <td>
                        	<select class="form-control input-sm">
                        		<option value="0"  <c:if test="${0 == 0}">selected</c:if>> </option>
                        		<option value="1"  <c:if test="${1 == 0}">selected</c:if>>role_master</option>
                        		<option value="2"  <c:if test="${2 == 0}">selected</c:if>>role_manager</option>
                        	</select>
                        </td>
                    </tr>
                    <tr>
                    	<td style="text-align:center;padding-top:10px;"><input type="checkbox" class="i-checks" id="checkbox3"></td>
                        <td  style="text-align:center;padding-top:10px;">1</td>
                        <td  style="text-align:center;padding-top:10px;">aaa123</td>
                        <td  style="text-align:center;padding-top:10px;">91001112</td>
                        <td  style="text-align:center;padding-top:10px;">박지은</td>
                        <td  style="text-align:center;padding-top:10px;">본사</td>
                        <td  style="text-align:center;padding-top:10px;">경영부</td>
                        <td  style="text-align:center;padding-top:10px;">전문경영</td>
                        <td  style="text-align:center;padding-top:10px;">부장</td>
                       	<td>
                       	 	<select class="form-control input-sm">
                       	 		<option  <c:if test="${0 == 1}">selected</c:if>> </option>
                        		<option  <c:if test="${1 == 1}">selected</c:if>>role_master</option>
                        		<option  <c:if test="${2 == 1}">selected</c:if>>role_manager</option>
                        	</select>
                        </td>
                    </tr>
                    </tbody>
                </table>    
			</div>
		    <div class="row" style="text-align:right; margin-right:5px;">
            	<button type="button"  class="btn btn-sm btn-success" onclick="location.href='adminMakeMember.do'">사원 등록</button>
            </div>

            </div>
             <div class="panel-footer"  style="text-align:center;">
                <div class="btn-group">
                    <button type="button" class="btn btn-default">&nbsp;<i class="fa fa-chevron-left"></i></button>
                    <button class="btn btn-default active">1</button>
                    <button class="btn btn-default  ">2</button>
                    <button class="btn btn-default">3</button>
                    <button class="btn btn-default">4</button>
                    <button type="button" class="btn btn-default ">&nbsp;<i class="fa fa-chevron-right"></i></button>
                </div>
              </div>
        </div> 
            
         
   </div>  
</div>
</div>