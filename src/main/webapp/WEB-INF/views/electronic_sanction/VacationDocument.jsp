<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="table-responsive">
	<h4>휴가문서</h4>
	<table cellpadding="1" cellspacing="1" class="table table-bordered ">
		<tr>
			<th
				style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%"><font
				color="#f05050">*</font> 휴가 선택</th>
			<td colspan="3"><select class="form-control" id="vacationSelect">
					<option value="0">선택</option>
					<option value="1">연차휴가</option>
					<option value="2">특별휴가</option>
			</select></td>
		</tr>
		<tr>
			<th
				style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">문서번호</th>
			<td style="width: 40%"><input type="text" class="form-control"></td>
			<th
				style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">기안일자</th>
			<td style="width: 40%"><input type="text" class="form-control"></td>
		</tr>
	</table>
</div>
