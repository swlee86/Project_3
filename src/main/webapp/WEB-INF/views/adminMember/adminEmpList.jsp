<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--  
	작성자	: 백승아
	작성일	: 2016-12-08
	목 적  	: 사원 관리 리스트 view
-->
 
 <script>
 $(function(){
	 
 });
 </script>
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
					<li><a href="index.html">홈</a></li>
					<li><span>관리자</span></li>
					<li class="active"><span>사원관리</span></li>
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
            	<div class="panel-heading" id="totalcount">
                	전체 인원 수 : <font color="#ff757f">${totalcount}</font> 명
            	</div>
            <div class="panel-body">
				<div class="row text-right" id="search_panel">
					<div class="col-md-7">
						<form name="list" action="adminEmp_list.do">
							<select name="pagesize" onchange="submit()" 
								    class="form-control input-sm" style="width: 20%; margin-left: 80%">
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
					
					<!-- 검색 -->
						<form action="adminEmp_list.do" class="form-inline"  action="adminEmp_list.do">
							<div class="col-md-1">
								<div class="form-group">
									<select class="form-control input-sm" name="f">
										<option value="emp_no">사원번호</option>
										<option value="emp_name">이름</option>
										<!-- <option value="dept_no">부서</option>
										<option value="low_dept_no">하위부서</option>
										<option value="position_no">직위</option> -->
									</select>
								</div>
							</div>

							<div class="col-md-3">
								<div class="form-group">
									<div class="input-group">
										<input type="text" class="form-control input-sm" name="q" />
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

			<div class="row" style="margin-left: 2%;" id="addbtn_panel">
            	<button type="button" class="btn btn-md btn-success" style="margin-right: 10px;" onclick="location.href='adminAdd_member.do'">사원 등록</button>
            	<button type="button" class="btn btn-md btn-danger" style="margin-right: 10px;" onclick="location.href='adminWithdrawal.do'">탈퇴 요청</button>
            	<button type="button" class="btn w-xs btn-info" onclick="location.href='adminEmp_authority.do'">권한 부여</button>
            </div>  
                <hr style="border:2px solid gray; margin-bottom:0px">
                <div class="table-responsive">
                <table cellpadding="1" cellspacing="1" id="dataTable"
                	   class="table table-hover table-bordered table-condensed" >
                    <thead>
                    <tr style="background-color:#f9fafc">
                        <th>사원번호</th>
                        <th>지 점</th>
                        <th>부 서</th>
                      	<th>하위부서</th>
                      	<th>직 위</th>                      
                        <th>이 름</th>                     
                        <th>사 진</th>
                        <th>근무상태</th>
                        <th>&nbsp;</th>
                    </tr>
                    </thead>
                    
                    <tbody>
                  	<c:forEach var="list" items="${list}">
                    <tr id="tr">
                        <td>${list.emp_no}</td>
                        <td>${list.branch_name}</td>
                        <td>${list.dept_name}</td>
                        <td>${list.low_dept_name}</td>
                        <td>${list.position_name}</td>
                        <td>${list.emp_name}</td>
                        <td>
                        	<<img alt="사진" src="${pageContext.request.contextPath}/img/onload/${list.pic}" class="img-circle m-b">
                        </td>
                        <td>${list.cg_name}</td>
                        <td>
                        	<button type="button" class="btn btn-outline btn-primary emp_hisBtn">이력보기</button>
                        </td>
                    </tr>
                    </c:forEach>
                    </tbody>
                </table>    
			</div>
			<div style="text-align: center;" id="page_panel">
			 <div class="btn-group">
					<c:if test="${cpage > 1}">
                    	<button type="button" class="btn btn-default" onclick="location.href='adminEmployeeManage.do?currentpage=${cpage-1}&pagesize=${psize}'">&nbsp;<i class="fa fa-chevron-left"></i></button>
                    </c:if>
                    <c:forEach var="i" begin="1" end="${pagecount}" step="1">	
                    <c:choose>
                    	<c:when test="${cpage == i}">
                    		<button class="btn btn-default active" style="background-color:#DAD9FF"><b>${i}</b></button>
                    	</c:when>
                    	<c:otherwise>
							<button class="btn btn-default" onclick="location.href='adminEmployeeManage.do?currentpage=${i}&pagesize=${psize}'">${i}</button>                	
                    	</c:otherwise>
                    </c:choose>
					</c:forEach>
					<c:if test="${cpage < pagecount}">
                    	<button type="button" class="btn btn-default" onclick="location.href='adminEmployeeManage.do?currentpage=${cpage+1}&pagesize=${psize}'">&nbsp;<i class="fa fa-chevron-right"></i></button>
                	</c:if>
                </div>
              </div>
            </div>
        </div> 
   </div>  
</div>
</div>