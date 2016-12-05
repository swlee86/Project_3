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
<div class="row">
	<div class="col-lg-12">
		<div class="hpanel">
			<!-- <div class="panel-heading hbuilt">
				<div class="panel-tools">
					<a class="showhide"><i class="fa fa-chevron-up"></i></a> <a
						class="closebox"><i class="fa fa-times"></i></a>
				</div>
				<small>프로젝트 리스트</small>
			</div> -->
			<div class="panel-heading">
                <small>프로젝트 리스트</small>
            </div>
			<div class="panel-body">
				<div class="row" style="text-align:right; margin-right:5px;">
            		<div class="form-group col-md-8">
						<select class="form-control input-sm" id="ctg" onchange="selectCtg()">
							<option value="all">전체</option>
							<option value="write">내가 작성한 프로젝트</option>
							<option value="include">내가 포함된 프로젝트</option>
						</select>
					</div>		
					
					<div class="col-md-4">
	                 	<form class="form-inline" >
	                 		<select id="search_select" name="selectSearch" class="form-control input-sm" >
	                    		<option selected="selected" value="emp_name">책임자</option>
	                        	<option value="dept_name">부서</option>
	                        	<option value="pj_title">제목</option>
	                        	<option value="s.pj_step_no">진행단계</option>
	                    	</select> 	
                    		<span id= "search-input">
                     		 	  	<input type="text" class="form-control input-sm" name="input" id="input_text"/>
                    		</span>
                    		<button class="btn btn-sm btn-default" type="button" value="" onclick="searchPj()">&nbsp;<span class="fa fa-search" ></span>
                    		</button> 			 
                		</form>
                	</div>
                </div>                	
                <br> 
				
				<div class="table-responsive" id="projectList">
					<table cellpadding="1" cellspacing="1" class="table table-bordered table-striped" >
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
									<td><a href="projectDetail.do?pj_no=${list.pj_no}">${list.pj_title}</a></td>
									<td>${list.pj_content}</td>
									<td>${list.pj_start}</td>
									<td>${list.pj_end}</td>
									
									
									<td>
										<div class="progress m-t-xs full progress-striped ">
											<c:if test="${list.pj_progress!=0}">
												<div style="width:${list.pj_progress}%" aria-valuemax="100" aria-valuemin="0"
													aria-valuenow="${list.pj_progress}%" role="progressbar"
													class="progress-bar progress-bar-warning active">${list.pj_progress}%</div>
											</c:if>
										</div>
									</td>
									
									<td>
										<div style="padding-top: 10px;">
											<c:if test="${list.pj_step_name=='진행'}">
												<span class="label label-success" style="width: 60px;padding-left:15px;padding-right:15px;">진&nbsp;&nbsp;&nbsp;&nbsp;행</span>
											</c:if>
											<c:if test="${list.pj_step_name=='미진행'}">
												<span class="label label-info" style=" width: 60px;padding-left:15px;padding-right:15px;">미진행</span>
											</c:if>
											<c:if test="${list.pj_step_name=='완료'}">
												<span class="label label-default" style=" width: 60px;padding-left:15px;padding-right:15px;">완&nbsp;&nbsp;&nbsp;&nbsp;료</span>
											</c:if>
											<c:if test="${list.pj_step_name=='중단'}">
												<span class="label label-danger" style=" width: 60px;padding-left:15px;padding-right:15px;">중&nbsp;&nbsp;&nbsp;&nbsp;단</span>
											</c:if>
											<c:if test="${list.pj_step_name=='보류'}">
												<span class="label label-warning" style="width: 60px;padding-left:15px;padding-right:15px;">보&nbsp;&nbsp;&nbsp;&nbsp;류</span>
											</c:if>
										</div>
									</td>
								</tr>			
							</c:forEach>
						</tbody>
					</table>
				</div>

			</div>
			<div class="panel-footer">
				<div style="text-align:right">
					<a href="projectCalendarAll.do" class="btn btn-sm btn-success"   style="padding-right:15px;padding-left:15px;font-weight:600;font-size:13px">프로젝트 일정</a>
				</div>
			</div>
		</div>
	</div>
	</div>
</div>

