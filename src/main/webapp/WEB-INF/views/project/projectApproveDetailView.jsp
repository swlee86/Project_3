<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
$(function(){
	 $('.padv_alert').click(function () {
		var padv_alert_val = $(this).attr('value');
		console.log(padv_alert_val);
		var step_no = 0;
		if(padv_alert_val == '승인'){
			step_no = 1;
		}else if(padv_alert_val == '승인거부'){
			step_no = 2;
		}else{
			step_no = 3;
		}
		console.log("step_no : " + step_no);
		var pj_no = "${pj.pj_no}";
		console.log(pj_no);
         swal({
                     title: " '"+padv_alert_val+"' 처리하시겠습니까?",
                     text: "확인을 누르시면 정상적으로  "+ padv_alert_val +" 처리 됩니다",
                     type: "warning",
                     showCancelButton: true,
                     confirmButtonColor: "#DD6B55",
                     confirmButtonText: "확인",
                     cancelButtonText: "취소",
                     closeOnConfirm: false,
                     closeOnCancel: false },
                 function (isConfirm) {
                     if (isConfirm) {
                    	  $.ajax(
          					   {
          							url : "project_approve_try.do",
          							type: "post",
          							data : {
          									pj_no : pj_no,
          									step_no : step_no
          							       },
          							success : function(data){
          								console.log(data);
          								console.log(data.step_no);
          								if(data.step_no == 1){ //승인처리시
          									$('#pj_step_no_mark').html('<button class="btn btn-xs btn-info" disabled>승인</button>');
          									$('#pj_step_no_btn_div').hide();
          								}else if(data.step_no == 2){ 
          									$('#pj_step_no_mark').html('<button class="btn btn-xs btn-danger" disabled>승인거부</button>');
          									$('#pj_step_no_btn_approval').attr('disabled',false);
          									$('#pj_step_no_btn_no_approval').attr('disabled',true);
          									$('#pj_step_no_btn_wait').attr('disabled',false);
          								}else if(data.step_no == 3){
          									$('#pj_step_no_mark').html('<button class="btn btn-xs btn-primary2" disabled>보류</button>');
          									$('#pj_step_no_btn_approval').attr('disabled',false);
          									$('#pj_step_no_btn_no_approval').attr('disabled',false);
          									$('#pj_step_no_btn_wait').attr('disabled',true);
          								}
          							}
          			           }
          			      ); 
                         swal("성공", padv_alert_val+" 처리되었습니다.", "success");
                     } else {
                         swal("취소", "취소 되었습니다.", "error");
                     }
                 });
     });
});

</script>
<!--프로젝트 승인클릭 시 뜨는 상세 페이지-->
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
					<li><a href="index.do">Home</a></li>
					<li><span>Project</span></li>
					<li class="active"><span>ProjectApprovalDetail</span></li>
				</ol>
			</div>
			<h2 class="font-light m-b-xs">프로젝트 승인 처리</h2>
			<small>프로젝트 승인 처리 상세 페이지 입니다.</small>
		</div>
	</div>
</div>


