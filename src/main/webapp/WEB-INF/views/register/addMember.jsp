<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- <div class="back-link">
<a href="Test_MainLanding_View.jsp" class="btn btn-primary">Back to Dashboard</a>
</div>-->
	<div class="container">
		<div class="heading">
			<div class="register-container">
				<div class="row">
					<div class="col-md-12">
						<div class="text-center m-b-md" style="color:gray">
							<h3>회원가입</h3>
							<small>ToInfra 의 다양한 기능을 느껴보세요!</small>
						</div>
						
						<div class="hpanel">
							<div class="panel-body">
								<form action="#" id="loginForm" method="post">
									<div class="row">
										<%--
										<div class="form-group col-lg-12">
											<label style="color: black;">사번 확인</label>

											<div class="input-group">
												<input type="text" value="" id="emp_no" class="form-control" name="emp_no"> 
												<span class="input-group-btn" id="numchkmsg">
													<input type="button" class="btn btn-success " id="numchk" value="사번 확인">
												</span> 										
											</div>
											<span id="numchkresult" style="color: blue;"></span>
										</div>
										--%>
										<div class="form-group col-lg-12">
											<label style="color: black;">ID</label>
											<div class="input-group">
												<input type="text" value="" id="userid" class="form-control" name="userid">
												<span class="input-group-btn">
													<input type="button" class="btn btn-success " id="idchk" value="중복 체크">
												</span> 										
											</div>
											<span id="idchkresult" style="color: blue;"></span>
										</div>
										
										<div class="form-group col-lg-6">
											<label style="color: black;">Password</label> 
											<input type="password" value="" id="pwd" class="form-control" name="pwd">
										</div>
										<div class="form-group col-lg-6">
											<label style="color: black;">Repeat Password</label> <input
												type="password" value="" id="pwdchk" class="form-control" name="pwdchk">
										</div>
										<%--
										<div class="form-group col-lg-12">
											<label style="color: black;">주소</label>
											<div class="input-group">
												<input type="text" id="sample6_postcode" name="postcode" class="form-control" placeholder="우편번호">
												<span class="input-group-btn">
													<input type="button" onclick="sample6_execDaumPostcode()" class="btn btn-success "  value="우편번호 찾기">
												</span> 										
											</div>
											<div class="row">
											<br>
											<div class=" col-lg-6">
												<input type="text" id="sample6_address"  name="addr" class="form-control"  placeholder="기본주소">
											</div>
											<div class=" col-lg-6">
												<input type="text" id="sample6_address2" name="addr_detail" class="form-control"  placeholder="상세주소">
											</div> 

											</div>
										</div>
										--%>
										<div class="form-group col-lg-12">
											<label style="color: black;">E-mail</label>
											<div class="row">
											<div class="col-lg-12">
												<input type="text" value="${registerGoogleMail}" id="email" class="form-control" name="email">
											</div>
											</div>
										</div>
										
										<div class="form-group col-lg-12">
											<label style="color: black;">계좌번호</label> 
											<div class="row">
											<div class=" col-lg-6">
												<select class="form-control" name="bank">
													<option value="국민">국민</option>
													<option value="신한">신한</option>
													<option value="기업">기업</option>
													<option value="SC은행">SC은행</option>
													<option value="우체국">우체국</option>
													<option value="농협">농협</option>
												</select>
											</div>
											<div class=" col-lg-6">
												<input type="text" value="" id="account" class="form-control" name="account">
											</div>
											<input type="hidden" value="${registerGoogleId}" name="googleapiid">
											</div>
										</div>						
									</div>
									<div class="text-center">
										<input type="submit" class="btn btn-success" value="Register">
										<button class="btn btn-default">Cancel</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>