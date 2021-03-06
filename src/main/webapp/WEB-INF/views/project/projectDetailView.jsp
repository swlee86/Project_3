<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>
<!--  
	작성자	: 김주희
	작성일	: 2016-11-18
	목 적  	: 프로젝트 상세의 상세 보기 view
-->	
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
					<li><a href="project_list.do">전체 프로젝트</a></li>
					<li><a href="projectDetail.do?pj_no=${pjd.pj_no}">상세 프로젝트</a></li>
					<li><a href="#">상세프로젝트의 상세보기 </a> </li>
				</ol>
			</div>
			<h2 class="font-light m-b-xs">상세프로젝트의  상세보기 &nbsp;<a href="javascript:history.back()" ><i class="pe-7s-back text-info"></i></a></h2>
			<small>진행 중인 상세 프로젝트 내용을 확인하실 수 있습니다</small>
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
						<div align="right">
							<p>
								<i class="pe-7s-pen"></i>
								진행단계수정/내용수정은 책임자에게 문의하세요
							</p>
						</div>
						<table  id="pjd_detail_table" cellpadding="1" cellspacing="1" class="table table-bordered "  style="margin-bottom:0px;">
							<tr>
								<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:15%">상세 프로젝트<br> 제목</th>
                              	<td id="pjd_name" width="35%">
                              		<input type="text" class="form-control table-input input-sm" id="pjd_title" value="${pjd.pjd_title}" disabled="disabled" style="border: 0px; background-color: white;">
                              	</td>
                              	<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:15%">진행 단계</th>
                              	<td id="pjd_step" width="35%">
		                        	<div class="form-group">
				    	            	<select class="form-control input-sm table-input input-sm" id="step_no" disabled="disabled">	
				    	            		<c:forEach var="s" items="${pj_step_list}">
				    	            		   <option value="${s.pj_step_no}" ${pjd.pj_step_name == s.pj_step_name ? 'selected="selected"' : ''}>${s.pj_step_name}</option>
				    	          			</c:forEach>
						                </select>
						            </div> 
                              	</td>
							</tr>
							<tr>
								<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:15%">시작일</th>
	                        	<td>
	                        		<div class="form-inline">
	                        			<div class="input-group date">
    		  								<input type="text" class="form-control table-input input-sm formstartDate_detail" id="pjd_start" name="input" value="${pjd.pjd_start}" disabled="disabled" style="background-color: white;">
    		 									<span class="input-group-addon" style="color:#fd7d86"><i class="fa fa-calendar"></i></span>
    		 							</div>
    		 						</div>
	                        	</td>
	                        	<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:15%">종료일</th>
	                       		<td>	                       		
	                       			<div class="form-inline">
	                        			<div class="input-group date">
	                        			<c:choose>
	                        				<c:when test="${today>pjd.pjd_end}">
    		  								<input type="text" class="form-control table-input input-sm formendDate_detail" id="pjd_end" name="input" value="${pjd.pjd_end}" disabled="disabled" style="background-color: white; color: red">
    		 								</c:when>
    		 								<c:otherwise>
    		 								<input type="text" class="form-control table-input input-sm formendDate_detail" id="pjd_end" name="input" value="${pjd.pjd_end}" disabled="disabled" style="background-color: white; color: blue">
    		 								</c:otherwise>
    		 							</c:choose>	
    		 								<span class="input-group-addon" style="color:#fd7d86"><i class="fa fa-calendar"></i></span>
    		 							</div>
    		 						</div>
	                       		
	                       		</td>
                           	</tr> 
							<tr>
								<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:15%">상세 프로젝트<br> 내용</th>
                              	<td colspan="3">
                              		<textarea class="form-control table-input" id="pjd_content"  disabled="disabled" style="resize:none; border: 0px; background-color: white;" rows="5">${pjd.pjd_content}</textarea>
							</tr>
						</table>
						</br>
						<div align="right">
							<c:if test="${pj_emp_no==login_emp_no}">
								<input type="button" id="modify_pjd_btn" class="btn btn-primary2 btn-md" value="수정" onclick="modify_pjd()">
							</c:if>
						</div>
						
					</div>
				
					</br>
					</br>
				
					<div class="">
							<table class="table table-bordered table-striped" id="pjdd_table">
								<tr>
									<th width="10%" style="text-align: center;">작업완료</th>
									<th width="75%">작업내용</th>
									<c:if test="${pj_emp_no==login_emp_no}">
										<th width="15%"  style="text-align: center;">수정</th>
									</c:if>
									<th hidden="hidden"></th>
								</tr>
								<c:forEach var="list" items="${pjddlist}">
								<tr class="default_table">
									<td id="modify_tr_check_${list.pjdd_no}" align="center">
										<c:if test="${list.fin_check=='1'}">
											<input type="checkbox" class="icheckbox_square-green" checked="checked" disabled="disabled">
										</c:if>
										<c:if test="${list.fin_check=='0'}">
											<input type="checkbox" class="icheckbox_square-green" disabled="disabled">
										</c:if>
									</td>
									<td id="modify_td_${list.pjdd_no}">${list.pjdd_content}</td>
									<c:if test="${pj_emp_no==login_emp_no}">
										<td align="center"><input type="button" class="btn btn-primary2" value="수정" onclick="modify_pjdd(this.id)" id="modify_btn_${list.pjdd_no}"></td>
									</c:if>
									<td hidden="hidden"><input type="hidden"  readonly="readonly" value="${list.pjdd_no}"></td>
								</tr>
								</c:forEach>
							</table>
							
							<div align="right" ><!--class="col-md-offset-11 col-md-1" -->
								<c:if test="${pj_emp_no==login_emp_no}">
									<input type="button" id="add_btn" class="btn btn-success" value="추가" >
								</c:if>
							</div>
							
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="vendor/toastr/build/toastr.min.js"></script>
 <link rel="stylesheet" href="vendor/toastr/build/toastr.min.css" />
