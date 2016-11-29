<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="vendor/summernote/dist/summernote.css" />
<link rel="stylesheet" href="vendor/summernote/dist/summernote-bs3.css" /> 
<div class="pjd_table row" id="pjd_table" >
		<div class="col-lg-12">
			<div class="hpanel hblue">
				<div class="panel-heading hbuilt">
					<div class="panel-tools">
						<a class="showhide"><i class="fa fa-chevron-up"></i></a> 
						<a class="closebox"><i class="fa fa-times"></i></a>
					</div>
					상세 프로젝s트 - 1
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
														<input type="text" class="formstartDate pjd_start_plus form-control input-sm "  name="" value="" size="20px">
														<span class="input-group-addon"><font style="color:#fd7d86 "><i class="fa fa-calendar"></i></font></span>
													</div>
													&nbsp;&nbsp;~&nbsp;&nbsp;
													종료일 :
													<div class="input-group date">
														<input type="text" class="formendDate pjd_end_plus form-control" value="" name="" size="20px"> 
														<span class="input-group-addon"><font style="color:#fd7d86 "><i class="fa fa-calendar"></i></font></span>
													</div>
					                            </div>
											</td>
										</tr>
										<tr>
											<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%"><font color="#f05050">*</font> 제목</th>
											<td><input type="text" class="pjd_title_plus form-control input-sm" placeholder="제목" name="" style="width:100%"></td>
										</tr>	
								
										<tr>
											<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%">참여자</th>
											<td>
												<span class="input-group">
	                     							<input type="text" class="pjd_emp_name_plus form-control input-sm" name=""/>
	                     							<input type="text" class="pjd_emp_no_plus" name="">
	                        						<span class="input-group-btn">
														<button class="organization_add btn input-sm btn-default " type="button"  ><font style="color:#fd7d86 "><span class="fa fa-user-plus"></span></font></button>
													</span>
	                   	  						</span>
											</td>
										</tr>																	
									
										<tr>
											<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%"><font color="#f05050">*</font> 내용</th>
											<td>
												<div>
												<textarea cols="10" rows="10" class="summernote pjd_content_plus form-control"  placeholder="내용" name="" style="width:100%"></textarea>
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