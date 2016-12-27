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
					<div class="row" style="Text-align:center">
						<form class="form-horizontal " method="post" id="modifyForm" >
							<Table class="table table-condensed table-bordered" border="1">
								<c:if test="${not empty detail.pic}">
									<Tr>
										<Td rowspan="4">
											<img alt="사진" name="pic"  style="width:150px;height:150px;text-align:center" src="${pageContext.request.contextPath}/img/upload/${detail.pic}" class="img-square m-b">
										</Td>
									</Tr>
								</c:if>
								
								<Tr>
									<Td style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">사 원 번 호 </Td>
									<td>${detail.emp_no}</td>
									<Td style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">이 름 </Td>
									<td><input type="text" name="emp_name" value="${detail.emp_name}"></td>
									<Td style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">직 위 명 </Td>
									<td>${detail.position_name}</td>
								</Tr>
								
								<Tr>
									<Td style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">부 서 명 </Td>
									<td>${detail.dept_name}</td>
									<Td style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">지 점 명 </Td>
									<td>${detail.branch_name}</td>
									<Td style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">하위 부서명</Td>
									<td>${detail.low_dept_name}</td>
								</Tr>
						
								<tr>
									<Td style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">근무 상태 </Td>
									<td>${detail.cg_name}</td>
									<Td style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">휴 일 수</Td>
									<td><input style="text-align: center;" type="text" name="emp_break" value="${detail.emp_break}">일</td>
									<Td style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">연 봉 </Td>
									<td><input style="text-align: center;" type="text" name="salary" value="${detail.salary}">만원</td>
								</tr>
								
								<Tr>
									<c:if test="${not empty detail.pic}">
										<td></td>
									</c:if>
									<Td style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">아 이 디 </Td>
									<td>${detail.id}</td>
									<Td style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">생년월일 </Td>
									<td><input style="text-align: center;" type="text" name="birth" value="${detail.birth}"></td>
									<Td style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">연락처 </Td>
									<td><input style="text-align: center;" type="text" name="cell_phone" value="${detail.cell_phone}"></td>
								</Tr>
								
								<Tr>
									<c:if test="${not empty detail.pic}">
										<td></td>
									</c:if>							
									<Td style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">주소 </Td>
									<td>
										${detail.postcode}
									</td> 				
									<td colspan="2">${detail.addr} </td>
									<Td colspan="2"	>${detail.addr_detail}</Td> 
								</Tr>
								
								<tr>
									<c:if test="${not empty detail.pic}">
										<td></td>
									</c:if>
									<Td style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">이 메 일 </Td>
									<td>${detail.email}</td>
									<Td style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">은 행 </Td>
									<td>
										 ${detail.bank}
									</td>
									<Td style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">계좌번호 </Td>
									<td><input style="text-align: center;" type="text" name="account" value="${detail.account}"></td>
								</tr>	
							
							<c:if test="${not empty detail.emp_tel}">
								<tr>
									<c:if test="${not empty detail.pic}">
										<td></td>
									</c:if>
									<Td style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">연락처 2</Td>
									<td>${detail.emp_tel}</td>
									<td colspan="4"> </td>
								</tr>
							</c:if>
							</Table>	
							<br>
							<div class="row">
								<div class="text-center">
										<button class="btn btn-success">수정 하기</button>&nbsp;&nbsp;&nbsp;&nbsp;
										<button type="button" class="btn btn-default">취소 하기</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="heading-image animate-panel" data-child="img-animate" data-effect="fadeInRight" style="height: 100%;"></div>
