<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--협조문 페이지-->

<div class="table-responsive">
	<h4>협조문</h4>
	<table cellpadding="1" cellspacing="1" class="table table-bordered ">
		<tr>
			<th
				style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%"><font
				color="#f05050">*</font> 부서 선택</th>
			<td colspan="3">
				<input type="button" class="btn btn-success" value="부서선택" onclick="CooperationBtnFunction();">
			</td>
		</tr>
		<tr>
		     <th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%"><font color="#f05050">*</font>부서</th>
			<td colspan="3">
				<input type="text" id="CooperationDepartInput" name="" class="form-control">
			</td>	
		</tr>
		<tr>
		     <th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%"><font color="#f05050">*</font>이름</th>
			<td colspan="3">
				<input type="text" name="" id="CooperationNameInput" class="form-control">
			</td>	
		</tr>
	</table>
</div>


<div class="modal fade hmodal-success" id="CooperationModal" tabindex="-1" role="dialog" aria-hidden="true">
   <div class="modal-dialog modal-md">
      <div class="modal-content">
         <div class="color-line"></div>
         <div class="modal-header" style="height:50px;padding-top:10px;padding-bottom:0px">
            <h4 class="modal-title"><font color="#6a6c6f" size="4em"><b>수신자 선택</b></font></h4>
         </div>
         <div class="modal-body">
            <div class="row">
               <div class="col-md-4" style="border: 1px solid gray;" id="organization">
                  
               </div>   
               <div class="col-md-8" id="empList">
                  사원리스트
               </div>
            </div>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">닫기</button>
         </div>
      </div>
   </div>
</div>