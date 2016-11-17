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
					<li><a href="index.html">Dashboard</a></li>
					<li><span>App views</span></li>
					<li class="active"><span>Calendar</span></li>
				</ol>
			</div>
			<h2 class="font-light m-b-xs">지점 관리</h2>
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
								<span class="vertical-date pull-right"> Saturday <br />
									<small>12:17:43 PM</small>
								</span>
								<h2>조회</h2>
							</div>

							<div class="panel-body">
								<label class="form-control">지점 선택</label>
								 <select class="form-control" id="selectBranch">
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
								<span class="vertical-date pull-right"> Saturday <br />
									<small>12:17:43 PM</small>
								</span>
								<h2>지점 등록</h2>
							</div>

							<div class="panel-body">
								
								<br/>
								<form class="form-horizontal">	
									<div class="col-md-10"></div>
									<div class="col-md-2">
										<input type="button" class="btn btn-default" value="지점 추가">
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
								<span class="vertical-date pull-right"> Saturday <br />
									<small>12:17:43 PM</small>
								</span>
								<h2>지점 정보(조회, 수정)</h2>
							</div>

							<div class="panel-body">
								<form class="form-horizontal">
									<div class="form-group">
										<div class="col-md-4">
											<label>지점명</label>
										</div>
										<div class="col-md-8">
											<input type="text" class="form-control" readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-4">
											<label>우편번호</label>
										</div>
										<div class="col-md-8">
											<input type="text" class="form-control" readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-4">
											<label>우편번호</label>
										</div>
										<div class="col-md-8">
											<input type="text" class="form-control" readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-4">
											<label>기존주소</label>
										</div>
										<div class="col-md-8">
											<input type="text" class="form-control" readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-4">
											<label>상세주소</label>
										</div>
										<div class="col-md-8">
											<input type="text" class="form-control" readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-offset-2 col-md-6">
											<input type="submit" class="btn btn-success" value="수정">
										</div>
									</div>
									
								</form>
							</div>
							<div class="panel-footer"></div>
						</div>
					</div>
					
					<!--등록-->
					<div class="vertical-timeline-block">
						<div class="vertical-timeline-icon navy-bg">
							<i class="fa fa-calendar"></i>
						</div>
						<div class="vertical-timeline-content">
							<div class="p-sm">
								<span class="vertical-date pull-right"> Saturday <br />
									<small>12:17:43 PM</small>
								</span>
								<h2>지점 등록</h2>
							</div>

							<div class="panel-body">
								<form class="form-horizontal">
									<div class="form-group">
										<div class="col-md-4">
											<label>지점명</label>
										</div>
										<div class="col-md-8">
											<input type="text" class="form-control">
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-4">
											<label>우편번호</label>
										</div>
										<div class="col-md-8">
											<input type="text" class="form-control">
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-4">
											<label>우편번호</label>
										</div>
										<div class="col-md-8">
											<input type="text" class="form-control">
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-4">
											<label>기존주소</label>
										</div>
										<div class="col-md-8">
											<input type="text" class="form-control">
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-4">
											<label>상세주소</label>
										</div>
										<div class="col-md-8">
											<input type="text" class="form-control">
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-offset-2 col-md-6">
											<input type="submit" class="btn btn-success" value="등록">
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
