<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>		
<!--
	작성일 : 2016-11-17
	작성자 : 박성준
	목적 : 관리자 부서관리 페이지
-->
<div class="normalheader transition animated fadeIn">
	<div class="hpanel">
		<div class="panel-body">
			<a class="small-header-action" href="">
				<div class="clip-header">
					<i class="fa fa-arrow-up"></i>
				</div>
			</a>

			<div id="hbreadcrumb" class="pull-right m-t-lg">
				<div class="p-sm">
					<span class="vertical-date pull-right"> Saturday <br /> <small>12:17:43
							PM</small>
					</span>

				</div>
			</div>
			<h2 class="font-light m-b-xs">하위부서 관리</h2>
		</div>
	</div>
</div>

<div class="content">
	<div class="row">
		<div class="col-md-5">
			<div class="hpanel">
				<div class="v-timeline vertical-container animate-panel"
					data-child="vertical-timeline-block" data-delay="1">
					<div class="vertical-timeline-block">
						<div class="vertical-timeline-icon navy-bg">
							<i class="fa fa-calendar"></i>
						</div>
						<div class="vertical-timeline-content">
							<div class="p-sm">
								<span class="vertical-date pull-right"> Saturday <br />
									<small>12:17:43 PM</small>
								</span>
								<h2>하위부서 조회</h2>
							</div>

							<div class="panel-body">
								<label class="form-control">지점 선택</label> 	
								  <select class="form-control" id="select_Branch" onchange="showDeptFuc()">
									<option>선택</option>
									<c:forEach var="list" items="${branchList}">
										<option value="${list.branch_name}">${list.branch_name}</option>
									</c:forEach>
								  </select> <br /> 
							   <label class="form-control">부서 선택</label> 
								   <select class="form-control" id="select_Dept" onchange="showLowDeptFuc()">
								   </select> <br /> 
								<label class="form-control">하위부서 선택</label>
								 <select class="form-control" id="select_Low_Dept">
								</select> <br />
								<div class="col-md-offset-2 col-md-4">
									<input type="button" class="btn btn-success" id="seeDepartBtn"
										value="부서조회">
								</div>
								<div class="col-md-4">
									<input type="button" class="btn btn-success"
										id="addDownDepartBtn" value="부서추가">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="col-md-7">
			<div class="hpanel">
				<div class="v-timeline vertical-container animate-panel"
					data-child="vertical-timeline-block" data-delay="1">
					<div class="vertical-timeline-block">
						<div class="vertical-timeline-icon navy-bg">
							<i class="fa fa-calendar"></i>
						</div>
						<div class="vertical-timeline-content">
							<div class="p-sm">
								<span class="vertical-date pull-right"> Saturday <br />
									<small>12:17:43 PM</small>
								</span>
								<h2>하위부서 정보(조회, 수정)</h2>
							</div>

							<div class="panel-body">
								<div id="seeAndModifyDiv">
									<form class="form-horizontal">
										<div class="form-group">
											<h4>&nbsp;&nbsp;&nbsp;하위부서 정보(조회, 수정)</h4>
										</div>
										<input type="hidden" id="hiddendept_no">
										<input type="hidden" id="hiddenbranch_name">
										<input type="hidden" id="hiddenlow_dept_no">
										 <div class="form-group">
											<div class="col-md-3">
												<label>부서명</label>
											</div>
											<div class="col-md-9">
												<input type="text" id="dept_name" class="form-control" readonly="readonly">
											</div>
										</div>
										<div class="form-group">
											<div class="col-md-3">
												<label>하위 부서명</label>
											</div>
											<div class="col-md-9">
												<input type="text" id="low_dept_name" class="form-control" readonly="readonly">
											</div>
										</div>
										<div class="form-group">
											<div class="col-md-3">
												<label>연락처</label>
											</div>
											<div class="col-md-9">
												<input type="text" id="tel" class="form-control" readonly="readonly">
											</div>
										</div>
										<div class="form-group">
											<div class="col-md-3">
												<label>팩스번호</label>
											</div>
											<div class="col-md-9">
												<input type="text" id="fax" class="form-control" readonly="readonly">
											</div>
										</div>
									<div class="form-group">
										<div class="col-md-3">
											<label>출퇴근시간</label>
										</div>
										
										<div class="col-md-4">
											<div class="input-group clockpicker" data-autoclose="true">
                        					  <input type="text" class="form-control" id="in_time" readonly="readonly" >
                               					 <span class="input-group-addon">
                                    			     <span class="fa fa-clock-o"></span>
                               					 </span>
                    						</div>
                    					</div>	
                    					<div class="col-md-1">~</div>
                    					<div class="col-md-4">
                    						<div class="input-group clockpicker" data-autoclose="true">
                        					  <input type="text" class="form-control" id="out_time" readonly="readonly">
                               					 <span class="input-group-addon">
                                    			 	<span class="fa fa-clock-o"></span>
                               					 </span>
                    					    </div>
                    					</div>
									</div>
									<div class="form-group">
										<div class="col-md-3">
											<label>홈페이지 접근 시간</label>
										</div>
											<div class="col-md-4">
											<div class="input-group clockpicker" data-autoclose="true">
                        					  <input type="text" class="form-control" id="open" readonly="readonly" >
                               					 <span class="input-group-addon">
                                    			     <span class="fa fa-clock-o"></span>
                               					 </span>
                    						</div>
                    					</div>	
                    					<div class="col-md-1">~</div>
                    					<div class="col-md-4">
                    						<div class="input-group clockpicker" data-autoclose="true">
                        					  <input type="text" class="form-control" id="close" readonly="readonly">
                               					 <span class="input-group-addon">
                                    			 	<span class="fa fa-clock-o"></span>
                               					 </span>
                    					    </div>
                    					</div>
									</div>	
										
										<div class="form-group">
											<div class="col-md-offset-2 col-md-6">
												<input type="button" class="btn btn-success" id="lowDeptModifyBtn" value="수정">
											</div>
										</div>

									</form>
								</div>
								<!--추가할때 뜨는 폼-->
								<div id="addDiv">
									<form class="form-horizontal">
										<div class="form-group">
											<h4>&nbsp;&nbsp;&nbsp;하위부서 등록</h4>
										</div>
										<div class="form-group">
											<div class="col-md-3">
												<label>지점</label>
											</div>
											<div class="col-md-9">
												<select class="form-control" id="select_branch_add" onchange="showDeptFuc2()">
													<option>선택</option>
														<c:forEach var="list" items="${branchList}">
															<option value="${list.branch_name}">${list.branch_name}</option>
														</c:forEach>
												</select>
											</div>
										</div>
										<div class="form-group">
											<div class="col-md-3">
												<label>부서</label>
											</div>
											<div class="col-md-9">
												<select class="form-control" id="select_Dept_add">
											    </select>
											</div>
										</div>
										<div class="form-group">
											<div class="col-md-3">
												<label>하위 부서명</label>
											</div>
											<div class="col-md-9">
												<input type="text" class="form-control" id="add_low_dept_name">
											</div>
										</div>
										<div class="form-group">
											<div class="col-md-3">
												<label>연락처</label>
											</div>
											<div class="col-md-9">
												<input type="text" class="form-control" id="add_tel">
											</div>
										</div>
										<div class="form-group">
											<div class="col-md-3">
												<label>팩스번호</label>
											</div>
											<div class="col-md-9">
												<input type="text" class="form-control" id="add_fax">
											</div>
										</div>
										<div class="form-group">
										<div class="col-md-3">
											<label>출퇴근시간</label>
										</div>
										
										<div class="col-md-4">
											<div class="input-group clockpicker" data-autoclose="true">
                        					  <input type="text" class="form-control" id="add_in_time">
                               					 <span class="input-group-addon">
                                    			     <span class="fa fa-clock-o"></span>
                               					 </span>
                    						</div>
                    					</div>	
                    					<div class="col-md-1">~</div>
                    					<div class="col-md-4">
                    						<div class="input-group clockpicker" data-autoclose="true">
                        					  <input type="text" class="form-control" id="add_out_time" >
                               					 <span class="input-group-addon">
                                    			 	<span class="fa fa-clock-o"></span>
                               					 </span>
                    					    </div>
                    					</div>
									</div>
									<div class="form-group">
										<div class="col-md-3">
											<label>홈페이지 접근 시간</label>
										</div>
											<div class="col-md-4">
											<div class="input-group clockpicker" data-autoclose="true">
                        					  <input type="text" class="form-control" id="add_open">
                               					 <span class="input-group-addon">
                                    			     <span class="fa fa-clock-o"></span>
                               					 </span>
                    						</div>
                    					</div>	
                    					<div class="col-md-1">~</div>
                    					<div class="col-md-4">
                    						<div class="input-group clockpicker" data-autoclose="true">
                        					  <input type="text" class="form-control" id="add_close">
                               					 <span class="input-group-addon">
                                    			 	<span class="fa fa-clock-o"></span>
                               					 </span>
                    					    </div>
                    					</div>
									</div>	
										
										<div class="form-group">
											<div class="col-md-offset-2 col-md-6">
												<input type="button" class="btn btn-success" id="addlowDeptBtn" value="등록">
											</div>
										</div>
									</form>
								</div>


							</div>
							<div class="panel-footer"></div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>