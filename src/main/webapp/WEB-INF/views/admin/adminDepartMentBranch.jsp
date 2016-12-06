<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!--회사 지점 페이지-->
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
					<li><span>부서 관리</span></li>
					<li class="active"><span>지점 관리</span></li>
				</ol>
			</div>
			<h2 class="font-light m-b-xs"><i onclick="location.href='adminDepartWidget.do'" class="fa fa-chevron-circle-left"></i>&nbsp;&nbsp;지점 관리</h2>
		</div>
	</div>
</div>
<div class="content">
	<div class="row">
		<div class="col-md-5">
			<div class="hpanel">
				<div class="v-timeline vertical-container animate-panel"
					data-child="vertical-timeline-block" data-delay="1">
					<div class="vertical-timeline-block">
						<div class="vertical-timeline-icon navy-bg">
							<i class="fa fa-calendar"></i>
						</div>
						<div class="vertical-timeline-content">
							<div class="p-sm">
								<h2>조회</h2>
							</div>

							<div class="panel-body">
								<label class="form-control">지점 선택</label>
								 <select class="form-control" id="departMentselectBranch">
									<option>선택</option>
									<c:forEach var="list" items="${branchList}">
										<option value="${list.branch_name}">${list.branch_name}</option>
									</c:forEach>
								</select>
								<br/>
								
								<input type="button" class="btn btn-success" id="seeBranchBtn" value="조회">
							</div>
							<div class="panel-footer"></div>
						</div>
					</div>

					<div class="vertical-timeline-block">
						<div class="vertical-timeline-icon navy-bg">
							<i class="fa fa-calendar"></i>
						</div>
						<div class="vertical-timeline-content">
							<div class="p-sm">
								<h2>지점 등록</h2>
							</div>

							<div class="panel-body">
								
								<br/>
								<form class="form-horizontal">	
									<div class="col-md-10"></div>
									<div class="col-md-2">
										<input type="button" class="btn btn-default" id="addBrunchBtn" value="지점 추가">
									</div>
								</form>
							</div>
							<div class="panel-footer">
								
							</div>
						</div>
					</div>
					
				</div>
			</div>
		</div>
		<div class="col-md-1">
		
		</div>
		<div class="col-md-6">
			<div class="hpanel">
				<div class="v-timeline vertical-container animate-panel"
					data-child="vertical-timeline-block" data-delay="1">
					<!--조회-->
					<div class="vertical-timeline-block">
						<div class="vertical-timeline-icon navy-bg">
							<i class="fa fa-calendar"></i>
						</div>
						<div class="vertical-timeline-content">
							<div class="p-sm">
							   <h2>지점 정보(조회, 수정)</h2>
							</div>

							<div class="panel-body">
								<form class="form-horizontal">
								  <input type="hidden" id="hidden" name="branch_no">
								  <input type="hidden" id="hiddenBranchName" name="notChange_branch_Name">
								   <div class="form-group">
										<div class="col-md-4">
											<label>지점명</label>
										</div>
										<div class="col-md-8">
											<input type="text" class="form-control" readonly="readonly" id="branchName2" name="branch_name">
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-4">
											<label>우편번호</label>
										</div>
										<div class="col-md-8">
										  <div class="input-group">
											<input type="text" class="form-control" readonly="readonly" id="sample6_re_postcode" name="postcode">
											<span class="input-group-btn">
											  <input type="button" onclick="sample6_execDaumPostcode2()" class="btn btn-success "  value="우편번호 찾기">
											</span> 
										  </div>	
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-4">
											<label>기존주소</label>
										</div>
										<div class="col-md-8">
											<input type="text" class="form-control" readonly="readonly" id="sample6_re_address" name="addr">
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-4">
											<label>상세주소</label>
										</div>
										<div class="col-md-8">
											<input type="text" class="form-control" readonly="readonly" id="sample6_re_address2" name="addr_detail">
										</div>
									</div>
									
										<div class="col-md-offset-4 col-md-2">
											<input type="button" class="btn btn-success" id="modifyBranchsubmitBtn" value="수정">
										</div>
									    <div class="col-md-2">
											<input type="button" class="btn btn-success" id="deleteBranchsubmitBtn" value="삭제">
										</div>
									
								</form>
							</div>
							<div class="panel-footer"></div>
						</div>
					</div>
					
					<!--등록-->
					<div class="vertical-timeline-block" id="addBrunchDiv">
						<div class="vertical-timeline-icon navy-bg">
							<i class="fa fa-calendar"></i>
						</div>
						<div class="vertical-timeline-content">
							<div class="p-sm">
									<h2>지점 등록</h2>
							</div>

							<div class="panel-body">
								<form class="form-horizontal">
									<div class="form-group">
										<div class="col-md-4">
											<label>지점명</label>
										</div>
										<div class="col-md-8">
											<input type="text" class="form-control" id="addbranchName" name="branch_name">
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-4">
											<label>우편번호</label>
										</div>
										<div class="col-md-8">
										  <div class="input-group">
											<input type="text" class="form-control" id="sample6_postcode" name="postcode">
											<span class="input-group-btn">
											  <input type="button" onclick="sample6_execDaumPostcode()" class="btn btn-success "  value="우편번호 찾기">
											</span> 
										  </div>
										</div>	
										
									</div>
									<div class="form-group">
										<div class="col-md-4">
											<label>기존주소</label>
										</div>
										<div class="col-md-8">
											<input type="text" class="form-control"id="sample6_address" name="addr">
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-4">
											<label>상세주소</label>
										</div>
										<div class="col-md-8">
											<input type="text" class="form-control" id="sample6_address2" name="addr_detail">
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-offset-2 col-md-6">
											<input type="button" class="btn btn-success" id="addBranchsubmitBtn" value="등록">
										</div>
									</div>
									
								</form>
							</div>
							<div class="panel-footer"></div>
						</div>
					</div>
			    </div>
			</div>
		</div>
	</div>
</div>
