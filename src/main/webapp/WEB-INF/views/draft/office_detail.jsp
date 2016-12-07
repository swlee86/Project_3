<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="normalheader transition animated fadeIn media-body">
<div class="content animate-panel content-boxed">
<div style="margin: 10px;">
	<span class="up_btn">
		<a class="btn btn-outline btn-primary btn-m bgcolor" aria-controls="print">
			<span>Print</span>
		</a>
	</span>
	<span class="up-btn">
		<button class="btn btn-outline btn-primary btn-m bgcolor" data-toggle="modal" data-target="#draft_line_Modal">
			결재라인 확인
		</button>
	</span>
	<span class="up-btn">
		<button class="btn btn-outline btn-primary btn-m bgcolor" data-toggle="modal" data-target="#draft_ref_Modal">
			참조자 확인
		</button>
	</span>
	<span class="up-btn">
		<button class="btn btn-outline btn-primary btn-m bgcolor" data-toggle="modal" data-target="#rec_data_Modal">
			수신처 확인
		</button>
	</span>
	
	<c:forEach var="list" items="${ db_emp_no_list }">
		<c:if test="${ list == session_emp_no }">
			<span class="up-btn pull-right">
				<button class="btn btn-outline btn-primary btn-m bgcolor" data-toggle="modal" data-target="#draft_process_Modal">
				승인 처리
				</button>
			</span>
		</c:if>
	</c:forEach>
	
	
</div>
        <div class="row">
            <div class="col-lg-12">
                <div class="hpanel blog-article-box" id="print">
                    <div class="panel-heading" style="padding-bottom: 15px;">
                        <h4><img alt="로고" src="img/logo1.png"></h4>
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
					<br><br>
                </div>
            </div>
        </div>
    </div>
    
    
<!-- 결재라인 확인하기 Modal창 -->
<div class="modal fade hmodal-success" id="draft_line_Modal" tabindex="-1"
	 role="dialog" aria-hidden="true" style="display: none;">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="color-line"></div>
			<div class="modal-header">
				<h4 class="modal-title">결재 라인</h4>
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
							<td class="flag textcenter" width="6%">사원 번호</td>
							<td width="5%">${ line.emp_no }</td>
							<td class="flag textcenter" width="5%">직위</td>
							<td width="5%">${ line.position_name }</td>
							<td class="flag textcenter" width="5%">소속</td>
							<td width="13%">${ line.branch_name } &nbsp; ${ line.dept_name } &nbsp; ${ line.low_dept_name }</td>
							<td class="flag textcenter" width="5%">성명</td>
							<td width="5%">${ line.emp_name }</td>
							<td class="flag textcenter marginbottom" width="6%">승인결과</td>
							<td width="8%" style="padding-left: 14px;">
                       			<c:choose>
                       				<c:when test="${ line.app_check == '1' }">
                       					<img alt="승인" src="img/approval.png" style="width: auto; height: 30px;">
                       				</c:when>
                       				<c:when test="${ line.app_check == '2' }">
                       					<img alt="반려" src="img/denied.png" style="width: auto; height: 30px;">
                       				</c:when>
                       				<c:when test="${ line.app_check == '3' }">
                       					<img alt="보류" src="img/pending.png" style="width: auto; height: 30px;">
                       				</c:when>
                       				<c:when test="${ line.app_check == '4' }">
                       					미승인
                       				</c:when>
                       			</c:choose>
                       		</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<!-- 참조자 확인하기 Modal창 -->
<div class="modal fade hmodal-success" id="draft_ref_Modal" tabindex="-1"
	 role="dialog" aria-hidden="true" style="display: none;">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="color-line"></div>
			<div class="modal-header">
				<h4 class="modal-title">참조자</h4>
				<small class="font-bold">제 ${ detail.draft_no }호 문서의 참조자들을 확인합니다.</small>
			</div>
			<div class="modal-body">
				<table style="width: 100%;">
					<c:if test="${ refcount <= 0 }">
						<tr>
							<td colspan="8">등록된 참조자가 존재하지 않습니다.</td>
						</tr>
					</c:if>
					<c:forEach var="ref" items="${ refdetail }">
						<tr>
							<td class="flag textcenter" width="6%">사원 번호</td>
							<td width="5%">${ ref.emp_no }</td>
							<td class="flag textcenter" width="5%">직위</td>
							<td width="5%">${ ref.position_name }</td>
							<td class="flag textcenter" width="5%">소속</td>
							<td width="13%">${ ref.branch_name } &nbsp; ${ ref.dept_name } &nbsp; ${ ref.low_dept_name }</td>
							<td class="flag textcenter" width="5%">성명</td>
							<td width="5%">${ ref.emp_name }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<!-- 참조자 확인하기 Modal창 -->
