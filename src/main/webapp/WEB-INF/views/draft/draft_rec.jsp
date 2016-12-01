<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 여기 animated 들어갔는데 변경할 부분 있으면 수정하자 -->
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
                        <li>
                            <span>전자 결재</span>
                        </li>
                        <li class="active">
                            <span>결재 대기함</span>
                        </li>
                    </ol>
                </div>
                <h2 class="font-light m-b-xs">
                    	결재 대기함
                </h2>
                <small>&nbsp;&nbsp; 승인 대기 중인 결재 문서들을 확인할 수 있습니다</small>
            </div>
        </div>
    </div>

<div class="content animate-panel">

<div class="row" >
<div class="col-lg-12">

<div class="hpanel">
    <div class="panel-body">
        <span class="form-inline" style="width: 10%;">
        	<font size="4" style="vertical-align: middle;">검색기준</font> 
        	<span id="inputSpan" style="width: 50%; margin-left: 3%;">
        		<input class="form-control" type="text">
        		<!-- <span class='input-group-addon' style='color:#fd7d86'><i class='pe-7s-search'></i></span> -->
        	</span>
        </span>
    </div>
</div>


<div class="hpanel forum-box">
    <div class="panel-heading">
                <div class="pull-right" style="width: 25%;">
                	<span style="display: inline-block; width: 65%; text-align: right;">
                		수신처
            		</span>
            		<span style="display: inline-block; width: 33%; text-align: right;">
                		기안자
            		</span>
                </div>
        대외 발신 공문(${ officecount })
    </div>

	<c:forEach var="office" items="${ officelist }">
    <div class="panel-body">
        <div class="row">
        	<div class="col-md-9 forum-heading">
				<div class="desc" style="margin-bottom: 10px; margin-left: 1%;"> 
					<c:if test="${ office.rec_date == null }">
            		<span class="label label-success pull-left" style="margin-right: 5px;">New</span>
            		</c:if>
                		${ office.draft_date } 
           	 	</div>
            	<div style="margin-left: 2%;">
                	<a href="forum_details.html"><h4> ${ office.draft_title } </h4></a>
            	</div>
            </div>
            <div class="col-md-2 forum-info" style="margin-top: 7px;">
                <span style="display: block; font-weight: 550; font-size: 18px;"> ${ office.rec_place } </span>
                <small>${ office.rec_addr }</small>
            </div>
            <div class="col-md-1 forum-info" style="margin-top: 7px;">
                <span style="display: block; font-weight: 550; font-size: 18px;"> ${ office.emp_name } </span>
                <small>${ office.emp_no }</small>
            </div>
        </div>
    </div>
	</c:forEach>
</div>


<div class="hpanel forum-box">
    <div class="panel-heading">
    	<div class="pull-right" style="width: 25%;">
    		<span style="display: inline-block; width: 65%; text-align: right;">
    			수신 부서
    		</span>
    		<span style="display: inline-block; width: 33%; text-align: right;">
    			기안자
    		</span>
    	</div>
        협조문(${ cooperationcount })
    </div>

	<c:forEach var="cooper" items="${ cooperationlist }">
    <div class="panel-body">
        <div class="row">
        	<div class="col-md-9 forum-heading">
				<div class="desc" style="margin-bottom: 10px; margin-left: 1%;"> 
					<c:if test="${ cooper.rec_date == null }">
            		<span class="label label-warning pull-left" style="margin-right: 5px;">New</span>
            		</c:if>
                		${ cooper.draft_date } 
           	 	</div>
            	<div style="margin-left: 2%;">
                	<a href="forum_details.html"><h4> ${ cooper.draft_title } </h4></a>
            	</div>
            </div>
            <div class="col-md-2 forum-info" style="margin-top: 7px;">
                <span style="display: block; font-weight: 550; font-size: 18px;"> ${ cooper.low_dept_name } </span>
                <small>${ cooper.branch_name } ${ cooper.dept_name }</small>
            </div>
            <div class="col-md-1 forum-info" style="margin-top: 7px;">
                <span style="display: block; font-weight: 550; font-size: 18px;"> ${ cooper.emp_name } </span>
                <small>${ cooper.emp_no }</small>
            </div>
        </div>
    </div>
	</c:forEach>
</div>

<div class="hpanel forum-box">
    <div class="panel-heading">
		<div class="pull-right" style="width: 25%;">
			<span style="display: inline-block; width: 65%; text-align: right;">
				휴가기간 
			</span> 
			<span style="display: inline-block; width: 33%; text-align: right;">
				기안자 
			</span>
		</div>
	휴가신청서(${ breakcount })
	</div>

	<c:forEach var="break" items="${ breaklist }">
    <div class="panel-body">
        <div class="row">
        	<div class="col-md-9 forum-heading">
				<div class="desc" style="margin-bottom: 10px; margin-left: 1%;"> 
					<c:if test="${ break.rec_date }">
            		<span class="label label-info pull-left" style="margin-right: 5px;">New</span>
            		</c:if>
                		${ break.draft_date } 
           	 	</div>
            	<div style="margin-left: 2%;">
                	<a href="forum_details.html"><h4> ${ break.draft_title } </h4></a>
            	</div>
            </div>
            <div class="col-md-2 forum-info" style="margin-top: 7px;">
                <span style="display: block; font-weight: 550; font-size: 18px;"> ${ break.break_cg_name } </span>
                <small>${ break.break_term } 일</small>
            </div>
            <div class="col-md-1 forum-info" style="margin-top: 7px;">
                <span style="display: block; font-weight: 550; font-size: 18px;"> ${ break.emp_name } </span>
                <small>${ break.emp_no }</small>
            </div>
        </div>
    </div>
	</c:forEach>
</div>

</div>
</div>
</div>