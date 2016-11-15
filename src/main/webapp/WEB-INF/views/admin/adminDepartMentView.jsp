<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--관리자 부서관리 페이지-->
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
			<h2 class="font-light m-b-xs">부서관리</h2>
		</div>
	</div>
</div>
<div class="content animate-panel">
	<div class="row">
		<div class="col-lg-4">
			<div class="hpanel">
				<div class="panel-body">
				 <p class="m-b-lg">부서리스트</p>
				 
				<div class="dd" id="nestable2">
						<ol class="dd-list">
							<li class="dd-item" data-id="1">
								<div class="dd-handle">
									<span class="label h-bg-navy-blue"><i
										class="pe-7s-monitor"></i></span><span id="depart">개발부</span>
								</div>
								<div class="dd-handle">
									<span class="label h-bg-navy-blue"><i
										class="fa fa-won"></i></span><span id="sale">영업부</span>
								</div>	
								<div class="dd-handle">
									<span class="label h-bg-navy-blue"><i
										class="fa fa-users"></i></span>마케팅부
								</div>	
							</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-8">
			<div class="hpanel">
				<div class="panel-body">
					
					<div id="departList">
						<h4>부서를 선택해주세요</h4>
					</div>
				</div>
				<div class="panel-footer">This is standard panel footer</div>
			</div>
		</div>
	</div>
</div>