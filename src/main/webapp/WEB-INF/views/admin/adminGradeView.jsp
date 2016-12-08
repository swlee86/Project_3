<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
//var positionArray = new Array();
</script>
<!--직위 관리 페이지-->
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
					<li><a href="index.do">Dashboard</a></li>
					<li><span>Tables</span></li>
					<li class="active"><span>DataTables</span></li>
				</ol>
			</div>
			<h2 class="font-light m-b-xs">직위 관리</h2>
			<small>직위 정보 등록</small>
		</div>
	</div>
</div>

<div class="content animate-panel">
	<div class="row">

		<div class="col-lg-6">
			<div class="hpanel">
				<div class="v-timeline vertical-container animate-panel"
					data-child="vertical-timeline-block" data-delay="1">
					<div class="vertical-timeline-block">
						<div class="vertical-timeline-icon navy-bg">
							<i class="fa fa-inbox"></i>
						</div>
						<div class="vertical-timeline-content">
							<h4>직위 추가</h4>
							<hr/>
							<form class="form-horizontal" method="POST">
								<div class="form-group">
									<div class="col-md-offset-1 col-md-3">
										<label>이름 </label>
									</div>
									<div class="col-md-5">
										<input type="text" class="form-control" id="positionName">
									</div>
									<div class="col-md-2"></div>
									<div class="col-md-2"></div>
								</div>
								<div class="form-group">
									<div class="col-md-offset-1 col-md-3">
										<label>기본급여</label>
									</div>
									<div class="col-md-5">
										<input type="text" class="form-control" id="basic_pay">
									</div>
									<div class="col-md-4"></div>
								</div>
								<div class="form-group">
									<div class="col-md-offset-1 col-md-3">
										<label>추가급여</label>
									</div>
									<div class="col-md-5">
										<input type="text" class="form-control" id="add_pay">
									</div>
									<div class="col-md-4"></div> 
								</div>
								
								<div class="form-group">
									<div class="col-md-offset-5 col-md-2">
											<input type="button" class="btn btn-default " id="addBtn" value="직위추가">
									</div>
								</div>
								
								<div class="panel-footer"></div>
							</form>

						</div>
					</div>
				</div>
			</div>
			
			<div class="hpanel">
				<div class="v-timeline vertical-container animate-panel"
					data-child="vertical-timeline-block" data-delay="1">
					<div class="vertical-timeline-block">
						<div class="vertical-timeline-icon navy-bg">
							<i class="fa fa-inbox"></i>
						</div>
						<div class="vertical-timeline-content">
							<h4>직위 정보 조회</h4>
							<hr/>
							<form class="form-horizontal" action="positionModify.do" id="modifyForm">
								<div class="form-group">
									
									<div class="col-md-offset-4 col-md-5"id="selectPosition">
										<select class="form-control" onchange="selectPosition();">
												<option>선택</option>
											<c:forEach var="list" items="${positionList}">
												<option value='${list.position_no}'>${list.position_name}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group">
									<div class="col-md-offset-1 col-md-3">
										<label>이름 </label>
									</div>
									<div class="col-md-5">
										<input type="text" class="form-control" id="dbpositionName" name="position_name">
									</div>
									<div class="col-md-2"></div>
									<div class="col-md-2"></div>
								</div>
								<div class="form-group">
									<div class="col-md-offset-1 col-md-3">
										<label>기본급여</label>
									</div>
									<div class="col-md-5">
										<input type="text" class="form-control" id="dbbasic_pay" name="basic_pay">
									</div>
									<div class="col-md-4"></div>
								</div>
								<div class="form-group">
									<div class="col-md-offset-1 col-md-3">
										<label>추가급여</label>
									</div>
									<div class="col-md-5">
										<input type="text" class="form-control" id="dbadd_pay" name="add_pay">
									</div>
									<div class="col-md-4"></div>
								</div>
								<div class="col-sm-offset-5 col-sm-2">
									<input type="submit" class="btn btn-default" value="정보수정">
								</div>
								<br/><br/><br/>
								<div class="panel-footer"></div>
								<input type="hidden" name="set_date" id="set_date">
								<input type="hidden" name="position_no" id="position_no">
								<input type="hidden" name="step" id="step">
							</form>

						</div>
					</div>
				</div>
			</div>
			
		</div>
		<div class="col-lg-6">
			<div class="hpanel">
				<div class="v-timeline vertical-container animate-panel"
					data-child="vertical-timeline-block" data-delay="1">
					<div class="vertical-timeline-block">
						<div class="vertical-timeline-icon navy-bg">
							<i class="fa fa-inbox"></i>
						</div>
						<div class="vertical-timeline-content">
							<div class="form-group" style="height: 650px;">
									<h4>직위 리스트 보기</h4>
								<hr />
								
								<div class="infont col-md-6">
									<div class="col-md-offset-3 col-md-2">
										<input type="button" class="btn btn-default" id="saveBtn" value="저장">
									</div>
									<br/><br/>
									<ul id="sortable">
										<c:forEach var="list" items="${positionList}">
										<li class='gradLi' value='${list.position_name}'>
											<i class="fa fa-thumbs-o-up"></i>${list.position_name}
											<button class='btn btn-danger2' onclick="deleteli(this);">Delete</button>
										</li>
										</c:forEach>
										
									</ul>
								</div>
							</div>
							<div class="panel-footer"></div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
</div>
<!-- <input type="hidden" id="hidin"> -->
<script>

	/* var jsonInfo = JSON.stringify(positionArray); */
	
	/* document.getElementById('hidin').value = jsonInfo; */
</script>