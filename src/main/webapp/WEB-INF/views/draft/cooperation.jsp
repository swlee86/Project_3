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
                       			<td class="flag">발신자 사번</td>
                       			<td width="25%"><input type="text" class="nb" readonly name="emp_no" value="${ draft.emp_no }"></td>
                       			<td class="flag" width="13%">발신자 명</td>
                       			<td><input type="text" class="nb" readonly name="emp_name" value="${ draft.emp_name }"></td>
                       		</tr>
                       		<tr height="14px;"></tr>
                       		<tr>
                       			<td class="flag">수신</td>
                       			<td colspan="4" id="sanction_DraftOk_no_td"> 
									<span class="input-group">
										<input type="text" class="form-control input-sm" readonly
												id="choosedept_name">
											<a type="button" class="btn btn-default input-group-addon"
											   onclick="choosedept()"> 
												<span style="color: #fd7d86; font-size: 18px; font-weight: bold;">
													<i class="pe-7s-plus"></i>
												</span>
											</a>
									</span>
									<input type="hidden" id="choosedept_no" name="low_dept_no">
                       			</td>
                       		</tr>
                       		<tr height="60px"></tr>
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
                </div>
            </div>
        </div>
    </div>
    
    
<!-- 결재라인용 모달-->
<div class="modal fade hmodal-success" id="myModal6" tabindex="-1"
	role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-md">
		<div class="modal-content">
			<div class="color-line"></div>
			<div class="modal-header"
				style="height: 50px; padding-top: 10px; padding-bottom: 0px">
				<h4 class="modal-title">
					<font color="#6a6c6f" size="4em"><b>선택</b></font>
				</h4>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-md-7" style="border: 1px solid gray;"
						id="organization"></div>
					<div class="col-md-8" id="empList">사원리스트</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default btn-sm"
					data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
