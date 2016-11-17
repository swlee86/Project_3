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
			<h2 class="font-light m-b-xs">주소록 수정</h2>
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
						<form>
						<div class="table-responsive">
							<table cellpadding="1" cellspacing="1" class="table table-bordered "  >
								<tbody>
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:30px; width:10%; padding-top:15px;">이름</th>
										<td>	
											<div class="form-group">	
												<div class="input-group">
													<input type="text" class="form-control input-sm" placeholder="이름을 입력하세요." value="박지은"/>
													<span class="input-group-btn">
														<button class="btn btn-default input-sm" type="button">
															<font style="color:#fd7d86 "> <span class="fa fa-user-plus"></span></font>
														</button>
													</span>
												</div>
											</div>
										</td>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:30px; width:10%;padding-top:15px;">생년월일</th>
										<td>
											<div class="form-inline">
											<select  class="form-control input-sm">
												<c:forEach begin="1960" end="1999" var="i" >
													<option value="i" <c:if test="${i==1993}">selected</c:if>>${i}</option>
												</c:forEach>
											</select>
											년 &nbsp;
											<select  class="form-control input-sm">
												<c:forEach begin="1" end="12" var="i">
													<option value="i" <c:if test="${i==3}">selected</c:if>>${i}</option>
												</c:forEach>
											</select>
											월&nbsp;
											<select  class="form-control input-sm">
												<c:forEach begin="1" end="12" var="i">
													<option value="i" <c:if test="${i==3}">selected</c:if>>${i}</option>
												</c:forEach>
											</select>
											일
											</div>
										</td>
									</tr>
									<tr>
										<th style="background-color:#f5f5f5;text-align:right;padding-right:30px; width:10%">소속</th>
										<td><input type="text"  class="form-control input-sm" placeholder="회사명을 입력하세요." value="코스타"></td>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:30px; width:10%">메일</th>
										<td><input type="text" class="form-control input-sm" placeholder="메일을 입력하세요." value="wong303@naver.com"></td>
									</tr>
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:30px; width:10%">연락처1</th>
										<td><input type="text" class="form-control input-sm" placeholder="연락처를 입력하세요." value="010-2808-1042"></td>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:30px; width:10%">연락처2</th>
										<td><input type="email"  class="form-control input-sm" placeholder="연락처를 입력하세요." value="02-280-1042"></td>
									</tr>
									<tr>
										<th style="background-color:#f5f5f5; text-align:right;padding-right:30px; width:10%">사진등록</th>
										<td colspan="3"><input type="file"  class="form-control input-sm"></td>
									</tr>
									<tr >
										<th style="background-color:#f5f5f5; text-align:right;padding-right:30px; width:10%; padding-top:45px;">주소록 그룹</th>
										<td colspan="3">
											<select  class="form-control input-sm"  style="height:100px" size="5">
													<option>선택안함</option>
													<option>인사팀그룹</option>
													<option>영업팀그룹</option>
											</select>
										</td>
									</tr>
									<tr >
										<th style="background-color:#f5f5f5; text-align:right;padding-right:30px; width:10%; padding-top:20px;">메모</th>
										<td colspan="3">
											<textarea class="form-control">착한사람</textarea>
										</td>
									</tr>									
								</tbody>
							</table>
							<div class=" pull-right" style="text-align:center;">
								<input type="submit"  class="btn btn-sm btn-success" value="등 록" style="padding-right:15px;padding-left:15px;font-weight:600;font-size:13px">
								<input type="button"  onclick="location.href='contacts.do'" class="btn btn-sm btn-default"  value="취 소" style="padding-right:15px;padding-left:15px;font-weight:600;font-size:13px">
							</div>
						</div>
						</form>	
					</div>
				</div>


			</div>
		</div>
	</div>
</div>