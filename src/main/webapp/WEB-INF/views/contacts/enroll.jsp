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
			<h2 class="font-light m-b-xs">주소록 등록</h2>
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
								<tbody>
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:30px; width:10%">성</th>
										<td><input type="text" class="form-control input-sm" placeholder="성을 입력하세요."></td>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:30px; width:10%"">이름</th>
										<td><input type="text" class="form-control input-sm" placeholder="이름을 입력하세요."></td>
									</tr>
									<tr>
										<th style="background-color:#f5f5f5;text-align:right;padding-right:30px; width:10%">회사</th>
										<td colspan="3"><input type="text"  class="form-control input-sm" placeholder="회사명을 입력하세요."></td>
									</tr>
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:30px; width:10%">연락처</th>
										<td><input type="text" class="form-control input-sm" placeholder="연락처를 입력하세요."></td>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:30px; width:10%">메일</th>
										<td><input type="email"  class="form-control input-sm" placeholder="이메일을 입력하세요."></td>
									</tr>
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:30px; width:10%">사진등록</th>
										<td colspan="3"><input type="file"  class="form-control input-sm"></td>
									</tr>
									<tr >
										<th style="background-color:#f5f5f5; text-align:right;padding-right:30px; width:10%; padding-top:45px;">주소록 그룹</th>
										<td colspan="3">
											<select  class="form-control input-sm"  style="height:100px" size="5">
													<option>선택안함</option>
													<option>인사팀그룹</option>
													<option>영업팀그룹</option>
											</select>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="row" style="text-align:center;margin-right:10px;">
								<input type="submit"  class="btn w-xs btn-success" value="등 록">
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