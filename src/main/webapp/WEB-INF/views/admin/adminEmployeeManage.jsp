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
			<h2 class="font-light m-b-xs">사원관리</h2>
		</div>
	</div>
</div>




<div class="content animate-panel">
	<div class="row">
	
    <div class="col-lg-12">
        <div class="hpanel">
            <div class="panel-heading">
                	전체 사원: <font color="#ff757f">${totalcount}</font> 명
               	<form name="list">
				<select name="pagesize" onchange="submit()" class="form-control" style="width: 20%; margin-left: 80%">
					<c:forEach var="i" begin="10" end="100" step="10">
						<c:choose>
							<c:when test="${pagesize == i}">
								<option value='${i}' selected>${i}건</option>
							</c:when>
							<c:otherwise>
								<option value='${i}'>${i}건</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
			</form>
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
                        <th  style="text-align:center;"> NO </th>
                        <th  style="text-align:center;">사 번</th>
                        <th  style="text-align:center;">이 름</th>
                      	<th  style="text-align:center;">구 분</th>                      
                        <th  style="text-align:center;">지 점</th>
                        <th  style="text-align:center;">부 서</th>
                        <th  style="text-align:center;">하위 부서</th>
                        <th  style="text-align:center;">직 위</th>
                    </tr>
                    </thead>
                    
                    <tbody>
                  	<c:forEach var="list" items="${list}">
                    <tr>
                        <td  style="text-align:center;">${list.rn}</td>
                        <td  style="text-align:center;">${list.emp_no}</td>
                        <td  style="text-align:center;"><a href="adminMemberDetail.do?emp_no=${list.emp_no}">${list.emp_name}</a></td>
                        <td  style="text-align:center;">${list.cg_name}</td>
                        <td  style="text-align:center;">${list.branch_name}</td>
                        <td  style="text-align:center;">${list.dept_name}</td>
                        <td  style="text-align:center;">${list.low_dept_name}</td>
                        <td  style="text-align:center;">${list.position_name}</td>
                    </tr>
                    </c:forEach>
                    </tbody>
                </table>    
			</div>
		    <div class="row" style="text-align:right; margin-right:5px;">
            	<button type="button"  class="btn btn-sm btn-success" onclick="location.href='adminMakeMember.do'">사원 등록</button>
            </div>

            </div>
             <div class="panel-footer"  style="text-align:center;">
                <div class="btn-group">
                	<c:if test="${cpage>1}">
                    <a href="adminEmployeeManage.do?currentpage=${cpage-1}&pagesize=${psize}"><button type="button" class="btn btn-default">&nbsp;<i class="fa fa-chevron-left"></i></button></a>
                    </c:if>
                    <c:forEach var="i" begin="1" end="${pagecount}" step="1">	
							<a href="adminEmployeeManage.do?currentpage=${i}&pagesize=${psize}"><button class="btn btn-default">${i}</button></a>
					</c:forEach>
					<c:if test="${cpage>1}">
                    <a href="adminEmployeeManage.do?currentpage=${cpage+1}&pagesize=${psize}"><button type="button" class="btn btn-default ">&nbsp;<i class="fa fa-chevron-right"></i></button></a>
                	</c:if>
                </div>
              </div>
        </div> 
            
         
   </div>  
</div>
</div>