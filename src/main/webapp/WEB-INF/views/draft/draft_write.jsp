<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<div class="normalheader transition animated fadeIn media-body">
	<div class="hpanel">
		<div class="panel-body">
			<a class="small-header-action" href="">
				<div class="clip-header">
					<i class="fa fa-arrow-up"></i>
				</div>
			</a>
			<div id="hbreadcrumb" class="pull-right m-t-lg">
				<ol class="hbreadcrumb breadcrumb">
					<li><a href="index.do">홈</a></li>
					<li><span>전자 결재</span></li>
					<li class="active"><span>전자 결재 등록</span></li>
				</ol>
			</div>
			<h2 class="font-light m-b-xs">전자 결재 등록</h2>
			<small>&nbsp;&nbsp;전자 결재를 등록할 수 있습니다^^</small>
		</div>
	</div>
</div>

<!-- 상단 -->
<div class="content animate-panel">
	<div class="row">
		<div class="col-lg-12">
			<div class="hpanel">
				<div class="panel-body">
					<form name="draft" enctype="multipart/form-data">
						<div class="table-responsive">
							<div class="table-responsive">
								<table cellpadding="1" cellspacing="1" class="table table-bordered">
									<tr>
										<th style="background-color: #f5f5f5; text-align: right; 
											   	   padding-right: 10px; width: 15%;">
											<i class="pe-7s-paperclip"></i>
											첨부 파일
										</th>
										<td colspan="3">
											<input type="file" name="uploadfile" class="form-control input-sm" style="border: none;">
										</td>
									</tr>
									<tr>
										<th style="background-color: #f5f5f5; text-align: right; 
												   padding-right: 10px; width: 10%;">
											<font color="#f05050">*</font> 결재 유형
										</th>
										<td colspan="3" style="padding-left: 25px;">
											<div class="radio radio-success radio-inline" style="margin-top: 0px;">
												<input type="radio" onclick="checkDraft()" style="border: none;"
													   id="radio1" name="cg_no" value="1"> 
													<label for="radio1">대외 공문</label>
											</div>
											<div class="radio radio-success radio-inline">
												<input type="radio" onclick="checkDraft()" style="border: none;"
													   id="radio2" name="cg_no" value="2"> 
													<label for="radio2">협조문</label>
											</div>
											<div class="radio radio-success radio-inline">
												<input type="radio" onclick="checkDraft()" style="border: none;"
													   id="radio3" name="cg_no" value="3"> 
													<label for="radio3">휴가 신청서</label>
											</div>
										</td>
									</tr>
									<tr>
										<th style="background-color: #f5f5f5; text-align: right; 
												   padding-right: 10px; width: 10%">
											<font color="#f05050">*</font> 결재 라인
										</th>
										<td id="sanction_DraftOk_no_td">
											<span class="input-group">
												<input type="text" class="form-control input-sm" readonly
													   id="draft_Ok_emp_no" name="draft_line_emp_no">
													   
													<a type="button" class="btn btn-default input-group-addon"
													   id="draft_line_Icon"> 
														<span style="color: #fd7d86">
															<i class="fa fa-user-plus"></i>
														</span>
													</a>
											</span>
										</td>
										<th style="background-color: #f5f5f5; text-align: right; 
												   padding-right: 10px; width: 10%">
											<font color="#f05050">*</font> 이름
										</th>
										<td style="width: 40%" id="sanction_DraftName_td">
											<input type="text" class="form-control input-sm" readonly
												   id="draft_Ok_emp_name">
										</td>
									</tr>
									
									<tr>
										<th style="background-color: #f5f5f5; text-align: right; 
												   padding-right: 10px; width: 10%">
											<font color="#f05050">*</font> 참조자
										</th>
										<td id="sanction_writeNo_td">
											<span class="input-group">
												<input type="text" class="form-control input-sm" readonly
													   id="draft_ref_emp_no" name="draft_ref_emp_no"> 
												<a type="button" class="btn btn-default input-group-addon"
												   id="draft_ref_Icon"> 
													<span style="color: #fd7d86">
														<i class="fa fa-user-plus"></i>
													</span>
												</a>
											</span>
										</td>
										<th style="background-color: #f5f5f5; text-align: right; 
												   padding-right: 10px; width: 10%">
											<font color="#f05050">*</font> 이름
										</th>
										<td style="width: 40%" id="sanction_writename_td">
											<input type="text" class="form-control input-sm" readonly
												   id="draft_ref_emp_name">
										</td>
									</tr>
								</table>
								<br>
							</div>
						</div>

						<!-- 선택된 form 띄우기 -->
						<div class="panel-body" id="document_table" style="border: none;">

						</div>
						<div class="pull-right" style="text-align: center;">
							<input type="submit" class="btn btn-sm btn-success"
								id="submitBtn" value="결재 요청"
								style="padding-right: 15px; padding-left: 15px; font-weight: 600; font-size: 13px">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>



