<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
					<li><a href="index.html">홈</a></li>
					<li><span>업무 관리</span></li>
					<li class="active"><span>업무 등록</span></li>
				</ol>
			</div>
			<h2 class="font-light m-b-xs">업무 등록</h2>
			<small>업무를 등록할 수 있습니다^^</small>
		</div>
	</div>
</div>

<div class="content animate-panel">
	<div class="row">
		<div class="col-lg-12">
			<div class="hpanel">
				<div class="panel-body">
					<div class="table-responsive">
						<form   id="taskForm" method="POST" enctype="multipart/form-data">
							<div class="table-responsive">
								<table cellpadding="1" cellspacing="1"
									class="table table-bordered" style="margin-bottom: 0px;">
									<tr>
										<th
											style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">
											<font color="#f05050">*</font> 업무 명
										</th>
										<td colspan="3"><input type="text"
											class="form-control input-sm" name="task_name" id="upmoo"></td>
									</tr>
									<tr>
										<th
											style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">
											<font color="#f05050">*</font> 업무 유형
										</th>
										<td colspan="3">
											<div class="radio radio-success radio-inline">
												<input type="radio" id="inlineRadio1" name="cg_no" value="1"><label
													for="inlineRadio1">업무 요청</label>
											</div>
											<div class="radio radio-success radio-inline">
												<input type="radio" id="inlineRadio2" name="cg_no" value="2"><label
													for="inlineRadio2">업무 보고</label>
											</div>
											<div class="radio radio-success radio-inline">
												<input type="radio" id="inlineRadio3" name="cg_no" value="3"><label
													for="inlineRadio3">업무 일지</label>
											</div>
										</td>
									</tr>
									<tr>
										<th
											style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">
											<font color="#f05050">*</font> 수신자 사번
										</th>
										<td ><span class="input-group"> <input readonly
												type="text" class="form-control input-sm" id="rec_emp_no"
												name="rec_emp_no" /> <a type="button"
												class="btn btn-default input-group-addon" id="recIcon">
													<span style="color: #fd7d86"> <i
														class="fa fa-user-plus"></i>
												</span>
											</a>
										</span>
										<div id="rec_no_td"></div>
										</td>
										<th
											style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">
											<font color="#f05050">*</font> 수신자 명
										</th>
										<td style="width: 40%" ><input readonly
											type="text" class="form-control input-sm" id="rec_name" 
											name="rec_name">
											<div id="rec_name_td"></div>
											</td>
									</tr>
									<tr>
										<th
											style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">
											<font color="#f05050">*</font> 참조자 사번
										</th>
										<td ><span class="input-group"> <input
												type="text" class="form-control input-sm" name="emp_no" id="chamjoInput"
												readonly> <a type="button"
												class="btn btn-default input-group-addon" id="deptA"> <span
													style="color: #fd7d86"> <i class="fa fa-user-plus"></i>
												</span>
											</a>
										</span>
										<div id="task_no_td"></div>
										</td>
										<th
											style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">
											<font color="#f05050">*</font> 참조자 명
										</th>
										<td style="width: 40%"><input  readonly
											type="text" class="form-control input-sm" id="task_name">
											<div  id="task_name_td"></div>
										</td>
									</tr>
									<tr>
										<th
											style="background-color: #f5f5f5; text-align: right; ` padding-right: 10px; width: 10%">
											<font color="#f05050">*</font> 업무 기한 <input type="hidden"
											id="deadline" name="deadline">
										</th>
										<td colspan="3">
											<div class="form-inline">
												<div class="input-group date">
													<input type="text" class="form-control input-sm"
														id="makeuserUpdateDate"> <span
														class="input-group-addon" style="color: #fd7d86"> <i
														class="fa fa-calendar"></i>
													</span>
												</div>
											</div>
										</td>
									</tr>
								</table>
								<table cellpadding="1" cellspacing="1"
									class="table table-bordered " style="margin-top: 0px;">
									<tr>
										<th
											style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">
											<font color="coral">*</font> 내용
										</th>
										<td><textarea cols="10" rows="10" class="form-control" id="content"
												name="content"></textarea></td>
									</tr>
								<!-- 	<tr>
										<th
											style="background-color: #f5f5f5; text-align: right; padding-right: 10px; width: 10%">
											<i class="pe-7s-paperclip"></i> 첨부 파일
										</th>
										<td><input type="file" name="uploadfile"
											class="form-control input-sm"></td>
									</tr> -->
									</tbody>
								</table>
								<div class="row" style="text-align: right; margin-right: 10px;">
									<input type="submit" id="submitBtn"
										class="btn btn-sm btn-success " value="완료"
										style="padding-right: 15px; padding-left: 15px; font-weight: 600; font-size: 13px"
										onclick="send()">
								</div>
							</div>
							<input type="hidden" id="hiddenEmp_no"> 
							<input type="hidden" id="hiddenMenuName" value="업무">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- <div class="modal fade hmodal-success" id="myModal6" tabindex="-1"
	role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-md">
		<div class="modal-content">
			<div class="color-line"></div>
			<div class="modal-header" style="height: 50px;">
				<h4 class="modal-title">
					<font color="#6a6c6f" size="4em"> <b>수신자 선택</b>
					</font>
				</h4>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-md-4" id="organization"></div>
					<div class="col-md-8" id="empList">사원리스트</div>
				</div>
			</div>
			<div class="modal-footer">
				<button id="closeModal" type="button" class="btn btn-default btn-sm">닫기</button>
			</div>
		</div>
	</div>
</div>
 -->

<div class="modal fade hmodal-success" id="myModal6" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-lg" id="modal_size">
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
				               <div class="groupdiv2 col-md-3" style="border: 1px solid #ddd;" id="organization">
				                  
				               </div>   
				               <div class="col-md-4" id="empList" >
				                  	
				               </div>
				               <div id="modal_size_option">
				               <div class=" col-md-1">
				               		<button type="button" class='btn  btn-success' onclick="precheck()"><i class='fa fa-chevron-right'></i></button>
				               		<br><Br>
				               		<button type="button" class='btn  btn-default' style="color:#62cb31" onclick="precheck_cancel()"><i class='fa fa-chevron-left'></i></button>
				               </div>  
				                <div class=" col-md-4" style="border: 1px solid #ddd;"   >
				                	<div class="row"><div style="background-color:#f6f6f6;font-size:15px;padding:10px 0 10px 12px;margin-bottom:5px;margin-left:0px"><i class="fa fa-users"></i>선택된 사원</div></div>
				                	
				                  	<div id="empList_list">선택된 사원이 없습니다.</div> 	
				               </div>
				               </div>
				            </div>
	        			</div>
	        		</div>
	        		<div id="tab-2" class="tab-pane">
	        			<div class="panel-body">
	        				<div class="row">   
				               <div class="row"> 
									<div class="col-md-3" id="modal_size_sea">
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