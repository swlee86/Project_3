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
                	사원정보 공유 게시판
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
                	총 게시글 수 : 10 개
            </div>
            <div class="panel-body">
            	<form action="" class="form-inline">
                 	<select  class="form-control input-sm" >
                    	<option >제목</option>
                        <option>작성자명</option>
                     </select> 	
                     <div class="input-group">
                     	<input type="text" class="form-control input-sm" placeholder="" name="s"/>
                        	<span class="input-group-btn">
								<button class="btn btn-sm btn-default" type="submit"> <span class="fa fa-search" style=" font-size: 19px;"></span> </button>
							</span>
                     </div>
                </form>            	
                <br>     
                <div class="table-responsive">
                <table cellpadding="1" cellspacing="1" class="table">
                    <thead>
                    <tr>
                        <th>번호</th>
                        <th>제ㅇ목</th>
                        <th>작성자명</th>
                        <th>작성일시</th>
                        <th>조회수</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>3</td>
                        <td>Vosselsaar&nbsp;&nbsp;&nbsp;<img alt="file"  src="images/fileimg.PNG"></td>
                        <td>박지은 (부서명)</td>
                        <td>16/11/06</td>
                        <td>22</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;<img alt="reply"  src="images/replyimg.gif"> &nbsp;Vosselaar</td>
                        <td>박지은  (부서명)</td>
                        <td>16/11/06</td>
                        <td>11</td>
                    </tr>
                    <tr>
                        <td>5</td>
                        <td>Vosselaar</td>
                        <td>박지은  (부서명)</td>
                        <td>16/11/06</td>
                        <td>11</td>
                    </tr>                    
                    <tr>
                        <td>1</td>
                        <td>Vosselaar&nbsp;&nbsp;&nbsp;<img alt="file" src="images/fileimg.PNG"></td>
                        <td>박지은  (부서명)</td>
                        <td>16/11/06</td>
                        <td>100</td>
                    </tr>
                    </tbody>
                </table>
                <button type="button" class="btn btn-outline btn-success" style="text-align:right">글 등록</button>
			</div>

            </div>
             <div class="panel-footer"  style="text-align:center;">
                <div class="btn-group">
                    <button type="button" class="btn btn-default"><i class="fa fa-chevron-left" style=" font-size: 20px;"></i></button>
                    <button class="btn btn-default active">1</button>
                    <button class="btn btn-default  ">2</button>
                    <button class="btn btn-default">3</button>
                    <button class="btn btn-default">4</button>
                    <button type="button" class="btn btn-default "><i class="fa fa-chevron-right" style=" font-size: 20px;"></i></button>
                </div>
              </div>
        </div> 
            
         
   </div>  
</div>
</div>