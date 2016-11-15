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
            <h2 class="font-light m-b-xs">
                전체 프로젝트
            </h2>
            <small>다른팀에서 진행중인 프로젝트까지 확인할 수 있습니다</small>
        </div>
    </div>
</div>

<div class="content animate-panel">

    <div class="col-lg-12">
        <div class="hpanel">
            <div class="panel-heading">
                <div class="panel-tools">
                    <a class="showhide"><i class="fa fa-chevron-up"></i></a>
                    <a class="closebox"><i class="fa fa-times"></i></a>
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
                <table cellpadding="1" cellspacing="1" class="table table-bordered table-striped">
                    <thead>
                    <tr>
                        <th>프로젝트이름</th>
                        <th>책임자</th>
                        <th>내용</th>
                        <th>날짜</th>
                        <th>진행상황</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>Abraham</td>
                        <td>076 9477 4896</td>
                        <td>294-318 Duis Ave</td>
                        <td>Vosselaar</td>
                        <td>Belgium</td>
                    </tr>
                    <tr>
                        <td>Phelan</td>
                        <td>0500 034548</td>
                        <td>680-1097 Mi Rd.</td>
                        <td>Lavoir</td>
                        <td>Pakistan</td>
                    </tr>
                    <tr>
                        <td>Raya</td>
                        <td>(01315) 27698</td>
                        <td>Ap #289-8161 In Avenue</td>
                        <td>Santomenna</td>
                        <td>Burkina Faso</td>
                    </tr>
                    <tr>
                        <td>Azalia</td>
                        <td>0500 854198</td>
                        <td>226-4861 Augue. St.</td>
                        <td>Newtown</td>
                        <td>Christmas Island</td>
                    </tr>
                    <tr>
                        <td>Garth</td>
                        <td>(01662) 59083</td>
                        <td>3219 Elit Avenue</td>
                        <td>Ternitz</td>
                        <td>Saint Martin</td>
                    </tr>
                    <tr>
                        <td>Selma</td>
                        <td>0877 118 6905</td>
                        <td>P.O. Box 410, 7331 Nec, St.</td>
                        <td>Glenrothes</td>
                        <td>Korea, North</td>
                    </tr>
                    </tbody>
                </table>
                </div>

            </div>
            <div class="panel-footer">
                <input type="button" class="btn btn-success" value="프로젝트 작성" id="makeProjectBtn">
            </div>
        </div>
    </div>
</div>
