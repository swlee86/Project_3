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
					<li class="active"><span>Mailbox</span></li>
				</ol>
			</div>
			<h2 class="font-light m-b-xs">메일함 보기</h2>
			<small>메일을 확인하세요!</small>
		</div>
	</div>
</div>
<div class="content animate-panel">

	<div class="row">
		<div class="col-md-3">
			<jsp:include page="/sidebar/mailLeftList_side.jsp"></jsp:include>
		</div>

		<div class="col-md-9">
			<div class="hpanel">
				<div class="panel-heading hbuilt">
					<div class="text-center p-xs font-normal">
						<div class="input-group">
							<input type="text" class="form-control input-sm"
								placeholder="Search email in your inbox..."> <span
								class="input-group-btn">
								<button type="button" class="btn btn-sm btn-default">Search
								</button>
							</span>
						</div>
					</div>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-md-6 m-b-md">
							<div class="btn-group">
								<button class="btn btn-default btn-sm">
									<i class="fa fa-refresh"></i> Refresh
								</button>
								<button class="btn btn-default btn-sm" >
									&nbsp;<i class="fa fa-eye"></i>
								</button>
								<button class="btn btn-default btn-sm" >
									&nbsp;<i class="fa fa-exclamation"></i>
								</button>
								<button class="btn btn-default btn-sm">
									&nbsp;<i class="fa fa-trash-o"></i>
								</button>
								<button class="btn btn-default btn-sm" >
									&nbsp;<i class="fa fa-check"></i>
								</button>
								<button class="btn btn-default btn-sm" >
									<i class="fa fa-tag"></i>
								</button>
							</div>
						</div>
						<div class="col-md-6 mailbox-pagination m-b-md">
							<div class="btn-group">
								<button class="btn btn-default btn-sm">
									<i class="fa fa-arrow-left"></i>
								</button>
								<button class="btn btn-default btn-sm">
									<i class="fa fa-arrow-right"></i>
								</button>
							</div>
						</div>
					</div>
					<div class="table-responsive">
						<table class="table table-hover table-mailbox">
							<tbody>
								<tr class="unread">
									<td class="">
										<div class="checkbox checkbox-single checkbox-success">
											<input type="checkbox" checked> <label></label>
										</div>
									</td>
									<td><a href="#">Jeremy Massey</a></td>
									<td><a href="#">Lorem ipsum dolor sit amet,
											consectetur adipiscing elit.</a></td>
									<td><i class="fa fa-paperclip"></i></td>
									<td class="text-right mail-date">Tue, Nov 25</td>
								</tr>
								<tr>
									<td class="">
										<div class="checkbox">
											<input type="checkbox"> <label></label>
										</div>
									</td>
									<td><a href="#">Marshall Horne</a></td>
									<td><a href="mailbox_view.do">클릭해보세여여여요요</a></td>
									<td></td>
									<td class="text-right mail-date">Wed, Jan 13</td>
								</tr>
								<tr class="active">
									<td class="">
										<div class="checkbox">
											<input type="checkbox"> <label></label>
										</div>
									</td>
									<td><a href="#">Grant Franco</a> <span
										class="label label-warning">Finance</span></td>
									<td><a href="#">Etiam maximus tellus a turpis tempor
											mollis.</a></td>
									<td></td>
									<td class="text-right mail-date">Mon, Oct 19</td>
								</tr>
								<tr class="unread active">
									<td class="">
										<div class="checkbox checkbox-single">
											<input type="checkbox" checked> <label></label>
										</div>
									</td>
									<td><a href="#">Ferdinand Meadows</a></td>
									<td><a href="#">Aenean hendrerit ligula eget augue
											gravida semper.</a></td>
									<td><i class="fa fa-paperclip"></i></td>
									<td class="text-right mail-date">Sat, Aug 29</td>
								</tr>
								<tr>
									<td class="">
										<div class="checkbox checkbox-single">
											<input type="checkbox"> <label></label>
										</div>
									</td>
									<td><a href="#">Ivor Rios</a> <span
										class="label label-info">Social</span></td>
									<td><a href="#">Sed quis augue in nunc venenatis
											finibus.</a></td>
									<td><i class="fa fa-paperclip"></i></td>
									<td class="text-right mail-date">Sat, Dec 12</td>
								</tr>
								<tr>
									<td class="">
										<div class="checkbox">
											<input type="checkbox"> <label></label>
										</div>
									</td>
									<td><a href="#">Maxwell Murphy</a></td>
									<td><a href="#">Quisque eu tortor quis justo viverra
											cursus.</a></td>
									<td></td>
									<td class="text-right mail-date">Sun, May 17</td>
								</tr>
								<tr>
									<td class="">
										<div class="checkbox">
											<input type="checkbox"> <label></label>
										</div>
									</td>
									<td><a href="#">Henry Patterson</a></td>
									<td><a href="#">Aliquam nec justo interdum, ornare mi
											non, elementum lacus.</a></td>
									<td><i class="fa fa-paperclip"></i></td>
									<td class="text-right mail-date">Thu, Aug 06</td>
								</tr>
								<tr>
									<td class="">
										<div class="checkbox">
											<input type="checkbox"> <label></label>
										</div>
									</td>
									<td><a href="#">Brent Rasmussen</a></td>
									<td><a href="#">Nam nec turpis sed quam tristique
											sodales.</a></td>
									<td></td>
									<td class="text-right mail-date">Sun, Nov 15</td>
								</tr>
								<tr class="unread">
									<td class="">
										<div class="checkbox checkbox-single checkbox-success">
											<input type="checkbox" checked> <label></label>
										</div>
									</td>
									<td><a href="#">Joseph Hurley</a></td>
									<td><a href="#">Nullam tempus leo id urna sagittis
											blandit.</a></td>
									<td><i class="fa fa-paperclip"></i></td>
									<td class="text-right mail-date">Sun, Aug 10</td>
								</tr>
								<tr>
									<td class="">
										<div class="checkbox">
											<input type="checkbox"> <label></label>
										</div>
									</td>
									<td><a href="#">Alan Matthews</a></td>
									<td><a href="#">Quisque quis turpis ac quam sagittis
											scelerisque vel ut urna.</a></td>
									<td></td>
									<td class="text-right mail-date">Sun, Mar 27</td>
								</tr>
								<tr class="active">
									<td class="">
										<div class="checkbox">
											<input type="checkbox"> <label></label>
										</div>
									</td>
									<td><a href="#">Colby Lynch</a> <span
										class="label label-danger">Travel</span></td>
									<td><a href="#">Donec non enim pulvinar, ultrices
											metus eget, condimentum mi.</a></td>
									<td></td>
									<td class="text-right mail-date">Thu, Dec 31</td>
								</tr>
								<tr class="unread">
									<td class="">
										<div class="checkbox checkbox-single checkbox-success">
											<input type="checkbox" checked> <label></label>
										</div>
									</td>
									<td><a href="#">Jeremy Massey</a></td>
									<td><a href="#">Lorem ipsum dolor sit amet,
											consectetur adipiscing elit.</a></td>
									<td><i class="fa fa-paperclip"></i></td>
									<td class="text-right mail-date">Tue, Nov 25</td>
								</tr>
								<tr>
									<td class="">
										<div class="checkbox">
											<input type="checkbox"> <label></label>
										</div>
									</td>
									<td><a href="#">Marshall Horne</a></td>
									<td><a href="#">Praesent nec nisl sed neque ornare
											maximus at ac enim.</a></td>
									<td></td>
									<td class="text-right mail-date">Wed, Jan 13</td>
								</tr>
								<tr class="active">
									<td class="">
										<div class="checkbox">
											<input type="checkbox"> <label></label>
										</div>
									</td>
									<td><a href="#">Grant Franco</a> <span
										class="label label-warning">Finance</span></td>
									<td><a href="#">Etiam maximus tellus a turpis tempor
											mollis.</a></td>
									<td></td>
									<td class="text-right mail-date">Mon, Oct 19</td>
								</tr>
								<tr class="unread active">
									<td class="">
										<div class="checkbox checkbox-single">
											<input type="checkbox" checked> <label></label>
										</div>
									</td>
									<td><a href="#">Ferdinand Meadows</a></td>
									<td><a href="#">Aenean hendrerit ligula eget augue
											gravida semper.</a></td>
									<td><i class="fa fa-paperclip"></i></td>
									<td class="text-right mail-date">Sat, Aug 29</td>
								</tr>
								<tr>
									<td class="">
										<div class="checkbox checkbox-single">
											<input type="checkbox"> <label></label>
										</div>
									</td>
									<td><a href="#">Ivor Rios</a> <span
										class="label label-info">Social</span></td>
									<td><a href="#">Sed quis augue in nunc venenatis
											finibus.</a></td>
									<td><i class="fa fa-paperclip"></i></td>
									<td class="text-right mail-date">Sat, Dec 12</td>
								</tr>
								<tr>
									<td class="">
										<div class="checkbox">
											<input type="checkbox"> <label></label>
										</div>
									</td>
									<td><a href="#">Maxwell Murphy</a></td>
									<td><a href="#">Quisque eu tortor quis justo viverra
											cursus.</a></td>
									<td></td>
									<td class="text-right mail-date">Sun, May 17</td>
								</tr>
								<tr>
									<td class="">
										<div class="checkbox">
											<input type="checkbox"> <label></label>
										</div>
									</td>
									<td><a href="#">Henry Patterson</a></td>
									<td><a href="#">Aliquam nec justo interdum, ornare mi
											non, elementum lacus.</a></td>
									<td><i class="fa fa-paperclip"></i></td>
									<td class="text-right mail-date">Thu, Aug 06</td>
								</tr>
								<tr>
									<td class="">
										<div class="checkbox">
											<input type="checkbox"> <label></label>
										</div>
									</td>
									<td><a href="#">Brent Rasmussen</a></td>
									<td><a href="#">Nam nec turpis sed quam tristique
											sodales.</a></td>
									<td></td>
									<td class="text-right mail-date">Sun, Nov 15</td>
								</tr>
								<tr class="unread">
									<td class="">
										<div class="checkbox checkbox-single checkbox-success">
											<input type="checkbox" checked> <label></label>
										</div>
									</td>
									<td><a href="#">Joseph Hurley</a></td>
									<td><a href="#">Nullam tempus leo id urna sagittis
											blandit.</a></td>
									<td><i class="fa fa-paperclip"></i></td>
									<td class="text-right mail-date">Sun, Aug 10</td>
								</tr>
								<tr>
									<td class="">
										<div class="checkbox">
											<input type="checkbox"> <label></label>
										</div>
									</td>
									<td><a href="#">Alan Matthews</a></td>
									<td><a href="#">Quisque quis turpis ac quam sagittis
											scelerisque vel ut urna.</a></td>
									<td></td>
									<td class="text-right mail-date">Sun, Mar 27</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="panel-footer">
					<i class="fa fa-eye"> </i> 6 unread
				</div>
			</div>
		</div>
	</div>
</div>