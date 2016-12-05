<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<div class="content animate-panel content-boxed">
	<div>
		<a class="btn btn-default buttons-print btn-sm" aria-controls="print">
			<span>Print</span>
		</a>
	</div>

        <div class="row">
            <div class="col-lg-12">
                <div class="hpanel blog-article-box" id="print">
                    <div class="panel-heading" style="padding-bottom: 15px;">
                        <h4>협 조 문</h4>
                    </div>
                    <div class="panel-body" style="color: black; font-size: 13px; border-top: 5px solid #34495E;">
                       <table width="100%" id="datatable">
                       		<tr>
                       			<td width="13%" class="flag">문서 번호</td>
                       			<td>제 ${ detail.draft_no }호</td>
                       			<td></td>
                       			<td></td>
                       			<td></td>
                       		</tr>
                       		<tr height="14px"></tr>
                       		<tr>
                       			<td class="flag">발신</td>
                       			<td colspan="4">${ detail.branch_name } &nbsp;&nbsp; ${ detail.dept_name } &nbsp;&nbsp; ${ detail.low_dept_name }</td>
                       		</tr>
                       		<tr>
                       			<td class="flag">발신자 사번</td>
                       			<td width="23%">${ detail.emp_no }</td>
                       			<td class="flag" width="13%">발신자 명</td>
                       			<td>${ detail.emp_name }</td>
                       		</tr>
                       		<tr>
                       			<td class="flag">발신일</td>
                       			<td colspan="4">${ detail.draft_date }</td>
                       		</tr>
                       		<tr>
                       			<td class="flag">수신</td>
                       			<td colspan="4">${ attach.branch_name } &nbsp;&nbsp; ${ attach.dept_name } &nbsp;&nbsp; ${ low_dept_name }</td>
                       		</tr>
                       		<tr height="35px"></tr>
                       		<tr>
                       			<td colspan="5" class="flag">참조자 &nbsp; ${ refcount }인 </td>
                       		</tr>
                       		<c:if test="${ refcount != 0 }">                     			
                       		<c:forEach var="ref" items="${ refdetail }">  
                       			<tr>
                       				<td class="flag">사원 번호</td>
                       				<td>${ ref.emp_no }</td>
                       				<td class="flag">사원 명</td>
                       				<td>${ ref.emp_name }</td>
                       			</tr>
                       		</c:forEach>
                       		</c:if>
                       		<c:if test="${ refcount == 0 }">
                       			<td colspan="5" style="padding-left: 10px;">참조자가 없습니다</td>
                       		</c:if>
                       		<tr height="14px"></tr>
                       		<tr>
                       			<td colspan="5" class="flag">결재라인 &nbsp; ${ linecount }인 </td>
                       		</tr>
                       		<c:forEach var="line" items="${ linedetail }">
                       			<tr>
                       				<td class="flag">사원 번호</td>
                       				<td>${ line.emp_no }</td>
                       				<td class="flag">사원 명</td>
                       				<td width="20%">${ line.emp_name }</td>
                       				<td>
                       					<c:choose>
                       						<c:when test="${ line.app_check == '1' }">
                       							<img alt="승인" src="img/approval.png" style="width:30%; height: 30px;">
                       						</c:when>
                       						<c:when test="${ line.app_check == '0' }">
                       							<img alt="거부" src="img/denied.png" style="width:30%; height: 30px;">
                       						</c:when>
                       					</c:choose>
                       				</td>
                       			</tr>
                       		</c:forEach>
                       		<tr height="70px"></tr>
                       		<tr>
                       			<td class="flag">제목</td>
                       			<td colspan="4">${ detail.draft_title }</td>
                       		</tr>
                       </table>
                       <div style="border-top: 3px solid #34495E; margin-top: 5px; height: 500px; over-flow: auto; padding: 10px;">
                       		${ detail.draft_content }
                       </div>
                    </div>
                    <br><br>
                    
                    <div class="pull-right" style="text-align: center;">
                    	<input type="button" onclick="location.href='draft_rec.do'"
							   class="btn btn-sm btn-default" value="뒤로가기"
							   style="padding-right: 15px; padding-left: 15px; font-weight: 600; font-size: 13px">
					</div>
					
					<br><br>
                </div>
            </div>
        </div>
    </div>