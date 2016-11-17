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
			<h2 class="font-light m-b-xs">급여 관리</h2>
		</div>
	</div>
</div>

<div class="content animate-panel">
        <div class="row">
            <div class="col-md-4">
                <div class="hpanel">
                    <div class="panel-body">
                        <div class="text-center">
                            <h2 class="m-b-xs">기지급 급여 내역</h2>
                           <div class="m">
                                <i class="pe-7s-science fa-5x"></i>
                            </div>
                            <p class="small">
                                                 지급된 급여 목록 조회
                            </p>
                            <button class="btn btn-success btn-sm" id="movetotalSalaryList">이동</button>
                        </div>
                    </div>
                </div>
            </div>
         

      <div class="col-md-4">
                <div class="hpanel">
                    <div class="panel-body">
                        <div class="text-center">
                            <h2 class="m-b-xs">당월 급여 내역</h2>
                           <div class="m">
                                <i class="pe-7s-science fa-5x"></i>
                            </div>
                            <p class="small">
                                                 지급 예정 급여 목록 조회
                            </p>
                            <button class="btn btn-success btn-sm" id="moveSalaryPlanList">이동</button>
                        </div>
                    </div>
                </div>
            </div>

   <div class="col-md-4">
                <div class="hpanel">
                    <div class="panel-body">
                        <div class="text-center">
                            <h2 class="m-b-xs">급여 기본 정보 관리</h2>
                           <div class="m">
                                <i class="pe-7s-science fa-5x"></i>
                            </div>
                            <p class="small">
                                                 개인별 급여 기본 정보 관리
                            </p>
                            <button class="btn btn-success btn-sm" id="moveSalaryManage">이동</button>
                        </div>
                    </div>
                </div>
                </div>
    </div>
  </div>