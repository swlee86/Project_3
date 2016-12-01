<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
$(function(){
	
});

</script>
<!--프로젝트 승인클릭 시 뜨는 상세 페이지-->
<div class="normalheader transition animated fadeIn media-body">
	<div class="hpanel">
		<div class="panel-body">
			<a class="small-header-action" href="">
				<div class="clip-header">
					<i class="fa fa-arrow-up"></i>
				</div>
			</a>

			<div id="hbreadcrumb" class="pull-right m-t-lg">
				<ol class="hbreadcrumb breadcrumb">
					<li><a href="index.do">Home</a></li>
					<li><span>Project</span></li>
					<li class="active"><span>ProjectApprovalDetail</span></li>
				</ol>
			</div>
			<h2 class="font-light m-b-xs">프로젝트 승인 처리</h2>
			<small>프로젝트 승인 처리 상세 페이지 입니다.</small>
		</div>
	</div>
</div>


<div class="content animate-panel">

<div class="row">
    <div class="col-lg-5">
        <div class="hpanel hgreen">
            <div class="panel-body">
                <h3>Title. ${pj.pj_title}</h3>
                <dl>
                    <dt>Writer. ${pj.emp_name}</dt>
                    <dd><i class="pe-7s-date" style="font-size:2em"></i> ${pj.pj_start}~${pj.pj_end}</dd>
                </dl>
                <p>
                  ${pj.pj_content}
                </p>
            </div>
            <div class="panel-body">
                버튼
            </div>
        </div>
    </div>
    
    <div class="col-lg-7">
        <div class="hpanel">
            <div class="hpanel">

            <ul class="nav nav-tabs">
            	<li class="active"><a data-toggle="tab" href="#tab-1">상세프로젝트 - 1</a></li>
            	<c:forEach begin="2" end="${listsize}" var="i">
            		<li class=""><a data-toggle="tab" href="#tab-${i}">상세프로젝트 - ${i}</a></li>
            	</c:forEach> 
            </ul>
            
            <c:set var="tabcount" value="1"/>
            
            <div class="tab-content">  
           	 	<c:forEach items="${list}" var="list">
	                <div id="tab-${tabcount}" class="tab-pane <c:if test="${tabcount==1}">active</c:if>"> 
	                
	                    <div class="panel-body">
	                            <table class="table table-bordered" class="table table-bordered" style="margin-bottom: 0px">    
	                                <tr>
	                                    <th  style="background-color: #f9fafc; text-align: right; padding-right: 10px; width: 10%">상세제목</th>
	                                   	<td>${list.pjd_title}</td>
	                                   	<th  style="background-color: #f9fafc; text-align: right; padding-right: 10px; width: 10%">기간</th>
	                                    <td>${list.pjd_start}&nbsp;&nbsp;~&nbsp;&nbsp;${list.pjd_end}</td>  
	                                </tr>
	                                <tr>
	                                    <th style="background-color: #f9fafc; text-align: right; padding-right: 10px; width: 10%">참여자</th>
	                                    <td colspan="3">qsdfxdfxdf,dfsdfs,dsfsdf,d</td>
	                                </tr>
	                            </table>
	                            
	                     		<table class="table table-bordered" style="margin-top: 0px; border: 4px solid #e9ecef;">
									<tr>
										<th style="background-color: #f9fafc; text-align: right; padding-right: 10px; width: 10%">내용 </th>
										<td>${list.pjd_content}</td>	
									</tr>
								</table>
	                    </div>
	                </div>
	                <c:set var="tabcount" value="${tabcount+1}"/>
	               <%--  @@@@@@@<c:out value="${tabcount}" ></c:out> --%>
                </c:forEach>
                
                
                
                <!-- <div id="tab-2" class="tab-pane">
                    <div class="panel-body no-padding">
                    </div>
                </div> -->
                
                
                
            </div>


            </div>
        </div>
    </div>
</div>

</div>












<div class="modal fade hmodal-success" id="myModal1" tabindex="-2"
	role="dialog" aria-hidden="true">
	<div class="modal-dialog  modal-sm">
		<div class="modal-content">
			<div class="color-line"></div>
			<div class="modal-header text-center">프로젝트 처리 안내</div>
			<div class="modal-body">
				<font class="font-bold" size="2em"> <font
					style="color: gray;">프로젝트 명 : 파인애플</font><br> <font
					style="color: #9d9fa2"> 정말 처리하시겠습니까?</font> <br>
				</font>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default btn-sm"
					data-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary btn-sm demo2"
					data-dismiss="modal" data-toggle="modal" data-target="#myModal5">승인</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade hmodal-success" id="myModal5" tabindex="-1"
	role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="color-line"></div>
			<div class="modal-header">
				<h4 class="modal-title">
					<font color="#6a6c6f">처리 결과<i class="fa fa-table"></i></font>
				</h4>
				<small class="font-bold">Lorem Ipsum is simply dummy text.</small>
			</div>
			<div class="modal-body">
				<table class="table table-bordered" style="text-align: center">
					<tr style="background-color: #f5f5f5;">
						<th style="text-align: center">책임자</th>
						<th style="text-align: center">프로젝트 명</th>
						<th style="text-align: center">결재</th>
						<th style="text-align: center">승인 일시</th>
					</tr>
					<tr>
						<td>박성준 - (사단)한국소프트웨어기술진흥협회</td>
						<td>파인애플펜</td>
						<td>승인</td>
						<td>2016.11.08 12:42</td>
					</tr>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>