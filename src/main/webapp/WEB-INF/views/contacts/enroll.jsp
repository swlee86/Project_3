<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="normalheader transition animated fadeIn">
	<div class="hpanel">
		<div class="panel-body">
			<a class="small-header-action" href="">
				<div class="clip-header">
					<i class="fa fa-arrow-up"></i>
				</div>
			</a>

			<div id="hbreadcrumb" class="pull-right m-t-lg">
				<ol class="hbreadcrumb breadcrumb">
					<li><a href="index.html">Dashboard</a></li>
					<li><span>App views</span></li>
					<li class="active"><span>Contacts</span></li>
				</ol>
			</div>
			<h2 class="font-light m-b-xs">주소록 등록</h2>
			<small>Show users list in nice and color panels</small>
		</div>
	</div>
</div>


<div class="content animate-panel">
	<div class="row">
		<div class="col-lg-12">
			<div class="hpanel">
				<div class="panel-body">
					<div class="table-responsive">
						<form action="enroll.do" method="post" enctype="multipart/form-data">  
						<div class="table-responsive">
							<table cellpadding="1" cellspacing="1" class="table table-bordered "  >
								<tbody>
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%; padding-top:15px;"><font color="#f05050">* </font>이름</th>
										<td>	
											<div class="form-group">	
												<div class="input-group">
													<input type="text" class="form-control input-sm" placeholder="이름을 입력하세요." name="name" id="name" />
													<span class="input-group-btn">
														<button class="btn btn-default input-sm" type="button" id="organization_add">
															<font style="color:#fd7d86 "> <span class="fa fa-user-plus"></span></font>
														</button>
													</span>
												</div>
											</div>
										</td>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%;padding-top:15px;">생년월일</th>
										<td>
											<div class="form-inline">
												<input type="text" class="form-control " id="addenrollDate" name="birth">
											</div>
										</td>
									</tr>
									<tr>
										<th style="background-color:#f5f5f5;text-align:right;padding-right:10px; width:10%">소속</th>
										<td><input type="text"  class="form-control input-sm" placeholder="회사명을 입력하세요." id="attach" name="attach"></td>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%">메일</th>
										<td><input type="text" class="form-control input-sm" placeholder="메일을 입력하세요." id="mail" name="mail"></td>
									</tr>
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%">집/개인 전화번호</th>
										<td><input type="text" class="form-control input-sm" placeholder="연락처를 입력하세요." id="tel1" name="tel1"></td>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%">휴대폰번호</th>
										<td><input type="text"  class="form-control input-sm" placeholder="연락처를 입력하세요." id="tel2" name="tel2"></td>
									</tr>
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%">사진등록</th>
										<td colspan="3">
											<input type="file"  class="form-control input-sm" id="uploadfile" name="uploadfile">
											<input type="hidden" name="empimg" id="empimg">
										</td>
									</tr>
									<tr >
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%; padding-top:45px;">주소록 그룹</th>
										<td colspan="3">
											
											<select  class="form-control input-sm"  style="height:80px" size="3" name="group_no">
													<c:forEach items="${grouplist}" var="g">
														<c:choose>
															<c:when test="${g.group_no == 1}">
																<option value="${g.group_no}" selected>${g.group_name}</option>
															</c:when>
															<c:otherwise>
																<option value="${g.group_no}">${g.group_name}</option>
															</c:otherwise>
														</c:choose>
													</c:forEach>
											</select>
										</td>
									</tr>
									<tr >
										<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%; padding-top:20px;">메모</th>
										<td colspan="3">
											<textarea class="form-control" name="memo"></textarea>
										</td>
									</tr>									
								</tbody>
							</table>
							
							
						</div>
						<div class=" pull-right" style="text-align:center;">
								<input type="submit"  class="btn btn-sm btn-success" value="등록" style="padding-right:15px;padding-left:15px;font-weight:600;font-size:13px">
								<input type="button"  onclick="location.href='contacts.do'" class="btn btn-sm btn-default"  value="취 소" style="padding-right:15px;padding-left:15px;font-weight:600;font-size:13px">
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