<div class="content animate-panel">
<div class="row">
    <div class="col-lg-5">
        <div class="hpanel hgreen">
            <div class="panel-body">
                <h3><b>Title.</b> ${pj.pj_title}
                	<span id="pj_step_no_mark">
                		<c:choose> 
                					<c:when test="${pj.step_no == '1'}">
	                        			<button class="btn btn-xs btn-info" disabled>승인</button>
	                        		</c:when>
	                        		<c:when test="${pj.step_no == '2'}">
	                        			<button class="btn btn-xs btn-danger" disabled>승인거부</button>
	                        		</c:when>
	                        		<c:when test="${pj.step_no == '3'}">
	                        			<button class="btn btn-xs btn-primary2" disabled>보류</button>
	                        		</c:when>
	                        		<c:when test="${pj.step_no == '4'}">
	                        			<button class="btn btn-xs btn-warning2" disabled>미승인</button>
	                        		</c:when>
	                        	</c:choose> 
					</span>
				</h3>
                <dl>
                    <dt>Writer. ${pj.emp_name}</dt>
                    <dd><i class="pe-7s-date" style="font-size:2em"></i> &nbsp;${pj.pj_start}&nbsp;&nbsp;~&nbsp;&nbsp;${pj.pj_end}</dd>
                </dl>
              
                <p>
                  ${pj.pj_content}
                </p>
            </div>
            <div id="pj_step_no_btn_div">
            <c:if test="${pj.step_no != '1'}">
            <div class="panel-body">  
            	<div class="row" style="text-align:center"  >
	            	<button class="btn btn-md btn-info padv_alert" id="pj_step_no_btn_approval" value="승인" style="padding-right: 15px; padding-left: 15px; font-weight: bold; font-size: 13px;">&nbsp;&nbsp;&nbsp;승&nbsp;&nbsp;인&nbsp;&nbsp;&nbsp;</button>&nbsp;&nbsp;
	               	<button class="btn btn-md btn-danger padv_alert" id="pj_step_no_btn_no_approval" value="승인거부" <c:if test="${pj.step_no == '2'}">disabled</c:if> style="padding-right: 15px; padding-left: 15px; font-weight: bold; font-size: 13px;">승인거부</button>&nbsp;&nbsp;
	               	<button class="btn btn-md btn-primary2 padv_alert" id="pj_step_no_btn_wait" value="보류" <c:if test="${pj.step_no == '3'}">disabled</c:if> style="padding-right: 15px; padding-left: 15px; font-weight: bold; font-size: 13px;">&nbsp;&nbsp;&nbsp;보&nbsp;&nbsp;류&nbsp;&nbsp;&nbsp;</button>
               	</div>
            </div>
            </c:if>
            </div>
            
             <div class="panel-body">  
             <div class="pull-right">
               		<a href="projectApprove.do" class="btn btn-success btn-sm" style="padding-right: 15px; padding-left: 15px; font-weight: bold; font-size: 13px;">목록으로</a>
               	</div>
             </div>
        </div>
    </div>
    
    <div class="col-lg-7">
        <div class="hpanel">
            <div class="hpanel">
   			<c:set var="tabcount" value="1"/>
            <ul class="nav nav-tabs">
            	<c:forEach begin="1" end="${listsize}" var="i">
            		<li class="<c:if test="${tabcount==i}">active</c:if>"><a data-toggle="tab" href="#tab-${i}">상세프로젝트 - ${i}</a></li>
            	</c:forEach> 
            </ul>
            
         
            
            <div class="tab-content">  
           	 	<c:forEach items="${list}" var="list">
	                <div id="tab-${tabcount}" class="tab-pane <c:if test="${tabcount==1}">active</c:if>"> 
	                
	                    <div class="panel-body ">
	                            <table class="table table-bordered" class="table table-bordered" style="margin-bottom: 0px">    
	                                <tr>
	                                    <th  style="background-color: #f9fafc; text-align: right; padding-right: 10px; width: 10%">상세제목</th>
	                                   	<td>${list.pjd_title}</td>
	                                   	<th  style="background-color: #f9fafc; text-align: right; padding-right: 10px; width: 10%">기간</th>
	                                    <td>${list.pjd_start}&nbsp;&nbsp;~&nbsp;&nbsp;${list.pjd_end}</td>  
	                                </tr>
	                                <tr>
	                                    <th style="background-color: #f9fafc; text-align: right; padding-right: 10px; width: 10%">참여자</th>
	                                    <td colspan="3">${list.emp_name}</td>
	                                </tr>
	                            </table>
	                            
	                     		<table class="table table-bordered" style="margin-top: 0px; border: 4px solid #e9ecef;">
									<tr>
										<th style="background-color: #f9fafc; text-align: right; padding-right: 10px; width: 10%">내용 </th>
										<td>${list.pjd_content}</td>	
									</tr>
								</table>
	                    </div>
	                </div>
	                <c:set var="tabcount" value="${tabcount+1}"/>
                </c:forEach>

            </div>


            </div>
        </div>
    </div>
</div>

</div>







