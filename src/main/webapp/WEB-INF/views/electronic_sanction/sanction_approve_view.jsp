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
			<h2 class="font-light m-b-xs">협조문</h2>
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
										<td style="width:40%">2016-11-09</td>
									</tr>
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:30px; width:10%">기안자</th>
										<td>김주희</td>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:30px; width:10%">기안부서</th>
										<td>그룹웨어팀</td>
									</tr>	
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:30px; width:10%">참조자</th>
										<td>박지은 </td>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:30px; width:10%">기결재첨부</th>
										<td></td>
									</tr>	
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:30px; width:10%">수신처</th>
										<td colspan="3">박성준 (사단)한국소프트웨어기술진흥협회 </td>
									</tr>	
																									
									<tr>
										<th style="background-color:#f5f5f5;text-align:right;padding-right:30px; width:10%">문서제목</th>
										<td colspan="3">결재</td>
									</tr>
									<tr>
										<td colspan="4">
											전자결재
										</td>
									</tr>
								</table>	
							<div class="row" style="text-align:center;margin-right:10px;">
								<input type="submit"  class="btn w-xs btn-primary" value="결재회수" style="margin-right:5px;">
								<input type="button"  class="btn w-xs btn-default" data-toggle="modal" data-target="#myModal5" style="margin-right:5px;" value="진행현황">
								<input type="button"  class="btn w-xs btn-default"  style="margin-right:5px;"  value="인쇄">
								<input type="button"  class="btn w-xs btn-default"   value="목록">
							</div>
						</div>
						</form>	
					</div>
				</div>


			</div>
		</div>
	</div>
</div>

<div class="modal fade hmodal-success" id="myModal5" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="color-line"></div>
			<div class="modal-header">
				<h4 class="modal-title"><font color="#6a6c6f">진행현황 <i class="fa fa-table"></i></font></h4>
				<small class="font-bold">Lorem Ipsum is simply dummy text.</small>
			</div>
			<div class="modal-body">
				<table class="table table-bordered" style="text-align:center">
					<tr style="background-color:#f5f5f5;">
						<th style="text-align:center">순번</th>
						<th style="text-align:center">결재자</th>
						<th style="text-align:center">결제유형</th>
						<th style="text-align:center">결재</th>
						<th style="text-align:center">배정일시</th>
						<th style="text-align:center">확인일시</th>
						<th style="text-align:center">결재일시</th>
					</tr>
					<tr>
						<td>1</td>
						<td>박성준 - (사단)한국소프트웨어기술진흥협회</td>
						<td>결재</td>
						<td>진행</td>
						<td>2016.11.08 11:49</td>
						<td>2016.11.08 12:42</td>
						<td>2016.11.08 12:42</td>
					</tr>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>