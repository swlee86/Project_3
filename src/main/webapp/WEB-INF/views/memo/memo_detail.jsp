<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--  
	작성자	: 박지은
	작성일	: 2016-12-01
	목 적  	: 메모 상세 보는 view
-->
<script>
$(function(){
	$('#memo_plus').click(function(){
		$.ajax(
				{
					type : "get",
					url  : "memo_write.do",
					dataType : "html",
					success : function(data){
						$('#memo_plus_div').html(data);
					}
				}		
			)
	});
	
	$("#memo_content").keyup(function() {
		  memo_ajax();
	});
	
	$("#memo_title").keyup(function() { 
		  memo_ajax();
	});
	
	
	function memo_ajax(){
		$.ajax(
				{
					type : "post",
					url  : "private_memo_update.do",
					data : {
						"update_memo_no" : $('#update_memo_no').val(),
						"memo_content" :$('#memo_content').val(),
						"memo_title" : $('#memo_title').val()
					},
					success : function(data){
						
					}
				}		
			)
	}
});

</script>
<div class="col-md-9">
	<div class="hpanel">
		<div class="panel-body" style="background: ${memo.color};">
			<div class="text-center hidden">We couldn't find any notes for
				you.</div>
			<div class="tab-content">
				<a href="#" id="memo_plus"><span
					class="glyphicon glyphicon-plus"></span></a>
				<div class="pull-right">
					<a href="removememo.do?memo_no=${memo.memo_no}"><b><span
							class="glyphicon glyphicon-trash"></span></b></a>
				</div>
				<input type="hidden" id="update_memo_no" value="${memo.memo_no}">
				<div id="note1" class="tab-pane active">
					<div class="pull-right text-muted m-l-lg">
						${memo.memo_date}</div>
					<h3>
						<input type="text" id="memo_title" value="${memo.title}"
							style="border:0px;background-color:${memo.color}">
					</h3>

					<hr />
					<div class="note-content" style="background: ${memo.color};">
						<textarea class="form-control" style="background: ${memo.color};"
							id="memo_content">${memo.memo_content}</textarea>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
