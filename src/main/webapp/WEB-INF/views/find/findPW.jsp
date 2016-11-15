<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
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
                        <span>로그인</span>
                    </li>
                    <li class="active">
                        <span>비밀번호 찾기</span>
                    </li>
                </ol>
            </div>
            <h2 class="font-light m-b-xs">
                	비밀번호 찾기
            </h2>
            <small>비밀번호를 찾을 수 있습니다</small>
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
								<label class="col-md-4 control-label" style="text-align: right;">사번</label>
								<div class="col-md-5">
									<input type="text" class="form-control" placeholder="사번">
								</div>
							</div>

							<div class="form-group col-lg-12">
								<label class="col-md-4 control-label" style="text-align: right;">아이디</label>
								<div class="col-md-5">
									<input type="text" class="form-control"  placeholder="아이디">
								</div>
							</div>
							
							<div class="form-group col-lg-12">
								<label class="col-md-4 control-label" style="text-align: right;">부서번호</label>
								<div class="col-md-5">
									<input type="text" class="form-control"  placeholder="부서번호">
								</div>
							</div>
						
						</div>
						
						<div class="text-center" >
								<a class="btn btn-success" href="findPW_Result.do">비밀번호 찾기</a>
								<a class="btn btn-default" href="login.do">취소하기</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="heading-image animate-panel" data-child="img-animate" data-effect="fadeInRight" style="height: 100%;"></div>
