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
					<form class="form-horizontal " method="POST" id="modifyForm">
 						<div class="row" style="Text-align:center">
							<div class="row">
							<Table border="1">
								<c:if test="${not empty detail.pic}">
								<Tr>
									<Td colspan="6">
										<img alt="사진" name="pic"  style="width:100px;height:100px;" src="${pageContext.request.contextPath}/img/upload/${detail.pic}" class="img-circle m-b">
									</Td>
								</Tr>
								</c:if>
								
								<Tr>
									<Td style="text-align: right;">사 원 번 호 </Td>
									<td><input type="text" class="form-control input-sm" readonly="readonly" id="emp_no" name="emp_no" value="${detail.emp_no}"></td>
									<Td style="text-align: right;">이 름 </Td>
									<td><input type="text" class="form-control"  readonly="readonly" name="emp_name" value="${detail.emp_name}"></td>
									<Td style="text-align: right;">직 위 명 </Td>
									<td><input type="text" class="form-control" readonly="readonly" name="position_name" value="${detail.position_name}"></td>
								</Tr>
								<Tr>
									<Td style="text-align: right;">부 서 명 </Td>
									<td><input type="text" readonly="readonly" class="form-control" name="dept_name" value="${detail.dept_name}"></td>
									<Td style="text-align: right;">지 점 명 </Td>
									<td><input type="text" class="form-control"  readonly="readonly" name="branch_name" value="${detail.branch_name}"></td>
									<Td style="text-align: right;">하위 부서명</Td>
									<td><input type="text" class="form-control" readonly="readonly" name="low_dept_name" value="${detail.low_dept_name}"></td>
								</Tr>
						
								<tr>
									<Td style="text-align: right;">근무 상태 </Td>
									<td><input type="text" class="form-control" readonly="readonly" name="cg_name" value=" ${detail.cg_name}"></td>
									<Td style="text-align: right;">휴 일 수</Td>
									<td><input type="text" class="form-control" readonly="readonly" name="emp_break" value=" ${detail.emp_break}"></td>
									<Td style="text-align: right;">연 봉 </Td>
									<td><input type="text" class="form-control" readonly="readonly" name="salary" value=" ${detail.salary}"></td>
								</tr>
								
								<Tr>
									<Td style="text-align: right;">아 이 디 </Td>
									<td><input type="text" class="form-control" readonly="readonly" name="id" value="${detail.id}"></td>
									<Td style="text-align: right;">생년월일 </Td>
									<td><input type="text" class="form-control"  readonly="readonly" name="birth" value="${detail.birth}"></td>
									<Td style="text-align: right;">연락처 </Td>
									<td><input type="text" class="form-control" name="cell_phone" id="cell_phone" value="${detail.cell_phone}"></td>
								</Tr>
								
								<Tr>							
									<Td style="text-align: right;">주소 </Td>
									<td>
										<div class="input-group">
										<input type="text" id="sample6_postcode" readonly class="form-control" placeholder="" value="${detail.postcode}"  name="postcode">
										<span class="input-group-btn">
											<input type="button" onclick="sample6_execDaumPostcode()" class="btn btn-success "  value="우편번호 찾기">
										</span> 			
									</div>
									</td> 				
									<td <c:if test="${not empty detail.emp_tel}">colspan="1"</c:if>	><input type="text" id="sample6_address"  class="form-control" readonly placeholder="기본주소" name="addr" value="${detail.addr}"></td>
									<Td <c:if test="${not empty detail.emp_tel}">colspan="1"</c:if>	><input type="text" id="sample6_address2"  class="form-control"  readonly placeholder="상세주소" name="addr_detail"  value="${detail.addr_detail}" ></Td>
									<c:if test="${not empty detail.emp_tel}">
										<Td style="text-align: right;">연락처 2</Td>
										<td><input type="text" class="form-control" readonly="readonly" name="id" value=" ${detail.emp_tel}"></td>
									</c:if> 
								</Tr>
								<tr>
									<Td style="text-align: right;">이 메 일 </Td>
									<td><input type="email" class="form-control"  readonly placeholder="example@gmail.com" name="email" id="email"  value="${detail.email}" ></td>
									<Td style="text-align: right;">은 행 </Td>
									<td>
										<select class="form-control" name="bank" id="bank" disabled="disabled">
											<option >선택</option> 
											<option value="국민" <c:if test="${detail.bank=='국민'}">selected</c:if> >국민</option>
											<option value="신한" <c:if test="${detail.bank=='신한'}">selected</c:if> >신한</option>
											<option value="기업" <c:if test="${detail.bank=='기업'}">selected</c:if> >기업</option>
											<option value="SC은행" <c:if test="${detail.bank=='SC은행'}">selected</c:if> >SC은행</option>
											<option value="우체국" <c:if test="${detail.bank=='우체국'}">selected</c:if> >우체국</option>
											<option value="농협" <c:if test="${detail.bank=='농협'}">selected</c:if> >농협</option>
										</select>
									</td>
									<Td style="text-align: right;">계좌번호 </Td>
									<td><input type="text" class="form-control"  readonly placeholder="123456-22-123456" name="account"  value="${detail.account}" id="account"></td>
								</tr>	
							</Table>	
					
							</div>

						

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