<!-- 결재라인용 모달-->
<!-- <div class="modal fade hmodal-success" id="myModal6" tabindex="-1"
	role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-md">
		<div class="modal-content">
			<div class="color-line"></div>
			<div class="modal-header"
				style="height: 50px; padding-top: 10px; padding-bottom: 0px">
				<h4 class="modal-title">
					<font color="#6a6c6f" size="4em"><b>사원 선택</b></font>
				</h4>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-md-4" style="border: 1px solid gray;"
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
 -->
 <div class="modal fade hmodal-success" id="myModal6" tabindex="-1" role="dialog" aria-hidden="true">
   <div class="modal-dialog modal-md">
      <div class="modal-content">
         <div class="color-line"></div>
         <div class="modal-header" style="height:50px;padding-top:10px;padding-bottom:0px">
            <h3 class="modal-title"><font color="#6a6c6f" size="4em"><i class="fa fa-table"></i> <b>사원 선택</b></font></h3>
         </div>
         <div class="modal-body">
         	<!-- <div class="hpanel"> -->
	         	<ul class="nav nav-tabs">
	                <li class="active"><a data-toggle="tab" href="#tab-1"><span style="font-weight: 600;font-size:13px">조직도</span></a></li>
	                <li class=""><a data-toggle="tab" href="#tab-2"><span style="font-weight: 600;font-size:13px">검색</span></a></li>
	            </ul>
	        	<div class="tab-content">
	        		<div id="tab-1" class="tab-pane active">
	        			<div class="panel-body">
	        				<div class="row">  
				               <div class="groupdiv2 col-md-4" style="border: 1px solid #ddd;" id="organization">
				                  
				               </div>   
				               <div class=" col-md-8" id="empList" >
				                  	
				               </div>
				            </div>
	        			</div>
	        		</div>
	        		<div id="tab-2" class="tab-pane">
	        			<div class="panel-body">
	        				<div class="row">   
				               <div class="row"> 
									<div class="col-md-3">
										<div class="form-inline">
											<select class="form-control input-sm" id="con_ins_org_sea_field">
												<option value="emp_name">사원명</option>
												<option value="low_dept_name">하위부서명</option>
											</select>
										</div>
									</div>

									<div class="col-md-6">
										<div class="form-inline">
											<div class="input-group">
												<input type="text" class="form-control input-sm" id="con_ins_org_sea_query" />
												<span class="input-group-btn">
													<a href="#" class="btn btn-default input-sm" id="con_ins_org_sea_btn" style="color: #fd7d86">
														<b><span class="fa fa-search"></span></b>
													</a>
												</span>
											</div>
										</div>
									</div>	
									
				               </div>
				               
				               <br>
				               <div class="row">
					               <div class="col-md-12" id="empList2"  >
					                  	
					               </div>
				               </div>   
				            </div>
	        			</div>
	        		</div>
	        	</div>
        	 <!-- </div> -->
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">닫기</button>
         </div>
      
   </div>
</div>
</div>