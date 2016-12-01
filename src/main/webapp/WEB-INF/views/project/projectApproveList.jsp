<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<script>
$(function(){

	if($('#pj_approval_search').val() == 'step_no'){
		$('#pj_approval_search_keyword').empty();
		$('#pj_approval_search_keyword').append('<select class="form-control input-sm" name="q">'+
														'<option value="2">승인거부</option>'+
														'<option value="3">보류</option>'+
														'<option value="4">미승인</option>'+
													'</select>'
													);
	}
	$('#pj_approval_search').change(function(){
		console.log('select 체인지');
		console.log($('#pj_approval_search').val());
		if($('#pj_approval_search').val() == 'step_no'){
			$('#pj_approval_search_keyword').empty();
			$('#pj_approval_search_keyword').append('<select class="form-control input-sm" name="q">'+
															'<option value="2">승인거부</option>'+
															'<option value="3">보류</option>'+
															'<option value="4">미승인</option>'+
														'</select>'
														);
		}else{
			$('#pj_approval_search_keyword').empty();
			$('#pj_approval_search_keyword').append('<input type="text" class="form-control input-sm" name="q" />');
		}
	});
	

});

</script>
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
                    <li><a href="index.do">Home</a></li>
                    <li>
                        <span>Project</span>
                    </li>
                    <li class="active">
                        <span>ProjectApprovalList</span>
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
                	전체 : <font color="coral">ss</font> 개
            </div>
            <div class="panel-body">
					<div class="row text-right">
						<div class="col-md-6"></div>
						<form action="projectApprove.do" class="form-inline ">
							<div class="col-md-2">
								<div class="form-group">
									<select class="form-control input-sm" name="f" id="pj_approval_search">
										<option value="emp_name" <c:if test="${field == 'emp_name'}">selected</c:if>>책임자</option>
										<option value="step_no" <c:if test="${field == 'step_no'}">selected</c:if>>승인단계</option> 
										<option value="pj_title" <c:if test="${field == 'pj_title'}">selected</c:if>>제목</option>
										
									</select>
								</div>
							</div>

							<div class="col-md-4">
								<div class="form-group">
									<div class="input-group">
										<span id="pj_approval_search_keyword">
											<input type="text" class="form-control input-sm" name="q" value=""/>
										</span>
										
										<span class="input-group-btn">
											<button class="btn btn-default input-sm" type="submit" style="color: #f05050">
												<span class="fa fa-search"></span>
											</button>
										</span>
									</div>
								</div>
							</div>
						</form>
					</div>








					<hr style="border:1px solid gray; margin-bottom:0px">
                <div class="table-responsive">
                <table id="example1"  class="footable table-stripped toggle-arrow-tiny table table-hover"  data-page-size="8" data-filter=#filter>
                    <thead>
                    <tr>
                        <th><input type="checkbox" class="i-checks"></th>
                        <th data-toggle="true" >책임자</th>
                        <th >프로젝트명</th>
                        <th>기 &nbsp; 간</th>
                        <th>승인단계</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${list}" var="p">
	                    <tr>
	                        <td><input type="checkbox" class="i-checks"></td>
	                        <td>${p.emp_name}</td>
	                        <td><a href="project_approve_detailview.do?pj_no=${p.pj_no}">${p.pj_title}</a></td>
	                        <td>${p.pj_start}&nbsp; &nbsp;~&nbsp; &nbsp;${p.pj_end}</td>
	                        <td>
	                        	<c:choose> 
	                        		<c:when test="${p.step_no == '2'}">
	                        			승인거부
	                        		</c:when>
	                        		<c:when test="${p.step_no == '3'}">
	                        			보류
	                        		</c:when>
	                        		<c:when test="${p.step_no == '4'}">
	                        			미승인
	                        		</c:when>
	                        	</c:choose>
	                        </td>
	                    </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="row" style="text-align:right; margin-right:5px;">
                	<button type="button"  class="btn btn-sm btn-success" style="padding-right:15px;padding-left:15px;font-weight:600;font-size:13px">일괄승인</button>
                </div>
			</div>

            </div>






				<div class="panel-footer" style="text-align: center">
					<div class="btn-group">
						<c:if test="${pg>1}">
							<a class="btn btn-default" href="projectApprove.do?tapno=${tapno}&pg=${pg-1}&f=${field}&q=${query}&group=${group}">
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
									<a class="btn btn-default" href="projectApprove.do?pg=${i}&f=${field}&q=${query}"> ${i} </a>
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<c:if test="${pg < pagecount}">
							<a class="btn btn-default" href="projectApprove.do?pg=${pg+1}&f=${field}&q=${query}"> 
							&nbsp;<i class="fa fa-chevron-right"></i>
							</a>
						</c:if>
					</div>
				</div>


			</div> 
   </div>  
</div>


</div>

