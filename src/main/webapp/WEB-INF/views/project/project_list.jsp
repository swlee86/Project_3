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
					<li><a href="index.do">홈</a></li>
					<li><span>프로젝트 관리</span></li>
					<li><a href="project_list.do">전체 프로젝트</a></li>
				</ol>
			</div>
			<h2 class="font-light m-b-xs">전체 프로젝트</h2>
			<small>다른팀에서 진행중인 프로젝트까지 확인할 수 있습니다</small>
		</div>
	</div>
</div>

<div class="content animate-panel">

	<div class="col-lg-12">
		<div class="hpanel">
			<div class="panel-heading">
				<div class="panel-tools">
					<a class="showhide"><i class="fa fa-chevron-up"></i></a> <a
						class="closebox"><i class="fa fa-times"></i></a>
				</div>
				<small>프로젝트 리스트</small>
			</div>
			<div class="panel-body">
				<div class="form-group">
					<select class="form-control">
						<option>전체보기</option>
						<option>내것만</option>
					</select>
				</div>
				<div class="table-responsive">
					<table cellpadding="1" cellspacing="1"
						class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>프로젝트이름</th>
								<th>책임자</th>
								<th>제목</th>
								<th>내용</th>
								<th>시작일</th>
								<th>종료일</th>
								<th>진행률</th>
								<th>진행단계</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>애플펜</td>
								<td>박성준</td>
								<td>파인애플펜</td>
								<td>애플 + 펜 = 파인애플펜</td>
								<td>2016-11-10</td>
								<td>2016-11-20</td>
								<td></td>
								<td><span class="label label-success"
									style="margin-top: -5px; width: 20%;">진행</span></td>
							</tr>
							<tr>
								<td>펜애플</td>
								<td>박성준</td>
								<td>펜파인애플</td>
								<td>펜애플 + 애플 = 펜파인애플펜</td>
								<td>2016-11-10</td>
								<td>2016-12-20</td>
								<td></td>
								<td><span class="label label-info"
									style="margin-top: -5px; width: 20%;">완료</span></td>
							</tr>
							<tr>
								<td>펜투애플</td>
								<td>박성준호우</td>
								<td>펜파인애플투투</td>
								<td>펜애플 + 애플 = 펜파파파인애플펜</td>
								<td>2016-10-10</td>
								<td>2016-12-25</td>
								<td></td>
								<td><span class="label label-danger"
									style="margin-top: -5px; width: 20%;">미진행</span></td>
							</tr>
						</tbody>
					</table>
				</div>

			</div>
			<div class="panel-footer">
				<input type="button" class="btn btn-success" value="프로젝트 작성"
					id="makeProjectBtn">
			</div>
		</div>
	</div>
</div>
