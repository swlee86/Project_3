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
                <span class="pull-right">
                    <i class="fa fa-clock-o"> </i> ${ officecount } 개의 결재 문서가 있습니다
                </span>
        대외 발신 공문
    </div>

	<c:forEach var="office" items="${ officelist }">
	
    <div class="panel-body">
        <div class="row">

            <div class="col-md-10 forum-heading">

                <span class="label label-success pull-left">new</span>
                <a href="forum_details.html"><h4> ${ office.draft_title } </h4></a>
                <div class="desc"> ${ office.draft_date } </div>
            </div>
            <div class="col-md-1 forum-info">
                <span class="number"> ${ office.rec_place } </span>
                <small>Views</small>
            </div>
            <div class="col-md-1 forum-info">
                <span class="number"> ${ office.emp_no } </span>
                <small>Posts</small>
            </div>
        </div>
    </div>
    
	</c:forEach>
</div>


<div class="hpanel forum-box">

    <div class="panel-heading">
                <span class="pull-right">
                    <i class="fa fa-clock-o"> </i> ${ cooperationcount } 개의 결재 문서가 있습니다
                </span>
	협조문
    </div>

	<c:forEach var="coo" items="${ cooperationlist }">

    <div class="panel-body">
        <div class="row">
            <div class="col-md-10 forum-heading">
                <span class="label label-warning pull-left">New</span>
                <a href="forum_details.html" >
                    <h4>${ coo.draft_title }</h4>
                </a>
                <div class="desc">${ coo.draft_date }</div>
            </div>
            <div class="col-md-1 forum-info">
                <span class="number"> ${ coo.low_dept_no } </span>
                <small>Views</small>
            </div>
            <div class="col-md-1 forum-info">
                <span class="number"> ${ coo.emp_no } </span>
                <small>Posts</small>
            </div>
        </div>
    </div>

	</c:forEach>
</div>


<div class="hpanel forum-box">

    <div class="panel-heading">
                <span class="pull-right">
                    <i class="fa fa-clock-o"> </i> ${ breakcount } 개의 결재 문서가 있습니다
                </span>
	휴가 신청서
    </div>

	<c:forEach var="break" items="${ breaklist }">

    <div class="panel-body">
        <div class="row">
            <div class="col-md-10 forum-heading">
                <span class="label label-info pull-left">new</span>
                <a href="forum_details.html" >
                	<h4>${ break.draft_title }</h4>
                </a>
                <div class="desc"> ${ break.draft_date }</div>
            </div>
            <div class="col-md-1 forum-info">
                <span class="number"> ${ break.break_term } </span>
                <small>Views</small>
            </div>
            <div class="col-md-1 forum-info">
                <span class="number"> ${ break.emp_no } </span>
                <small>Posts</small>
            </div>
        </div>
    </div>
    
    </c:forEach>
</div>


</div>
</div>
</div>