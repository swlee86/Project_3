<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--
	작성일 : 2016-11-17
	작성자 : 박성준
	목적 : 관리자 부서관리 페이지
-->
<div class="normalheader transition animated fadeIn">
	<div class="hpanel">
		<div class="panel-body">
			<a class="small-header-action" href="">
				<div class="clip-header">
					<i class="fa fa-arrow-up"></i>
				</div>
			</a>

			<div id="hbreadcrumb" class="pull-right m-t-lg">
				<div class="p-sm">
					<span class="vertical-date pull-right"> Saturday <br /> <small>12:17:43
							PM</small>
					</span>

				</div>
			</div>
			<h2 class="font-light m-b-xs">하위부서 관리</h2>
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
								<h2>하위부서 조회</h2>
							</div>

							<div class="panel-body">
								<label class="form-control">지점 선택</label> <select
									class="form-control">
									<option>선택</option>
									<option>서울</option>
									<option>제주</option>
								</select> <br /> <label class="form-control">부서 선택</label> <select
									class="form-control">
									<option>선택</option>
									<option>개발</option>
									<option>영업</option>
								</select> <br /> <label class="form-control">하위부서 선택</label> <select
									class="form-control">
									<option>선택</option>
									<option>개발1호</option>
									<option>영업1호</option>
								</select> <br />
								<div class="col-md-offset-2 col-md-4">
									<input type="button" class="btn btn-success" id="seeDepartBtn"
										value="부서조회">
								</div>
								<div class="col-md-4">
									<input type="button" class="btn btn-success"
										id="addDownDepartBtn" value="부서추가">
								</div>
							</div>
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
								<span class="vertical-date pull-right"> Saturday <br />
									<small>12:17:43 PM</small>
								</span>
								<h2>하위부서 정보(조회, 수정)</h2>
							</div>

							<div class="panel-body">
								<div id="seeAndModifyDiv">
									<form class="form-horizontal">
										<div class="form-group">
											<h4>하위부서 정보(조회, 수정)</h4>
										</div>
										<div class="form-group">
											<div class="col-md-3">
												<label>부서</label>
											</div>
											<div class="col-md-9">
												<input type="text" class="form-control" readonly="readonly">
											</div>
										</div>
										<div class="form-group">
											<div class="col-md-3">
												<label>하위 부서명</label>
											</div>
											<div class="col-md-9">
												<input type="text" class="form-control" readonly="readonly">
											</div>
										</div>
										<div class="form-group">
											<div class="col-md-3">
												<label>연락처</label>
											</div>
											<div class="col-md-9">
												<input type="text" class="form-control" readonly="readonly">
											</div>
										</div>
										<div class="form-group">
											<div class="col-md-3">
												<label>팩스번호</label>
											</div>
											<div class="col-md-9">
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
								<!--추가할때 뜨는 폼-->
								<div id="addDiv">
									<form class="form-horizontal">
										<div class="form-group">
											<h4>하위부서 등록</h4>
										</div>
										<div class="form-group">
											<div class="col-md-3">
												<label>부서</label>
											</div>
											<div class="col-md-9">
												<input type="text" class="form-control" readonly="readonly">
											</div>
										</div>
										<div class="form-group">
											<div class="col-md-3">
												<label>하위 부서명</label>
											</div>
											<div class="col-md-9">
												<input type="text" class="form-control" readonly="readonly">
											</div>
										</div>
										<div class="form-group">
											<div class="col-md-3">
												<label>연락처</label>
											</div>
											<div class="col-md-9">
												<input type="text" class="form-control" readonly="readonly">
											</div>
										</div>
										<div class="form-group">
											<div class="col-md-3">
												<label>팩스번호</label>
											</div>
											<div class="col-md-9">
												<input type="text" class="form-control" readonly="readonly">
											</div>
										</div>
										<div class="form-group">
											<div class="col-md-offset-2 col-md-6">
												<input type="submit" class="btn btn-success" value="등록">
											</div>
										</div>
									</form>
								</div>


							</div>
							<div class="panel-footer"></div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>