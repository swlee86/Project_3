<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--출장, 휴가 , 외근 근태 신청서 양식 제작-->
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
					<li class="active"><span>Contacts</span></li>
				</ol>
			</div>
			<h2 class="font-light m-b-xs">신청서 쓰기</h2>
			<small>Show users list in nice and color panels</small>
		</div>
	</div>
</div>



<div class="normalheader transition animated fadeIn">
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
											style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%"><font
											color="#f05050">*</font> 기간</th>
										<td>

											<div class="form-group">
												시작일 :			
												<div class="input-group date">
													<input type="text" class="form-control" id="writeOtherAttendace" value="" size="20px">
													<span class="input-group-addon" style="color:#fd7d86 "><i class="fa fa-calendar"></i></span>
												</div>
												
												&nbsp;&nbsp;~&nbsp;&nbsp; 종료일 :
												<div class="input-group date">
													<input type="text" class="form-control" id="writeOtherAttendace2" value="" size="20px">
													<span class="input-group-addon" style="color:#fd7d86 "><i class="fa fa-calendar"></i></span>
												</div>
												
												<div class="checkbox checkbox-danger" style="padding-top:0px;margin-top:0px;padding-right:10px;">
													<input id="checkbox1" type="checkbox" checked ><label >중요 </label>
												</div>

												<select class="form-control">
													<option>선택</option>
													<option>출장</option>
													<option>휴가</option>
													<option>외근</option>
												</select>

											</div>


										</td>
									</tr>
									<tr>
										<th
											style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%"><font
											color="#f05050">*</font> 제목</th>
										<td><input type="text" class="form-control input-sm"
											placeholder="제목" style="width: 100%"></td>
									</tr>
									<tr>
										<th
											style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">장소</th>
										<td><input type="text" class="form-control input-sm"
											placeholder="장소" style="width: 100%"></td>
									</tr>
									<tr>
										<th
											style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">참여자</th>
										<td>
											<span class="input-group"> 
												<input type="text" class="form-control input-sm" /> 
												<span class="input-group-btn">
														<button class="btn btn-sm btn-default" type="submit">
															<span style="color:#fd7d86 "><i class="fa fa-user-plus"></i></span>
														</button>
												</span>
											</span>
										</td>
									</tr>

									<tr>
										<th
											style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%"><font
											color="#f05050">*</font> 내용</th>
										<td><textarea cols="10" rows="10" class="form-control"
												placeholder="내용" style="width: 100%"></textarea></td>
									</tr>
									</tbody>
								</table>
								<div class="pull-right" style="text-align: center;">
									<input type="submit" class="btn w-xs btn-success" value="저장" style="padding-right:15px;padding-left:15px;font-weight:600;font-size:13px"> 
									<input type="button" onclick="location.href='contacts.do'" class="btn w-xs btn-default" value="취 소" style="padding-right:15px;padding-left:15px;font-weight:600;font-size:13px">
								</div>
							</div>
						</form>
					</div>
				</div>


			</div>
		</div>
	</div>
</div>
