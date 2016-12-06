<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="normalheader transition animated fadeIn media-body">
<div class="content animate-panel content-boxed">
<div style="margin: 10px;">
	<span class="up_btn">
		<a class="btn btn-default buttons-print btn-m" aria-controls="print">
			<span>Print</span>
		</a>
	</span>
	<span class="up-btn">
		<button class="btn btn-default btn-m" data-toggle="modal" data-target="#draft_line_Modal">
			결재라인 확인
		</button>
	</span>
	<span class="up-btn">
		<a class="btn btn-default btn-m" data-toggle="modal" data-target="#draft_ref_Modal">
			참조자 확인
		</a>
	</span>
	<span class="up-btn">
		<a class="btn btn-default btn-m">
			수신처 확인
		</a>
	</span>
</div>
        <div class="row">
            <div class="col-lg-12">
                <div class="hpanel blog-article-box" id="print">
                    <div class="panel-heading" style="padding-bottom: 15px;">
                        <h4>2 P M</h4>
                        <small>경기도 성남시 분당구 삼평동 대왕판교로 670길(구 682번지) 유스페이스2 B동 8층 / 070.5039.5803,5807 / FAX 070.7614.3450</small>
                    </div>
                    <div class="panel-body" style="color: black; font-size: 13px; border-top: 5px solid #34495E;">
                       <table width="100%" id="datatable">
                       		<tr>
                       			<td width="13%" class="flag">문서 번호</td>
                       			<td>제 ${ detail.draft_no }호</td>
                       		</tr>
                       		<tr height="14px"></tr>
                       		<tr>
                       			<td class="flag">발신</td>
                       			<td colspan="3">${ detail.branch_name } &nbsp;&nbsp; ${ detail.dept_name } &nbsp;&nbsp; ${ detail.low_dept_name }</td>
                       		</tr>
                       		<tr>
                       			<td class="flag" width="13%">발신자 명</td>
                       			<td>${ detail.emp_name }</td>
                       		</tr>
                       		<tr>
                       			<td class="flag">수신처</td>
                       			<td>${ detail.rec_place }</td>
                       		</tr>
                       		<tr>
                       			<td class="flag">수신자 명</td>
                       			<td>${ detail.rec_person }</td>
                       		</tr>
                       		<tr height="70px"></tr>
                       		<tr>
                       			<td class="flag">제목</td>
                       			<td colspan="3">${ detail.draft_title }</td>
                       		</tr>
                       </table>
                       <div style="border-top: 3px solid #34495E; margin-top: 5px; height: 700px; over-flow: auto; padding: 10px;">
                       		${ detail.draft_content }
                       </div>
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
    
    
    
<!-- 결재라인 확인하기 Modal창 -->
<div class="modal fade hmodal-success" id="draft_line_Modal" tabindex="-1"
	 role="dialog" aria-hidden="true" style="display: none;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="color-line"></div>
			<div class="modal-header">
				<h4 class="modal-title">결재 라인 확인</h4>
				<small class="font-bold">제 ${ detail.draft_no }호 문서의 결재자들을 확인합니다.</small>
			</div>
			<div class="modal-body">
				<table style="width: 100%;">
					<c:if test="${ linecount <= 0 }">
						<tr>
							<td colspan="10">등록된 결재자가 존재하지 않습니다.</td>
						</tr>
					</c:if>
					<c:forEach var="line" items="${ linedetail }">
						<tr>
							<td class="flag" width="7%">사원 번호</td>
							<td width="7%">${ line.emp_no }</td>
							<td class="flag" width="7%">직위</td>
							<td width="7%">${ line.position_name }</td>
							<td class="flag" width="7%">소속</td>
							<td width="7%">${ line.branch_name } &nbsp; ${ line.dept_name } &nbsp; ${ line.low_dept_name }</td>
							<td class="flag" width="7%">성명</td>
							<td width="7%">${ line.emp_name }</td>
							<td class="flag" width="7%">승인결과</td>
							<td width="7%">
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
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
			</div>
		</div>
	</div>
</div>
</div>