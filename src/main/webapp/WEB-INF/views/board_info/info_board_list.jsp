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
                	총 게시글 수 : <font color="coral">${totalcount}</font> 개
            </div>
             
            
            <div class="panel-body">
            	<div class="row">
            		<div class="col-md-6">
            			<form name="list">
							<select name="pagesize" onchange="submit()" class="form-control input-sm" style="width: 20%;">
								<c:forEach var="i" begin="5" end="25" step="5">
									<c:choose>
										<c:when test="${psize == i}">
											<option value='${i}' selected>${i}건</option>
										</c:when>
										<c:otherwise>
											<option value='${i}'>${i}건</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</form>
            		</div>
            		<div class="text-right">
            			<form id="searchForm" action="info_board_list.do" class="form-inline" method="POST">
                 			<div class="col-md-2">
                 				<div class="form-group">
                 					<select class="form-control input-sm" name="f">
                    					<option value="title">제목</option>
                    					<option value="emp_name">작성자</option>
                    				</select> 	
                    			</div>
                    		</div>
                    		
                    		<div class="col-md-4">
                    			<div class="form-group">
                    				<div class="input-group">
                    	            	<input type="text" class="form-control input-sm" name="q" id="title"/>
                    					<span class="input-group-btn">
                                  			<button id="searchBtn" class="btn btn-sm btn-default input-sm" type="submit"
                                  			style="color: #f05050">
                                  				<span class="fa fa-search" ></span>
                                  			</button>
                    					</span>
                    				</div>
                    			</div>
                    		</div>
                		</form>
                	</div>
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
                 				<td>
                 					<a href="detailinfo_board_list.do?no=${list.no}&currentpage=${cpage}&pagesize=${psize}">
                 						${list.title} <c:if test="${list.file_name != null}"><img alt="file" src="images/fileimg.PNG"></c:if>
                 					</a>
                 				</td>
                 				<td>${list.emp_name}</td>
                 				<td>${list.regdate}</td>
                 				<td>${list.hit}</td>
                 			</tr> 
                 		</c:forEach>
                    </tbody>
                </table>
                <div class="row" style="text-align:right; margin-right:5px;">
                	<%-- <c:if test="${rec_emp_no}"> --%>
	                	<button type="button" class="btn w-xs btn-success" onclick="location.href='info_board_write.do'" >글 등록</button>
	                <%-- </c:if> --%>
                </div>
			</div>

            </div>
             <div class="panel-footer"  style="text-align:center;">
                <div class="btn-group">
                  <c:if test="${cpage > 1}">
                    	<button type="button" class="btn btn-default" onclick="location.href='info_board_list.do?currentpage=${cpage-1}&pagesize=${psize}'">&nbsp;<i class="fa fa-chevron-left"></i></button>
                    </c:if>
                    <c:forEach var="i" begin="1" end="${pagecount}" step="1">	
                    <c:choose>
                    	<c:when test="${cpage==i}">
                    		<button class="btn btn-default active" style="background-color:#DAD9FF"><b>${i}</b></button>
                    	</c:when>
                    	<c:otherwise>
							<button class="btn btn-default" onclick="location.href='info_board_list.do?currentpage=${i}&pagesize=${psize}'">${i}</button>                	
                    	</c:otherwise>
                    </c:choose>
					</c:forEach>
					<c:if test="${cpage < pagecount}">
                    	<button type="button" class="btn btn-default" onclick="location.href='info_board_list.do?currentpage=${cpage+1}&pagesize=${psize}'">&nbsp;<i class="fa fa-chevron-right"></i></button>
                	</c:if>
            
                
                </div>
              </div>
        </div> 
            
           
         
   </div>  
</div>
</div>