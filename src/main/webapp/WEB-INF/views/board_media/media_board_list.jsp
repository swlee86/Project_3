<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>

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
                    <li><a href="index.html">홈</a></li>
                    <li>
                        <span>게시판</span>
                    </li>
                    <li class="active">
                        <span>언론 게시판</span>
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
					<div class="row text-right">
						<div class="col-md-6">
							<form name="list">
								<select name="pagesize" onchange="submit()" class="form-control input-sm" style="width: 20%;">
									<c:forEach var="i" begin="5" end="25" step="5">
										<c:choose>
											<c:when test="${pgsize == i}">
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
						<form action="media_board_list.do" class="form-inline ">
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
										<input type="text" class="form-control input-sm" name="q" />
										<span class="input-group-btn">
											<button class="btn btn-default input-sm" type="submit"
												style="color: #f05050">
												<span class="fa fa-search"></span>
											</button>
										</span>
									</div>
								</div>
							</div>
						</form>
					</div>


					<br>
					<hr style="border: 1px solid gray; margin-bottom: 0px">
					<div class="table-responsive">
						<table cellpadding="1" cellspacing="1" class="table  table-hover" style="text-align: left">
							<thead>
								<tr style="background-color: #f6f6f6;">
									<th style="text-align: center">번호</th>
									<th style="width: 50%;">제목</th>
									<th>작성자명</th>
									<th>작성일시</th>
									<th>조회수</th>
								</tr>
							</thead>
							<tbody>

								<c:forEach items="${list}" var="n">
									<tr>
										<td style="text-align: center">${n.no}</td>
										<td>
											<a href="media_board_view.do?no=${n.no}&pg=${pg}&pagesize=${pgsize}">${n.title}
											<c:if test="${not empty n.file_name}">
												&nbsp;&nbsp;&nbsp;<img alt="file" src="images/fileimg.PNG">
											</c:if></a>
										</td>
										<td>${n.emp_name}</td>
										<td>${n.regdate}</td>
										<td>${n.hit}</td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
						<div class="row" style="text-align: right; margin-right: 5px;">
              			<se:authorize access="hasRole('ROLE_MEDIA')">
							<button type="button" class="btn w-xs btn-success" onclick="location.href='media_board_write.do'" style="padding-right: 15px; padding-left: 15px; font-weight: 600; font-size: 13px">글
								등록</button>
						</se:authorize>
						</div>
					</div>

				</div>
				<div class="panel-footer"  style="text-align:center;">
                <div class="btn-group">
                	<c:if test="${pg>1}">
                		<button type="button" class="btn btn-default" onclick="location.href='media_board_list.do?pg=${pg-1}&f=${field}&q=${query}&pagesize=${pgsize}'">&nbsp;<i class="fa fa-chevron-left"></i></button>
                	</c:if>
                	
                    <c:forEach var="i" begin="1" end="${pagecount}" step="1">
                    	<c:choose>
                    		<c:when test="${pg==i}">
                    			<button class="btn btn-default active" style="background-color:#DAD9FF"><b>${i}</b></button>
                    		</c:when>
                    		<c:otherwise>
                    			 <button class="btn btn-default" onclick="location.href='media_board_list.do?pg=${i}&f=${field}&q=${query}&pagesize=${pgsize}'">${i}</button>
                    		</c:otherwise>
                    	</c:choose> 	
                    </c:forEach>
                    
                   	<c:if test="${pg < pagecount}">
                    	<button type="button" class="btn btn-default " onclick="location.href='media_board_list.do?pg=${pg+1}&f=${field}&q=${query}&pagesize=${pgsize}'">&nbsp;<i class="fa fa-chevron-right"></i></button>
                    </c:if>
                </div>
              </div>
        </div> 
            
         
   </div>  
</div>
</div>