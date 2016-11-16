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
							<small>2PM 의 다양한 기능을 느껴보세요!</small>
						</div>
						
						<div class="hpanel">
							<div class="panel-body">
								<form action="#" id="loginForm">
									<div class="row">
										<div class="form-group col-lg-12">
											<label style="color: black;">사번 확인</label>
											<div class="input-group">
												<input type="text" value="" id="emp_no" class="form-control" name=""> 
												<span class="input-group-btn">
													<input type="button" class="btn btn-success " id="numchk" value="사번 확인">
												</span> 										
											</div>
											<span id="chkresult" style="color: blue;"></span>
										</div>
																			
										<div class="form-group col-lg-12">
											<label style="color: black;">ID</label>
											<div class="input-group">
												<input type="text" value="" id="userid" class="form-control" name=""> 
												<span class="input-group-btn">
													<input type="button" class="btn btn-success " id="idchk" value="중복 체크">
												</span> 										
											</div>
											<span id="chkresult" style="color: blue;"></span>
										</div>
										
										<div class="form-group col-lg-6">
											<label style="color: black;">Password</label> <input
												type="password" value="" id="" class="form-control" name="">
										</div>
										<div class="form-group col-lg-6">
											<label style="color: black;">Repeat Password</label> <input
												type="password" value="" id="" class="form-control" name="">
										</div>
										<div class="form-group col-lg-6">
											<label style="color: black;">Email Address</label> <input
												type="email" value="" id="" class="form-control" name="">
										</div>
										<div class="form-group col-lg-6">
											<label style="color: black;">Repeat Email Address</label> <input
												type="email" value="" id="" class="form-control" name="">
										</div>
										
										<div class="form-group col-lg-12">
											<label style="color: black;">주소</label>
											<div class="input-group">
												<input type="text" id="sample6_postcode" class="form-control" placeholder="우편번호">
												<span class="input-group-btn">
													<input type="button" onclick="sample6_execDaumPostcode()" class="btn btn-success "  value="우편번호 찾기">
												</span> 										
											</div>
											<div class="row">
											<br>
											<div class=" col-lg-6">
												<input type="text" id="sample6_address"  class="form-control"  placeholder="기본주소">
											</div>
											<div class=" col-lg-6">
												<input type="text" id="sample6_address2"  class="form-control"  placeholder="상세주소">
											</div> 

											</div>
										</div>
										
										<div class="form-group col-lg-12">
											<label style="color: black;">계좌번호</label> 
											<div class="row">
											<div class=" col-lg-6">
												<select class="form-control" >
													<option>국민</option>
													<option>신한</option>
													<option>기업</option>
													<option>SC은행</option>
													<option>우체국</option>
													<option>농협</option>
												</select>
											</div>
											<div class=" col-lg-6">
												<input type="text" value="" id="" class="form-control" name="">
											</div>
											</div>
										</div>						
									</div>
									<div class="text-center">
										<button class="btn btn-success">Register</button>
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