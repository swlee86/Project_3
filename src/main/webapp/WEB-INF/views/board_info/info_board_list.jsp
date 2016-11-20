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
                	회사 정보게시판
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
                	총 개시글 수 : <font color="coral">${totalcount}</font> 개
            </div>
            <div class="panel-body">
            	<div class="row" style="text-align:right; margin-right:5px;">
            			<form id="searchForm" action="info_board_list.do" class="form-inline" method="POST">
                 			<select class="form-control input-sm">
                    			<option>제목</option>
                    		 </select> 	
                    		 <input type="text" class="form-control input-sm" name="title" id="title"/>
                    		 <button id="searchBtn" class="btn btn-sm btn-default" type="submit">&nbsp;<span class="fa fa-search" ></span> </button>
                		</form>
                </div>           	
                <br>     
                <hr style="border:1px solid gray; margin-bottom:0px">
                <div class="table-responsive">
                <table cellpadding="1" cellspacing="1" class="table  table-hover" style="text-align:left">
                    <thead>
                    <tr style="background-color:#f6f6f6;">
                        <th style="text-align:center">번호</th>
                        <th style="width:50%;">제목</th>
                        <th >작성자명</th>
                        <th >작성일시</th>
                        <th >조회수</th>
                    </tr>
                    </thead>
                    <tbody>
                 		<c:forEach var="list" items="${companyList}">
                 			<tr>
                 				<td style="text-align:center">${list.no}</td>
                 				<td><a href="detailinfo_board_list.do?no=${list.no}&currentpage=${cpage}&pagesize=${psize}">${list.title}</a></td>
                 				<td>관리자</td>
                 				<td>${list.regdate}</td>
                 				<td>${list.hit}</td>
                 			</tr> 
                 		</c:forEach>
                    </tbody>
                </table>
                <div class="row" style="text-align:right; margin-right:5px;">
                	<button type="button" class="btn w-xs btn-success" onclick="location.href='info_board_write.do'" >글 등록</button>
                </div>
			</div>

            </div>
             <div class="panel-footer"  style="text-align:center;">
                <div class="btn-group">
                    <c:if test="${cpage>1}">
                    	<a href="info_board_list.do?currentpage=${cpage-1}&pagesize=${psize}"><button type="button" class="btn btn-default">&nbsp;<i class="fa fa-chevron-left"></i></button></a>
                    </c:if>
                    <c:forEach var="i" begin="1" end="${pagecount}" step="1">	
						<a href="info_board_list.do?currentpage=${i}&pagesize=${psize}"><button class="btn btn-default">${i}</button></a>
					</c:forEach>
					<c:if test="${cpage>1}">
                    	<a href="info_board_list.do?currentpage=${cpage+1}&pagesize=${psize}"><button type="button" class="btn btn-default ">&nbsp;<i class="fa fa-chevron-right"></i></button></a>
                	</c:if>
                
                </div>
              </div>
        </div> 
            
         
   </div>  
</div>
</div>