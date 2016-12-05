<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="vendor/summernote/dist/summernote.css" />
<link rel="stylesheet" href="vendor/summernote/dist/summernote-bs3.css" /> 

<script>
 $(function(){
	 
	$('.showhide_first').click(function(){
		$('.pdplus_0').slideUp();
	});
	$('.showup_first').click(function(){
		$('.pdplus_0').slideDown();
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
					<li><a href="projects.do">프로젝트 생성</a></li>
				</ol>
			</div>
			<h2 class="font-light m-b-xs">프로젝트 상세 생성</h2>
			<small>프로젝트의 상세정보를 입력하세요.</small>
		</div>
	</div>
</div>
<div class="content animate-panel">
 
	<form class="form-inline" action="project_detail_plus_try.do" method="post">
		
		<input type="hidden" name="pjd_count" id="pjd_count" value="0">
		<a id="pjd_detail_btn"  class="btn w-xs btn-warning"  style="padding-right:15px;padding-left:15px;font-weight:600;font-size:13px">Plus <i class="fa fa-plus"></i></a>
		<div class="pull-right" style="text-align:center;">
			<a href="project_list.do" class="btn w-xs btn-default"  style="padding-right:15px;padding-left:15px;font-weight:600;font-size:13px">Cancel <i class="fa fa-close"></i></a>
		<!-- 	<a href=""  class="btn w-xs btn-success" style="padding-right:15px;padding-left:15px;font-weight:600;font-size:13px"><i class="fa fa-chevron-left"></i> Previous </a> -->
			
			<button type="submit" class="btn w-xs btn-success" style="padding-right:15px;padding-left:15px;font-weight:600;font-size:13px">Save <i class="fa fa-chevron-down"></i></button>
		</div>
		<br>
	<div class="pjd_table row" id="pjd_table" >
		<div class="col-lg-12">
			<div class="hpanel hblue">
				<div class="panel-heading hbuilt">
					<div class="panel-tools">
						<a class="showhide_first"><i class="fa fa-chevron-up"></i></a> 
						 <a class="showup_first"><i class="fa fa-chevron-down"></i></a>  <!-- <i class="fa fa-times"></i> -->
					</div>
					상세 프로젝트 - 기본
				</div>
				
				<div class="panel-body pdplus_0">		
					<div class="table-responsive">
								<table cellpadding="1" cellspacing="1" class="table table-bordered "  >
									<tr>
											<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%"><font color="#f05050">*</font> 기간</th>
											<td>
												<div class="form-group">
													
													<div class="input-group date">
														<input type="text" class="form-control input-sm formstartDate" name="pjd[0].pjd_start" value="" size="20px">
														<span class="input-group-addon"><font style="color:#fd7d86 "><i class="fa fa-calendar"></i></font></span>
													</div>
													&nbsp;&nbsp; <b>~</b> &nbsp;&nbsp;
													
													<div class="input-group date">
														<input type="text" class="formendDate form-control input-sm" name="pjd[0].pjd_end" value="" size="20px"> 
														<span class="input-group-addon"><font style="color:#fd7d86 "><i class="fa fa-calendar"></i></font></span>
													</div>
					                            </div>
											</td>
										</tr>
										<tr>
											<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%"><font color="#f05050">*</font> 제목</th>
											<td><input type="text" class="form-control input-sm" placeholder="제목" name="pjd[0].pjd_title" style="width:100%"></td>
										</tr>	
								
										<tr>
											<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%">참여자</th>
											<td>
											<div class="col-md-3">
											<div class="form-inline">
												
												<!-- <span class="input-group">      -->                							
	                     							<span class="multiDiv_0">
	                     							
	                     							</span>
	                        						<span class="">
														<button class=" btn input-sm btn-default" type="button" id="organization_add"><font style="color:#fd7d86 "><span class="fa fa-user-plus"></span></font></button>
													</span>
	                   	  					<!-- 	</span> -->
	                   	  						</div>
	                   	  						</div>
											</td>
										</tr>																	
									
										<tr>
											<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%"><font color="#f05050">*</font> 내용</th>
											<td>
												<div>
												<textarea cols="10" rows="10" class="summernote form-control" placeholder="내용" name="pjd[0].pjd_content" style="width:100%" ></textarea>
												</div>
											</td>
										</tr>
								</table>				
							</div>		
						</div>
					<div class="panel-footer"></div>
				</div>
			</div>
		</div>
		<div id="kung_pjd_table" >
		
		</div>
	</form>	
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
	                <li class="active"><a data-toggle="tab" href="#tabp-1"><span style="font-weight: 600;font-size:13px">조직도</span></a></li>
	                <li class=""><a data-toggle="tab" href="#tabp-2"><span style="font-weight: 600;font-size:13px">검색</span></a></li>
	            </ul>
	        	<div class="tab-content">
	        		<div id="tabp-1" class="tab-pane active">
	        			<div class="panel-body">
	        				<div class="row">  
				               <div class="groupdiv2 col-md-4" style="border: 1px solid #ddd;" id="porganization">
				                  
				               </div>   
				               <div class=" col-md-8" id="emppList" >
				                  	
				               </div>
				            </div>
	        			</div>
	        		</div>
	        		<div id="tabp-2" class="tab-pane">
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
										<div class="form-inline">
											<div class="input-group">
											<input type="hidden" id="con_ins_org_sea_btn_sel" value="2">
												<input type="text" class="form-control input-sm" id="conp_ins_org_sea_query" />
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