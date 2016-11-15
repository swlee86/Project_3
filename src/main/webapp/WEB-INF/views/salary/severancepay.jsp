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
			<div class="row">
				<div class="form-group col-sm-4">
					<h2 class="font-light m-b-xs">퇴직금 계산</h2>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="content animate-panel">

	<div class="row">

		<div class="col-md-6">
			<div class="hpanel email-compose">

				<div class="panel-heading hbuilt">
					<div class="p-xs">
						<form method="post" class="form-horizontal">
							<div class="form-group">
								<label class="col-sm-3 control-label text-left">정산구분:</label>

								<div class="col-sm-8">
									<select class="form-control">
										<option>퇴직정산</option>
										<option>중도정산</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label text-left ">정산기준일자:</label>

								<div class="col-sm-8">
									<input type="text" class="form-control" id="sevdate1">
									<button type="button" class="btn btn-sm btn-default">
										<span id="searchicon_sevdate1" class="fa fa-search"></span>
									</button>
								</div>
							</div>
							<div class="col-sm-9"></div>
							<input type="button" class="btn btn-success" id="searchbtn" value="조회하기">
						</form>


					</div>
				</div>

			</div>
		</div>

		<div class="col-md-6">
				<div class="hpanel">
					<div class="panel-body">
						<h3>결과 뜰꺼임</h3>
					</div>
				</div>
			</div>
		</div>

	</div>



