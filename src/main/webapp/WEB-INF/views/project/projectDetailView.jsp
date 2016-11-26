<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="normalheader transition animated fadeIn media-body">
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
					<li><span>프로젝트 관리</span></li>
					<li><a href="projects.do">프로젝트 생성</a></li>
				</ol>
			</div>
			<h2 class="font-light m-b-xs">프로젝트 상세보기</h2>
			<small>프로젝트 진척률을 확인하세요</small>
		</div>
	</div>
</div>
<div class="content animate-panel">
	<div class="row">
		<div class="col-lg-4">
			<div class="hpanel">
				<div class="panel-body text-center">
					<a href="#myModal?id=1" data-target="#myModal" data-toggle="modal">
						<img alt="logo" class="img-circle img-small" src="images/a1.jpg">
					</a>
					<div class="m-t-sm">
						<strong>Mark Newon</strong>
						<p class="small">UI Designer</p>
					</div>
				</div>
			</div>

			<div class="hpanel">
				<div class="panel-body text-center">
					<img alt="logo" class="img-circle img-small" src="images/a2.jpg">
					<div class="m-t-sm">
						<strong>Anna Smith</strong>
						<p class="small">JS Developer</p>
					</div>
				</div>
			</div>
		</div>

		<div class="col-lg-8">
			<div class="hpanel">
				<div class="panel-body">
					<div class="table-responsive">
						<table  cellpadding="1" cellspacing="1" class="table table-bordered "  style="margin-bottom:0px;">
							<tr>
								<th style="background-color:#f5f5f5; text-align:center;padding-right:10px; width:20%">상세 프로젝트 제목</th>
                              	<td colspan="3" id="pjd_name">${pjd.pjd_title}</td>
							</tr>
							<tr>
								<th style="background-color:#f5f5f5; text-align:center;padding-right:10px; width:20%">시작일</th>
	                        	<td id="pjd_start">${pjd.pjd_start}</td>
	                        	<th style="background-color:#f5f5f5; text-align:center;padding-right:10px; width:20%">종료일</th>
	                       		<td id="pjd_end">${pjd.pjd_end}</td>
                           	</tr> 
							<tr>
								<th style="background-color:#f5f5f5; text-align:center;padding-right:10px; width:20%">상세 프로젝트 내용</th>
                              	<td colspan="3"id="pjd_content">${pjd.pjd_content}</td> 
							</tr>
						</table>
					
					</div>
				
					</br>
					</br>
				
					<div class="table-responsive">
						<div class="table-responsive">
							<table class="table table-bordered table-striped">
								<tr>
									<th />
									<th>테스트</th>
									<th>첫번째</th>
									<th>첫번째</th>
									<th>첫번째</th>
									<th>진행상황</th>
									<th>선택</th>
								</tr>

								<tr>
									<td><input type="checkbox" class="i-checks"></td>
									<td><input type="text" class="form-control" readonly="readonly" value="안녕"></td>
									<td><input type="text" class="form-control" readonly="readonly"></td>
									<td><input type="text" class="form-control" readonly="readonly"></td>
									<td><input type="text" class="form-control" readonly="readonly"></td>
									<td><select class="form-control">
											<option>진행</option>
											<option>미진행</option>
											<option>보류</option>
											<option>완료</option>
											<option>중단</option>
									</select></td>
									<td><input type="button" class="btn btn-success"
										value="선택"></td>
								</tr>
								<tr>
									<td><input type="checkbox" class="i-checks"></td>
									<td>두번째</td>
									<td>둘둘</td>
									<td>둘리</td>
									<td>난서현이야</td>
									<td><select class="form-control">
											<option>진행</option>
											<option>미진행</option>
											<option>보류</option>
											<option>완료</option>
											<option>중단</option>
									</select></td>
									<td><input type="button" class="btn btn-success"
										value="선택"></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!--이미지 클릭시 뜨는 모달 페이지-->
<div class="modal fade hmodal-success" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog  modal-sm">
		<div class="modal-content">
			<div class="color-line"></div>
			<div class="modal-header text-center">
		 	<h4 class="modal-title"><img alt="logo" class="img-circle m-b" src="images/a3.jpg" style="width: 82px;height: 82px;"></h4> <br>
				<font class="font-bold" size="2em">
					<font style="color:gray;">박성준</font><br>
					<font style="color:#9d9fa2">(사단)한국소프트웨어기술진흥협회 > <br>개발부 > 팀장</font> <br>
					<font style="color:gray;">01020768626</font>
				</font>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default btn-sm" data-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary btn-sm demo2">주소록 등록</button>
			</div>
		</div>
	</div>
</div>
