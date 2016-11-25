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
					<li><a href="index.html">Dashboard</a></li>
					<li><span>App views</span></li>
					<li class="active"><span>Contacts</span></li>
				</ol>
			</div>
			<h2 class="font-light m-b-xs">요청 등록</h2>
			<small>Show users list in nice and color panels</small>
		</div>
	</div>
</div>


<div class="content animate-panel">
	<div class="row">
		<div class="col-lg-12">
			<div class="hpanel">
				<div class="panel-body">
					<div class="table-responsive">
						<form id="documentForm" method="POST">
							<div class="table-responsive">
								<table cellpadding="1" cellspacing="1"
									class="table table-bordered ">
									<tr>
										<th
											style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">문서번호</th>
										<td style="width: 40%"></td>
										<th
											style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">기안일자</th>
										<td style="width: 40%"></td>
									</tr>
									<tr>
										<th
											style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">기안자</th>
										<td></td>
										<th
											style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">기안부서</th>
										<td></td>
									</tr>
									<tr>
										<th
											style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%"><font
											color="#f05050">*</font> 결제자 사번</th>
										<td id="sanction_DraftOk_no_td"><span class="input-group">
												<input type="text" class="form-control input-sm"
												id="draft_Ok_emp_no" name="draft_line_emp_no" /> <a
												type="button" class="btn btn-default input-group-addon"
												id="draft_Ok_Icon"> <span style="color: #fd7d86"><i
														class="fa fa-user-plus"></i></span>
											</a>
										</span></td>
										<th
											style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%"><font
											color="#f05050">*</font> 결제자 이름</th>
										<td style="width: 40%" id="sanction_DraftName_td"><input
											type="text" class="form-control input-sm"
											id="draft_Ok_emp_name" name="draft_line_emp_name"></td>
									</tr>
									<tr>
										<th
											style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%"><font
											color="#f05050">*</font> 참조자 사번</th>
										<td id="sanction_writeNo_td"><span class="input-group">
												<input type="text" class="form-control input-sm"
												id="draft_line_emp_no" name="draft_line_emp_no" /> <a
												type="button" class="btn btn-default input-group-addon"
												id="draft_line_Icon"> <span style="color: #fd7d86"><i
														class="fa fa-user-plus"></i></span>
											</a>
										</span></td>
										<th
											style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%"><font
											color="#f05050">*</font> 참조자 이름</th>
										<td style="width: 40%" id="sanction_writename_td"><input
											type="text" class="form-control input-sm"
											id="draft_line_emp_name" name="draft_line_emp_name"></td>
									</tr>
									<tr>
										<th
											style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%"><font
											color="#f05050">*</font> 문서제목</th>
										<td colspan="3"><input type="text"
											class="form-control input-sm" placeholder="문서제목을 입력하세요."></td>
									</tr>
									<tr>
										<th
											style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%"><font
											color="#f05050">*</font> 문서제목</th>
										<td colspan="3"><select class="form-control"
											id="sanction_cg">
												<option value="0">선택</option>
												<option value="1">협조문</option>
												<option value="2">대외발생</option>
												<option value="3">휴가</option>
										</select></td>
									</tr>

								</table>
								<br>
							</div>
					</div>
					
					<div class="panel-body" id="documentTable" style="border: none;">
						
					</div>
					<br/><br/>
						<div class=" pull-right" style="text-align: center;">
							<input type="submit" class="btn btn-sm btn-success" value="결재 요청"
								style="padding-right: 15px; padding-left: 15px; font-weight: 600; font-size: 13px">
							<input type="button" onclick="location.href='sanction_list.do'"
								class="btn btn-sm btn-default" value="취 소"
								style="padding-right: 15px; padding-left: 15px; font-weight: 600; font-size: 13px">
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>
</div>





<!--참조자용 모달-->
<div class="modal fade hmodal-success" id="myModal6" tabindex="-1"
	role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-md">
		<div class="modal-content">
			<div class="color-line"></div>
			<div class="modal-header"
				style="height: 50px; padding-top: 10px; padding-bottom: 0px">
				<h4 class="modal-title">
					<font color="#6a6c6f" size="4em"><b>결재자 선택</b></font>
				</h4>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-md-4" style="border: 1px solid gray;"
						id="organization"></div>
					<div class="col-md-8" id="empList">사원리스트</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default btn-sm"
					data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
