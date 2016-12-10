<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--프로젝트 상세 카드형식-->
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
					<li><a href="index.do">홈</a></li>
					<li><span>프로젝트 관리</span></li>
					<li class="active"><span>상세 프로젝트</span></li>
				</ol>
			</div>
			<h2 class="font-light m-b-xs">상세 프로젝트</h2>
			<small>진행 중인 프로젝트의 상세 내용을 확인하실 수 있습니다</small>
		</div>
	</div>
</div>
<div class="content animate-panel normalheader transition animated fadeIn media-body">
	<c:set var="count" value="0"/><!-- count 사용이유 : 2개씩 쌍으로 이루어 br로 한줄 띄우려고 -->
	<div class="row projects">
		<c:forEach var="i" items="${pjdlist}" step="1">
			<c:set var="count" value="${count+1}" />
			<div class="col-lg-6">
				<c:if test="${count%2==1 && count!=1}">
					<br>
				</c:if>
				<div class="hpanel hgreen">
					<div class="panel-body">
						<!--프로젝트 상세 히든 번호-->
						<input type="hidden" class="hiddenValue" value="${i.pjd_no}"> 
						<div class="row">
							<div class="col-sm-10">
								<div class="row">
									<div class="col-sm-4">
										<h4 class="projectName">${i.pjd_title}</h4>
									</div>
									<div class="col-sm-4">
										<h4 class="makeUser">${i.emp_name}</h4>
									</div>
								</div>
								<br/>
		
								<div class="row">
									<div class="col-sm-3">
										<div class="project-label">시작일</div>
											<small>${i.pjd_start}</small>
									</div>
									<div class="col-sm-3">
										<div class="project-label">종료일</div>
											<small>${i.pjd_end}</small>
									</div>
									<div class="col-sm-3">
										<div class="project-label">진행률</div>
										<div class="progress m-t-xs full progress-small">
											<c:if test="${i.pjd_progress !=0 }">
												<div style="width: ${i.pjd_progress}%"   aria-valuemax="100" aria-valuemin="0"
													aria-valuenow="${i.pjd_progress}" role="progressbar"
													class=" progress-bar progress-bar-success" ></div>
											</c:if>
										</div>
									</div>
									<div class="col-sm-3">
										<div class="project-label">진행단계</div>
										<div style="padding-top: 5px;">
											<c:if test="${i.pj_step_name=='진행'}">
												<span class="label label-success">&nbsp;&nbsp;진&nbsp;&nbsp;&nbsp;&nbsp;행&nbsp;&nbsp;</span>
											</c:if>
											<c:if test="${i.pj_step_name=='미진행'}">
												<span class="label label-info">&nbsp;미&nbsp;진&nbsp;행&nbsp;</span>
											</c:if>
											<c:if test="${i.pj_step_name=='완료'}">
												<span class="label label-default">&nbsp;&nbsp;완&nbsp;&nbsp;&nbsp;&nbsp;료&nbsp;&nbsp;</span>
											</c:if>
											<c:if test="${i.pj_step_name=='중단'}">
												<span class="label label-danger">&nbsp;&nbsp;중&nbsp;&nbsp;&nbsp;&nbsp;단&nbsp;&nbsp;</span>
											</c:if>
											<c:if test="${i.pj_step_name=='보류'}">
												<span class="label label-warning">&nbsp;&nbsp;보&nbsp;&nbsp;&nbsp;&nbsp;류&nbsp;&nbsp;</span>
											</c:if>
										</div>
									</div>
								</div>
								<br/>
								<p style="height: 36px;">${i.pjd_content}</p>
							</div>
		
							<div class="col-sm-2 project-info">
								<div class="project-value" style="margin-top: 5px;">
									<div class="project-label">참여자</div>
								</div>
								<br/>
								<div class="project-people">
									<c:forEach var="j" items="${peopleList[i.rownum-1]}">
										<a href="" data-toggle="modal" data-target="#myModal" id="pjdmodal_${j.emp_no}" class="selectpeople">
										<img alt="logo" class="img-circle" src="${pageContext.request.contextPath}/img/upload/${j.pic}"></a>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
					<div class="panel-footer">
						<div style="text-align:right">
							<a class="btn btn-success btn-sm" href="projectdetail_detailview.do?pjd_no=${i.pjd_no}" style="padding-right:15px;padding-left:15px;font-weight:600;font-size:13px">상세보기</a>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>				
	</div>
</div>

<!-- modal창 -->
<div class="modal fade hmodal-success" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog  modal-sm">
		<div class="modal-content">
			<div class="color-line"></div>
			<div class="modal-header text-center">
				<h4 class="modal-title">
					<img alt="logo" class="img-circle m-b"  id="m_img" src="${pageContext.request.contextPath}/img/upload/images/a3.jpg" style="width: 82px; height: 82px;">
				</h4>
				<br> <font class="font-bold" size="2em"> <font style="color: gray;" id="m_name"></font><br> 
				<font style="color: #9d9fa2" id="m_dept"></font> 
				<br> 
				<font style="color: gray;" id="m_cell"></font>
				</font>
			</div>
			<div class="modal-footer">
				<form id="contact" method="post">
					<input type="hidden" name="emp_no" id="h_emp_no">
					<input type="hidden" name="name" id="h_emp_name">
					<input type="hidden" name="attach" id="h_emp_attach">
					<input type="hidden" name="tel1" id="h_emp_tel1">
					<input type="hidden" name="tel2" id="h_emp_tel2">
					<input type="hidden" name="birth" id="h_emp_birth">
					<input type="hidden" name="pic" id="h_emp_pic">
					<input type="hidden" name="mail" id="h_emp_mail">
				<button type="button" class="btn btn-default btn-sm"data-dismiss="modal">닫기</button>
				<button type="submit" class="btn btn-primary btn-sm demo2">주소록 등록</button>
				</form>
			</div>
		</div>
	</div>
</div>
