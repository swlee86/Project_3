<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="table-responsive">
	<h4>대외발신공문</h4>
	<table cellpadding="1" cellspacing="1" class="table table-bordered ">
		<tr>
			<th style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">결재 번호</th>
			  <td colspan="3">
			  	<input type="text" name="draft_no" class="form-control">
			  </td> 
		</tr>
		<tr>
			<th style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">기안 제목</th>
			  <td colspan="3">
			  	<input type="text" name="draft_title" class="form-control">
			  </td> 
		</tr>
		<tr>
			<th style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">기안 내용</th>
			  <td colspan="3">
			  	<input type="text" name="draft_content" class="form-control">
			  </td> 
		</tr>
		<tr>
			<th style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">기안자 사번</th>
			  <td colspan="3">
			  	<input type="text" name="emp_no" class="form-control" value="${ emp_no }">
			  </td> 
		</tr>
		<tr>
			<th style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">기안일</th>
			  <td colspan="3">
			  	<input type="text" name="draft_date" class="form-control">
			  </td> 
		</tr>
		<tr>
			<th
				style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">수신처</th>
			<td style="width: 40%"><input type="text" name="rec_place" class="form-control"></td>
			<th
				style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">팩스번호</th>
			<td style="width: 40%"><input type="text" name="rec_fax" class="form-control"></td>
		</tr>
		<tr>
			<th
				style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">수신자</th>
			<td><input type="text" name="rec_person" class="form-control"></td>
			<th
				style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">연락처</th>
			<td><input type="text" name="rec_tel" class="form-control"></td>
		</tr>
		<tr>
			<th
				style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">우편번호</th>
			  <td colspan="3">
			  	<div class="input-group">
						<input type="text" id="sample6_postcode" name="rec_postcode" class="form-control" placeholder="우편번호">
						<span class="input-group-btn">
							<input type="button" onclick="sample6_execDaumPostcode()" class="btn btn-success "  value="우편번호 찾기">
			  			</span>
			  	</div>
			  </td> 
	    </tr>		
		<tr>	
			<th
				style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">기본주소</th>
			<td><input type="text" id="sample6_address"  name="rec_addr" class="form-control"  placeholder="기본주소"></td>
			<th
				style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">상세주소</th>
			<td><input type="text" id="sample6_address2" name="rec_addr_detail" class="form-control"  placeholder="상세주소"></td>
		</tr>

	</table>
</div>
