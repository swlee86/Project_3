<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="vendor/summernote/dist/summernote.css" />
<link rel="stylesheet" href="vendor/summernote/dist/summernote-bs3.css" /> 
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
<button id="pjd_detail_btn">추가</button>
	<form class="form-inline" action="project_detail_plus_try.do" method="post">
		폼<input type="text" name="pjd_count" id="pjd_count" value="0">
		<div class="pull-right" style="text-align:center;">
			<a href="project_list.do" class="btn w-xs btn-default"  style="padding-right:15px;padding-left:15px;font-weight:600;font-size:13px">Cancel <i class="fa fa-close"></i></a>
		<!-- 	<a href=""  class="btn w-xs btn-success" style="padding-right:15px;padding-left:15px;font-weight:600;font-size:13px"><i class="fa fa-chevron-left"></i> Previous </a> -->
			<button type="submit"  class="btn w-xs btn-success" style="padding-right:15px;padding-left:15px;font-weight:600;font-size:13px">Save <i class="fa fa-chevron-down"></i></button>
		</div>
		<br><br>
	<div class="pjd_table row" id="pjd_table" >
		<div class="col-lg-12">
			<div class="hpanel hblue">
				<div class="panel-heading hbuilt">
					<div class="panel-tools">
						<a class="showhide"><i class="fa fa-chevron-up"></i></a> 
						<a class="closebox"><i class="fa fa-times"></i></a>
					</div>
					상세 프로젝트 - 1
				</div>
				
				<div class="panel-body">		
					<div class="table-responsive">
								<table cellpadding="1" cellspacing="1" class="table table-bordered "  >
									<tr>
											<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%"><font color="#f05050">*</font> 기간</th>
											<td>
												<div class="form-group">
													시작일 :
													<div class="input-group date">
														<input type="text" class="form-control input-sm formstartDate" name="pjd[0].pjd_start" value="" size="20px">
														<span class="input-group-addon"><font style="color:#fd7d86 "><i class="fa fa-calendar"></i></font></span>
													</div>
													&nbsp;&nbsp;~&nbsp;&nbsp;
													종료일 :
													<div class="input-group date">
														<input type="text" class="formendDate form-control" name="pjd[0].pjd_end" value="" size="20px"> 
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
												<span class="input-group">
	                     							<!-- <input type="text" class="form-control input-sm" id="rec_emp_name" name="pjd[0].rec_emp_name"/>
	                     							<input type="hidden" name="pjd[0].rec_emp_no" id="rec_emp_no"> -->
	                     							<span class="multiDiv_0">
	                     							
	                     							</span>
	                        						<span class="input-group-btn">
														<button class=" btn input-sm btn-default" type="button" id="organization_add2"><font style="color:#fd7d86 "><span class="fa fa-user-plus"></span></font></button>
													</span>
	                   	  						</span>
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


<div class="modal fade hmodal-success" id="myModal6" tabindex="-1" role="dialog" aria-hidden="true">
   <div class="modal-dialog modal-md">
      <div class="modal-content">
         <div class="color-line"></div>
         <div class="modal-header" style="height:50px;padding-top:10px;padding-bottom:0px">
            <h4 class="modal-title"><font color="#6a6c6f" size="4em"><b>사원 선택</b></font></h4>
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