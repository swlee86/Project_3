<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--직위 관리 페이지-->
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
					<li><a href="index.do">Dashboard</a></li>
					<li><span>Tables</span></li>
					<li class="active"><span>DataTables</span></li>
				</ol>
			</div>
			<h2 class="font-light m-b-xs">직위 관리</h2>
			<small>직위 정보 등록</small>
		</div>
	</div>
</div>

<div class="content animate-panel">
	<div class="row">
	
    <div class="col-lg-6">
        <div class="hpanel">
            <div class="panel-heading">
                	직위 추가
            </div>
            <div class="panel-body">
            	<div class="col-md-4">
            		<input type="text" class="form-control">
            	</div>
            	<div class="col-md-4">
	            	<button class="btn btn-default">
	            		 <span class="fa fa-plus-circle"></span>
	            	</button>
            	</div>
            </div>
          </div>


			<div class="hpanel">
				<div class="v-timeline vertical-container animate-panel"
					data-child="vertical-timeline-block" data-delay="1">
					<div class="vertical-timeline-block">
						<div class="vertical-timeline-icon navy-bg">
							<i class="fa fa-inbox"></i>
						</div>
						<div class="vertical-timeline-content">
							<div class="p-sm">
								
								<h4>기본급여</h4>
								<input type="text" class="form-control">
								
							</div>
							<div class="panel-footer"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="hpanel">
				<div class="v-timeline vertical-container animate-panel"
					data-child="vertical-timeline-block" data-delay="1">
					<div class="vertical-timeline-block">
						<div class="vertical-timeline-icon navy-bg">
							<i class="fa fa-inbox"></i>
						</div>
						<div class="vertical-timeline-content">
							<div class="p-sm">
								<h4>추가급여</h4>
								<input type="text" class="form-control">
							</div>
							<div class="panel-footer"></div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="col-lg-6">
			<div class="hpanel">
				<div class="v-timeline vertical-container animate-panel"
					data-child="vertical-timeline-block" data-delay="1">
					<div class="vertical-timeline-block">
						<div class="vertical-timeline-icon navy-bg">
							<i class="fa fa-inbox"></i>
						</div>
						<div class="vertical-timeline-content">
							<div class="form-group" style="height: 300px;">
								<div class="infont col-md-6">
									<ul id="sortable">
										<li><i class="fa fa-cab"></i>사장</li>
										<li><i class="fa fa-thumbs-o-up"></i> 부장</li>
										<li><i class="fa fa-thumbs-o-up"></i> 과장</li>
										<li><i class="fa fa-thumbs-o-up"></i> 차장</li>
										<li><i class="fa fa-thumbs-o-up"></i> 대리</li>
									</ul>
								</div>
							</div>
							<div class="panel-footer"></div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
</div>

