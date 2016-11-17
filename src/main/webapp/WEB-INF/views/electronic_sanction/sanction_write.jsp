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
						<form>
						<div class="table-responsive">
							<table cellpadding="1" cellspacing="1" class="table table-bordered "  >
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%">문서번호</th>
										<td style="width:40%">자동채번</td>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%">기안일자</th>
										<td style="width:40%">2016.11.09</td>
									</tr>
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%">기안자</th>
										<td>통삼삼</td>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%">기안부서</th>
										<td>그룹웨어팀</td>
									</tr>	
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%">참조자</th>
										<td>
											<span class="input-group">
                     							<input type="text" class="form-control input-sm" />
                        							<a type="button" class="btn btn-default input-group-addon"  data-toggle="modal" data-target="#myModal6" >
                        								<span style="color:#fd7d86 "><i class="fa fa-user-plus"></i></span>
                        							</a>
											</span> 

                   	  						
                   	  						
                   	  						
										</td>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%">기결재첨부</th>
										<td></td>
									</tr>																	
									<tr>
										<th style="background-color:#f5f5f5;text-align:right;padding-right:10px; width:10%"><font color="#f05050">*</font> 문서제목</th>
										<td colspan="3"><input type="text"  class="form-control input-sm" placeholder="문서제목을 입력하세요."></td>
									
									</tr>
								</table>	
								<br>
									
								<table cellpadding="1" cellspacing="1" class="table table-bordered "  >	
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%"><font color="#f05050">*</font> 서류종류</th>
										<td><input type="text" class="form-control input-sm" ></td>
									</tr>
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%"><font color="#f05050">*</font> 매수</th>
										<td><input type="text"  class="form-control input-sm" size="20px"></td>
									</tr>
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%"><font color="#f05050">*</font> 제출사유</th>
										<td>
											<textarea cols="10" rows="10" class="form-control" ></textarea>
										</td>
									</tr>
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%"> <i class="pe-7s-paperclip"></i> 파일업로드</th>
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



<div class="modal fade hmodal-success" id="myModal6" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="color-line"></div>
			<div class="modal-header">
				<h4 class="modal-title"><font color="#6a6c6f">결재자 선택<i class="fa fa-table"></i></font></h4>
				<small class="font-bold">Lorem Ipsum is simply dummy text.</small>
			</div>
			<div class="modal-body">
				<table class="table table-bordered" style="text-align:center; float: left; width: 45%;">
					<tr style="background-color:#f5f5f5;">
						<th style="text-align:center">순번</th>
						<th style="text-align:center">이름</th>
						<th style="text-align:center">부서</th>
						<th style="text-align:center">직위</th>
					</tr>
					<tr>
						<td>1</td>
						<td>박성준</td>
						<td>개발부</td>
						<td>PL</td>
					</tr>
					<tr>
						<td>2</td>
						<td>이상원</td>
						<td>개발부</td>
						<td>PM</td>
					</tr>
				</table>
				<input type="button" value="=>" style="text-align: center;">
				<table class="table table-bordered" style="text-align:center; float: left; width: 45%; margin-left: 10%;">
					<tr style="background-color:#f5f5f5;">
						<th style="text-align:center">순번</th>
						<th style="text-align:center">이름</th>
						<th style="text-align:center">부서</th>
						<th style="text-align:center">직위</th>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">추가</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>