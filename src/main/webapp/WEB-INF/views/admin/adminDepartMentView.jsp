<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>		
<!--관리자 부서관리 페이지-->
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
				<li><span>부서관리</span></li>
				<li><a href="adminDownDepartment.do">부서 관리</a></li>
			   </ol>
			</div>
			<h2 class="font-light m-b-xs"><i onclick="location.href='adminDepartWidget.do'" class="fa fa-chevron-circle-left"></i>&nbsp;&nbsp;부서 관리</h2>
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
								<select id="selectbranch" class="form-control" onchange="departMentFuc()">
									<option>선택</option>
									<c:forEach var="list" items="${branchList}">
										<option value="${list.branch_name}">${list.branch_name}</option>
									</c:forEach>
								</select> 
								<br /> 
								<label class="form-control">부서 선택</label> 
								 <select class="form-control" id="selectDept">
								</select> <br /> 
								<input type="button" class="btn btn-success" id="seeDeptBtn" value="조회">
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
									<h2>부서 등록</h2>
							</div>

							<div class="panel-body">

								<form class="form-horizontal">
									<label class="form-control">지점 선택</label> 
									<select class="form-control" id="choosebranch">
										<option>선택</option>
											<c:forEach var="list" items="${branchList}">
												<option value="${list.branch_name}">${list.branch_name}</option>
											</c:forEach>
									</select> <br />
									<div class="col-md-4"></div>
									<div class="col-md-4">
										<input type="button" class="btn btn-success" id="addDepartmentBtn" value="부서 등록">
									</div>
								</form>
							</div>
							<div class="panel-footer"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-7">
			<div class="hpanel">
				<div class="v-timeline vertical-container animate-panel"
					data-child="vertical-timeline-block" data-delay="1">
					<div class="vertical-timeline-block">
						<div class="vertical-timeline-icon navy-bg">
							<i class="fa fa-calendar"></i>
						</div>
						<div class="vertical-timeline-content">
							<div class="p-sm">
								<h2>부서 정보(조회, 수정)</h2>
							</div>

							<div class="panel-body">
								<form class="form-horizontal">
								  <input type="hidden" id="hiddept_no">
								  <input type="hidden" id="hidbranch_no">
								  <input type="hidden" id="hidbranch_name">
									<div class="form-group">
										<div class="col-md-3">
											<label>지점명</label>
										</div>
										<div class="col-md-9">
											<input type="text" class="form-control" id="branch_name" name="branch_name" readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-3">
											<label>부서명</label>
										</div>
										<div class="col-md-9">
											<input type="text" class="form-control" id="dept_name" name="dept_name"  readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-3">
											<label>상여금 지급 비율</label>
										</div>
										<div class="col-md-9">
											<input type="text" class="form-control" id="bonus_percent" name="bonus_percent" readonly="readonly">
										</div>
									</div>
						    		
										<div class="col-md-offset-4 col-md-2">
											<input type="button" class="btn btn-success" id="modifyDeptBtn" value="수정">
										</div>
									
										<div class="col-md-2">
											<input type="button" class="btn btn-success" id="deleteDeptBtn" value="삭제">
										</div>
									

								</form>
							</div>
							<div class="panel-footer"></div>
						</div>
					</div>
					
					<!--등록-->
					<div class="vertical-timeline-block" id="addDepartmentDiv">
						<div class="vertical-timeline-icon navy-bg">
							<i class="fa fa-calendar"></i>
						</div>
						<div class="vertical-timeline-content">
							<div class="p-sm">
								<h2>부서 등록</h2>
							</div>

							<div class="panel-body">
								<form class="form-horizontal">
								  	<div class="form-group">
										<div class="col-md-3">
											<label>지점명</label>
										</div>
										<div class="col-md-9">
											<input type="text" id="addbranch_name" class="form-control">
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-3">
											<label>부서명</label>
										</div>
										<div class="col-md-9">
											<input type="text" id="adddept_name" class="form-control">
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-3">
											<label>상여금 지급 비율</label>
										</div>
										<div class="col-md-9">
											<input type="text" id="addbonus_percent" class="form-control">
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-offset-2 col-md-6">
											<input type="button" id="insertDeptBtn" class="btn btn-success" value="등록">
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