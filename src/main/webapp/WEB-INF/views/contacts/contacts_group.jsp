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
					<li><span>주소록</span></li> 
					<li class="active"><span>주소록 그룹 관리</span></li>
				</ol>
			</div>
			<h2 class="font-light m-b-xs">개인 주소록</h2>
			<small>회원 마다 가질수 있는 주소록입니다.</small>
		</div>
	</div>
</div>


<div class="content animate-panel">
	<div class="row">
		<!-- <div class="col-md-3">
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
					<a data-toggle="collapse" data-parent="#accordion" href="#q1" aria-expanded="true"> <i class="fa fa-chevron-down pull-right text-muted"></i>  <b>개인 주소록 그룹</b>
					</a>
					<div id="q1" class="panel-collapse collapse">
						<hr>
						그룹
					</div>
				</div>
				<div class="panel-body" style="text-align: center">
					<a class="btn w-xs btn-outline btn-success btn-block" href="contacts_group.do">
						주소록 그룹 관리
					</a>
				</div>
			</div>
		</div> -->
		
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
					<div id="q1" class="panel-collapse collapse groupdiv" id="accordiongroup">
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




		<div class="col-md-9">
			<div class="hpanel">
				<div class="panel-body">
					<div class="row">
						<div class="col-md-5">
							<div class="col-md-11">
								<div class="row groupdiv" style=" border: 1px solid #ddd; height:300px">
									<div style="background-color:#f6f6f6;padding:10px 0 10px 12px;margin-bottom:5px"><b>개인그룹 목록</b></div>
									<input type="hidden" id="grouplistsize" value="${grouplistsize}" > 
									
										<c:forEach items="${grouplist}" var="g">
											<c:choose>
												<c:when test="${g.group_no == 1}"></c:when>
												<c:otherwise>
													&nbsp;&nbsp;&nbsp;&nbsp;<img src="${pageContext.request.contextPath}/img/line.PNG" class="grouplineimg"><img src="${pageContext.request.contextPath}/img/fileimg.png" style="width:14px;height:14px;">&nbsp;&nbsp;<a href="#" class="contact_group_class" id="a${g.group_no}" >${g.group_name}</a><br>			
												</c:otherwise>
											</c:choose>
											
										</c:forEach> 
								
								</div>
								<br>
								<div class="row">
									<button type="button" style="background-color:#363636; " id="contact_group_enroll_btn" class="btn  btn-primary btn-sm btn-block"> 개인 주소록 그룹 등록 </button>
								</div>
							</div>
						</div>
						
						<div class="col-md-7" id="contact_group_from">
							<form method="post" action="contacts_group_insert.do" id="contact_group_from_action">
							 	<table  class="table table-bordered">
							 			<tr>
							 				<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:20%"><font color="#f05050">*</font> 그룹명</th>
											<td>
												<input type="text" name="group_name" id="group_name" class="form-control  input-sm" >
												<input type="hidden" name="pre_group_no" id="pre_group_no" value="">
											</td>
							 			</tr>			 				
							 	</table>
							 	<div class="row text-right" style="margin-right:5px;">
							 		<input type="submit" id="contact_group_from_submit" class="btn  btn-success btn-sm" style="padding-right:15px;padding-left:15px;font-weight:600;font-size:13px;" value="저장">
							 		<a href="" id="contact_group_delete_btn" class="btn  btn-default btn-sm" style="padding-right:15px;padding-left:15px;font-weight:600;font-size:13px"> 삭제 </a>
							 		<a href="contacts_group.do" class="btn  btn-default btn-sm" style="padding-right:15px;padding-left:15px;font-weight:600;font-size:13px">취소</a>
							 	</div>
							</form>
						</div> 
						
						
					</div>
				</div>
				<div class="panel-footer" style="text-align: center;">&nbsp;</div>
			</div>
		</div>
	</div>
</div>
