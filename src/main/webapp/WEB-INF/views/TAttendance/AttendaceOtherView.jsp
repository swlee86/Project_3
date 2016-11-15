<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--각기 다른 근태 보기 (휴가, 외박..)-->
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
			<h2 class="font-light m-b-xs">일일근태등록</h2>
		</div>
	</div>
</div>

<div class="normalheader transition animated fadeIn">
	<div class="row">
		<div class="col-lg-12">
			<div class="hpanel">
				<div class="panel-body">
					<form class="form-inline">
						<div class="form-group col-md-1">
							<div class="col-md-1" style="margin-top: 5px;">
								<select class="form-control">
									<option>선택</option>
									<option>야근</option>
									<option>외근</option>
									<option>휴가</option>
								</select>
							</div>
						</div>

						<div class="form-group col-md-4">
							<h4>
								<label class="col-md-3">근무년월</label>
							</h4>
							<div class="col-md-4">
								<input type="text" class="form-control" id="otherdate">
							</div>
						</div>

						<div class="form-group col-md-4">
							<h4>
								<label class="col-md-3">사원번호</label>
							</h4>
							<div class="col-md-4">
								<input type="text" class="form-control" id="otherdate">
							</div>
						</div>

						<div class="form-group col-md-1" style="margin-top: 10px;">
							<div class="col-md-1">
								<input type="button" class="btn btn-success" value="검색">
							</div>
						</div>

					</form>

				</div>
			</div>
		</div>
		<br/>
		<div class="col-lg-12">
			<div class="hpanel">
				<div class="panel-body">
					<h3>외근? 근태 종류 시간띄움</h3>
				</div>
			</div>
		</div>
	</div>
</div>