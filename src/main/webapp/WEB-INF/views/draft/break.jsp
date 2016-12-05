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
                       <table id="datatable">
                       		<tr>
                       			<td width="20%" class="flag">문서 번호</td>
                       			<td>제 ${ detail.draft_no }호</td>
                       			<td></td>
                       			<td></td>
                       			<td></td>
                       			<td></td>
                       		</tr>
                       		<tr height="14px"></tr>
                       		<tr>
                       			<td class="flag">소속</td>
                       			<td colspan="3">${ detail.branch_name } &nbsp;&nbsp; ${ detail.dept_name } &nbsp;&nbsp; ${ detail.low_dept_name }</td>
                       		</tr>
                       		<tr>
                       			<td class="flag">사원번호</td>
                       			<td width="30%">${ detail.emp_no }</td>
                       			<td class="flag">직위</td>
                       			<td width="20%">${ detail.position_name }</td>
                       			<td class="flag" width="13%">성명</td>
                       			<td>${ detail.emp_name }</td>
                       		</tr>
                       		<tr height="10%" style="text-align:center; vertical-align:center;">
                       			<td colspan="5">상기 본인은 아래와 같이 휴가를 신청하오니 허락하여주시기 바랍니다.</td>
                       		</tr>
                       		<tr>
                       			<td class="flag">휴가 내역</td>
                       			<td colspan="5">${ detail.break_cg_name }</td>
                       		</tr>
                       		<tr>
                       			<td class="flag">휴가 사유</td>
                       			<td colspang="5">${ detail.draft_content }</td>
                       		</tr>
                       		<tr>
                       			<td class="flag">휴가 기간</td>
                       			<td>${ detail.break_start } 부터 ${ detail.break_end } 까지</td>
                       			<td colspan="4">(${ detail.break_term }) 일간</td>
                       		</tr>
                       		<tr>
                       			<td class="flag">비상연락처</td>
                       			<td colspan="5">${ detail.cell_phone }</td>
                       		</tr>
                       		<tr>
                       			<td class="flag">발신일</td>
                       			<td colspan="3">${ detail.draft_date }</td>
                       		</tr>
                       		<tr>
                       			<td class="flag">수신</td>
                       			<td>${ attach.branch_name } &nbsp;&nbsp; ${ attach.dept_name } &nbsp;&nbsp; ${ low_dept_name }</td>
                       		</tr>
                       		<tr height="35px"></tr>
                       		<tr>
                       			<td colspan="4" class="flag">참조자 &nbsp; ${ refcount }인 </td>
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
                       			<td colspan="4" style="padding-left: 10px;">참조자가 없습니다</td>
                       		</c:if>
                       		<tr height="14px"></tr>
                       		<tr>
                       			<td colspan="4" class="flag">결재라인 &nbsp; ${ linecount }인 </td>
                       		</tr>
                       		<c:forEach var="line" items="${ linedetail }">
                       			<tr>
                       				<td class="flag">사원 번호</td>
                       				<td>${ line.emp_no }</td>
                       				<td class="flag">사원 명</td>
                       				<td>${ line.emp_name }</td>
                       			</tr>
                       		</c:forEach>
                       		<tr height="70px"></tr>
                       		<tr>
                       			<td class="flag">제목</td>
                       			<td colspan="3">${ detail.draft_title }</td>
                       		</tr>
                       </table>
                       <div style="border-top: 3px solid #34495E; margin-top: 5px; height: 500px; over-flow: auto; padding: 10px;">
                       		${ detail.draft_content }
                       </div>
                    </div>
                </div>
            </div>
        </div>
    </div>