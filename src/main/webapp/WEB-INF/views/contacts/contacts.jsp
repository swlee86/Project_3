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
					<li><a href="index.html">홈</a></li>
					<!-- <li><span>App views</span></li> -->
					<li class="active"><span>주소록</span></li>
				</ol>
			</div>
			<h2 class="font-light m-b-xs">개인 주소록 </h2>
			<small>회원 마다 가질수 있는 주소록입니댜.</small>
		</div>
	</div>
</div>

<div class="content animate-panel">
	<div class="row">
		<div class="col-md-3">
			<div class="hpanel panel-group" id="accordion" role="tablist" aria-multiselectable="true">
				<div class="panel-body">
					<a class="btn w-xs btn-success btn-block" href="enroll.do">주소록 등록</a>
				</div>
				<div class="panel-body">
					<h4 class="m-t-none m-b-none" style="font-size:1em">
						<a href="contacts.do">전체 주소록</a>
					</h4>
				</div>
				<div class="panel-body">
					<a data-toggle="collapse" data-parent="#accordion"  href="#q1" aria-expanded="true"> <i class="fa fa-chevron-down pull-right text-muted"></i>  <b>개인 주소록 그룹</b>
					</a>
					<div id="q1" class="panel-collapse collapse groupdiv" id="accordiongroup" style="display:block">
					<div style="margin-bottom:10px"> </div>
							<c:forEach items="${grouplist}" var="g">
								<c:choose>
									<c:when test="${g.group_no == 1}"></c:when> 
									<c:otherwise>
										&nbsp;&nbsp;&nbsp;&nbsp;<img src="${pageContext.request.contextPath}/img/line.PNG" class="grouplineimg"><img src="${pageContext.request.contextPath}/img/fileimg.png" style="width:14px;height:14px;">&nbsp;&nbsp;<a href="" class="contact_list_group_class" id="${g.group_no}">${g.group_name}</a><br>	
									</c:otherwise>
								</c:choose>
								
								
								<%-- <li><a href="" class="contact_list_group_class" id="${g.group_no}">${g.group_name}</a></li>	 --%>
							</c:forEach>
						
						
					</div>
				</div>
				<div class="panel-body" style="text-align: center">
					<a class="btn w-xs btn-outline btn-success btn-block" href="contacts_group.do">
						주소록 그룹 관리
					</a>
				</div>
			</div>
		</div>
	<input type="hidden" id="groupnumber" value="${group}">
<%-- 	<input type="hidden" id="field" value="${field}">
	<input type="hidden" id="query" value="${query}"> --%>