<script src="vendor/jquery/dist/jquery.min.js"></script>
 <script>

 //프로젝트 리스트에서 프로젝트 카테고리(전체 / 내가쓴것 / 내가 포함된것 )변경시킬때
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
							/* $.each(data.project, function(index){
								project = data.project[index];
								console.log(index +":" +project.pj_step_name);
							}); */
		                     
							$.each(data.project, function(index){
		                           makeTable += "<tr><td>"+data.project[index].emp_name+"</td><td>"+data.project[index].dept_name +
		                           "</td><td><a href='projectDetail.do?pj_no="+data.project[index].pj_no+"'>"+data.project[index].pj_title+"</a></td><td>"+data.project[index].pj_content+
		                           "</td><td>"+data.project[index].pj_start+"</td><td>"+data.project[index].pj_end+"</td>"+
									

		                           "<td><div class='progress m-t-xs full progress-striped'>";
		                           
		                           if(data.project[index].pj_progress != 0){
			                           makeTable += "<div style='width:" + 
			                           data.project[index].pj_progress+"%' aria-valuemax='100' aria-valuemin='0'aria-valuenow='"+
			                           data.project[index].pj_progress+" role='progressbar' class='progress-bar progress-bar-warning active'>"+
			                           data.project[index].pj_progress+"%</div>";
		                           }
		                           makeTable += "</div></td><td><div style='padding-top: 10px;''>";
		                           
		                           
		                           if(data.project[index].pj_step_name == "진행"){
		                        	   makeTable += "<span class='label label-success' style='width: 60px;padding-left:15px;padding-right:15px;'>진    행</span>"
		                           } if(data.project[index].pj_step_name == "미진행"){
		                        	   makeTable += "<span class='label label-info' style='width: 60px;padding-left:15px;padding-right:15px;'>미진행</span>"
		                           } if(data.project[index].pj_step_name == "완료"){
		                        	   makeTable += "<span class='label label-default' style='width: 60px;padding-left:15px;padding-right:15px;'>완    료</span>"
		                           } if(data.project[index].pj_step_name == "중단"){
		                        	   makeTable += "<span class='label label-danger' style='width: 60px;padding-left:15px;padding-right:15px;'>중    단</span>"
		                           } if(data.project[index].pj_step_name == "보류"){
		                        	   makeTable += "<span class='label label-warning' style='width: 60px;padding-left:15px;padding-right:15px;'>보    류</span>"
		                           }

		                           makeTable += "</div></td></tr>";
		                           
		                     }); 
		                     makeTable += "</tbody></table>";
		                     $('#projectList').empty();
		                     $('#projectList').append(makeTable);
		                     
					} 
		});
	}


 //프로젝트리스트에서 검색할때
function searchPj(){

	var selectSearch = $("#search_select option:selected").val();
	var input = $("#input_text").val();
	$.ajax({
		url : "project_search_list.do",
       	data : {
       				"selectSearch" : selectSearch,
       				"input" : input,
               },
		success : function(data){
			console.log(data);
			
			
			 $('#projectList').empty();

			 var makeTable = "";

			 makeTable = 
				 "<table cellpadding='1' cellspacing='1' class='table table-bordered table-striped'><thead>"+
				 "<tr><th>책임자</th><th>부서</th><th>제목</th><th>내용</th><th>시작일</th><th>종료일</th><th>진행률</th><th>진행단계</th></tr>"+
				 "</thead><tbody>";
				 
             var project ="";
				/* $.each(data.project, function(index){
					project = data.project[index];
					console.log(index +":" +project.pj_step_name);
				}); */
                 
				$.each(data.project, function(index){
                       makeTable += "<tr><td>"+data.project[index].emp_name+"</td><td>"+data.project[index].dept_name +
                       "</td><td><a href='projectDetail.do?pj_no="+data.project[index].pj_no+"'>"+data.project[index].pj_title+"</a></td><td>"+data.project[index].pj_content+
                       "</td><td>"+data.project[index].pj_start+"</td><td>"+data.project[index].pj_end+"</td>"+
						

                       "<td><div class='progress m-t-xs full progress-striped'>";
                       
                       if(data.project[index].pj_progress != 0){
                           makeTable += "<div style='width:" + 
                           data.project[index].pj_progress+"%' aria-valuemax='100' aria-valuemin='0'aria-valuenow='"+
                           data.project[index].pj_progress+" role='progressbar' class='progress-bar progress-bar-warning active'>"+
                           data.project[index].pj_progress+"%</div>";
                       }
                       makeTable += "</div></td><td><div style='padding-top: 10px;''>";
                       
                       
                       if(data.project[index].pj_step_name == "진행"){
                    	   makeTable += "<span class='label label-success' style='width: 60px;padding-left:15px;padding-right:15px;'>진    행</span>"
                       } if(data.project[index].pj_step_name == "미진행"){
                    	   makeTable += "<span class='label label-info' style='width: 60px;padding-left:15px;padding-right:15px;'>미진행</span>"
                       } if(data.project[index].pj_step_name == "완료"){
                    	   makeTable += "<span class='label label-default' style='width: 60px;padding-left:15px;padding-right:15px;'>완    료</span>"
                       } if(data.project[index].pj_step_name == "중단"){
                    	   makeTable += "<span class='label label-danger' style='width: 60px;padding-left:15px;padding-right:15px;'>중    단</span>"
                       } if(data.project[index].pj_step_name == "보류"){
                    	   makeTable += "<span class='label label-warning' style='width: 60px;padding-left:15px;padding-right:15px;'>보    류</span>"
                       }

                       makeTable += "</div></td></tr>";
                       
                 }); 
                 makeTable += "</tbody></table>";
                 $('#projectList').empty();
                 $('#projectList').append(makeTable);
		}               
    });
}
 
 
$('#search_select').change(function(){
	console.log('select 체인지');
	if($('#search_select').val() == 's.pj_step_no'){
		$('#search-input').empty();
		$('#search-input').append('<select class="form-control input-sm" name="step_name" id="input_text">'+
														'<option value="2">미진행</option>'+
														'<option value="1">진행</option>'+
														'<option value="3">보류</option>'+
														'<option value="5">중단</option>'+
														'<option value="4">완료</option>'+
													'</select>'
													);
	}else{
		$('#search-input').empty();
		$('#search-input').append('<input type="text" class="form-control input-sm" name="input" id="input_text"/>');
	}
});
 	
</script> 