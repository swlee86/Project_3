
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--  
	작성일 : 2016-12-06
	작성자 : 백승아
	사용 목적 : 전자결재 수신함 뷰
-->

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
                            <span>결재 수신함</span>
                        </li>
                    </ol>
                </div>
                <h2 class="font-light m-b-xs">
                    	결재 수신함
                </h2>
                <small>&nbsp;&nbsp; 수신한 결재 문서들을 확인할 수 있습니다</small>
            </div>
        </div>
    </div>

<div class="content animate-panel">

<div class="row" >
<div class="col-lg-12">

<form action="">
<div class="hpanel">
    <div class="panel-body">
        <span class="form-inline" style="width: 10%;">
        	<font size="4" style="vertical-align: middle;">검색 기준</font> 
        	<span id="inputSpan" style="width: 50%; margin-left: 3%">
        		<input class="form-control" type="text">
        		<span class="form-control" style="margin-left: -10px;">
        			<i class="pe-7s-search" style="font-size: 22px;"></i>
        		</span>
        	</span>
        </span>
    </div>
</div>
</form>


<!-- 대외 발신 공문 -->
<div class="hpanel forum-box">
    <div class="panel-heading">
                <div class="pull-right" style="width: 35%;">
                	<span style="display: inline-block; width: 50%; text-align: right;">
                		수신처
            		</span>
            		<span style="display: inline-block; width: 24%; text-align: right;">
                		기안자
            		</span>
            		<span style="display: inline-block; width: 24%; text-align: right;">
                		승인 결과
            		</span>
                </div>
        대외 발신 공문(${ officecount })
    </div>

	<c:forEach var="office" items="${ officelist }">
    <div class="panel-body">
        <div class="row">
        <c:if test="${ officecount == 0 }">
        	<div class=""> 대외 발신 공문 수신 내역이 없습니다 </div>
        </c:if>
        <c:if test="${ officecount != 0 }">
        	<div class="col-md-6 forum-heading">
				<div class="desc" style="margin-bottom: 10px; margin-left: 1%;">
                	${ office.draft_date } 
           	 	</div>
            	<div style="margin-left: 2%;">
                	<a href="office_detail.do?draft_no=${ office.draft_no }&"><h4> ${ office.draft_title } </h4></a>
            	</div>
            </div>
            <div class="col-md-4 forum-info" style="margin-top: 7px;">
                <span style="display: block; font-weight: 550; font-size: 18px;"> ${ office.rec_place } </span>
                <small>${ office.rec_addr }</small>
            </div>
            <div class="col-md-1 forum-info" style="margin-top: 7px;">
                <span style="display: block; font-weight: 550; font-size: 18px;"> ${ office.emp_name } </span>
                <small>${ office.emp_no }</small>
            </div>
            <div class="col-md-1 forum-info" style="margin-top: 7px;">
                <span style="display: block; margin-right: 10%; margin-top: -5px;">
                	<c:choose>
                		<c:when test="${ office.step_no == '1' }">
                			<button class="btn btn-info btn-circle" style="width: 48px; height: 48px;"> 승인 </button>
                		</c:when>
                		<c:when test="${ office.step_no == '2' }">
                			<button class="btn btn-danger btn-circle" style="width: 48px; height: 48px;"> 반려 </button>
                		</c:when>
                		<c:when test="${ office.step_no == '3' }">
                			<button class="btn btn-primary2 btn-circle" style="width: 48px; height: 48px;"> 보류 </button>
                		</c:when>
                		<c:when test="${ office.step_no == '4' }">
                			<button class="btn btn-warning2 btn-circle" style="width: 48px; height: 48px;"> 미승인 </button>
                		</c:when>
                	</c:choose>
                </span>
            </div>
        </c:if>
        </div>
    </div>
	</c:forEach>
</div>


