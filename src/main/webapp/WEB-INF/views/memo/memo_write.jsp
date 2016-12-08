<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
$(function(){
	console.log("초기 color : "+ $('#memo_plus_color_no option:selected').attr('id'));
	var color = $('#memo_plus_color_no option:selected').attr('id')
	$('#memo_plus_panel_body').css('background',color);
	$('#memo_plus_title').css('background-color',color);
	$('#memo_plus_title').css('background-color',color);
	$('#memo_plus_content_div').css('background-color',color);
	$('#memo_plus_content').css('background-color',color);
	
	
	$('#memo_plus_color_no').change(function(){
		console.log('select 체인지');
		console.log("value : "+$('#memo_plus_color_no').val());
 		console.log("color : "+ $('#memo_plus_color_no option:selected').attr('id'));
 		color = $('#memo_plus_color_no option:selected').attr('id')
 		$('#memo_plus_panel_body').css('background',color);
		$('#memo_plus_title').css('background-color',color);
		$('#memo_plus_title').css('background-color',color);
		$('#memo_plus_content_div').css('background-color',color);
		$('#memo_plus_content').css('background-color',color);
		
	});
	
	

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
			  "timeOut": "2000",
			  "extendedTimeOut": "1000",
			  "showEasing": "swing",
			  "hideEasing": "linear",
			  "showMethod": "fadeIn",
			  "hideMethod": "fadeOut"
	        };
	//제목 필수
	$('#submit_btn').click(function() {
		console.log("이거탐?");
		if ($('#memo_plus_title').val() == "") {
			toastr.warning('제목을 입력해 주세요');
			$('#memo_plus_title').focus();
			return false;
		}
	});
	});
</script>

        <div class="col-md-9">
            <div class="hpanel">
                <div class="panel-body" style="background: ;" id="memo_plus_panel_body" >
                    <div class="tab-content">
                        <div id="note" class="tab-pane active">
                        <form action="memo_write.do" method="post">
						<div class="form-inline">
							<input type="text" class="form-control" id="memo_plus_title" name="title" placeholder="제목 입력" style="background-color:; border: 0px;">
							<div class="pull-right">
								<select name="color_no" class="form-control input-xs" id="memo_plus_color_no">
									<c:forEach var="color" items="${color}">
										<option value="${color.color_no}" id="${color.color}"
											<c:if test="${color.color_no == 1}">selected</c:if>>${color.color_name}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<hr/>
                            <div class="note-content" id="memo_plus_content_div" style="background: ;">
                                <textarea class="form-control" id="memo_plus_content"  style="background: ;" placeholder="본문 입력" name="memo_content" wrap="hard"></textarea>
                            </div>
                            <div class="pull-right">
                                <button class="btn btn-sm btn-default" id="submit_btn" ><span class="glyphicon glyphicon-ok"></span> <b>Save</b></button>
                            </div>
                        </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
