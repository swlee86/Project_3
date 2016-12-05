<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<div class="content animate-panel content-boxed">
	<div>
		<a class="btn btn-default buttons-print btn-sm" aria-controls="print">
			<span>Print</span>
		</a>
	</div>
	<div>
		<a class="btn btn-default buttons-print btn-sm" aria-controls="print">
			결재라인 확인하기
		</a>
	</div>
	<div>
		<a class="btn btn-default buttons-print btn-sm" aria-controls="print">
			참조자 확인하기
		</a>
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
                    	<input type="button" onclick="location.href='draft_rec.do'"
							   class="btn btn-sm btn-default" value="뒤로가기"
							   style="padding-right: 15px; padding-left: 15px; font-weight: 600; font-size: 13px">
					</div>
					
					<br><br>
                </div>
            </div>
        </div>
    </div>