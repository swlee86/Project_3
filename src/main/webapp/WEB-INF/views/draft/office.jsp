<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<div class="content animate-panel content-boxed">
        <div class="row">
            <div class="col-lg-12">
                <div class="hpanel blog-article-box" id="print">
                    <div class="panel-heading" style="height: 180px; padding-bottom: 15px;">
                        <h4>2 P M</h4>
                        <small>경기도 성남시 분당구 삼평동 대왕판교로 670길(구 682번지) 유스페이스2 B동 8층 / 070.5039.5803,5807 / FAX 070.7614.3450</small>
                    </div>
                    <div class="panel-body" style="height: 1070px; color: black; font-size: 13px; border-top: 5px solid #34495E;">
                       <table width="100%" id="datatable">
                       		<tr>
                       			<td width="13%" class="flag">문서 번호</td>
                       			<td>
                       				제 <input type="text" class="nb" name="draft_no" readonly style="text-align: right; width: 40px;" value="${ draft_no }"> 호
                       			</td>
                       			<td></td>
                       			<td></td>
                       		</tr>
                       		<tr height="14px"></tr>
                       		<tr>
                       			<td class="flag">발신</td>
                       			<td colspan="3">
                       				<input type="text" class="nb" readonly name="branch_name" style="width: 50px;" value="${ draft.branch_name }">  
                       				<input type="text" class="nb" readonly name="dept_name" style="width: 50px;" value="${ draft.dept_name }">
                       				<input type="text" class="nb" readonly name="low_dept_name" style="width: 50px;" value="${ draft.low_dept_name }">
                       			</td>
                       		</tr>
                       		<tr>
                       			<td class="flag" width="13%">발신자 명</td>
                       			<td colspan="3"><input type="text" class="nb" readonly name="emp_name" value="${ draft.emp_name }"></td>
                       		</tr>
                       		<tr height="14px"></tr>
                       		<tr>
                       			<td class="flag">수신처</td>
                       			<td colspan="3">
                       				<input type="text" name="rec_place" id="rec_place" class="form-control">
                       			</td>
                       		</tr>
                       		<tr>
                       			<td class="flag">수신자 명</td>
                       			<td colspan="3">
                       				<input type="text" name="rec_person" id="rec_person" class="form-control">                      			
                       			</td>
                       		</tr>
                       		<tr>
                       			<td class="flag">연락처</td>
                       			<td width="36%">
                       				<input type="text" name="rec_tel" id="rec_tel" class="form-control">                      			
                       			</td>
                       			<td class="flag" style="text-align: center;">FAX</td>
                       			<td>
                       				<input type="text" name="rec_fax" id="rec_fax" class="form-control">                      			
                       			</td>
                       		</tr>
                       		<tr>
                       			<td class="flag">우편번호</td>
                       			<td>
                       			<div class="input-group">
                       				<input type="text" id="rec_postcode" readonly name="rec_postcode" class="form-control">                      			
                       				<span class="input-group-btn">
										<input type="button" onclick="sample6_execDaumPostcode()" class="btn btn-success"  value="우편번호 찾기">
									</span>
                       			</div>
                       			</td>
                       		</tr>
                       		<tr>
                       			<td class="flag">기본주소</td>
                       			<td>
                       				<input type="text" id="sample6_address" readonly name="rec_addr" class="form-control">                      			
                       			</td>
                       			<td class="flag" style="text-align: center;">상세주소</td>
                       			<td>
                       				<input type="text" id="sample6_address2" name="rec_addr_detail" class="form-control">                      			
                       			</td>
                       		</tr>
                       		<tr height="55px"></tr>
                       		<tr>
                       			<td class="flag">제목</td>
                       			<td colspan="3">
                       				<input type="text" name="draft_title" id="draft_title" class="form-control">
                       			</td>
                       		</tr>
                       </table>
                       <div style="border-top: 3px solid #34495E; margin-top: 5px; over-flow: auto; padding: 10px;">
                       		<textarea rows="27" cols="100%" name="draft_content" class="form-control" style="resize: none;"></textarea>
                       </div>
                    </div>
                </div>
            </div>
        </div>
    </div>