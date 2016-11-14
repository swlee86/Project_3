<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--프로젝트 생성 폼-->
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
					<li><a href="projects.do">프로젝트 생성</a></li>
				</ol>
			</div>
			<h2 class="font-light m-b-xs">프로젝트 생성</h2>
			<small>새로운 프로젝트를 시작해 보세요!</small>
		</div>
	</div>
</div>
<div class="content">

    <div class="row">
        <div class="col-lg-6">
            <div class="hpanel">
                <div class="panel-heading">
                    <div class="panel-tools">
                        <a class="showhide"><i class="fa fa-chevron-up"></i></a>
                        <a class="closebox"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="panel-body">

                    <form role="form" id="form">
                        <div class="form-group">
                        	<label>프로젝트 이름</label> 
                        	<input type="email" placeholder="Enter email" class="form-control" required>
                        </div>
                        <div class="form-group">
                        	<label>Password</label> 
                        	<input type="password" placeholder="Password" class="form-control" name="password">
                        </div>
                        <div class="form-group">
                        	<label>Url</label> 
                        	<input type="text" placeholder="Enter email" class="form-control" name="url">
                        </div>
                        <div class="form-group">
                        	<label>Number</label> 
                        	<input type="text" placeholder="Enter email" class="form-control" name="number">
                        </div>
                        <div class="form-group">
                        	<label>MaxLength</label> 
                        	<input type="text" placeholder="Enter email" class="form-control" name="max">
                        </div>
                        
                        <div>
                            <button class="btn btn-sm btn-primary m-t-n-xs" type="submit"><strong>Submit</strong></button>
                        </div>
                    </form>

                </div>
            </div>
        </div>
	</div>
</div>
    