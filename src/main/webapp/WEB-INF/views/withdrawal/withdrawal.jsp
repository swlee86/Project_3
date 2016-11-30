<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
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
                    <li><a href="index.html">홈</a></li>
                    <li>
                        <span>회원 정보 관리</span>
                    </li>
                    <li class="active">
                        <span>회원 탈퇴</span>
                    </li>
                </ol>
            </div>
            <h2 class="font-light m-b-xs">
                	회원 탈퇴
            </h2>
            <small>&nbsp;&nbsp;회원 탈퇴를 요청 할 수 있습니다</small>
        </div>
    </div>
</div>


<div class="content animate-panel">
	<div class="row">
		<div class="col-lg-12">
			<div class="hpanel">
				<div class="panel-body">
					<form class="form-horizontal">
 						<div class="row">
							
							<div class="form-group col-lg-12">
								<label class="col-sm-3 control-label" style="text-align: right;">사번</label>
								<div class="col-sm-7">
									<input type="text" class="form-control" readonly="readonly" value="${ emp_no }">
								</div>
							</div>
							
							<div class="form-group col-lg-12">
								<label class="col-sm-3 control-label" style="text-align: right;">아이디</label>
								<div class="col-sm-7">
									<input type="text" class="form-control" readonly="readonly" value="${ id }">
								</div>
							</div>
							
							<div class="form-group col-lg-12">
								<label class="col-sm-3 control-label" style="text-align: right;">비밀번호확인</label>
								<div class="col-sm-7">
									<input type="password" name="pwd" class="form-control" placeholder="*********">
								</div>
							</div>
						</div>
						
						<div class="text-center">
 								<button class="btn btn-success" data-toggle="modal" data-target="#myModal" id="withdrawal">탈퇴하기</button>
 
 								<button class="btn btn-default" style="margin-left: 10px;">취소하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Modal -->
<div class="modal fade hmodal-success" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog  modal-sm">
		<div class="modal-content">
			<div class="color-line"></div>
			<div class="modal-header text-center">
		 		<big>탈퇴를 요청하시겠습니까?</big>
		 	</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-success" id="withdrawalOk">탈퇴 요청</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>

<!-- <div class="heading-image animate-panel" data-child="img-animate" data-effect="fadeInRight" style="height: 100%;"></div>
 -->