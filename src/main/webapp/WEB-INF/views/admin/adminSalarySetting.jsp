<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--급여 설정  관리 페이지  -->
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
					<li><a href="index.do">홈</a></li>
					<li><span>급여 관리</span></li>
					<li><a href="adminSalarySetting.do">급여 설정 관리</a></li>
				</ol>
			</div>
			<h2 class="font-light m-b-xs"> <i onclick="location.href='adminSalaryView.do'" class="fa fa-chevron-circle-left"></i>&nbsp;&nbsp;급여 설정 관리</h2>
		</div>
	</div>
</div>


<div class="content animate-panel">
<input type="hidden" id="dayJudgement" value=${result}>
		<div class="hpanel">
			<div class="panel-body">
				
				<h4><i class="pe-7s-angle-right"></i><span class="font-icon-name"></span>&nbsp;&nbsp;&nbsp;
					현재 급여일 : <span id="dbAddDate">${pay_date}일</span><input type="button" id="showBtn" class="col-md-offset-1 btn btn-default" value="설정하기">	</h4>
				<hr/>			
				
				<div id="settingAddDate">	
				<h4>
					<i class="pe-7s-angle-right"></i><span class="font-icon-name"></span>&nbsp;&nbsp;&nbsp;급여일
					설정
				</h4>
				<div class="col-md-1">
					<span class="form-control">지급일</span>
				</div>
				<div class="col-md-4">
					<select class="form-control" id="daySelect">
						<c:forEach begin="1" end="31" var="i">
							<option value=${i}>${i}</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<button type="button" class="btn btn-md btn-default" id="savepayDateBtn">
						<span class="fa fa-search"></span>&nbsp;&nbsp;저장
					</button>
				</div>
			</div>
		  </div>
	 </div>
</div>

<div class="content animate-panel">
	<div class="hpanel">
			<div class="panel-body">
			<h4>
			  <i class="pe-7s-angle-right"></i><span class="font-icon-name"></span>&nbsp;&nbsp;&nbsp;상여금 지급 여부 설정
			</h4>
		    <hr/>	
            <form action="" method="post">
                <div class="table-responsive">
            
                <table cellpadding="1" cellspacing="1" class="table table-hover table-bordered table-condensed" >
                   <thead>
                    <tr style="background-color:#f9fafc">
                    	<th style="text-align:center;"><input type="checkbox" id="allCheck" 
								name="Allcheckbox" style="width:20px; height:20px;"></th>
                        <th  style="text-align:center;"> NO </th>
                        <th  style="text-align:center;">지점명</th>
                        <th  style="text-align:center;">부서명</th>
                        <th  style="text-align:center;">지급 여부</th>                   
                     </tr>
                   </thead>
                   <tbody>
                   <c:forEach var="list" items="${list}" varStatus="status">
                     <tr>
                    	<td style="text-align:center;padding-top:10px;">
                    		<input type="checkbox" name="checkboxadd" id="${list.dept_no}" style="width:20px; height:20px;">
                    	</td>
                    	<td  style="text-align:center;padding-top:10px;">${status.count}</td>
                        <td  style="text-align:center;padding-top:10px;">${list.branch_name}</td>
                        <td  style="text-align:center;padding-top:10px;">${list.dept_name}</td>
                       <td>
                        	<select class="form-control input-sm" id="selectbonus${list.dept_no}">
                        	   <c:choose>
                        	   		<c:when test="${list.bonus_check ==1}">
		                        		<option>미지급</option>
								        <option selected="selected">지급</option>
						        	</c:when>
						        	<c:otherwise>
						        	    <option selected="selected">미지급</option>
								        <option>지급</option>
						        	</c:otherwise>
						        </c:choose>
                            </select>
                        </td>
                    </tr>
                 </c:forEach>
                    </tbody>
                </table>    
			</div>
		    <div class="row" style="text-align:right; margin-right:5px;">
            	<input type="button" id="add_pay_div" class="btn btn-sm btn-success" value="지급 확정">
            </div>
            </form>
			
		</div>
	</div>
</div>
	