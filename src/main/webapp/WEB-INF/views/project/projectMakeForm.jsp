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
			<h2 class="font-light m-b-xs">프로젝트 생성</h2>
			<small>새로운 프로젝트를 시작해 보세요!</small>
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
										<th style="background-color:#f5f5f5; text-align:right;padding-right:30px; width:10%"><font color="coral">*</font> 기간</th>
										<td>
											<div class="form-group">
											시작일 :
											<div class="input-group date">
												<input type="text" class="form-control" id="formstartDate" value="" size="20px">
												<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
											</div>
											&nbsp;&nbsp;~&nbsp;&nbsp;
											종료일 :
											<div class="input-group date">
												<input type="text" id="formendDate" class="form-control" value="" size="20px"> 
												<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
											</div>
											<div class="checkbox checkbox-success">
				                                <input id="checkbox3" type="checkbox">
				                                <label for="checkbox3"> 중요 </label>
				                            </div>
				                            <select  class="form-control input-sm">
				                            	<option style="background-color: blue"><img alt="logo" class="img-circle m-b" src="images/s1.PNG">업무ts</option>
				                            	<option style="background-image:url(images/a1.jpg);">중요</option>
				                            </select>
				                            </div>
										</td>
									</tr>
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:30px; width:10%"><font color="coral">*</font> 제목</th>
										<td><input type="text" class="form-control input-sm" placeholder="제목" style="width:100%"></td>
									</tr>	
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:30px; width:10%">장소</th>
										<td><input type="text" class="form-control input-sm" placeholder="장소" style="width:100%"></td>
									</tr>	
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:30px; width:10%">참여자</th>
										<td>
											<span class="input-group">
                     							<input type="text" class="form-control input-sm" />
                        						<span class="input-group-btn">
													<button class="btn btn-sm btn-default" type="submit">&nbsp; <i class="pe-7s-add-user text-danger" ></i></button>
												</span>
                   	  						</span>
										</td>
									</tr>																	
									
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:30px; width:10%"><font color="coral">*</font> 내용</th>
										<td>
											<textarea cols="10" rows="10" class="form-control"  placeholder="내용" style="width:100%"></textarea>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="row" style="text-align:right;margin-right:10px;">
								<input type="submit"  class="btn w-xs btn-success" value="저장" style="margin-right:10px;">
								<input type="button"  onclick="location.href='contacts.do'" class="btn w-xs btn-default"  value="취 소">
							</div>
						</div>
						</form>	
					</div>
				</div>


			</div>
		</div>
	</div>
</div>    