<%-- 	<input type="hidden" id="contactmsg" value="${contactmsg}"> --%>


		<div class="col-md-9">
			<div class="hpanel">
				<ul class="nav nav-tabs tabstyle">
					<li class="<c:if test="${empty tapno}">active</c:if>"><a data-toggle="tab" href="#tab-1" id="all">ALL</a></li>
					<li class="<c:if test="${2 == tapno}">active</c:if>"><a data-toggle="tab" href="#tab-2" id="ga">가</a></li> 
					<li class="<c:if test="${3 == tapno}">active</c:if>"><a data-toggle="tab" href="#tab-3" id="na">나</a></li>
					<li class="<c:if test="${4 == tapno}">active</c:if>"><a data-toggle="tab" href="#tab-4" id="da">다</a></li>
					<li class="<c:if test="${5 == tapno}">active</c:if>"><a data-toggle="tab" href="#tab-5" id="la">라</a></li>
					<li class="<c:if test="${6 == tapno}">active</c:if>"><a data-toggle="tab" href="#tab-6" id="ma">마</a></li>
					<li class="<c:if test="${7 == tapno}">active</c:if>"><a data-toggle="tab" href="#tab-7" id="ba">바</a></li>
					<li class="<c:if test="${8 == tapno}">active</c:if>"><a data-toggle="tab" href="#tab-8" id="sa">사</a></li>
					<li class="<c:if test="${9 == tapno}">active</c:if>"><a data-toggle="tab" href="#tab-9" id="aa">아</a></li>
					<li class="<c:if test="${10 == tapno}">active</c:if>"><a data-toggle="tab" href="#tab-10" id="ja">자</a></li>
					<li class="<c:if test="${11 == tapno}">active</c:if>"><a data-toggle="tab" href="#tab-11" id="cha">차</a></li>
					<li class="<c:if test="${12 == tapno}">active</c:if>"><a data-toggle="tab" href="#tab-12" id="ca">카</a></li>
					<li class="<c:if test="${13 == tapno}">active</c:if>"><a data-toggle="tab" href="#tab-13" id="ta">타</a></li>
					<li class="<c:if test="${14 == tapno}">active</c:if>"><a data-toggle="tab" href="#tab-14" id="pa">파</a></li>
					<li class="<c:if test="${15 == tapno}">active</c:if>"><a data-toggle="tab" href="#tab-15" id="ha">하</a></li>
					<li class="<c:if test="${16 == tapno}">active</c:if>"><a data-toggle="tab" href="#tab-16" id="alp">A-Z</a></li>
					<li class="<c:if test="${17 == tapno}">active</c:if>"><a data-toggle="tab" href="#tab-17" id="num">0-9</a></li>
				</ul>
				
				
				
				
				<div class="tab-content" >												
					<div id="tab-${tapno}" class="tab-pane active" >
						<div class="panel-body">
							<div class="row text-right">
								<div class="col-md-6"></div>
								<form action="contacts.do" class="form-inline ">
									<input type="hidden" name="tapno" value="${tapno}">
									<input type="hidden" name="group" value="${group}">
									<div class="col-md-2">
										<div class="form-group">
											<select class="form-control input-sm" name="f">
												<option value="name">이름</option>
												<option value="attach">소속</option>
											</select>
										</div>
									</div>

									<div class="col-md-4">
										<div class="form-group">
											<div class="input-group">
												<input type="text" class="form-control input-sm" name="q" />
												<span class="input-group-btn">
													<button class="btn btn-default input-sm" type="submit" style="color: #fd7d86">
														<b><span class="fa fa-search"></span></b>
													</button>
												</span>
											</div>
										</div>
									</div>
								</form>
							</div>
							<hr>

							
							<div class="row">
								<input type="hidden" id="listsize" value="${listsize}">					
								<c:choose>
									<c:when test="${listsize == 0}">
									
									</c:when>
									<c:otherwise>
										<c:forEach begin="0" end="${listsize-1}" step="1" var="n">
											<div class="col-lg-6">
												<div class="hpanel hblue contact-panelt">
													<div class="panel-body">
													<%-- /images/profile.jpg  :  ${list[n].pic} --%>
														<img alt="logo" class="img-circle m-b" src="${pageContext.request.contextPath}/img/upload/${list[n].pic}" align="left">
														<h4>
															<a href="" data-toggle="modal" data-target="#myModal" id="conmodal_${n}"><B>${list[n].name}</B></a>
														</h4>
														<p>
															<%-- id : conmodal_${n}<br> --%>
															<%-- 주소록 번호(contact_no_${n}) : ${list[n].contact_no}  --%>
															<input type="hidden" id="contact_no_${n}" value="${list[n].contact_no}"> 
															연락처2 : <c:if test="${not empty list[n].tel2}">${list[n].tel2}</c:if>
															<br> 소속 : <c:if test="${not empty list[n].attach}">${list[n].attach}</c:if>
															<br> 메일 : <c:if test="${not empty list[n].mail}">${list[n].mail}</c:if>
														</p>
													</div>
												</div>
											</div>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</div>
							
							
						</div>
						
						<div class="panel-footer" style="text-align: center">
							<div class="btn-group">
								<c:if test="${pg>1}">
									<a  class="btn btn-default" href="contacts.do?tapno=${tapno}&pg=${pg-1}&f=${field}&q=${query}&group=${group}">
										&nbsp;<i class="fa fa-chevron-left"></i>
									</a>
								</c:if>

								<c:forEach var="i" begin="1" end="${pagecount}">
									<c:choose>
										<c:when test="${pg==i}">
											<button class="btn btn-default active" style="background-color: #DAD9FF">
												<b>${i}</b>
											</button>
										</c:when>
										<c:otherwise>
											<a class="btn btn-default" href="contacts.do?tapno=${tapno}&pg=${i}&f=${field}&q=${query}&group=${group}">
												${i}
											</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>

								<c:if test="${pg < pagecount}">
									<a class="btn btn-default" href="contacts.do?tapno=${tapno}&pg=${pg+1}&f=${field}&q=${query}&group=${group}">
										&nbsp;<i class="fa fa-chevron-right"></i>
									</a>
								</c:if>
							</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
</div>








<div class="modal fade hmodal-success" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="color-line"></div>
			<div class="modal-header text-center" style="height:180px;padding-top:25px">
				<h4 class="modal-title"><img alt="logo" id="m_img" class="img-circle m-b" style="width:130px;height:130px"></h4>
			</div>
			<div class="modal-body">
				<table class="table  table-condensed  table-bordered">
					<tr>
						<td style="background-color:#f9f9f9;text-align:right;font-weight:600;padding-right:10px">이름</td>
						<td id="m_name"></td>
						<td style="background-color:#f9f9f9;text-align:right;font-weight:600;padding-right:10px">소속</td>
						<td id="m_attach"></td>
					</tr>
					<tr>
						<td style="background-color:#f9f9f9;text-align:right;font-weight:600;padding-right:10px">생년월일</td>
						<td id="m_birth"></td>
						<td style="background-color:#f9f9f9;text-align:right;font-weight:600;padding-right:10px">메일</td>
						<td id="m_mail"></td>
					</tr>
					<tr>
						<td style="background-color:#f9f9f9;text-align:right;font-weight:600;padding-right:10px">연락처1</td>
						<td id="m_tel1"></td>
						<td style="background-color:#f9f9f9;text-align:right;font-weight:600;padding-right:10px">연락처2</td>
						<td id="m_tel2"></td>
					</tr>
					<tr>
						<td style="background-color:#f9f9f9;text-align:right;font-weight:600;padding-right:10px">메모</td>
						<td id="m_memo" colspan="3"></td>
					</tr>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default btn-sm" data-dismiss="modal" style="padding-right:15px;padding-left:15px;font-weight:600;font-size:13px">닫기</button>
				<a href="" id="contact_modla_update" class="btn btn-success btn-sm"  style="padding-right:15px;padding-left:15px;font-weight:600;font-size:13px">수정</a>
				<a  href="" id="contact_modla_delete" class="btn btn-success btn-sm" style="padding-right:15px;padding-left:15px;font-weight:600;font-size:13px">삭제</a>
			</div>
		</div>
	</div>
</div>