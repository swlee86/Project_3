<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="content animate-panel">
<div class="row">
    <div class="col-lg-4">
        <div class="hpanel hgreen" id="detail_panel">
            <div class="panel-body">
                <img alt="logo" class="img-circle m-b m-t-md" id="pic">
                <h3 id="emp_name"></h3>
                <div class="text-muted font-bold m-b-xs" id="emp_no"></div>
                <br>
                <h3>소속</h3>
                <p id="attach">
                </p>
            </div>
            <div class="panel-body">
                <dl>
                    <dt>개인 연락처</dt>
                    <dd>A description list is perfect for defining terms.</dd>
                    <dt>사내 연락처</dt>
                    <dd>Vestibulum id ligula porta felis euismod semper eget lacinia odio sem nec elit.</dd>
                    
                </dl>
            </div>
            <div class="panel-footer contact-footer">
                <div class="row">
                    <div class="col-md-4 border-right">
                        <div class="contact-stat"><span>Projects: </span> <strong>200</strong></div>
                    </div>
                    <div class="col-md-4 border-right">
                        <div class="contact-stat"><span>Messages: </span> <strong>300</strong></div>
                    </div>
                    <div class="col-md-4">
                        <div class="contact-stat"><span>Views: </span> <strong>400</strong></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="col-lg-8">
        <div class="hpanel">
            <div class="hpanel">
            <div class="tab-content">
                <div id="tab-1" class="tab-pane active">
                    <div class="panel-body">
                        <strong>탈퇴를 요청한 사원</strong>
                        
                        <hr style="border:2px solid gray; margin-bottom:0px">
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                <tr>
                                    <th>사원번호</th>
                                    <th>지점</th>
                                    <th>부서</th>
                                    <th>하위부서</th>
                                    <th>직위</th>
                                    <th>이름</th>
                                    <td>&nbsp;</td>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="wlist" items="${ withdrawal }">
                                	<tr style="cursor: pointer;" class="trClick">
                                    	<td>${ wlist.emp_no }</td>
                                    	<td>${ wlist.branch_name }</td>
                                    	<td>${ wlist.dept_name }</td>
                                    	<td>${ wlist.low_dept_name }</td>
                                    	<td>${ wlist.position_name }</td>
                                    	<td>${ wlist.emp_name }</td>
                                    	<td><button class="btn btn-outline btn-danger2">삭제</button></td>
                                	</tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            </div>
        </div>
    </div>
</div>
</div>