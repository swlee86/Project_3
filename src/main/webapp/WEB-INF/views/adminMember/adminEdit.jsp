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
                        <span>사원 관리</span>
                    </li>
                    <li class="active">
                        <span>사원 정보 수정</span>
                    </li>
                </ol>
            </div>
            <h2 class="font-light m-b-xs">
                	사원 정보 수정
            </h2>
            <small>&nbsp;&nbsp;사원 정보를 수정 할 수 있습니다^^</small>
        </div>
    </div>
</div>


<div class="content animate-panel">
	<div class="row">
		<div class="col-lg-12">
			<div class="hpanel">
				<div class="panel-body">
					<form class="form-horizontal" method="POST" id="modifyForm">
 						<div class="row">
							<div class="form-group col-lg-12">
								<label class="col-sm-3 control-label" style="text-align: right;">사원번호</label>
								<div class="col-sm-7">
									<input type="text" class="form-control" readonly="readonly" id="emp_no" name="emp_no" value="${detail.emp_no}">
								</div>
							</div>

							<div class="form-group col-lg-12">
								<label class="col-sm-3 control-label" style="text-align: right;">부서</label>
								<div class="col-sm-7">
									<input type="text" readonly="readonly" class="form-control" name="dept_name" value="${detail.dept_name}">
								</div>
							</div>
							
							<div class="form-group col-lg-12">
								<label class="col-sm-3 control-label" style="text-align: right;">이름</label>
								<div class="col-sm-7">
									<input type="text" class="form-control"  readonly="readonly" name="emp_name" value="${detail.emp_name}">
								</div>
							</div>
							
							<div class="form-group col-lg-12">
								<label class="col-sm-3 control-label" style="text-align: right;">아이디</label>
								<div class="col-sm-7">
									<input type="text" class="form-control" readonly="readonly" name="id" value="${detail.id}">
								</div>
							</div>
							

							
							
							<div class="form-group col-lg-12">
								<label class="col-sm-3 control-label" style="text-align: right;">주소</label>
								<div class="col-sm-7">
									<div class="input-group">
										<input type="text" id="sample6_postcode" class="form-control" placeholder="" value="${detail.postcode}"  name="postcode">
										<span class="input-group-btn">
											<input type="button" onclick="sample6_execDaumPostcode()" class="btn btn-success "  value="우편번호 찾기">
										</span> 			
									</div>							
								</div>
								<br/>
								<div class="col-sm-3"></div>
								<div class=" col-sm-4">
									<input type="text" id="sample6_address"  class="form-control"  placeholder="기본주소" name="addr" value="${detail.addr}">
								</div>
								<div class=" col-sm-3">
									<input type="text" id="sample6_address2"  class="form-control"  placeholder="상세주소" name="addr_detail"  value="${detail.addr_detail}" >
								</div>
							</div>
							
							<div class="form-group col-lg-12">
								<label class="col-sm-3 control-label" style="text-align: right;">연락처</label>
								<div class="col-sm-7">
									<input type="text" class="form-control" name="cell_phone" id="cell_phone" value="${detail.cell_phone}"  >
								</div>
							</div>
							
							<div class="form-group col-lg-12">
								<label class="col-sm-3 control-label" style="text-align: right;">이메일</label>
								<div class="col-sm-7">
									<input type="email" class="form-control"  placeholder="example@gmail.com" name="email" id="email"  value="${detail.email}" >
								</div>
							</div>
							
							<div class="form-group col-lg-12">
								<label class="col-sm-3 control-label" style="text-align: right;">은행</label>
								<div class="col-sm-7">
									<select class="form-control" name="bank" id="bank">
											<option >선택</option> 
											<option value="국민" <c:if test="${detail.bank=='국민'}">selected</c:if> >국민</option>
											<option value="신한" <c:if test="${detail.bank=='신한'}">selected</c:if> >신한</option>
											<option value="기업" <c:if test="${detail.bank=='기업'}">selected</c:if> >기업</option>
											<option value="SC은행" <c:if test="${detail.bank=='SC은행'}">selected</c:if> >SC은행</option>
											<option value="우체국" <c:if test="${detail.bank=='우체국'}">selected</c:if> >우체국</option>
											<option value="농협" <c:if test="${detail.bank=='농협'}">selected</c:if> >농협</option>
									</select>
								</div>
							</div>
							
							<div class="form-group col-lg-12">
								<label class="col-sm-3 control-label" style="text-align: right;">계좌번호</label>
								<div class="col-sm-7">
									<input type="text" class="form-control"  placeholder="123456-22-123456" name="account"  value="${detail.account}" id="account">
								</div>
							</div>
							
							근무상태 : ${detail.cg_name}<Br>
							직위명 : ${detail.position_name}<Br>
							하위부서명:${detail.low_dept_name}<Br>
							부서명 : ${detail.dept_name}<Br>
							지점 : ${detail.branch_name}<Br>
							휴일수 : ${detail.emp_break}<Br>
							연봉 : ${detail.salary}<Br>
							생년월일${detail.birth}<Br>
							이미지 : ${detail.pic}<Br>
							<c:if test="${not empty detail.emp_tel}">연락처 : ${detail.emp_tel}</c:if> 

						</div>
						
						
						<div class="text-center">
								<button class="btn btn-success">수정하기</button>
								<button class="btn btn-default">취소하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="heading-image animate-panel" data-child="img-animate" data-effect="fadeInRight" style="height: 100%;"></div>
