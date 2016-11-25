<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					<li><span>App views</span></li>
					<li class="active"><span>Mailbox</span></li>
				</ol>
			</div>
			<h2 class="font-light m-b-xs">메일함 보기</h2>
			<small>메일을 확인하세요!</small>
		</div>
	</div>
</div>
<div class="content animate-panel">

	<div class="row">
		<div class="col-md-3">
			<jsp:include page="/sidebar/mailLeftList_side.jsp"></jsp:include>
		</div>

		<div class="col-md-9">
			<div class="hpanel">
				<div class="panel-heading hbuilt">
					<div class="text-center p-xs font-normal">
						<div class="input-group">
							<input type="text" class="form-control input-sm" placeholder="Search email in your inbox..."> 
							<span class="input-group-btn">
								<button type="button" class="btn btn-sm btn-default" style="color:#f05050"><span class="fa fa-search"></span> Search
								</button>
							</span>
						</div>
					</div>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-md-6 m-b-md">
							<div class="btn-group">
								<button class="btn btn-default btn-sm">
									<i class="fa fa-refresh"></i> Refresh
								</button>
								<button class="btn btn-default btn-sm" >
									&nbsp;<i class="fa fa-eye"></i>
								</button>
								<button class="btn btn-default btn-sm" >
									&nbsp;<i class="fa fa-exclamation"></i>
								</button>
								<button class="btn btn-default btn-sm">
									&nbsp;<i class="fa fa-trash-o"></i>
								</button>
								<button class="btn btn-default btn-sm" >
									&nbsp;<i class="fa fa-check"></i>
								</button>
								<button class="btn btn-default btn-sm" >
									<i class="fa fa-tag"></i>
								</button>
							</div>
						</div>
						<div class="col-md-6 mailbox-pagination m-b-md">
							<div class="btn-group">
								<button class="btn btn-default btn-sm">
									<i class="fa fa-arrow-left"></i>
								</button>
								<button class="btn btn-default btn-sm">
									<i class="fa fa-arrow-right"></i>
								</button>
							</div>
						</div>
					</div>
					<div class="table-responsive">
						<!-- <hr style="border:1px solid gray; margin-bottom:0px"> -->
						<table class="table table-hover table-mailbox">
							<thead>
								<tr>
									<th>보낸사람</th>
									<th>제목</th>
									<th class="text-right mail-date">시간</th>
								</tr>
								<tr>
									<th colspan="5"></th>
								</tr>
							</thead>
							<tbody>
							
								<c:forEach var="list" items="${maillist}">
								<tr>
								<c:choose>
									<c:when test="${list.emp_no eq '=?UTF-8?Q?Google_=EC=BB=A4=EB=AE=A4=EB=8B=88=ED=8B=B0=ED=8C=80?= <googlecommunityteam-noreply@google.com>'}">
										<td><a href="#">googlecommunityteam-noreply@google.com</a></td>
									</c:when>
									<c:otherwise>
										<td><a href="#">${list.emp_no}</a></td>
									</c:otherwise>
								</c:choose>
									<td><a href="#" onClick="javascript:window.open('${pageContext.request.contextPath}/mail/data/${list.mail_content}.html','popup','scrollbars=no, resizable=no, width=500px,height=800px')">${list.title}</a><span class="text-right mail-date"><i class="fa fa-paperclip"></i></span></td>
									<td class="text-right mail-date">${list.rec_check}</td>
								</tr>
								<tr id="mailload"></tr>
								</c:forEach>
								<tr>
									<td colspan="3"><a href="#" onclick="location.href='mailbox.do?page=${usepage}'">다음 메일</a></td>
								</tr>
							
							
							</tbody>
						</table>
					</div>
				</div>
				<div class="panel-footer">
						<input type="button" class="btn btn-sm btn-success" value="메일쓰기" id="writeMailBtn" style="padding-right: 15px; padding-left: 15px; font-weight: 600; font-size: 13px">
						<input type="button" class="btn btn-sm btn-default" value="삭제하기" style="padding-right: 15px; padding-left: 15px; font-weight: 600; font-size: 13px">
				</div>
				<div class="panel-footer"  style="text-align:center;">
                <div class="btn-group">
					<c:if test="${cpage > 1}">
                    	<button type="button" class="btn btn-default" onclick="location.href='mailbox.do?currentpage=${cpage-1}&pagesize=${psize}'">&nbsp;<i class="fa fa-chevron-left"></i></button>
                    </c:if>
                    <c:forEach var="i" begin="1" end="${pagecount}" step="1">	
                    <c:choose>
                    	<c:when test="${cpage==i}">
                    		<button class="btn btn-default active" style="background-color:#DAD9FF"><b>${i}</b></button>
                    	</c:when>
                    	<c:otherwise>
							<button class="btn btn-default" onclick="location.href='mailbox.do?currentpage=${i}&pagesize=${psize}'">${i}</button>                	
                    	</c:otherwise>
                    </c:choose>
					</c:forEach>
					<c:if test="${cpage < pagecount}">
                    	<button type="button" class="btn btn-default" onclick="location.href='mailbox.do?currentpage=${cpage+1}&pagesize=${psize}'">&nbsp;<i class="fa fa-chevron-right"></i></button>
                	</c:if>
                
                </div>
              </div>
			</div>
		</div>
	</div>
</div>
