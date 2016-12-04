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
			<h2 class="font-light m-b-xs">프로젝트 생성</h2>
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
													<input type="text" class="formstartDate form-control input-sm" value="" name="pj_start" size="20px">
													<span class="input-group-addon"><font style="color:#fd7d86 "><i class="fa fa-calendar"></i></font></span>
												</div>
												&nbsp;&nbsp; <b>~</b> &nbsp;&nbsp;
											
												<div class="input-group date">
													<input type="text"  class="formendDate form-control input-sm" value="" name="pj_end" size="20px"> 
													<span class="input-group-addon"><font style="color:#fd7d86 "><i class="fa fa-calendar"></i></font></span>
												</div>
				                            </div>
										</td>
									</tr>
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%"><font color="#f05050">*</font> 제목</th>
										<td><input type="text" class="form-control input-sm" placeholder="제목" style="width:100%" name="pj_title"></td>
									</tr>	
								
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%">수신자</th>
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
											<textarea cols="10" rows="10"   placeholder="내용" style="width:100%" name="pj_content" class="summernote"></textarea>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="pull-right" style="text-align:center;">
								<a href="project_list.do" class="btn w-xs btn-default"  style="padding-right:15px;padding-left:15px;font-weight:600;font-size:13px">Cancel <i class="fa fa-close"></i></a>
								<button type="submit"  onclick='send();' class="btn w-xs btn-success" style="padding-right:15px;padding-left:15px;font-weight:600;font-size:13px">Next <i class="fa fa-chevron-right"></i></button>
								<input type="hidden" id="hiddenEmp_no">
								<input type="hidden" id="hiddenMenuName" value="프로젝트승인">
							</div>
						</div>
						</form>	
					</div>
				</div>


			</div>
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



