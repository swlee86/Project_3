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
                    <li>
                        <span>관리자</span>
                    </li>
                    <li class="active">
                        <span>권한 부여</span>
                    </li>
                </ol>
            </div>
            <h2 class="font-light m-b-xs">
                	권한 관리
            </h2>
            <small>&nbsp;&nbsp;직위의 권한을 관리할 수 있습니다^^</small>
        </div>
    </div>
</div>

<div class="content animate-panel">
    <div class="row">
        <div class="col-lg-12">
            <div class="text-center m-b-xl">
            <div class="row">
            
            	<c:forEach var="plist" items="${ plist }" varStatus="status">
                <div class="col-sm-3">
                    <div 
                    	<c:if test="${ status.index % 4 == 0 }"> class="hpanel plan-box hyellow active" </c:if>
                    	<c:if test="${ status.index % 4 == 1 }"> class="hpanel plan-box hgreen active" </c:if>
                    	<c:if test="${ status.index % 4 == 2 }"> class="hpanel plan-box hblue active" </c:if>
                    	<c:if test="${ status.index % 4 == 3 }"> class="hpanel plan-box hred active" </c:if>
                    >
                        <div class="panel-heading hbuilt text-center">
                            <h4 class="font-bold">${ plist.position_name }</h4>
                            <input type="hidden" value="${ plist.position_no }">
                        </div>
                        <div class="panel-body">
                            <table class="table">
                                <thead>
                                <tr> 
                                	<td style="font-weight: bold;">공통 권한</td>
                                </tr>
                                </thead>
                                
                                <tbody>
                                <c:forEach var="rlist" items="${ rlist }">
                                <c:if test="${ rlist.role_no != 0 }">
                                <tr>
                                    <td>
                                    	<input type="checkbox" name="checklist" value="${ rlist.role_no }"
                                    	<c:forEach var="list" items="${ plist.rolelist }">
                                    		<c:if test="${ list == rlist.role_no }">
                                    			checked
                                    		</c:if>
                                    	</c:forEach>
                                    	> ${ rlist.role_exp }
                                    </td>
                                </tr>
                                </c:if>
                                </c:forEach>
                                </tbody>
                            </table>
                            <button
                            	<c:if test="${ status.index % 4 == 0 }"> class="btn btn-warning applyBtn btn-sm m-t-xs" </c:if>
                    			<c:if test="${ status.index % 4 == 1 }"> class="btn btn-success applyBtn btn-sm m-t-xs" </c:if>
                    			<c:if test="${ status.index % 4 == 2 }"> class="btn btn-info applyBtn btn-sm m-t-xs" </c:if>
                    			<c:if test="${ status.index % 4 == 3 }"> class="btn btn-danger applyBtn  btn-sm m-t-xs" </c:if>
                    		>적용</button>
                    		<button
                            	<c:if test="${ status.index % 4 == 0 }"> class="btn btn-outline detailBtn btn-sm m-t-xs btn-warning" </c:if>
                    			<c:if test="${ status.index % 4 == 1 }"> class="btn btn-outline detailBtn btn-sm m-t-xs btn-success" </c:if>
                    			<c:if test="${ status.index % 4 == 2 }"> class="btn btn-outline detailBtn btn-sm m-t-xs btn-info" </c:if>
                    			<c:if test="${ status.index % 4 == 3 }"> class="btn btn-outline detailBtn btn-sm m-t-xs btn-danger" </c:if>
                    		>상세보기</button>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>