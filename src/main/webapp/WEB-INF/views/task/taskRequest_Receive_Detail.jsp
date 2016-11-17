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
					<li><a href="index.do">Dashboard</a></li>
					<li><span>App views</span></li>
					<li class="active"><span>Contacts</span></li>
				</ol>
			</div>
			<h2 class="font-light m-b-xs">업무 요청 수신 페이지</h2>
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
							<table cellpadding="1" cellspacing="1" class="table table-bordered "  style="margin-bottom:0px">
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%">제목</th>
										<td style="width:40%">UI/UX 구현</td>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%">승인상태</th>
										<td style="width:40%"><button class="btn btn-xs btn-warning2">미승인</button></td>
									</tr>
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%">지시자</th>
										<td>김주희 사원</td>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%">지시부서</th>
										<td>개발팀</td>
									</tr>	
									<tr>
										<th style="background-color:#f5f5f5;text-align:right;padding-right:10px; width:10%">담당자</th>
										<td >박지은</td>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%">업무기한</th>
										<td >2016-11-16 </td>
									</tr>	
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%">업무 참여자</th>
										<td colspan="3">이지은 대리<br>김지은 주임</td>
									</tr>	
																									
									<tr>
										<th style="background-color:#f5f5f5;text-align:right;padding-right:10px; width:10%">첨부파일</th>
										<td colspan="3">업무 내용.hwp</td>
									</tr>
							
									<tr>
										<th style="background-color:#f5f5f5;text-align:right;padding-right:10px; width:10%">내용</th>
										<td colspan="3">업<br>무<Br> 내<Br>용</td>
									</tr>
								</table>		
								
								<table class="table table-bordered" style="margin-top:0px;border:6px solid #e9ecef" >
									<tr>
										<th colspan="2" style="background-color:#f9fafc;font-weight:bold;color:#111;font-size:1.2em;padding-left:20px;">처리 내역</th>
									</tr>
									<tr>
										<th style="background-color:#f5f5f5;text-align:right;padding-right:10px; width:10%;padding-top:40px;">승인 진행 단계</th>
										<td>
											<div class="form-inline">
												<span class="sty"> 
													<input type="radio" name="approval" id="approv" value="1" class="radio radioa" /> 
													<label class="sty" for="approv">승인</label>
												</span> 
												<span  class="sty"> 
													<input type="radio" name="approval" id="reject" value="2" class="radio radior" /> 
													<label class="sty" for="reject" >거부</label>
												</span> 
												<span  class="sty"> 
													<input type="radio" name="approval" id="wait" value="3" class="radio radiow" /> 
													<label class="sty" for="wait">보류</label>
												</span>
											</div>
											<br><br><br>
										</td>
									</tr>
								</table>
								
								<div class=" pull-right" style="text-align:center;">
									<input type="submit"  class="btn btn-sm btn-success" value="처리하기" style="padding-right:15px;padding-left:15px;font-weight:600;font-size:13px">
									<input type="button"  onclick="location.href='contacts.do'" class="btn btn-sm btn-default"  value="뒤로가기" style="padding-right:15px;padding-left:15px;font-weight:600;font-size:13px">
								</div>
	
							</div>
						</form>	
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

