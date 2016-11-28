<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<div class="normalheader transition animated fadeIn">
	<div class="hpanel">
		<div class="panel-body">
			<a class="small-header-action" href="">
				<div class="clip-header">
					<i class="fa fa-arrow-up"></i>
				</div>
			</a>
			<div class="row">
				<div class="form-group col-sm-4">
					<h2 class="font-light m-b-xs">급여 마감 관리</h2>
				</div>
			</div>
		</div>
	</div>
</div>


<!--월별 급여 보기-->
<div class="normalheader transition animated fadeIn">
	<div class="row">
		<div class="col-sm-12">
			<div class="hpanel style=" text-align:center">
				<div class="panel-body">
					<h4>
						<i class="pe-7s-angle-right"></i><span class="font-icon-name"></span>&nbsp;&nbsp;&nbsp;${date} 급여정보
					</h4>
					 <hr style="border:1px solid gray; margin-bottom:0px">
			<form action="SalaryCloseCheck.do" method="POST" id="salaryCloseForm">	
				<input type="hidden" name="date" value="${date}"> 	 
				<div class="table-responsive">
                     <table cellpadding="1" cellspacing="1" class="table table-hover table-bordered table-condensed" >
                    <thead>
                    <tr style="background-color:#f9fafc">
                        <th  style="text-align:center;"></th>
                        <th  style="text-align:center;">사 번</th>
                        <th  style="text-align:center;">이 름</th> 
                        <th  style="text-align:center;">지점</th>
                        <th  style="text-align:center;">부서</th>
                        <th  style="text-align:center;">하위 부서</th>
                        <th  style="text-align:center;">직위</th>
                        <th  style="text-align:center;">총 근무시간</th>
                        <th  style="text-align:center;">총 추가 근무시간</th>
                        <th  style="text-align:center;">총지급액</th>
                        <th  style="text-align:center;">확정 여부</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="list" items="${list}">
                      <tr>
                        <td style="text-align:center;">
                    		<input type="checkbox" class="i-checks" name="checkbox" value="${list.pay_no}">
                    	</td>
                        <td  style="text-align:center;">${list.emp_no}</td>
                        <td  style="text-align:center;">${list.emp_name}</td> 
                        <td  style="text-align:center;">${list.branch_name}</td>
                        <td  style="text-align:center;">${list.dept_name}</td>
                        <td  style="text-align:center;">${list.low_dept_name}</td>
                        <td  style="text-align:center;">${list.position_name}</td>
                        <td  style="text-align:center;">${list.acc_commute_time}</td>
                        <td  style="text-align:center;">${list.acc_add_time}</td>
                        <td  style="text-align:center;">${list.total_pay}</td>
                       <c:choose>
                       	 <c:when test="${list.master_check ==1}">
                        	<td  style="text-align:center;">확정</td>
                         </c:when>
                         <c:otherwise>
                         	<td  style="text-align:center;">미확정</td>
                         </c:otherwise>
                       </c:choose> 
                     </tr>
                    </c:forEach>
                 </tbody>
                </table>  
			</div>
			<input type="hidden" name="pay_no2" id="hiddenPay">
			<div class="row" style="text-align:right; margin-right:5px;">
            	<input type="submit" class="btn btn-sm btn-success" value="마감 확정">
            </div>
      </form>
		</div>
		
		<div class="panel-footer"  style="text-align:center;">
                <div class="btn-group">
                    <button type="button" class="btn btn-default">&nbsp;<i class="fa fa-chevron-left"></i></button>
                    <button class="btn btn-default active">1</button>
                    <button class="btn btn-default">2</button>
                    <button class="btn btn-default">3</button>
                    <button class="btn btn-default">4</button>
                    <button type="button" class="btn btn-default ">&nbsp;<i class="fa fa-chevron-right"></i></button>
                </div>
         </div>
			</div>
		</div>
	</div>
</div>
