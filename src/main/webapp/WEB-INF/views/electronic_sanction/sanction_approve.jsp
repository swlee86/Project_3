<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
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
                    <li>
                        <span>App views</span>
                    </li>
                    <li class="active">
                        <span>Contacts</span>
                    </li>
                </ol>
            </div>
            <h2 class="font-light m-b-xs">
                	결재대기함
            </h2>
            <small>Show users list in nice and color panels</small>
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
            	<div class="row" style="background-color:#f7f9fa">
	            	<form action="" class="form-inline">
	            		<table style="margin-top:20px; margin-bottom:20px;" width="100%">
	                 		<tr > 
	                 			<td width="10%"></td>
	                 			<th style="text-align:right;padding-right:20px;">기안자 </th>
	                 			<td><input type="text" class="form-control input-sm" style="width:60%"></td>
	                 			<td width="10%"></td>
	                 			<th style="text-align:right;padding-right:20px;">양식명 </th>
	                 			<td><input type="text" class="form-control input-sm" style="width:60%"></td>
	                 			<td width="10%"></td>
	                 		</tr> 
	                 		<tr> <td colspan="7">&nbsp;</td>
	                 		</tr>
	                 		<tr>
	                 			<td></td>
	                 			<th style="text-align:right;padding-right:20px;">문서제목 </th>
	                 			<td><input type="text" class="form-control input-sm" width="100%" style="width:100%"></td>
	                 			<td></td>
	                 			<td></td>
	                 			<td><button class="btn w-xs btn-danger" type="submit"><span class="fa fa-search"></span> Search</button></td>
	                 			<td></td>
	                 		</tr>            
	               		</table>
	                </form>   
                </div>  
                       	
                <br>     
                <hr style="border:1px solid gray; margin-bottom:0px">
                <div class="table-responsive">
                <table cellpadding="1" cellspacing="1" class="table table-hover">
                    <thead>
                    <tr>
                        <th>NO</th>
                        <th>서식함</th>
                        <th>유형</th>
                        <th>문서제목</th>
                        <th>기안자</th>
                        <th>기안부서</th>
                        <th>기안일</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>4</td>
                        <td>공통</td>
                        <td>결재</td>
                        <td>기안용지_승인_프로세스_재기안</td>
                        <td>통삼일</td>
                        <td>그룹웨어팀</td>
                        <td>2016.11.09 19:24</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>공통</td>
                        <td>결재</td>
                        <td>기안용지_승인_프로세스_재기안</td>
                        <td>통삼일</td>
                        <td>그룹웨어팀</td>
                        <td>2016.11.09 19:24</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>공통</td>
                        <td>결재</td>
                        <td>기안용지_승인_프로세스_재기안</td>
                        <td>통삼일</td>
                        <td>그룹웨어팀</td>
                        <td>2016.11.09 19:24</td>
                    </tr>                    
                    <tr>
                        <td>1</td>
                        <td>공통</td>
                        <td>결재</td>
                        <td>기안용지_승인_프로세스_재기안</td>
                        <td>통삼일</td>
                        <td>그룹웨어팀</td>
                        <td>2016.11.09 19:24</td>
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