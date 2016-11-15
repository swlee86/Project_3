<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--출장, 휴가 , 외근 근태 신청서 양식 제작-->
<div class="normalheader transition animated fadeIn">
	<div class="row">
		<div class="col-lg-12">
			<div class="hpanel">
				<div class="panel-body">
					<h4>신청서 쓰기</h4>
				</div>
			</div>
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
											style="background-color: #f5f5f5; text-align: right; padding-right: 30px; width: 10%"><font
											color="coral">*</font> 기간</th>
										<td>

											<div class="form-group">
												시작일 :
												<div class="input-group date">
													<input type="text" class="form-control" id="formstartDate"
														value="" size="20px"> <span
														class="input-group-addon"><i
														class="glyphicon glyphicon-calendar"></i></span>
												</div>
												&nbsp;&nbsp;~&nbsp;&nbsp; 종료일 :
												<div class="input-group date">
													<input type="text" id="formendDate" class="form-control"
														value="" size="20px"> <span
														class="input-group-addon"><i
														class="glyphicon glyphicon-calendar"></i></span>
												</div>
												<div class="checkbox checkbox-success">
													<input id="checkbox3" type="checkbox"> <label
														for="checkbox3"> 중요 </label>
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
											style="background-color: #f5f5f5; text-align: right; padding-right: 30px; width: 10%"><font
											color="coral">*</font> 제목</th>
										<td><input type="text" class="form-control input-sm"
											placeholder="제목" style="width: 100%"></td>
									</tr>
									<tr>
										<th
											style="background-color: #f5f5f5; text-align: right; padding-right: 30px; width: 10%">장소</th>
										<td><input type="text" class="form-control input-sm"
											placeholder="장소" style="width: 100%"></td>
									</tr>
									<tr>
										<th
											style="background-color: #f5f5f5; text-align: right; padding-right: 30px; width: 10%">참여자</th>
										<td><span class="input-group"> <input type="text"
												class="form-control input-sm" /> <span
												class="input-group-btn">
													<button class="btn btn-sm btn-default" type="submit">
														&nbsp; <i class="pe-7s-add-user text-danger"></i>
													</button>
											</span>
										</span></td>
									</tr>

									<tr>
										<th
											style="background-color: #f5f5f5; text-align: right; padding-right: 30px; width: 10%"><font
											color="coral">*</font> 내용</th>
										<td><textarea cols="10" rows="10" class="form-control"
												placeholder="내용" style="width: 100%"></textarea></td>
									</tr>
									</tbody>
								</table>
								<div class="row" style="text-align: right; margin-right: 10px;">
									<input type="submit" class="btn w-xs btn-success" value="저장"
										style="margin-right: 10px;"> <input type="button"
										onclick="location.href='contacts.do'"
										class="btn w-xs btn-default" value="취 소">
								</div>
							</div>
						</form>
					</div>
				</div>


			</div>
		</div>
	</div>
</div>
