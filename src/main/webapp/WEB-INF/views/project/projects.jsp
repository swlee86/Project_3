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
					<li><span>프로젝트 상세보기</span></li>S
					<li><a href="projects.do">진행중인 프로젝트(1.내가 하고있는 것만 ) (2.내가 속한 부서의 프로젝트)</a></li>
				</ol>
			</div>
			<h2 class="font-light m-b-xs">진행중인 프로젝트</h2>
			<small>부서에서 진행 중인 프로젝트를 확인하실 수 있습니다</small>
		</div>
	</div>
</div>
<div class="content animate-panel">
	
		<div class="row projects">
			<c:forEach var="i" items="${pjdlist}" step="1">
			 	<div class="col-lg-6">
					<div class="hpanel hgreen">
						<div class="panel-body">
							<!--프로젝트 상세 히든 번호-->
							<input type="hidden" class="hiddenValue" value="${i.pjd_no}"> 
							<span class="label label-success pull-right" style="margin-top: -5px;">NEW</span>
							<div class="row">
								<div class="col-sm-8">
									<div class="row">
										<div class="col-sm-4">
											<h4 class="projectName">${i.pjd_title}</h4>
										</div>
										<div class="col-sm-4">
											<h4 class="makeUser">${i.emp_name}</h4>
										</div>
									</div>
		
		
									<br />
		
									<div class="row">
										<div class="col-sm-4">
											<div class="project-label">시작일</div>
											<small>${i.pjd_start}</small>
										</div>
										<div class="col-sm-4">
											<div class="project-label">종료일</div>
											<small>${i.pjd_end}</small>
										</div>
										<div class="col-sm-4">
											<div class="project-label">PROGRESS</div>
											<div class="progress m-t-xs full progress-small">
												<div style="width: 12%" aria-valuemax="100" aria-valuemin="0"
													aria-valuenow="12" role="progressbar"
													class=" progress-bar progress-bar-success"></div>
											</div>
										</div>
									</div>
									<br />
									<p style="height: 36px;">${i.pjd_content}</p>
								</div>
		
								<div class="col-sm-4 project-info">
									<div class="project-value" style="margin-top: 5px;">
										<small>참여자</small>
									</div>
									<br />
									<div class="project-people">
										<c:forEach var="j" items="${peopleList[i.rownum-1]}">
											<a href="" data-toggle="modal" data-target="#myModal" id="pjdmodal_${j.emp_no}" class="selectpeople">
												<img alt="logo" class="img-circle" src="${j.pic}"></a>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
						<div class="panel-footer">
						<div style="text-align:right">
							<button class="btn btn-sm btn-success" onclick="detailProjectCheckList(this)" style="padding-right:15px;padding-left:15px;font-weight:600;font-size:13px">
								<a class="btn w-xs btn-success btn-block" href="projectdetail_detailview.do?pjd_no=${i.pjd_no}">상세보기</a>
							</button>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>				
	</div>
</div>


<!--이미지 클릭시 뜨는 모달 페이지-->
<div class="modal fade hmodal-success" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog  modal-sm">
		<div class="modal-content">
			<div class="color-line"></div>
			<div class="modal-header text-center">
		 	<h4 class="modal-title"><img alt="logo" id="m_img" class="img-circle m-b" src="images/a3.jpg" style="width: 82px;height: 82px;"></h4> <br>
				<font class="font-bold" size="2em">
					<font style="color:gray;" id="m_name"></font><br>
					<font style="color:#9d9fa2" id="m_dept"></font> <br>
					<font style="color:gray;" id="m_cell"></font>
				</font>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default btn-sm" data-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary btn-sm demo2">주소록 등록</button>
			</div>
		</div>
	</div>
</div>
<!-- 
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="color-line"></div>
			<div class="modal-header">
				<h4 class="modal-title">정보보기</h4>
			</div>
			<div class="modal-body">
			<form method="post" class="form-horizontal text-center">				
				<div class="form-group">
					<label class="control-label col-sm-4">아이디  </label>
					<div class="col-sm-6">
						<input type="text" name="id" class="form-control">
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-4 control-label">이름 </label>
					<div class="col-sm-6">
						<input type="text" placeholder="placeholder" class="form-control">
					</div>
                </div>
				
				<div class="form-group">
					<label class="col-sm-4 control-label">부서 </label>
					<div class="col-sm-6">
						<input type="text" placeholder="placeholder" class="form-control">
					</div>
                </div>
				
				<div class="form-group">
					<label class="col-sm-4 control-label">직급 </label>
					<div class="col-sm-6">
						<input type="text" placeholder="placeholder" class="form-control">
					</div>
                </div>
				
			</form>
			
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

 -->