<div class="modal fade hmodal-success" id="rec_data_Modal" tabindex="-1"
	 role="dialog" aria-hidden="true" style="display: none;">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="color-line"></div>
			<div class="modal-header">
				<h4 class="modal-title">수신처</h4>
				<small class="font-bold">제 ${ detail.draft_no }호 문서의 수신처 정보를 확인합니다.</small>
			</div>
			<div class="modal-body">
				<table id="recTable" style="width: 100%;">
					<tr>
						<td class="flag textcenter" width="10%">수신처</td>
						<td width="40%">${ detail.rec_place }</td>
					</tr>
					<tr>
						<td class="flag textcenter">수신자 명</td>
						<td>${ detail.rec_person }</td>
					</tr>
					<tr>
						<td class="flag textcenter">연락처</td>
						<td>${ detail.rec_tel }</td>
					</tr>
					<tr>
						<td class="flag textcenter">FAX</td>
						<td>${ detail.rec_fax }</td>
					</tr>
					<tr>
						<td class="flag textcenter">우편번호</td>
						<td>${ detail.rec_postcode  }</td>
					</tr>
					<tr>
						<td class="flag textcenter">주소</td>
						<td>${ detail.rec_addr } &nbsp; ${ detail.rec_addr_detail }</td>
					</tr>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<!-- 승인 처리하기 Modal창 -->
<div class="modal fade hmodal-success" id="draft_process_Modal" tabindex="-1"
	 role="dialog" aria-hidden="true" style="display: none;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="color-line"></div>
			
			<div class="modal-header">
				<h4 class="modal-title">승인 처리</h4>
				<small class="font-bold">제 ${ detail.draft_no }호 문서의 승인을 처리합니다.</small>
				<input type="hidden" id="draft_no_hidden" value="${ detail.draft_no }">
			</div>
			
			<div class="modal-body">
					<c:choose>
						<c:when test="${ app_check == '1' }">
							<span class="marginbottom color textcenter flag dragdrop" id="dragarea"
								  style="background-color: rgb(98,203,49)" value="승인"> </span>
						</c:when>
						<c:when test="${ app_check == '2' }">
							<span class="marginbottom color textcenter flag dragdrop" id="dragarea"
								  style="background-color: rgb(231,76,60)" value="반려"> </span>
						</c:when>
						<c:when test="${ app_check == '3' }">
							<span class="marginbottom color textcenter flag dragdrop" id="dragarea"
								  style="background-color: rgb(155,89,182)" value="보류"> </span>
						</c:when>
						<c:when test="${ app_check == '4' }">
							<span class="marginbottom color textcenter flag dragdrop" id="dragarea"></span>
						</c:when>
					</c:choose>
					<div class="row ui-sortable">
                    <div class="col-md-4 border-right" id="cg_1"> 
                    	<div class="contact-stat gradLi ui-sortable-handle h-bg-green color"
                    		 style="border: 4px solid #4EA327;" id="one">
                    		<strong>승인</strong>
                    	</div> 
                    </div>
                    <div class="col-md-4" id="cg_2"> 
                    	<div class="contact-stat gradLi ui-sortable-handle h-bg-red color"
                    		 style="border: 4px solid #B93D30;" id="two">
                    		<strong>반려</strong>
                    	</div> 
                    </div>
                    <div class="col-md-4 border-right" id="cg_3"> 
                    	<div class="contact-stat gradLi ui-sortable-handle h-bg-violet color"
                    		 style="border: 4px solid #7C4792;" id="three">
                    		<strong>보류</strong>
                    	</div> 
                    </div>
                </div>
			</div>
			<div class="modal-footer">
				<button type="button" id="app_check" class="btn btn-outline btn-success" data-dismiss="modal">
					<i class="fa fa-check"></i>
					<span class="bold">처리</span>
				</button>
			</div>
		</div>
	</div>
</div>

</div>