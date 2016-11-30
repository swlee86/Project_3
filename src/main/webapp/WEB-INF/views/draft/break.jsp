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
		     <th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%"><font color="#f05050">*</font>신청 기간</th>
			<td colspan="3">
				<div class="form-inline">
					<div class="input-group date">
						<input type="text" class="form-control input-sm"
							id="vacationStartDate"> <span class="input-group-addon"
							style="color: #fd7d86"><i class="fa fa-calendar"></i></span>
					</div>
					&nbsp; ~ &nbsp;
					<div class="input-group date">
						<input type="text" class="form-control input-sm"
							id="vacationEndDate"> <span class="input-group-addon"
							style="color: #fd7d86"><i class="fa fa-calendar"></i></span>
					</div>
				</div>
			</td>	
		</tr>
		
	</table>
</div>
