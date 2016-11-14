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
					<li class="active"><span>Calendar</span></li>
				</ol>
			</div>
			<h2 class="font-light m-b-xs">Calendar</h2>
			<small>Full-sized, drag & drop event calendar.</small>
		</div>
	</div>
</div>

<div class="content">
	<div class="row">
		<div class="col-lg-12">
			<div class="row">
				<div class="col-md-6">
					<div class="hpanel">
						<div class="panel-body">
							<div id="external-events">
								<strong>일정을 추가해보세요 !</strong>
								<p>
									<br />
									<div id='external-events'>
										<div class='external-event h-bg-green text-white'>일정이름을 입력하세요</div>
									</div>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-12">
			<div class="hpanel">
				<div class="panel-heading">
					<div class="panel-tools">
						<a class="showhide"><i class="fa fa-chevron-up"></i></a> <a
							class="closebox"><i class="fa fa-times"></i></a>
					</div>
					Calendar
				</div>
				<div class="panel-body">
					<div id="calendar">
					
					</div>
				</div>
			</div>
		</div>
	</div>

</div>