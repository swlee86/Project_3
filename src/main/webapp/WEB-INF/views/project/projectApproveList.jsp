<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!--프로젝트 승인처리 페이지-->
<div class="normalheader transition animated fadeIn">
    <div class="hpanel">
        <div class="panel-body">
            <a class="small-header-action" href="#">
                <div class="clip-header">
                    <i class="fa fa-arrow-up"></i>
                </div>
            </a>
            <div id="hbreadcrumb" class="pull-right m-t-lg">
                <ol class="hbreadcrumb breadcrumb">
                    <li><a href="index.do">Dashboard</a></li>
                    <li>
                        <span>App views</span>
                    </li>
                    <li class="active">
                        <span>Contacts</span>
                    </li>
                </ol>
            </div>
            <h2 class="font-light m-b-xs">
                	프로젝트 승인 처리
            </h2>
            <small>승인 대기중인 프로젝트 리스트</small>
        </div>
    </div>
</div>

<div class="content animate-panel">
	<div class="row">
	
    <div class="col-lg-12">
        <div class="hpanel">
            <div class="panel-heading">
                	전체 : <font color="coral">10</font> 개
            </div>
            <div class="panel-body">
            	<div class="row">
	            	<form action="" class="form-inline">
	            		<div class="form-group" style="margin-left:10px;">
	            			<select class="form-control col-md-4">
	            				<option>선택</option>
	            				<option>책임자</option>
	            				<option>프로젝트 명</option>
	            			</select>
	            		</div>
	            		
	            		<div class="form-group" style="margin-left:10px;">
	            			<div class="col-md-4">
	            				<input type="text" class="form-control">
	            			</div>
	            		</div>
	            		
	            		<div class="form-group" style="margin-left:10px;">
	            			<div class="col-md-4">
	            				<button class="btn btn-success">
	            					<span class="fa fa-search"></span>&nbsp;&nbsp;
	            					검색
	            				</button>
	            			</div>
	            		</div>    
	                </form>   
                </div>  
                      
                <hr style="border:1px solid gray; margin-bottom:0px">
                <div class="table-responsive">
                <table cellpadding="1" cellspacing="1" class="table table-hover">
                    <thead>
                    <tr>
                        <th><input type="checkbox" class="i-checks"></th>
                        <th>책임자</th>
                        <th>프로젝트명</th>
                        <th>내용</th>
                        <th>시작일</th>
                        <th>종료일</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td><input type="checkbox" class="i-checks"></td>
                        <td>박성준</td>
                        <td>애플펜</td>
                        <td><a href="project_approve_detailview.do">우리집에 왜왔니</a></td>
                        <td>2016-11-16</td>
                        <td>2016-11-26</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" class="i-checks"></td>
                        <td>홍길동</td>
                        <td>의적질</td>
                        <td><a href="sanction_approve_view.do">최순실 털기</a></td>
                        <td>2016-10-16</td>
                        <td>2016-12-25</td>
                    </tr>
                    </tbody>
                </table>
                <div class="row" style="text-align:right; margin-right:5px;">
                	<button type="button"  class="btn w-xs btn-primary" >일괄결재</button>
                </div>
			</div>

            </div>
             <div class="panel-footer"  style="text-align:center;">
                <div class="btn-group">
                    <button type="button" class="btn btn-default">&nbsp;<i class="fa fa-chevron-left"></i></button>
                    <button class="btn btn-default active">1</button>
                    <button class="btn btn-default  ">2</button>
                    <button class="btn btn-default">3</button>
                    <button class="btn btn-default">4</button>
                    <button type="button" class="btn btn-default ">&nbsp;<i class="fa fa-chevron-right"></i></button>
                </div>
              </div>
        </div> 
   </div>  
</div>
</div>