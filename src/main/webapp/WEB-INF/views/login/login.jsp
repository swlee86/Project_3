<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<header id="page-top">
		<div class="container">
			<div class="heading">

				<div class="login-container">
					<div class="row">
						<div class="col-md-12">
							<div class="text-center m-b-md">
								<h3>로그인</h3>
								<small>WelCome 2pm! 
									<c:if test="${param.error != null}">
										<div>
											로그인실패<br>
											<c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null}">
       										이유 : <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />
											</c:if>
										</div>
									</c:if>
								</small>
							</div>
							<div class="hpanel">
								<div class="panel-body">
									<form action="${pageContext.request.contextPath}/login" id="loginForm" method="POST">
										<div class="form-group">
											<label class="control-label" for="username" style="color: black;">아이디</label> <input
												type="text" placeholder="example@gmail.com"
												title="Please enter you username" required="" value=""
												name="username" id="username" class="form-control">
											<span class="help-block small">Your unique username to
												app</span>
										</div>
										<div class="form-group">
											<label class="control-label" for="password" style="color:black;">비밀번호</label> <input
												type="password" title="Please enter your password"
												placeholder="******" required="" value="" name="password"
												id="password" class="form-control"> <span
												class="help-block small">Yur strong password</span>
										</div>
										<div class="checkbox">
											<input type="checkbox" class="i-checks" checked> 
												<label style="color: black;">로그인상태 유지</label>
											<p class="help-block small">(if this is a private
												computer)</p>
										</div>
										<input type="submit" class="btn btn-success btn-block" value="로그인" id="loginSubmitBtn"> 
										<a class="btn btn-default btn-block" href="addMember.do">회원가입</a>
										<label class="control-label" for="find" style="text-align:center"><a href="findIdPw.do">아이디 / 비밀번호 찾기</a></label>
									</form>
								</div>
							</div>
						</div>
					</div>
			</div>
		</div>
	</div>
	</header>
	<div class="heading-image animate-panel" data-child="img-animate" data-effect="fadeInRight" style="height: 100%;"></div>
