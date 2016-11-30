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
									<th width="10%">작업완료</th>
									<th width="75%">작업내용</th>
									<th width="15%">수정/수정완료</th>
									<th hidden="hidden"></th>
								</tr>
								<c:forEach var="list" items="${pjddlist}">
								<tr class="default_table">
									<td id="modify_tr_check_${list.pjdd_no}">
										<c:if test="${list.fin_check=='1'}">
											<input type="checkbox" class="icheckbox_square-green" checked="checked" disabled="disabled">
										</c:if>
										<c:if test="${list.fin_check=='0'}">
											<input type="checkbox" class="icheckbox_square-green" disabled="disabled">
										</c:if>
									</td>
									<td id="modify_td_${list.pjdd_no}">${list.pjdd_content}</td>
									<td><input type="button" class="btn btn-default" value="수정" onclick="modify_pjdd(this.id)" id="modify_btn_${list.pjdd_no}"></td>
									<td hidden="hidden"><input type="hidden"  readonly="readonly" value="${list.pjdd_no}"></td>
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

<script src="vendor/jquery/dist/jquery.min.js"></script>
<script>
$(function(){
	var index = 0;	
	$('#add_btn').click(function(){
		
		//alert(index);
		
		var appendTable="<tr class='add_table' id='add_btn_tr_"+index+"'><td><input type='checkbox' class='icheckbox_square-green'></td>"+
						"<td><input type='text' class='form-control input-sm' id='add_txt_"+index+"'></td>"+
						"<td><input type='button' class='btn btn-default add_btn' id='add_btn_"+index+"' onclick='addclick(this.id)' value='추가완료'></td>"+
						"<td hidden='hidden'><input type='hidden'  readonly='readonly'></td></tr>";
		console.log($('#add_btn').val());
		$('#pjdd_table').last().append(appendTable);
		
		index = index+1;
	});


	
	
})
//추가완료 버튼 눌렀을때
function addclick(id){
	var add_i = id.substr(8);
	var add_content = $('#add_txt_'+add_i).val();
	var pjd_no = ${pjd_no};
	//ajax통해서 add_conctetn를 추가시킴
		
	// 추가후 리스트 동기화
	if(add_content!=""){
	$.ajax(
				{
					url  : "insert_pjdd.do",
					data : {
						"pjd_no" :  pjd_no,
						"pjdd_content" : add_content,
					},
					success : function(data){
						console.log(data);
					
							
						$.ajax(
								{
									url : "updatepjddtable.do",
									data :{
										"pjd_no" : pjd_no,	
									},
									success : function(data){
										console.log(data.data);
										var appendTable ="";
										var pjdd = "";
							            $.each(data, function(index){
							            	pjdd = data[index];
							                console.log(pjdd);
							            });
							               
							            $.each(pjdd, function(index){
											appendTable+="<tr class='default_table'><td id='modify_tr_check_"+pjdd[index].pjdd_no+"'>";
											if(pjdd[index].fin_check=='1'){
												appendTable+="<input type='checkbox' class='icheckbox_square-green' checked='checked' disabled='disabled'>";
											}else if(pjdd[index].fin_check=='0'){
												appendTable+="<input type='checkbox' class='icheckbox_square-green' disabled='disabled'>";
											}
											appendTable+="</td><td id='modify_td_"+pjdd[index].pjdd_no+"'>"+pjdd[index].pjdd_content+"</td>"+
														 "<td><input type='button' class='btn btn-default' value='수정' onclick='modify_pjdd(this.id)' id='modify_btn_"+pjdd[index].pjdd_no+"'></td>"+
														 "<td hidden='hidden'><input type='hidden'  readonly='readonly' value='"+pjdd[index].pjdd_no+"'></td></tr>";
											
										});
							            
										$('.default_table').remove();
										$('#add_btn_tr_'+add_i).remove();
											
										$('#pjdd_table').first().append(appendTable);
									}
										
								});
							
					}
				}
		);
	

		///체크개수구하기(진행률)
		var checked_count = $('input:checkbox:checked').length;
		var progress = 0 ;
		if(checked_count!=0){
			//alert("개수 "+ checked_count);
			var checkbox_count = $('input:checkbox').length;
			//alert('총개수'+ checkbox_count);
			progress = (checked_count/checkbox_count)*100;
				
		}
		progress = Math.floor(progress);	
		console.log("pjd_no:>"+pjd_no+"<  pjd_progress:>"+progress+"<");
		
		var pjd_no = ${pjd_no};
	 	$.ajax(
				{
					url  : "update_pjdprogress.do",
					data : {
						"pjd_no" : pjd_no,
						"pjd_progress" : progress,
					},
					success : function(data){
						console.log(data);
					}
				}
		); 
	}else{
		alert("작업내용을 입력하세요");
	}
}

function modify_pjdd(id){
	
	var modify_i = id.substr(11);
	
	var val = $('#modify_btn_'+modify_i).val();
	val = $.trim(val);
	
	var checked = $('#modify_tr_check_'+modify_i).children(".icheckbox_square-green").prop("checked");
	console.log("체크여부 : " + checked);
	
	if(checked=="undefined"){
		checked="false";
	}

	
	if(val=="수정"){
		$('#modify_btn_'+modify_i).val("수정완료");
		if(checked!=true){
			$('#modify_tr_check_'+modify_i).children(".icheckbox_square-green").prop("disabled",false);
		}
		var content = $('#modify_td_'+modify_i).html();
		console.log("content : " + content);
		
		$('#modify_td_'+modify_i).empty();
		
		var appnedtd ="";
		appnedtd = "<input type='text' class='form-control input-sm' value='"+content+"'>";
		$('#modify_td_'+modify_i).append(appnedtd);

		
	}
	if(val=="수정완료"){
		$('#modify_btn_'+modify_i).val("수정");
		
		$('#modify_tr_check_'+modify_i).children(".icheckbox_square-green").prop("disabled",true);
		
		var content = $('#modify_td_'+modify_i).children().val();
		console.log("content : " + content);
		
		$('#modify_td_'+modify_i).empty();
		
		var appnedtd ="";
		appnedtd = "<input type='text' class='form-control input-sm' value='"+content+"'>";
		$('#modify_td_'+modify_i).html(content);
		
		
		
		///체크개수구하기(진행률)
		var pjd_no = ${pjd_no};
		var checked_count = $('input:checkbox:checked').length;
		var progress = 0 ;
		if(checked_count!=0){
			//alert("개수 "+ checked_count);
			var checkbox_count = $('input:checkbox').length;
			//alert('총개수'+ checkbox_count);
			progress = (checked_count/checkbox_count)*100;
				
		}
		progress = Math.floor(progress);
		
		console.log("pjd_no:>"+pjd_no+"<  pjd_progress:>"+progress+"<");
		//alert(progress);
		var pjd_no = ${pjd_no};
	 	$.ajax(
				{
					url  : "update_pjdprogress.do",
					data : {
						"pjd_no" : pjd_no,
						"pjd_progress" : progress,
					},
					success : function(data){
						console.log(data);
					}
				}
		); 
		
		
		
		var fin_check_b= $('#modify_tr_check_'+modify_i).children(".icheckbox_square-green").prop("checked");
		var fin_check=0;
		if(fin_check_b==true){
			fin_check=1;
		}else if(fin_check_b==false){
			fin_check=0;
		}
		$.ajax(
				{
					url  : "update_pjdd.do",
					data : {
						"pjdd_no" : modify_i,	
						"pjdd_content" : content,
						"fin_check" : fin_check,
					},
					success : function(data){
						
					}
				}
		);
		
	}
	
}

</script>