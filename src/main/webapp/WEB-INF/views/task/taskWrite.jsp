<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<h2 class="font-light m-b-xs">업무 등록</h2>
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
						<form id="taskForm" method="POST" enctype="multipart/form-data">
						<input type="hidden" name="task_no" value="${task_No}">
						<div class="table-responsive">
							<table cellpadding="1" cellspacing="1" class="table table-bordered "  style="margin-bottom:0px;">
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%"><font color="#f05050">*</font> 업무명</th>
										<td colspan="3"><input type="text" class="form-control input-sm" name="task_name"></td>
									</tr>
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%"><font color="#f05050">*</font> 중요도</th>
										<td colspan="3">
											<div class="radio radio-success radio-inline">
												<input type="radio" id="sign" name="sign" value="0"><label for="sign">중요</label>
											</div>
											<div class="radio radio-success radio-inline">
												<input type="radio" id="sign2" name="sign" value="1"><label for="sign2">안중요</label>
											</div>
										</td>
									</tr>
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%"><font color="#f05050">*</font> 업무형태</th>
										<td colspan="3">
											<div class="radio radio-success radio-inline">
												<input type="radio" id="inlineRadio1" name="cg_noT" value="업무요청"><label for="inlineRadio1">업무 요청</label>
											</div>
											<div class="radio radio-success radio-inline">
												<input type="radio" id="inlineRadio2" name="cg_noT" value="업무보고"><label for="inlineRadio2">업무 보고</label>
											</div>
											<div class="radio radio-success radio-inline">
												<input type="radio" id="inlineRadio3" name="cg_noT" value="업무일지"><label for="inlineRadio3">업무 일지</label>
											</div>
											<!--구분 번호 -->
											<input type="hidden" name="cg_no" id="cg_no">
											<input type="hidden" name="cg_name" id="cg_name">
										</td>
									</tr>
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%"><font color="#f05050">*</font> 수신자 사번</th>
										<td id="rec_no_td">
											<span class="input-group">
                     							<input type="text" class="form-control input-sm" id="rec_emp_no" name="rec_emp_no"/>
                        							<a type="button" class="btn btn-default input-group-addon"  id="recIcon">
                        								<span style="color:#fd7d86 "><i class="fa fa-user-plus"></i></span>
                        							</a>
												</span> 
										</td>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%"><font color="#f05050">*</font> 수신자 명</th>
										<td style="width:40%" id="rec_name_td"><input type="text" class="form-control input-sm" id="rec_name" name="rec_name"></td>
									</tr>	
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%"><font color="#f05050">*</font> 참조자 사번</th>
										<td id="task_no_td">
											<span class="input-group">
                     							<input type="text" class="form-control input-sm" id="task_no"/>
                        							<a type="button" class="btn btn-default input-group-addon"  id="deptA">
                        								<span style="color:#fd7d86 "><i class="fa fa-user-plus"></i></span>
                        							</a>
												</span> 
										</td>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%"><font color="#f05050">*</font> 참조자명</th>
										<td style="width:40%" id="task_name_td"><input type="text" class="form-control input-sm" id="task_name"></td>
									</tr>	
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%"><font color="#f05050">*</font> 업무기한</th>
										<td colspan="3">							
											<div class="form-inline">
												<div class="input-group date">
												<input type="text" class="form-control input-sm"  id="makeuserUpdateDate"> 
												<span class="input-group-addon" style="color:#fd7d86 "><i class="fa fa-calendar"></i></span>
												</div>
												&nbsp;  ~ &nbsp; 
												<div class="input-group date">
												<input type="text" class="form-control input-sm"  id="makeuserUpdateDate2"> 
												<span class="input-group-addon" style="color:#fd7d86 "><i class="fa fa-calendar"></i></span>
												</div>
												<input type="hidden" name="deadline" id="deadline">
											</div> 
										</td>
									</tr>																
								</table>	
								<table cellpadding="1" cellspacing="1" class="table table-bordered " style="margin-top:0px;">	
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%"><font color="coral">*</font> 내용</th>
										<td>
											<textarea cols="10" rows="10" class="form-control" name="content"></textarea>
										</td>
									</tr>
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%"> <i class="pe-7s-paperclip"></i> 파일업로드</th>
										<td><input type="file" name="uploadfile" class="form-control input-sm"></td>
									</tr>
								</tbody>
							</table>
							<div class="row" style="text-align:right;margin-right:10px;">
								<input type="submit" id="submitBtn"  class="btn btn-sm btn-success demo2" value="요청" style="padding-right:15px;padding-left:15px;font-weight:600;font-size:13px">
							</div>
						</div>
						</form>	
					</div>
				</div>
			</div>
		</div>
	</div>
</div>



<div class="modal fade hmodal-success" id="myModal6" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-md">
		<div class="modal-content">
			<div class="color-line"></div>
			<div class="modal-header" style="height:50px;padding-top:10px;padding-bottom:0px">
				<h4 class="modal-title"><font color="#6a6c6f" size="4em"><b>수신자 선택</b></font></h4>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-md-4" style="border: 1px solid gray;" id="organization">
						
					</div>	
					<div class="col-md-8" id="empList">
						사원리스트
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default btn-sm" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>