<script src="vendor/jquery/dist/jquery.min.js"></script>

<!-- sweetalert -->
<link rel="stylesheet" href="vendor/sweetalert/lib/sweet-alert.css" />
<script src="vendor/sweetalert/lib/sweet-alert.min.js"></script>

<script>
$(function(){
	var index = 0;	
	
	//추가버튼누를때
	$('#add_btn').click(function(){
		
		var appendTable="<tr class='add_table' id='add_btn_tr_"+index+"'><td align='center'><input type='checkbox' class='icheckbox_square-green'></td>"+
						"<td><input type='text' class='form-control input-sm' id='add_txt_"+index+"'></td>"+
						"<td align='center'><input type='button' class='btn btn-info add_btn' id='add_btn_"+index+"' onclick='addclick(this.id)' value='추가완료'></td>"+
						"<td hidden='hidden'><input type='hidden'  readonly='readonly'></td></tr>";
		console.log($('#add_btn').val());
		$('#pjdd_table').last().append(appendTable);
		
		index = index+1;
	});

	
	
	//alert창
	toastr.options = {	 
			 "closeButton": true,
			  "debug": false,
			  "newestOnTop": false,
			  "progressBar": false,
			  "positionClass": "toast-top-center",
			  "preventDuplicates": false,
			  "onclick": null,
			  "showDuration": "300",
			  "hideDuration": "1000",
			  "timeOut": "5000",
			  "extendedTimeOut": "1000",
			  "showEasing": "swing",
			  "hideEasing": "linear",
			  "showMethod": "fadeIn",
			  "hideMethod": "fadeOut"
	        };
	 

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
					
						$.ajax(
								{
									url : "updatepjddtable.do",
									data :{
										"pjd_no" : pjd_no,	
									},
									success : function(data){
										var appendTable ="";
										var pjdd = "";
							            $.each(data, function(index){
							            	pjdd = data[index];
							          
							            });
							               
							            $.each(pjdd, function(index){
											appendTable+="<tr class='default_table'><td align='center' id='modify_tr_check_"+pjdd[index].pjdd_no+"'>";
											if(pjdd[index].fin_check=='1'){
												appendTable+="<input type='checkbox' class='icheckbox_square-green' checked='checked' disabled='disabled'>";
											}else if(pjdd[index].fin_check=='0'){
												appendTable+="<input type='checkbox' class='icheckbox_square-green' disabled='disabled'>";
											}
											appendTable+="</td><td id='modify_td_"+pjdd[index].pjdd_no+"'>"+pjdd[index].pjdd_content+"</td>"+
														 "<td align='center'><input type='button' class='btn btn-primary2' value='수정' onclick='modify_pjdd(this.id)' id='modify_btn_"+pjdd[index].pjdd_no+"'></td>"+
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
		
		var pjd_no = ${pjd_no};
	 	$.ajax(
				{
					url  : "update_pjdprogress.do",
					data : {
						"pjd_no" : pjd_no,
						"pjd_progress" : progress,
					},
					success : function(data){
					
					}
				}
		); 
	}else{
		
		toastr.warning('작업내용을 입력하세요');
		$('#add_txt_'+add_i).focus();
	}
}

//프로젝트 상세의 상세내용 수정
function modify_pjdd(id){
	
	var modify_i = id.substr(11);
	
	var val = $('#modify_btn_'+modify_i).val();
	val = $.trim(val);
	
	var checked = $('#modify_tr_check_'+modify_i).children(".icheckbox_square-green").prop("checked");
	
	if(checked=="undefined"){
		checked="false";
	}

	
	if(val=="수정"){
		$('#modify_btn_'+modify_i).val("수정완료");
		$('#modify_btn_'+modify_i).attr('class','btn btn-md btn-warning');
		if(checked!=true){
			$('#modify_tr_check_'+modify_i).children(".icheckbox_square-green").prop("disabled",false);
		}
		var content = $('#modify_td_'+modify_i).html();
		
		$('#modify_td_'+modify_i).empty();
		
		var appnedtd ="";
		appnedtd = "<input type='text' class='form-control input-sm' value='"+content+"'>";
		$('#modify_td_'+modify_i).append(appnedtd);
	
	}
	if(val=="수정완료"){
		$('#modify_btn_'+modify_i).val("수정");
		$('#modify_btn_'+modify_i).attr('class','btn btn-md btn-primary2');
		$('#modify_tr_check_'+modify_i).children(".icheckbox_square-green").prop("disabled",true);
		
		var content = $('#modify_td_'+modify_i).children().val();

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


//프로젝트 상세의 내용 수정
function modify_pjd(){
	
	if($('#modify_pjd_btn').val()=="수정"){
		$('.table-input').attr('disabled',false);
		$('#modify_pjd_btn').attr('class','btn btn-md btn-warning');
		$('#modify_pjd_btn').val("수정완료");
	}
	
	else if($('#modify_pjd_btn').val()=="수정완료"){
		
		var pjd_no = ${pjd_no};
		var pjd_title = $('#pjd_title').val();
		var pjd_content = $('#pjd_content').val();
		var pj_step_no = $("#step_no > option:selected").val();
		var pjd_start =$('#pjd_start').val();
		var pjd_end = $('#pjd_end').val();
		
		
		if($('#pjd_title').val() ==""){
			toastr.warning('제목을 입력해 주세요');
			$('#pjd_title').focus();
			return false;
		}
		if($('#pjd_start').val() ==""){
			toastr.warning('시작일을 선택해 주세요');
			$('#pjd_start').focus();
			return false;
		}
		if($('#pjd_end').val() =="" ){
			toastr.warning('종료일을 선택해 주세요');
			$('#pjd_end').focus();
			return false;
		}
		if($('#pjd_content').val() ==""){
			toastr.warning('내용을 입력해 주세요');
			$('#pjd_content').focus();
			return false;
		}
		

	 	$.ajax(
				{
					url  : "updatePjd.do",
					data : {
						"pjd_no" : pjd_no,
						"pjd_title" : pjd_title,
						"pjd_content" : pjd_content,
						"pj_step_no" : pj_step_no,
						"pjd_start" : pjd_start,
						"pjd_end" :pjd_end,
					},
					success : function(data){
						
						if(data.result==9999){
							swal({
		                         title: "",
		                         text: "상세내역을입력하세요.",
		                         type: "warning"
		                     });					
						}else if(data.result==8888){
							swal({
		                         title: "",
		                         text: "상세내역이 완료되지않았습니다.",
		                         type: "warning"
		                     });					
						}else if(data.result==1){
							swal({
		                         title: "",
		                         text: "수정 완료되었습니다.",
		                         type: "success"
		                     });
							
							$('.table-input').attr('disabled',true);
							$('#modify_pjd_btn').val("수정");
							$('#modify_pjd_btn').attr('class','btn btn-md btn-primary2');
						}
						
						//전체 프로젝트의 진행상황도 업데이트 시켜줘야함
						$.ajax(
								{
									url : "updatePj_step_state.do",
									data : {
										"pjd_no" : pjd_no,
									},
									success : function(data) {
										
									}
							
							
						});
					}
				}
		);		
		
		

	}
}
</script>

<script>
//프로젝트 시작일
$(function(){
	var pj_start ='${pj_date.pj_start}';
	var pj_end = '${pj_date.pj_end}';
	 
	$('.formstartDate_detail').datepicker({
		changeMonth: true, 
	    dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
	    dayNamesMin: ['일','월', '화', '수', '목', '금', '토'], 
	    monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    dateFormat: 'yy-mm-dd',
		changeYear: true,
		beforeShowDay: function(date){
			var loadDt1 = pj_start;
	 		var loadDt = pj_end;
	      	   
			var dayday1  = new Date(Date.parse(loadDt1) - 1 * 1000 * 60 * 60 * 24); // 시작일 
			var dayday =new Date(loadDt);  //종료일
	              
			if(date > dayday || date < dayday1) return [false];  //선택못해
	        return [true];
	        },
	        onSelect: function(selected) {
	            $('.formendDate_detail').datepicker("option","minDate", selected)
	        }
	});   
	
	
	$('.formendDate_detail').datepicker({
	     changeMonth: true, 
	      dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
	      dayNamesMin: ['일','월', '화', '수', '목', '금', '토'], 
	      monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	      monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	      dateFormat: 'yy-mm-dd',
	      changeYear: true,
	      beforeShowDay: function(date){
	    	  var loadDt1 = pj_start;
	    	  var loadDt = pj_end;
	    	  
	    	  var dayday1  = new Date(Date.parse(loadDt1) - 1 * 1000 * 60 * 60 * 24); // 시작일 
	          var dayday =new Date(loadDt);  //종료일
	           
	          if(date > dayday || date < dayday1) return [false];  //선택못해
	          return [true];   
	       }, 
	       onSelect: function(selected) {
	          $('.formstartDate_detail').datepicker("option","maxDate", selected)
	      }
	});
});  
</script>