<!--
	작성자 : 박성준
	작성일 : 2016-12-06
	목  적 : 탈퇴 리스트 보는 페이지
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					<li class="active"><span>사원 탈퇴 관리</span></li>
				</ol>
			</div>
			<h2 class="font-light m-b-xs">사원 탈퇴 리스트 보기</h2>
			<small>&nbsp;&nbsp;탈퇴 요청한 사원 리스트</small>
		</div>
	</div>
</div>

<div class="content animate-panel">
<div class="row">
    <div class="col-lg-4">
        <div class="hpanel hgreen">
            <div class="panel-body">
                <div class="pull-right text-right">
                	<h4>상세 정보</h4>
                </div>
                <img alt="logo" class="img-circle m-b m-t-md" src="images/profile.jpg">
                <br/>	
                <span class="detailSpan">사번 : 111</span><br/>
                <span class="detailSpan">이름 : 테스트</span><br/>
                <span class="detailSpan">직위 : 부서장</span><br/>
                <span class="detailSpan">부서 : 개발</span><br/>
                <span class="detailSpan">부서번호 : 027772222</span><br/>
                <span class="detailSpan">연락처 : 01011112222</span><br/>
                <span>사내 연락처 : </span>
                
                <div class="text-muted font-bold m-b-xs"></div>
            </div>
        </div>
    </div>
    <div class="col-lg-8">
        <div class="hpanel">
            <div class="hpanel">

            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#tab-1">탈퇴리스트</a></li>
            </ul>
            <div class="tab-content">
                <div id="tab-1" class="tab-pane active">
                    <div class="panel-body">
						<strong>탈퇴 요청한 사원 리스트 보기</strong>
						<br/>
						<small>이름을 클릭하시면 정보를 볼 수 있습니다!</small>
						<br/><br/>
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
	                                <tr>	
	                                	<th><input type="checkbox" id="allCheck" 
											name="Allcheckbox" style="width:20px; height:20px;"></th>
	                                	<th>사번</th>
	                                	<th>이름</th>
	                                	<th>사내 연락처</th>
	                                	<th/>
	                                </tr>
					            </thead>
                                <tbody>
                                	<tr>
                                		<td><input type="checkbox" 
											name="checkBox" style="width:20px; height:20px;"></td>
                                		<td>111</td>
                                		<td>홍길동</td>
                                		<td>010-111-2222</td>
                                		<td style="text-align: right;"><input type="button" class="btn btn-success" value="상세보기">
                                	</tr>
                                </tbody>
							</table>
						</div>
						<div class="col-md-offset-11 col-md-1">
								<input type="button" class="btn btn-danger2" value="승인" style="margin-left: -10px;">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
</div>

    
    
    
