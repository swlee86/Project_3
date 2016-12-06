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
                        <h4>휴가 신청서</h4>
                    </div>
                    <div class="panel-body" style="color: black; font-size: 13px; border-top: 5px solid #34495E;">
                       <table width="100%" id="datatable">
                       		<tr>
                       			<td width="13%" class="flag">문서 번호</td>
                       			<td>제 ${ detail.draft_no }호</td>
                       			<td></td>
                       			<td></td>
                       			<td></td>
                       			<td></td>
                       		</tr>
                       		<tr height="14px"></tr>
                       		<tr>
                       			<td colspan="6" class="flag">참조자 &nbsp; ${ refcount }인 </td>
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
                       			<td colspan="6" style="padding-left: 10px;">참조자가 없습니다</td>
                       		</c:if>
                       		<tr height="14px"></tr>
                       		<tr>
                       			<td colspan="6" class="flag">결재라인 &nbsp; ${ linecount }인 </td>
                       		</tr>
                       		<c:forEach var="line" items="${ linedetail }">
                       			<tr>
                       				<td class="flag">사원 번호</td>
                       				<td>${ line.emp_no }</td>
                       				<td class="flag">사원 명</td>
                       				<td>${ line.emp_name }</td>
                       				<td>
                       					<c:choose>
                       						<c:when test="${ line.app_check == '1' }">
                       							<img alt="승인" src="img/approval.png" style="width:100%; height: 30px;">
                       						</c:when>
                       						<c:when test="${ line.app_check == '0' }">
                       							<img alt="거부" src="img/denied.png" style="width:100%; height: 30px;">
                       						</c:when>
                       					</c:choose>
                       				</td>
                       			</tr>
                       		</c:forEach>
                       		
                       		<tr height="14px"></tr>
                       		<tr>
                       			<td class="flag">소속</td>
                       			<td colspan="5">${ detail.branch_name } &nbsp;&nbsp; ${ detail.dept_name } &nbsp;&nbsp; ${ detail.low_dept_name }</td>
                       		</tr>
                       		<tr>
                       			<td class="flag">사원번호</td>
                       			<td>${ detail.emp_no }</td>
                       			<td class="flag" width="10%">직위</td>
                       			<td width="18%">${ detail.position_name }</td>
                       			<td class="flag" width="10%">성명</td>
                       			<td>${ detail.emp_name }</td>
                       		</tr>
                       		<tr style="text-align:center; font-weight: bold;">
                       			<td colspan="6" height="130px">상기 본인은 아래와 같이 휴가를 신청하오니 허락하여주시기 바랍니다.</td>
                       		</tr>
                       		<tr>
                       			<td class="flag">휴가 내역</td>
                       			<td colspan="5">${ detail.break_cg_name }</td>
                       		</tr>
                       		<tr>
                       			<td class="flag">휴가 기간</td>
                       			<td width="28%">${ detail.break_start } &nbsp; 부터 &nbsp; ${ detail.break_end } &nbsp; 까지</td>
                       			<td colspan="4">(${ detail.break_term }) 일간</td>
                       		</tr>
                       		<tr style="border-bottom: 2px solid black;">
                       			<td class="flag" colspan="6">휴가 사유</td>
                       		</tr>
                       		<tr>
                       			<td colspan="6" height="300px" style="padding: 10px; vertical-align: text-top;">${ detail.draft_content }</td>
                       		</tr>
                       		<tr>
                       			<td class="flag" style="height: 50px;">비상연락처</td>
                       			<td colspan="5">${ detail.break_tel }</td>
                       		</tr>
                       		<tr>
                       			<td class="flag">신청일</td>
                       			<td colspan="3">${ detail.draft_date }</td>
                       		</tr>
                       		<tr style="text-align:center; font-weight: bold;">
                       			<td colspan="6" height="80px">
                       				상기 내용을 정확하게 기입하십시오. 정확하게 미기입 시 추후에 불이익을 당할 수 있습니다.
                       			</td>
                       		</tr>
                       </table>
                    </div>
                    <br><br>
                    
                    <div class="pull-right" style="text-align: center;">
                    	<input type="button" id="backBtn"
							   class="btn btn-sm btn-default" value="뒤로가기"
							   style="padding-right: 15px; padding-left: 15px; font-weight: 600; font-size: 13px">
					</div>
					
					<br><br>
                </div>
            </div>
        </div>
    </div>