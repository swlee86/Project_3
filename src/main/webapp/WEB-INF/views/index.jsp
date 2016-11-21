<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 채팅 테스트용 아이디 세션 -->
<%session.setAttribute("id", "PSJ"); %>
<div class="content animate-panel">
	<div class="row">
		<div class="col-lg-12 text-center m-t-md">
			<h2>Welcome to EPM</h2>
			<p>
				스타트업 및 중소기업의 <strong>프로젝트 관리, 인사, 일정 관리</strong>를 위한 그 모든 프로그램
			</p>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="hpanel">
				<div class="panel-heading">
					<div class="panel-tools">
						<a class="showhide"><i class="fa fa-chevron-up"></i></a> <a
							class="closebox"><i class="fa fa-times"></i></a>
					</div>
					Dashboard information
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-md-6">
							<div class="small text-center">
								<i class="fa fa-bolt"></i> <a href="mailbox.do">전자 우편</a>
							</div>
						<div class="table-responsive">
						<table class="table table-hover table-mailbox">
							<tbody>
								<tr>
									<td class="">
										<div class="checkbox">
											<input type="checkbox"> <label></label>
										</div>
									</td>
									<td><a href="#">Henry Patterson</a></td>
									<td><a href="#">Aliquam nec justo interdum, ornare minon, elementum lacus.</a></td>
									<td><i class="fa fa-paperclip"></i></td>
									<td class="text-right mail-date">Thu, Aug 06</td>
								</tr>
								<tr class="unread">
									<td class="">
										<div class="checkbox checkbox-single checkbox-success">
											<input type="checkbox" checked> <label></label>
										</div>
									</td>
									<td><a href="#">Joseph Hurley</a></td>
									<td><a href="#">Nullam tempus leo id urna sagittisblandit.</a></td>
									<td><i class="fa fa-paperclip"></i></td>
									<td class="text-right mail-date">Sun, Aug 10</td>
								</tr>
								<tr class="active">
									<td class="">
										<div class="checkbox">
											<input type="checkbox"> <label></label>
										</div>
									</td>
									<td><a href="#">Grant Franco</a></td>
									<td><a href="#">Etiam maximus tellus a turpis tempormollis.</a></td>
									<td></td>
									<td class="text-right mail-date">Mon, Oct 19</td>
								</tr>
							</tbody>
						</table>
						</div>
						</div>
						<div class="col-md-6">
							<div class="small text-center">
								<i class="fa fa-clock-o"></i><a href="info_board_list.do">사내 공지</a>
							</div>
						<div class="table-responsive">
							<table class="table table-hover table-mailbox">
									<c:forEach var="cplist" items="${companyList}">
									<tr>
                        				<td>${cplist.no}</td>
                        				<td>${cplist.title }</td>
                        				<td>${cplist.emp_name}</td>
                        				<td>${cplist.regdate}</td>
                        				<td>${cplist.hit}</td>
                    				</tr>
                    				</c:forEach>
                    			</table>
							</div>
							<div class="small m-t-xl pull-right" >
								<i class="fa fa-clock-o"></i> Last active in 12.10.2015
							</div>
						</div>
					</div>
				</div>
				<div class="panel-footer">
					Last update: 21.05.2015  [새로고침 ico]
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-3">
			<div class="hpanel" >
				<div class="panel-body text-center h-200">
					<i class="pe-7s-graph1 fa-4x"></i>

					<h1 class="m-xs">$1 206,90</h1>

					<h3 class="font-extra-bold no-margins text-success">All Income
					</h3>
					<small>Lorem ipsum dolor sit amet, consectetur adipiscing
						elit vestibulum.</small>
				</div>
				<div class="panel-footer">This is standard panel footer</div>
			</div>
		</div>
		<div class="col-lg-3">
			<div class="hpanel stats">
				<div class="panel-body h-200">
					<div class="stats-title pull-left">
						<h4>Users Activity</h4>
					</div>
					<div class="stats-icon pull-right">
						<i class="pe-7s-share fa-4x"></i>
					</div>
					<div class="m-t-xl">
						<h3 class="m-b-xs">210</h3>
						<span class="font-bold no-margins"> Social users </span>

						<div class="progress m-t-xs full progress-small">
							<div style="width: 55%" aria-valuemax="100" aria-valuemin="0"
								aria-valuenow="55" role="progressbar"
								class=" progress-bar progress-bar-success">
								<span class="sr-only">35% Complete (success)</span>
							</div>
						</div>

						<div class="row">
							<div class="col-xs-6">
								<small class="stats-label">Pages / Visit</small>
								<h4>7.80</h4>
							</div>

							<div class="col-xs-6">
								<small class="stats-label">% New Visits</small>
								<h4>76.43%</h4>
							</div>
						</div>
					</div>
				</div>
				<div class="panel-footer">This is standard panel footer</div>
			</div>
		</div>
		<div class="col-lg-3">
			<div class="hpanel stats">
				<div class="panel-body h-200">
					<div class="stats-title pull-left">
						<h4>Page Views</h4>
					</div>
					<div class="stats-icon pull-right">
						<i class="pe-7s-monitor fa-4x"></i>
					</div>
					<div class="m-t-xl">
						<h1 class="text-success">860k+</h1>
						<span class="font-bold no-margins"> Social users </span> <br /> <small>
							Lorem Ipsum is simply dummy text of the printing and <strong>typesetting
								industry</strong>. Lorem Ipsum has been.
						</small>
					</div>
				</div>
				<div class="panel-footer">This is standard panel footer</div>
			</div>
		</div>
		<div class="col-lg-3">
			<div class="hpanel stats">
				<div class="panel-body h-200">
					<div class="stats-title pull-left">
						<h4>Today income</h4>
					</div>
					<div class="stats-icon pull-right">
						<i class="pe-7s-cash fa-4x"></i>
					</div>
					<div class="clearfix"></div>
					<div class="flot-chart">
						<div class="flot-chart-content" id="flot-income-chart"></div>
					</div>
					<div class="m-t-xs">
						<div class="row">
							<div class="col-xs-5">
								<small class="stat-label">Today</small>
								<h4>$230,00</h4>
							</div>
							<div class="col-xs-7">
								<small class="stat-label">Last week</small>
								<h4>
									$7 980,60 <i class="fa fa-level-up text-success"></i>
								</h4>
							</div>
						</div>
					</div>
				</div>
				<div class="panel-footer">This is standard panel footer</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-3">
			<div class="hpanel stats">
				<div class="panel-heading">
					<div class="panel-tools">
						<a class="showhide"><i class="fa fa-chevron-up"></i></a> <a
							class="closebox"><i class="fa fa-times"></i></a>
					</div>
					Last active
				</div>
				<div class="panel-body list">
					<div class="stats-title pull-left">
						<h4>Activity</h4>
					</div>
					<div class="stats-icon pull-right">
						<i class="pe-7s-science fa-4x"></i>
					</div>
					<div class="m-t-xl">
						<span class="font-bold no-margins"> Social users </span> <br /> <small>
							Lorem Ipsum is simply dummy text of the printing simply all dummy
							text. Lorem Ipsum is simply dummy text of the printing and
							typesetting industry. Lorem Ipsum has been. </small>
					</div>
					<div class="row m-t-md">
						<div class="col-lg-6">
							<h3 class="no-margins font-extra-bold text-success">300,102</h3>

							<div class="font-bold">
								98% <i class="fa fa-level-up text-success"></i>
							</div>
						</div>
						<div class="col-lg-6">
							<h3 class="no-margins font-extra-bold text-success">280,200</h3>

							<div class="font-bold">
								98% <i class="fa fa-level-up text-success"></i>
							</div>
						</div>
					</div>
					<div class="row m-t-md">
						<div class="col-lg-6">
							<h3 class="no-margins font-extra-bold ">120,108</h3>

							<div class="font-bold">
								38% <i class="fa fa-level-down"></i>
							</div>
						</div>
						<div class="col-lg-6">
							<h3 class="no-margins font-extra-bold ">450,600</h3>

							<div class="font-bold">
								28% <i class="fa fa-level-down"></i>
							</div>
						</div>

					</div>
				</div>
				<div class="panel-footer">This is standard panel footer</div>
			</div>
		</div>
		<div class="col-lg-6">
			<div class="hpanel">
				<div class="panel-heading">
					<div class="panel-tools">
						<a class="showhide"><i class="fa fa-chevron-up"></i></a> <a
							class="closebox"><i class="fa fa-times"></i></a>
					</div>
					Recently active projects
				</div>
				<div class="panel-body list">
					<div class="table-responsive project-list">
						<table class="table table-striped">
							<thead>
								<tr>

									<th colspan="2">Project</th>
									<th>Completed</th>
									<th>Task</th>
									<th>Date</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="checkbox" class="i-checks" checked></td>
									<td>Contract with Zender Company <br /> <small><i
											class="fa fa-clock-o"></i> Created 14.08.2015</small>
									</td>
									<td><span class="pie">1/5</span></td>
									<td><strong>20%</strong></td>
									<td>Jul 14, 2013</td>
									<td><a href=""><i class="fa fa-check text-success"></i></a></td>
								</tr>
								<tr>
									<td><input type="checkbox" class="i-checks"></td>
									<td>There are many variations of passages <br /> <small><i
											class="fa fa-clock-o"></i> Created 21.07.2015</small>
									</td>
									<td><span class="pie">1/4</span></td>
									<td><strong>40%</strong></td>
									<td>Jul 16, 2013</td>
									<td><a href=""><i class="fa fa-check text-navy"></i></a></td>
								</tr>
								<tr>
									<td><input type="checkbox" class="i-checks" checked></td>
									<td>Contrary to popular belief <br /> <small><i
											class="fa fa-clock-o"></i> Created 12.06.2015</small>
									</td>
									<td><span class="pie">0.52/1.561</span></td>
									<td><strong>75%</strong></td>
									<td>Jul 18, 2013</td>
									<td><a href=""><i class="fa fa-check text-navy"></i></a></td>
								</tr>
								<tr>
									<td><input type="checkbox" class="i-checks"></td>
									<td>Gamma project <br /> <small><i
											class="fa fa-clock-o"></i> Created 06.03.2015</small>
									</td>
									<td><span class="pie">226/360</span></td>
									<td><strong>16%</strong></td>
									<td>Jul 22, 2013</td>
									<td><a href=""><i class="fa fa-check text-navy"></i></a></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-3">
			<div class="hpanel">
				<div class="panel-heading">
					<div class="panel-tools">
						<a class="showhide"><i class="fa fa-chevron-up"></i></a> <a
							class="closebox"><i class="fa fa-times"></i></a>
					</div>
					Activity
				</div>
				<div class="panel-body list">

					<div class="pull-right">
						<a href="#" class="btn btn-xs btn-default">Today</a> <a href="#"
							class="btn btn-xs btn-default">Month</a>
					</div>
					<div class="panel-title">Last Activity</div>
					<small class="fo">This is simple example</small>
					<div class="list-item-container">
						<div class="list-item">
							<h3 class="no-margins font-extra-bold text-success">2,773</h3>
							<small>Tota Messages Sent</small>
							<div class="pull-right font-bold">
								98% <i class="fa fa-level-up text-success"></i>
							</div>
						</div>
						<div class="list-item">
							<h3 class="no-margins font-extra-bold text-color3">4,422</h3>
							<small>Last activity</small>
							<div class="pull-right font-bold">
								13% <i class="fa fa-level-down text-color3"></i>
							</div>
						</div>
						<div class="list-item">
							<h3 class="no-margins font-extra-bold text-color3">9,180</h3>
							<small>Monthly income</small>
							<div class="pull-right font-bold">
								22% <i class="fa fa-bolt text-color3"></i>
							</div>
						</div>
						<div class="list-item">
							<h3 class="no-margins font-extra-bold text-success">1,450</h3>
							<small>Tota Messages Sent</small>
							<div class="pull-right font-bold">
								44% <i class="fa fa-level-up text-success"></i>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>
