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
                        <span>아이디 찾기</span>
                    </li>
                </ol>
            </div>
            <h2 class="font-light m-b-xs">
                	아이디 찾기
            </h2>
            <small>아이디를 찾을 수 있습니다</small>
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
									<label class="col-md-12 control-label" style="text-align: center;">
									<i class="fa pe-7s-search fa-3x"></i> &nbsp;&nbsp;&nbsp;
									 	입력하신 정보와 일치하는 아이디입니다.
									</label>
								</div>
								
								<div class="col-md-offset-5 col-md-2">
									<input type="text" class="form-control" readonly="readonly" placeholder="찾은아이디">
								</div>
						</div>	
								
							
						
						 <br><br><br><br><br>
						<div class="form-group col-lg-12 text-center" >
								<a class="btn btn-success" href="findPw.do">비밀번호 찾기</a>
								<a class="btn btn-default" href="login.do">로그인하기</a>
						</div>
						
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="heading-image animate-panel" data-child="img-animate" data-effect="fadeInRight" style="height: 100%;"></div>
