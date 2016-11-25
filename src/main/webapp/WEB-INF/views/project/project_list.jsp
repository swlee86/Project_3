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
					<li><a href="index.do">홈</a></li>
					<li><span>프로젝트 관리</span></li>
					<li><a href="project_list.do">전체 프로젝트</a></li>
				</ol>
			</div>
			<h2 class="font-light m-b-xs">전체 프로젝트</h2>
			<small>다른팀에서 진행중인 프로젝트까지 확인할 수 있습니다</small>
		</div>
	</div>
</div>

<div class="content animate-panel">

	<div class="col-lg-12">
		<div class="hpanel">
			<div class="panel-heading hbuilt">
				<div class="panel-tools">
					<a class="showhide"><i class="fa fa-chevron-up"></i></a> <a
						class="closebox"><i class="fa fa-times"></i></a>
				</div>
				<small>프로젝트 리스트</small>
			</div>
			<div class="panel-body">
				<div class="form-group">
					<select class="form-control" id="ctg" onchange="selectCtg()">
						<option value="all">전체</option>
						<option value="write">내가 작성한 프로젝트</option>
						<option value="include">내가 포함된 프로젝트</option>
					</select>
				</div>
				<div class="table-responsive" id="projectList">
					<table cellpadding="1" cellspacing="1" class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>책임자</th>
								<th>부서</th>
								<th>제목</th>
								<th>내용</th>
								<th>시작일</th>
								<th>종료일</th>
								<th>진행률</th>
								<th>진행단계</th>
							</tr>
						<tbody>
							<c:forEach  var="list" items="${pjlist}">
								<tr>
									<td>${list.emp_name}</td>
									<td>${list.dept_name}</td>
									<td>${list.pj_title}</td>
									<td>${list.pj_content}</td>
									<td>${list.pj_start}</td>
									<td>${list.pj_end}</td>
									
									
									<td>
										<div class="progress m-t-xs full progress-striped ">
											<div style="width:${list.pj_progress}%" aria-valuemax="100" aria-valuemin="0"
												aria-valuenow="${list.pj_progress}%" role="progressbar"
												class="progress-bar progress-bar-warning active">${list.pj_progress}%</div>
										</div>
									</td>
									
									<td>
										<c:if test="${list.pj_step_name=='진행'}">
											<span class="label label-success" style="margin-top: -5px; width: 20%;padding-left:15px;padding-right:15px;">진행</span>
										</c:if>
										<c:if test="${list.pj_step_name=='미진행'}">
											<span class="label label-primary" style="margin-top: -5px; width: 20%;padding-left:15px;padding-right:15px;">미진행</span>
										</c:if>
										<c:if test="${list.pj_step_name=='완료'}">
											<span class="label label-default" style="margin-top: -5px; width: 20%;padding-left:15px;padding-right:15px;">완료</span>
										</c:if>
										<c:if test="${list.pj_step_name=='중단'}">
											<span class="label label-danger" style="margin-top: -5px; width: 20%;padding-left:15px;padding-right:15px;">중단</span>
										</c:if>
										<c:if test="${list.pj_step_name=='보류'}">
											<span class="label label-warning" style="margin-top: -5px; width: 20%;padding-left:15px;padding-right:15px;">보류</span>
										</c:if>
									</td>
								</tr>			
							</c:forEach>
						</tbody>
					</table>
				</div>

			</div>
			<div class="panel-footer">
			<div style="text-align:right">
				<input type="button" class="btn btn-sm btn-success" value="프로젝트 작성" id="makeProjectBtn" style="padding-right:15px;padding-left:15px;font-weight:600;font-size:13px">
			</div>
			</div>
		</div>
	</div>
</div>



<script src="vendor/jquery/dist/jquery.min.js"></script>
<script>
function selectCtg(){
	
	var makeTable = "";

	 makeTable = 
		 "<table cellpadding='1' cellspacing='1' class='table table-bordered table-striped'><thead>"+
		 "<tr><th>책임자</th><th>부서</th><th>제목</th><th>내용</th><th>시작일</th><th>종료일</th><th>진행률</th><th>진행단계</th></tr>"+
		 "</thead><tbody>";
		 
	var select_ctg = document.getElementById("ctg").value;
		$.ajax({
					url : "select_pjlist.do",
	               	data : {
	            	   		select_ctg : select_ctg,
			               },
					success : function(data){
						
						//console.log(data);
	                     $('#projectList').empty();

	                     var project ="";
							$.each(data.project, function(index){
								project = data.project[index];
								console.log(index +":" +project.pj_step_name);
							});
		                     
							$.each(data.project, function(index){
		                           makeTable += "<tr><td>"+data.project[index].emp_name+"</td><td>"+data.project[index].dept_name +
		                           "</td><td>"+data.project[index].pj_title+"</td><td>"+data.project[index].pj_content+
		                           "</td><td>"+data.project[index].pj_start+"</td><td>"+data.project[index].pj_end+"</td>"+
		      
		                           "<td><div class='progress m-t-xs full progress-striped'><div style='width:" + 
		                           data.project[index].pj_progress+"%' aria-valuemax='100' aria-valuemin='0'aria-valuenow='"+
		                           data.project[index].pj_progress+" role='progressbar' class='progress-bar progress-bar-warning active'>"+
		                           data.project[index].pj_progress+"%</div></div></td><td>";
		                           
		                           
		                           if(data.project[index].pj_step_name == "진행"){
		                        	   makeTable += "<span class='label label-success' style='margin-top: -5px; width: 20%;padding-left:15px;padding-right:15px;'>진행</span>"
		                           } if(data.project[index].pj_step_name == "미진행"){
		                        	   makeTable += "<span class='label label-primary' style='margin-top: -5px; width: 20%;padding-left:15px;padding-right:15px;'>미진행</span>"
		                           } if(data.project[index].pj_step_name == "완료"){
		                        	   makeTable += "<span class='label label-default' style='margin-top: -5px; width: 20%;padding-left:15px;padding-right:15px;'>완료</span>"
		                           } if(data.project[index].pj_step_name == "중단"){
		                        	   makeTable += "<span class='label label-danger' style='margin-top: -5px; width: 20%;padding-left:15px;padding-right:15px;'>중단</span>"
		                           } if(data.project[index].pj_step_name == "보류"){
		                        	   makeTable += "<span class='label label-danger' style='margin-top: -5px; width: 20%;padding-left:15px;padding-right:15px;'>보류</span>"
		                           }

		                           makeTable += "</td></tr>";
		                           
		                     }); 
		                     makeTable += "</tbody></table>";
		                     $('#projectList').empty();
		                     $('#projectList').append(makeTable);
		                     
					} 
		});
	}

</script>