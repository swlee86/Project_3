<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
$(function(){
	$('#memo_plus_color_no').change(function(){
		console.log('select 체인지');
		console.log("value : "+$('#memo_plus_color_no').val());
 		console.log("color : "+ $('#memo_plus_color_no option:selected').attr('id'));
 		var color = $('#memo_plus_color_no option:selected').attr('id')
 		$('#memo_plus_panel_body').css('background',color);
		
	});
});
</script>

        <div class="col-md-9">
            <div class="hpanel">
                <div class="panel-body" style="background: red;" id="memo_plus_panel_body" >
                    <div class="tab-content">
                        <div id="note" class="tab-pane active">
                        <form action="memo_write.do" method="post">
                            <h3><input type="text" class="form-control" name="title" placeholder="제목 입력" style="background-color:Red;"></h3>
                            <hr/>
                                  	색상 : 
                            <select name="color_no" id="memo_plus_color_no">
                            	<c:forEach var="color" items="${color}">
                            	<option value="${color.color_no}" id="${color.color}" >${color.color_name}</option>
                            	</c:forEach>
                            </select>
                            <hr/>
                            <div class="note-content" style="background: red;">
                                <textarea class="form-control" style="background: red;" placeholder="본문 입력" name="memo_content" wrap="hard"></textarea>
                            </div>
                            <div class="btn-group">
                                <button class="btn btn-sm btn-default" type="submit"><i class="fa fa-thumbs-o-up"></i> 저장하기</button>
                                <a class="btn btn-sm btn-default" href="private_memo.do"><i class="fa fa-trash"></i> 목록으로</a>
                            </div>
                        </form>
                        </div>
                    </div>

                </div>

            </div>
        </div>
