<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="normalheader transition animated fadeIn media-body">
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
					<li><span>관리자</span></li>
					<li class="active"><span>사원 탈퇴</span></li>
				</ol>
			</div>
			<h2 class="font-light m-b-xs">사원 탈퇴 요청</h2>
			<small>&nbsp;&nbsp;탈퇴를 요청한 사원에 대해 승인처리할 수 있습니다^^</small>
		</div>
	</div>
</div>

<div class="content animate-panel">
<div class="row">
    <div class="col-lg-4">
        <div class="hpanel hgreen" id="detail_panel" style="visibility: hidden;">
            <div class="panel-body">
                <img alt="logo" class="img-circle m-b m-t-md" id="pic">
                <div class="pull-right" style="padding-top: 50px; padding-right: 50px;">
               		<h2 id="emp_name"></h2>
               		<div class="text-muted font-bold m-b-xs" id="emp_no"></div>
                </div>
                <br>
                <h5>소속</h5>
                <p id="attach">
                </p>
            </div>
            <div class="panel-body">
                <dl>
                	<br>
                    <dt>개인 연락처</dt>
                    <dd id="cell_phone"></dd>
                    <br>
                    <dt>사내 연락처</dt>
                    <dd id="emp_tel"></dd>
                </dl>
            </div>
            <div class="panel-footer contact-footer">
                <div class="row">
                    <div class="col-md-4 border-right">
                        <div class="contact-stat"><span>연봉</span> <strong id="salary"></strong></div>
                    </div>
                    <div class="col-md-4 border-right">
                        <div class="contact-stat"><span>입사일</span> <strong id="regdate"></strong></div>
                    </div>
                    <div class="col-md-4">
                        <div class="contact-stat"><span>생년월일</span> <strong id="birth"></strong></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="col-lg-8">
        <div class="hpanel">
            <div class="hpanel">
            <div class="tab-content">
                <div id="tab-1" class="tab-pane active">
                    <div class="panel-body">
                        <strong>탈퇴를 요청한 사원</strong>
                        
                        <hr style="border:2px solid gray; margin-bottom:0px">
                        <div class="table-responsive">
                            <table class="table table-striped table-hover">
                                <thead>
                                <tr>
                                    <th>사원번호</th>
                                    <th>지점</th>
                                    <th>부서</th>
                                    <th>하위부서</th>
                                    <th>직위</th>
                                    <th>이름</th>
                                    <td>&nbsp;</td>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="wlist" items="${ withdrawal }">
                                	<tr style="cursor: pointer;" class="trClick">
                                    	<td>${ wlist.emp_no }</td>
                                    	<td>${ wlist.branch_name }</td>
                                    	<td>${ wlist.dept_name }</td>
                                    	<td>${ wlist.low_dept_name }</td>
                                    	<td>${ wlist.position_name }</td>
                                    	<td>${ wlist.emp_name }</td>
                                    	<td><button class="btn btn-outline deleteBtn btn-danger2">삭제</button></td>
                                	</tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            </div>
        </div>
    </div>
</div>
</div>