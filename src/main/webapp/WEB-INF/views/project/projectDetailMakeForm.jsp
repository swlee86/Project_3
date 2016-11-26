<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--프로젝트 생성 폼-->
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
					<li><a href="index.do">홈</a></li>
					<li><span>프로젝트 관리</span></li>
					<li><a href="projects.do">프로젝트 생성</a></li>
				</ol>
			</div>
			<h2 class="font-light m-b-xs">프로젝트 상세 생성</h2>
			<small>프로젝트의 상세정보를 입력하세요.</small>
		</div>
	</div>
</div>
<div class="content animate-panel">
	<div class="row">
		<div class="col-lg-12">
			<div class="hpanel">
				<div class="panel-body">
					<div class="table-responsive">
						<form class="form-inline">
						<div class="table-responsive">
							<table cellpadding="1" cellspacing="1" class="table table-bordered "  >
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%"><font color="#f05050">*</font> 기간</th>
										<td>
											<div class="form-group">
												시작일 :
												<div class="input-group date">
													<input type="text" class="form-control input-sm" id="formstartDate" value="" size="20px">
													<span class="input-group-addon"><font style="color:#fd7d86 "><i class="fa fa-calendar"></i></font></span>
												</div>
												&nbsp;&nbsp;~&nbsp;&nbsp;
												종료일 :
												<div class="input-group date">
													<input type="text" id="formendDate" class="form-control" value="" size="20px"> 
													<span class="input-group-addon"><font style="color:#fd7d86 "><i class="fa fa-calendar"></i></font></span>
												</div>
				                            </div>
										</td>
									</tr>
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%"><font color="#f05050">*</font> 제목</th>
										<td><input type="text" class="form-control input-sm" placeholder="제목" style="width:100%"></td>
									</tr>	
								
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%">참여자</th>
										<td>
											<span class="input-group">
                     							<input type="text" class="form-control input-sm" />
                        						<span class="input-group-btn">
													<button class="btn input-sm btn-default" type="button"><font style="color:#fd7d86 "><span class="fa fa-user-plus"></span></font></button>
												</span>
                   	  						</span>
										</td>
									</tr>																	
									
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%"><font color="#f05050">*</font> 내용</th>
										<td>
											<textarea cols="10" rows="10" class="form-control"  placeholder="내용" style="width:100%"></textarea>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="pull-right" style="text-align:center;">
								<input type="submit"  class="btn w-xs btn-success" value="다음"  style="padding-right:15px;padding-left:15px;font-weight:600;font-size:13px">
								<a href="project_list.do" class="btn w-xs btn-default"  style="padding-right:15px;padding-left:15px;font-weight:600;font-size:13px">취소</a>
							</div>
						</div>
						</form>	
					</div>
				</div>


			</div>
		</div>
	</div>
</div>    