<!-- 협조문 -->
<div class="hpanel forum-box">
    <div class="panel-heading">
    	<div class="pull-right" style="width: 35%;">
    		<span style="display: inline-block; width: 50%; text-align: right;">
    			수신 부서
    		</span>
    		<span style="display: inline-block; width: 24%; text-align: right;">
    			기안자
    		</span>
            <span style="display: inline-block; width: 24%; text-align: right;">
                              승인 결과
            </span>
    	</div>
        협조문(${ cooperationcount })
    </div>

	<c:forEach var="cooper" items="${ cooperationlist }">
    <div class="panel-body">
        <div class="row">
        <c:if test="${ cooperationcount == 0 }">
        	<div class=""> 협조문 수신 내역이 없습니다 </div>
        </c:if>
        <c:if test="${ cooperationcount != 0 }">
        	<div class="col-md-8 forum-heading">
				<div class="desc" style="margin-bottom: 10px; margin-left: 1%;"> 
					${ cooper.draft_date }
           	 	</div>
            	<div style="margin-left: 2%;">
                	<a href="cooperation_detail.do?draft_no=${ cooper.draft_no }"><h4> ${ cooper.draft_title } </h4></a>
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
            <div class="col-md-1 forum-info" style="margin-top: 7px;">
                <span style="display: block; margin-right: 10%; margin-top: -5px;">
                	<c:choose>
                		<c:when test="${ cooper.step_no == '1' }">
                			<button class="btn btn-info btn-circle" style="width: 48px; height: 48px;"> 승인 </button>
                		</c:when>
                		<c:when test="${ cooper.step_no == '2' }">
                			<button class="btn btn-danger btn-circle" style="width: 48px; height: 48px;"> 반려 </button>
                		</c:when>
                		<c:when test="${ cooper.step_no == '3' }">
                			<button class="btn btn-primary2 btn-circle" style="width: 48px; height: 48px;"> 보류 </button>
                		</c:when>
                		<c:when test="${ cooper.step_no == '4' }">
                			<button class="btn btn-warning2 btn-circle" style="width: 48px; height: 48px;"> 미승인 </button>
                		</c:when>
                	</c:choose>
                </span>
            </div>
        </c:if>
        </div>
    </div>
	</c:forEach>
</div>


<!-- 휴가 신청서 -->
<div class="hpanel forum-box">
    <div class="panel-heading">
		<div class="pull-right" style="width: 35%;">
			<span style="display: inline-block; width: 50%; text-align: right;">
				휴가기간 
			</span> 
			<span style="display: inline-block; width: 24%; text-align: right;">
				기안자 
			</span>
            <span style="display: inline-block; width: 24%; text-align: right;">
               	승인 결과
            </span>
		</div>
	휴가신청서(${ breakcount })
	</div>

	<c:forEach var="br" items="${ breaklist }">
    <div class="panel-body">
        <div class="row">
        <c:if test="${ breakcount == 0 }">
        	<div class=""> 휴가 신청서 수신 내역이 없습니다 </div>
        </c:if>
        <c:if test="${ breakcount != 0 }">
        	<div class="col-md-8 forum-heading">
				<div class="desc" style="margin-bottom: 10px; margin-left: 1%;"> 	
                	${ br.draft_date }
           	 	</div>
            	<div style="margin-left: 2%;">
                	<a href="break_detail.do?draft_no=${ br.draft_no }"><h4> ${ br.draft_title } </h4></a>
            	</div>
            </div>
            <div class="col-md-2 forum-info" style="margin-top: 7px;">
                <span style="display: block; font-weight: 550; font-size: 18px;"> ${ br.break_cg_name } </span>
                <small>${ br.break_term } 일</small>
            </div>
            <div class="col-md-1 forum-info" style="margin-top: 7px;">
                <span style="display: block; font-weight: 550; font-size: 18px;"> ${ br.emp_name } </span>
                <small>${ br.emp_no }</small>
            </div>
            <div class="col-md-1 forum-info" style="margin-top: 7px;">
                <span style="display: block; margin-right: 10%; margin-top: -5px;">
                	<c:choose>
                		<c:when test="${ br.step_no == '1' }">
                			<button class="btn btn-info btn-circle" style="width: 48px; height: 48px;"> 승인 </button>
                		</c:when>
                		<c:when test="${ br.step_no == '2' }">
                			<button class="btn btn-danger btn-circle" style="width: 48px; height: 48px;"> 반려 </button>
                		</c:when>
                		<c:when test="${ br.step_no == '3' }">
                			<button class="btn btn-primary2 btn-circle" style="width: 48px; height: 48px;"> 보류 </button>
                		</c:when>
                		<c:when test="${ br.step_no == '4' }">
                			<button class="btn btn-warning2 btn-circle" style="width: 48px; height: 48px;"> 미승인 </button>
                		</c:when>
                	</c:choose>
                </span>
            </div>
        </c:if>
        </div>
    </div>
	</c:forEach>
</div>
</div>
</div>
</div>