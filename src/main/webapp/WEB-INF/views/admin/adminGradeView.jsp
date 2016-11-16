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
		<div class="col-lg-4">
			<div class="hpanel">
				<div class="v-timeline vertical-container animate-panel"
					data-child="vertical-timeline-block" data-delay="1">
					<div class="vertical-timeline-block">
						<div class="vertical-timeline-icon navy-bg">
							<i class="fa fa-inbox"></i>
						</div>
						<div class="vertical-timeline-content">
							<div class="p-sm">
								<h2>지점</h2>
								<select class="form-control">
									<option>지점 선택</option>
									<option>서울</option>
									<option>경기</option>
									<option>충북</option>
									<option>제주</option>
								</select>
							</div>
							<div class="panel-footer"></div>
						</div>
					</div>
				</div>
				<div class="vertical-timeline-block">
                        <div class="vertical-timeline-icon navy-bg">
                            <i class="fa fa-calendar"></i>
                        </div>
                        <div class="vertical-timeline-content">
                            <div class="p-sm">
                            <h4>부서</h4>
                             <select class="form-control">
									<option>부서</option>
									<option>서울</option>
									<option>경기</option>
									<option>충북</option>
									<option>제주</option>
								</select>
                            </div>
                            <div class="panel-footer">
                                It is a long established fact that
                            </div>
                        </div>
                    </div>
			</div>
		</div>
		<div class="col-lg-8">
			<div class="hpanel">
				<div class="v-timeline vertical-container animate-panel"
					data-child="vertical-timeline-block" data-delay="1">

					<div class="panel-body">
						<h4>사원리스트</h4>
					</div>


				</div>
			</div>
		</div>
	</div>
</div>