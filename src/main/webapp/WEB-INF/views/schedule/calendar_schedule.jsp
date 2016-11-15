<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<h2 class="font-light m-b-xs">일정보기</h2>
			<input type="button" class="btn btn-success" value="일정추가" id="addScheduleBtn">
		</div>
	</div>
</div>

<div class="content">
	<div class="row">
		<div class="col-lg-12">
				<div class="hpanel">
					<div class="panel-heading">
						<div class="panel-tools">
							<a class="showhide"><i class="fa fa-chevron-up"></i></a> <a
								class="closebox"><i class="fa fa-times"></i></a>
						</div>
						Calendar
					</div>
					<div class="panel-body">
						<div id="calendar"></div>
					</div>
				</div>
			</div>
		</div>
	
</div>


<!--모달 입니다.-->
<div id="myModal" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">일정 등록</h4>
			</div>
			<div class="modal-body">
				<form>
					<div class="form-group">
						<label>제목 : </label> <input type="text" class="form-control"
							id="mytitle">
					</div>
					<div class="form-group">
						<label>시작일 : </label> <input type="button" class="form-control"
							id="start">
					</div>
					<div class="form-group">
						<label>종료일 : </label> <input type="button" class="form-control"
							id="end">
					</div>
					<input type="button" class="btn btn-success" value="일정등록" id="resultBtn">
						
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>

	</div>
</div>



<div id="calendarmodalForm" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">일정 등록</h4>
			</div>
			<div class="modal-body">
				<h4>제발</h4>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>

	</div>
</div>

