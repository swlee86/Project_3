<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
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
			<h2 class="font-light m-b-xs">프로젝트 상세보기</h2>
			<small>프로젝트 진척률을 확인하세요</small>
		</div>
	</div>
</div>
<div class="content animate-panel">
	<div class="row">
		<div class="col-lg-4">
			<c:forEach var="list" items="${peoplelist}">
				<div class="hpanel" style="background-color: white; padding: 20px;">
					<div class="pandel-body text-center">
						<img alt="logo" class="img-circle img-small" src="${pageContext.request.contextPath}/img/upload/${list.pic}">
						<div class="m-t-sm">
							<strong>${list.emp_name}</strong>
						<p class="small">${list.branch_name} ${list.dept_name} ${list.low_dept_name}</p>
					</div>
					</div>
				</div>
			
			</c:forEach>
		</div>

		<div class="col-lg-8">
			<div class="hpanel">
				<div class="panel-body">
					<div class="table-responsive">
						<table  cellpadding="1" cellspacing="1" class="table table-bordered "  style="margin-bottom:0px;">
							<tr>
								<th style="background-color:#f5f5f5; text-align:center;padding-right:10px; width:20%">상세 프로젝트 제목</th>
                              	<td colspan="3" id="pjd_name">${pjd.pjd_title}</td>
							</tr>
							<tr>
								<th style="background-color:#f5f5f5; text-align:center;padding-right:10px; width:20%">시작일</th>
	                        	<td id="pjd_start">${pjd.pjd_start}</td>
	                        	<th style="background-color:#f5f5f5; text-align:center;padding-right:10px; width:20%">종료일</th>
	                       		<td id="pjd_end">${pjd.pjd_end}</td>
                           	</tr> 
							<tr>
								<th style="background-color:#f5f5f5; text-align:center;padding-right:10px; width:20%">상세 프로젝트 내용</th>
                              	<td colspan="3"id="pjd_content">${pjd.pjd_content}</td> 
							</tr>
						</table>
					
					</div>
				
					</br>
					</br>
				
					<div class="table-responsive">
						<div class="table-responsive">
							<table class="table table-bordered table-striped" id="pjdd_table">
								<tr>
									<th width="10%">완료</th>
									<th width="80%">작업내용</th>
									<th width="10%"></th>
									<th hidden="hidden"></th>
								</tr>
								<c:forEach var="list" items="${pjddlist}" step="1">
								<tr>
									<td><input type="checkbox" class="i-checks"></td>
									<td>테스트</td>
									<td><input type="button" class="btn btn-default" value="수정"></td>
									<td hidden="hidden"><input type="hidden"  readonly="readonly"></td>
								</tr>
								</c:forEach>
							</table>
							
							<div class="col-md-offset-11 col-md-1">
								<input type="button" id="add_btn" class="btn btn-success" value="추가" >
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!--이미지 클릭시 뜨는 모달 페이지-->
<div class="modal fade hmodal-success" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog  modal-sm">
		<div class="modal-content">
			<div class="color-line"></div>
			<div class="modal-header text-center">
		 	<h4 class="modal-title"><img alt="logo" class="img-circle m-b" src="images/a3.jpg" style="width: 82px;height: 82px;"></h4> <br>
				<font class="font-bold" size="2em">
					<font style="color:gray;">박성준</font><br>
					<font style="color:#9d9fa2">(사단)한국소프트웨어기술진흥협회 > <br>개발부 > 팀장</font> <br>
					<font style="color:gray;">01020768626</font>
				</font>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default btn-sm" data-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary btn-sm demo2">주소록 등록</button>
			</div>
		</div>
	</div>
</div>
<script src="vendor/jquery/dist/jquery.min.js"></script>
<script>
$(function(){
	
	$('#add_btn').click(function(){ 
	
		alert('들어옴2');
		var appendTable="<tr><td><input type='checkbox' class='i-checks'></td><td>테스트</td>"+
			"<td><input type='button' class='btn btn-default' value='수정'></td>"+
			"<td hidden='hidden'><input type='hidden'  readonly='readonly'></td></tr>";
		console.log($('#add_btn').val());
		$('#pjdd_table').last().append(appendTable);
		
		//appendTable = "<"
	});

})

</script>