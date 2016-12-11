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
                    <li><a href="index.html">홈</a></li>
                    <li>
                        <span>관리자</span>
                    </li>
                    <li class="active">
                        <span>권한 부여 상세</span>
                    </li>
                </ol>
            </div>
            <h2 class="font-light m-b-xs">
               	 상세 권한 관리
            </h2>
            <small>&nbsp;&nbsp;각 사원의 권한을 관리할 수 있습니다^^</small>
        </div>
    </div>
</div>

<div class="content animate-panel row" style="margin-bottom: 10px;">

<div class="col-lg-4 pull-right ui-sortable" style="margin-right: 40px; padding-bottom: 5px;">
	<c:forEach var="role" items="${ role }">
		<c:if test="${ role.role_no != '0' }">
			<button class="btn btn-primary sortable ui-sortable-handle" draggable="true">${ role.role_exp }</button>
			<br>
		</c:if>
	</c:forEach>
</div>

<c:forEach var="list" items="${ elist }" varStatus="status">
<div>
    <div class="col-lg-7">
    <div 
    	<c:if test="${ status.index % 6 == 0 }"> class="hpanel hblue" </c:if> 
    	<c:if test="${ status.index % 6 == 1 }"> class="hpanel hgreen" </c:if>
    	<c:if test="${ status.index % 6 == 2 }"> class="hpanel horange" </c:if>
    	<c:if test="${ status.index % 6 == 3 }"> class="hpanel hred" </c:if>
    	<c:if test="${ status.index % 6 == 4 }"> class="hpanel hyellow" </c:if>
    	<c:if test="${ status.index % 6 == 5 }"> class="hpanel hviolet" </c:if>
    >
            <div class="panel-heading hbuilt">
                <div class="panel-tools">
                    <a class="showhide"><i class="fa fa-chevron-up"></i></a>
                </div>
                &nbsp;&nbsp;	
                ${ list.branch_name } /
                ${ list.dept_name } /
                ${ list.low_dept_name }
                <span style="display: inline-block; width: 330px;"></span>
                ${ list.position_name } &nbsp;&nbsp; 
                ${ list.emp_name }
            </div>
            <div class="panel-body" style="display: none;">
            	<div class="pull-left">
                <img alt="사진" src="images/a4.jpg" class="img-square m-b">
            <!-- <img alt="사진" src="images/${list.pic}" class="img-circle m-b"> -->
            	</div>
            <div>
            	<div class="row" style="display: inline-block; margin-left: 100px;">
            		<h4>사번</h4>
            		<span>${ list.emp_no }</span>
            		<br>
            		<br>
            		<h4>연락처</h4>
            		<span style="display: inline-block;">${ list.cell_phone }</span>
            	</div>
            	<div class="row" style="display: inline-block; margin-left: 100px;">
            		<h4>근무상태</h4>
            		<span>${ list.cg_name }</span>
            		<br>
            		<br>
            		<h4>생년월일</h4>
            		<span style="display: inline-block;">${ list.birth }</span>
            	</div>
           	</div>
            </div>
            <div class="panel-footer dragarea" style="display: none; height: 200px;">
                <h3>권한</h3>
                <c:forEach var="authority" items="${ list.rolelist }">
            		${ authority.role_exp } <br>
            	</c:forEach>
            </div>
        </div>
    </div>
</div>
</c:forEach>
</div>