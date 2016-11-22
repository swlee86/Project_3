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
					<li><a href="index.html">Home</a></li>
					<!-- <li><span>App views</span></li> -->
					<li class="active"><span>Contacts</span></li>
				</ol>
			</div>
			<h2 class="font-light m-b-xs">개인 주소록</h2>
			<small>회원 마다 가질수 있는 주소록입니댜.</small>
		</div>
	</div>
</div>


<div class="content animate-panel">
	<div class="row">
		<div class="col-md-3">
			<div class="hpanel panel-group" id="accordion" role="tablist"
				aria-multiselectable="true">
				<div class="panel-body">
					<button type="button" class="btn w-xs btn-success btn-block"
						onclick="location.href='enroll.do'">주소록 등록</button>
				</div>
				<div class="panel-body">
					<h4 class="m-t-none m-b-none">
						<a href="#">전체 주소록</a>
					</h4>
				</div>
				<div class="panel-body">
					<a data-toggle="collapse" data-parent="#accordion" href="#q1"
						aria-expanded="true"> <i
						class="fa fa-chevron-down pull-right text-muted"></i> 사내 주소록 그룹
					</a>
					<div id="q1" class="panel-collapse collapse">
						<hr>
						그룹
					</div>
				</div>
				<div class="panel-body">
					<a data-toggle="collapse" data-parent="#accordion" href="#q2"
						aria-expanded="true"> <i
						class="fa fa-chevron-down pull-right text-muted"></i> 개인 주소록 그룹
					</a>
					<div id="q2" class="panel-collapse collapse">
						<hr>
						그룹
					</div>
				</div>
				<div class="panel-body" style="text-align: center">
					<button type="button" class="btn w-xs btn-outline btn-success btn-block" onclick="location.href='contaacts_group.do'">
						주소록 그룹 관리
					</button>
				</div>
			</div>
		</div>





		<div class="col-lg-9">
			<div class="hpanel">
				<div class="panel-body">
					<div class="row">
						<div class="col-md-5">
							<div class="col-md-11">
								<div class="row groupdiv" style=" border: 1px solid #ddd; height:300px">
									<ul>
										<c:forEach items="${grouplist}" var="g">
											<li>
												<a href="#" class="" id="group_${g.group_no}">${g.group_name}</a>
											</li>
										</c:forEach> 
									</ul>
								</div>
								<br>
								<div class="row">
									<button type="button" style="background-color:#363636; " class="btn  btn-primary btn-sm btn-block"> 개인 주소록 그룹 등록 </button>
								</div>
							</div>
						</div>
						<div class="col-md-7">
							<form method="post" action="">
							 	<table  class="table table-bordered">
							 			<tr>
							 				<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:20%"><font color="#f05050">*</font> 그룹명</th>
											<td>	<input type="text" class="form-control  input-sm" ></td>
							 			</tr>			 				
							 	</table>
							 	<div class="row text-right" style="margin-right:5px;">
							 		<input type="submit" class="btn  btn-success btn-sm" style="padding-right:15px;padding-left:15px;font-weight:600;font-size:13px" value="저장">
							 		<!-- <button type="button" class="btn  btn-default btn-sm" style="padding-right:15px;padding-left:15px;font-weight:600;font-size:13px"> 삭제 </button>	 -->
							 	</div>
							</form>
						</div>
					</div>
				</div>
				<div class="panel-footer" style="text-align: center;">&nbsp;</div>
			</div>
		</div>
	</div>
</div>
