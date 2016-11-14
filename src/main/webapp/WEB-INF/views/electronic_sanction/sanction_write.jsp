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
					<li class="active"><span>Contacts</span></li>
				</ol>
			</div>
			<h2 class="font-light m-b-xs">기안문 작성</h2>
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
						<form>
						<div class="table-responsive">
							<table cellpadding="1" cellspacing="1" class="table table-bordered "  >
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:30px; width:10%">문서번호</th>
										<td style="width:40%">자동채번</td>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:30px; width:10%">기안일자</th>
										<td style="width:40%">2016.11.09</td>
									</tr>
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:30px; width:10%">기안자</th>
										<td>통삼삼</td>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:30px; width:10%">기안부서</th>
										<td>그룹웨어팀</td>
									</tr>	
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:30px; width:10%">참조자</th>
										<td>
											<span class="input-group">
                     							<input type="text" class="form-control input-sm" />
                        						<span class="input-group-btn">
													<button class="btn btn-sm btn-default" type="submit">&nbsp; <i class="pe-7s-add-user" ></i></button>
												</span>
                   	  						</span>
										</td>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:30px; width:10%">기결재첨부</th>
										<td></td>
									</tr>																	
									<tr>
										<th style="background-color:#f5f5f5;text-align:right;padding-right:30px; width:10%"><font color="coral">*</font> 문서제목</th>
										<td colspan="3"><input type="text"  class="form-control input-sm" placeholder="문서제목을 입력하세요."></td>
									
									</tr>
								</table>	
								<br>
									
								<table cellpadding="1" cellspacing="1" class="table table-bordered "  >	
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:30px; width:10%"><font color="coral">*</font> 서류종류</th>
										<td><input type="text" class="form-control input-sm" ></td>
									</tr>
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:30px; width:10%"><font color="coral">*</font> 매수</th>
										<td><input type="text"  class="form-control input-sm" size="20px"></td>
									</tr>
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:30px; width:10%"><font color="coral">*</font> 제출사유</th>
										<td>
											<textarea cols="10" rows="10" class="form-control" ></textarea>
										</td>
									</tr>
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:30px; width:10%"> <i class="pe-7s-paperclip"></i> 파일업로드</th>
										<td><input type="file"  class="form-control input-sm" ></td>
									</tr>
								</tbody>
							</table>
							<div class="row" style="text-align:right;margin-right:10px;">
								<input type="submit"  class="btn w-xs btn-primary" value="결재 요청" style="margin-right:10px;">
								<input type="button"  onclick="location.href='sanction_list.do'" class="btn w-xs btn-default"  value="취 소">
							</div>
						</div>
						</form>	
					</div>
				</div>


			</div>
		</div>
	</div>
</div>