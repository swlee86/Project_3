<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<div class="content animate-panel content-boxed">
		<div class="row">
            <div class="col-lg-12">
                <div class="hpanel blog-article-box" id="print">
                    <div class="panel-heading" style="height: 180px; padding-bottom: 15px;">
                        <h4>협 조 문</h4>
                    </div>
                    <div class="panel-body" style="height: 1070px; color: black; font-size: 13px; border-top: 5px solid #34495E;">
                       <table width="100%" id="datatable">
                       		<tr>
                       			<td width="13%" class="flag">문서 번호</td>
                       			<td>제 ${ draft_no }호</td>
                       			<td></td>
                       			<td></td>
                       			<td></td>
                       		</tr>
                       		<tr height="14px"></tr>
                       		<tr>
                       			<td class="flag">발신</td>
                       			<td colspan="4">${ draft.branch_name } &nbsp;&nbsp; ${ draft.dept_name } &nbsp;&nbsp; ${ draft.low_dept_name }</td>
                       		</tr>
                       		<tr>
                       			<td class="flag">발신자 사번</td>
                       			<td width="23%">${ draft.emp_no }</td>
                       			<td class="flag" width="13%">발신자 명</td>
                       			<td>${ draft.emp_name }</td>
                       		</tr>
                       		<tr>
                       			<td class="flag">수신</td>
                       			<td colspan="4"> 여기 붙여야..
                       			</td>
                       		</tr>
                       		<tr height="70px"></tr>
                       		<tr>
                       			<td class="flag">제목</td>
                       			<td colspan="4">
                       				<input type="text" name="draft_title" class="form-control">
                       			</td>
                       		</tr>
                       </table>
                       <div style="border-top: 3px solid #34495E; margin-top: 5px; over-flow: auto; padding: 10px;">
                       		<textarea rows="35" cols="100%" name="draft_content" class="form-control" style="resize: none;"></textarea>
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