<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="vendor/summernote/dist/summernote.css" />
<link rel="stylesheet" href="vendor/summernote/dist/summernote-bs3.css" />  
<script src="vendor/toastr/build/toastr.min.js"></script>
 <link rel="stylesheet" href="vendor/toastr/build/toastr.min.css" />

<script>
$(function(){
	 toastr.options = {	 
			 "closeButton": true,
			  "debug": false,
			  "newestOnTop": false,
			  "progressBar": false,
			  "positionClass": "toast-top-center",
			  "preventDuplicates": false,
			  "onclick": null,
			  "showDuration": "300",
			  "hideDuration": "1000",
			  "timeOut": "2000",
			  "extendedTimeOut": "1000",
			  "showEasing": "swing",
			  "hideEasing": "linear",
			  "showMethod": "fadeIn",
			  "hideMethod": "fadeOut"
	        };
	 
		//날짜 필수. 제목필수, 내용 필수, 책임자 필수
		$('#submit_btn').click(function(){
			
			console.log("ss : "+$('.note-editable').text());
			
			if($('#pj_start').val() ==""){
				toastr.warning('시작일을 선택해 주세요');
				$('#pj_start').focus();
				return false;
			}
			if($('#pj_end').val() =="" ){
				toastr.warning('종료일을 선택해 주세요');
				$('#pj_end').focus();
				return false;
			}
			if($('#pj_title').val() ==""){
				toastr.warning('제목을 입력해 주세요');
				$('#pj_title').focus();
				return false;
			}
			if($('#rec_emp_name').val() ==""){
				toastr.warning('수신자를 선택해 주세요');
				$('#rec_emp_name').focus();
				return false;
			}
			if($('.note-editable').text() ==""){
				toastr.warning('내용을 입력해 주세요');
				$('.note-editable').focus();
				return false;
			}
			
		});
});
	

</script>
<!--프로젝트 생성 폼-->
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
					<li><span>프로젝트 관리</span></li>
					<li>프로젝트 작성</li>
				</ol>
			</div>
			<h2 class="font-light m-b-xs">프로젝트 작성</h2>
			<small>새로운 프로젝트를 시작해 보세요!</small>
		</div>
	</div>
</div>
<div class="content animate-panel">
	<div class="row">
		<div class="col-lg-12">
			<div class="hpanel">
				<div class="panel-body">
					<div class="table-responsive">
						<form class="form-inline" method="post" action="projectMake.do">
						<div class="table-responsive">
							<table cellpadding="1" cellspacing="1" class="table table-bordered "  >
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%"><font color="#f05050">*</font> 기간</th>
										<td>
											<div class="form-group">
												
												<div class="input-group date">
													<input type="text" class=" form-control input-sm formstartDate" value="" name="pj_start" id="pj_start" size="20px" >
													<span class="input-group-addon "><font style="color:#fd7d86 "><i class="fa fa-calendar"></i></font></span>
												</div>
												&nbsp;&nbsp; <b>~</b> &nbsp;&nbsp;
											
												<div class="input-group date">
													<input type="text"  class=" form-control input-sm formendDate" value="" name="pj_end" id="pj_end" size="20px" > 
													<span class="input-group-addon "><font style="color:#fd7d86 "><i class="fa fa-calendar"></i></font></span>
												</div>
				                            </div>
										</td>
									</tr>
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%"><font color="#f05050">*</font> 제목</th>
										<td><input type="text" class="form-control input-sm" placeholder="제목" style="width:100%" name="pj_title" id="pj_title" ></td>
									</tr>	
								
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%"><font color="#f05050">*</font> 수신자</th>
										<td>
											<div class="form-group">
											<div class="row">
												<div class="col-md-12">
												<span class="input-group">
													<input type="hidden" id="rec_emp_no" name="rec_emp_no"> 
	                     							<input type="text" class="form-control input-sm" id="rec_emp_name" name="rec_emp_name" readonly/>
	                        						<span class="input-group-btn">
														<button class="btn input-sm btn-default" type="button" id="organization_add"><font style="color:#fd7d86 "><span class="fa fa-user-plus"></span></font></button>
													</span>
	                   	  						</span>
	                   	  						</div>
	                   	  						</div>
                   	  						</div>
										</td>
									</tr>																	
									
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%"><font color="#f05050">*</font> 내용</th>
										<td>
											<div>
											<textarea cols="20" rows="20"   id="pj_content" placeholder="내용" style="width:100%;" name="pj_content" class="summernote"></textarea>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="pull-right" style="text-align:center;">
								<a href="project_list.do" class="btn w-xs btn-default"  style="padding-right:15px;padding-left:15px;font-weight:600;font-size:13px">Cancel <i class="fa fa-close"></i></a>
								<button type="submit" id="submit_btn" class="btn w-xs btn-success" style="padding-right:15px;padding-left:15px;font-weight:600;font-size:13px">Next <i class="fa fa-chevron-right"></i></button>
							</div>
							<input type="hidden" id="hiddenEmp_no" name="hiddenEmp_no">
						</div>
						</form>	
					</div>
				</div>


			</div>
		</div>
	</div>
</div>    

<div class="modal fade hmodal-success" id="myModal7" tabindex="-1" role="dialog" aria-hidden="true">
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
				               <div class="groupdiv2 col-md-4" style="border: 1px solid #ddd;" id="porganization">
				                  
				               </div>   
				               <div class=" col-md-8" id="emppList" >
				                  	
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
											<select class="form-control input-sm" id="conp_ins_org_sea_field">
												<option value="emp_name">사원명</option>
												<option value="low_dept_name">하위부서명</option>
											</select>
										</div>
									</div>

									<div class="col-md-6">
										<input type="hidden" id="con_ins_org_sea_btn_sel" value="1">
										<div class="form-inline">
											<div class="input-group">
												<input type="text" class="form-control input-sm" id="conp_ins_org_sea_query" />
												<span class="input-group-btn">
													<a href="#" class="btn btn-default input-sm"  id="con_ins_org_sea_btn" style="color: #fd7d86" >
														<b><span class="fa fa-search"></span></b>
													</a>
												</span>
											</div>
										</div>
									</div>	
									
				               </div>
				               
				               <br>
				               <div class="row">
					               <div class="col-md-12" id="emppList2"  >
					                  	
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
