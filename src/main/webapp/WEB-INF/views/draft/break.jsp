<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<div class="content animate-panel content-boxed">
        <div class="row">
            <div class="col-lg-12">
                <div class="hpanel blog-article-box" id="print">
                    <div class="panel-heading" style="height: 180px; padding-bottom: 15px;">
                        <h4>휴가 신청서</h4>
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
                       			<td></td>
                       			<td></td>
                       		</tr>
                       		<tr height="14px"></tr>
                       		<tr>
                       			<td class="flag">소속</td>
                       			<td colspan="5">${ draft.branch_name } &nbsp;&nbsp; ${ draft.dept_name } &nbsp;&nbsp; ${ draft.low_dept_name }</td>
                       		</tr>
                       		<tr>
                       			<td class="flag">사원번호</td>
                       			<td>${ draft.emp_no }</td>
                       			<td class="flag" width="10%">직위</td>
                       			<td width="18%">${ draft.position_name }</td>
                       			<td class="flag" width="10%">성명</td>
                       			<td>${ draft.emp_name }</td>
                       		</tr>
                       		<tr style="text-align:center; font-weight: bold;">
                       			<td colspan="6" height="130px">상기 본인은 아래와 같이 휴가를 신청하오니 허락하여주시기 바랍니다.</td>
                       		</tr>
                       		<tr>
                       			<td class="flag">휴가 내역</td>
                       			<td colspan="5">
                       				<select name="break_cg_no" class="form-control">
                       					<option value="1">연차휴가</option>
                       					<option value="2">월차휴가</option>
                       					<option value="3">특별휴가</option>
                       				</select>
                       			</td>
                       		</tr>
                       		<tr>
                       			<td class="flag">휴가 기간</td>
                       			<td colspan="5">
                       				<span class="form-group" style="display: inline-block; margin-bottom: 0px; width: 30%;">
                       					<span class="input-group date" name="break_start">
                       						<span class="input-group-addon">
                       							<span class="fa fa-calendar"></span>
                       						</span>
                       						<input type="text" name="break_start" id="breakdatepicker1" class="form-control">
                       					</span>
                       				</span> 
                       				<span style="display: inline-block; border:none; width: 10%; text-align: center;">부터</span>
                       				<span class="form-group" style="display: inline-block; margin-bottom: 0px; width: 30%;">
                       					<span class="input-group date" name="break_end">
                       						<span class="input-group-addon">
                       							<span class="fa fa-calendar"></span>
                       						</span>
                       						<input type="text" name="break_end" id="breakdatepicker2" class="form-control">
                       					</span>
                       				</span>
                       			</td>
                       		</tr>
                       		<tr style="border-bottom: 2px solid black;">
                       			<td class="flag" colspan="6">휴가 사유</td>
                       		</tr>
                       		<tr>
                       			<td colspan="6" height="300px" style="padding: 10px; vertical-align: text-top;">
                     				<textarea rows="25" cols="100%" name="draft_content" class="form-control" style="resize: none;"></textarea>
                       			</td>
                       		</tr>
                       		<tr>
                       			<td class="flag" style="height: 50px;">비상연락처</td>
                       			<td colspan="5">
                       				<input type="text" name="break_tel" class="form-control">
                       			</td>
                       		</tr>
                       		<tr style="text-align:center; font-weight: bold;">
                       			<td colspan="6" height="80px">
                       				상기 내용을 정확하게 기입하십시오. 정확하게 미기입 시 추후에 불이익을 당할 수 있습니다.
                       			</td>
                       		</tr>
                       </table>
                    </div>
                </div>
            </div>
        </div>
    </div>