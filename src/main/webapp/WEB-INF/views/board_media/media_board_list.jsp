<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <li><a href="index.html">Home</a></li>
                    <li>
                        <span>Board</span>
                    </li>
                    <li class="active">
                        <span>Media Board</span>
                    </li>
                </ol>
            </div>
            <h2 class="font-light m-b-xs">
                	언론 게시판
            </h2>
            <small>회사의 언론정보를 공유하는 게시판입니다.</small>
        </div>
    </div>
</div>

<div class="content animate-panel">
	<div class="row">
	
    <div class="col-lg-12">
        <div class="hpanel">
            <div class="panel-heading">
                	총 개시글 수 : <font color="coral">${totalcount}</font> 개
            </div>
            <div class="panel-body">
            	<div class="row" style="text-align:right; margin-right:5px;">
            			<form action="media_board_list.do"  class="form-inline"  method="get">	
                 			<select  class="form-control input-sm" name="f">
                    			<option value="title">제목</option>
                        		<option value="emp_name">작성자명</option>
                    		 </select>


							<div class="input-group">
								<input type="text" class="form-control input-sm" name="q" /> <span
									class="input-group-btn">
									<button class="btn btn-sm btn-default" type="submit">
										&nbsp;<span class="fa fa-search"></span>
									</button>
								</span>
							</div>
						</form>
                </div> 
                
                
                          	
                <br>     
                <hr style="border:1px solid gray; margin-bottom:0px">
                <div class="table-responsive">
                <table cellpadding="1" cellspacing="1" class="table  table-hover"   style="text-align:left">
                    <thead>
                    <tr style="background-color:#f6f6f6;">
                        <th  style="text-align:center">번호</th>
                        <th style="width:50%;">제목</th>
                        <th>작성자명</th>
                        <th>작성일시</th>
                        <th>조회수</th>
                    </tr>
                    </thead>
                    <tbody>
                    
                    <c:forEach items="${list}"  var="n">
                    	<tr>
	                        <td  style="text-align:center">${n.no}</td>
	                        <td>
	                        	<a href="media_board_view.do?no=${n.no}">${n.title}<c:if test="${not empty file_name}">&nbsp;&nbsp;&nbsp;<img alt="file"  src="images/fileimg.PNG"></c:if></a>
	                        </td>
	                        <td>${n.emp_name}</td>
	                        <td>${n.regdate}</td>
	                        <td>${n.hit}</td>
                   	 	</tr>
                    </c:forEach>

                    </tbody>
                </table>
                <div class="row" style="text-align:right; margin-right:5px;">
                	<button type="button" class="btn w-xs btn-success" onclick="location.href='media_board_write.do'" style="padding-right:15px;padding-left:15px;font-weight:600;font-size:13px">글 등록</button>
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