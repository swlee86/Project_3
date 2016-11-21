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

<div class="content animate-panel">
	<div class="row">
		<div class="col-lg-12">
			<div class="hpanel">
				<div class="panel-body">
					<div class="table-responsive">
						<form class="form-inline">
							<div class="table-responsive">
								<table cellpadding="1" cellspacing="1"
									class="table table-bordered ">
									<tr>
										<th
											style="background-color: #f5f5f5; text-align: right; padding-right: 30px; width: 10%"><font
											color="coral">*</font> 기간</th>
										<td>
											<div class="form-group">				
												<div class="input-group date">
													<input type="text" class="form-control" id="writeOtherCommute"
														value="" size="20px"> <span
														class="input-group-addon"><i
														class="glyphicon glyphicon-calendar"></i></span>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<th style="background-color: #f5f5f5; text-align: right; padding-right: 30px; width: 10%">
											<font color="coral">*</font> 근태종류
										</th>
										<td>
											<div class="form-group">				
												<select class="form-control">
													<option>선택</option>
													<option>외근</option>
													<option>휴가</option>
													<option>출장</option>
												</select>
											</div>
										</td>
									</tr>
								</table>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<br />
		<div class="col-lg-12">
			<div class="hpanel">
				<div class="panel-body">
					<h3>외근? 근태 종류 시간띄움</h3>
				</div>
			</div>
		</div>
	</div>
</div>