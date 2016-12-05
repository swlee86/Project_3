<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
$(function(){
	$('.memo_detail').click(function(){
		console.log("memo_no : "+$(this).attr('id'));
		var memo_no = $(this).attr('id');
		$.ajax(
				{
					type : "post",
					url  : "private_memo_detail.do",
					data : {
						"memo_no" : memo_no
					},
					success : function(data){
						console.log("data: "+data);  
						$('#memo_plus_div').html(data);
					}
				}		
			)	
	});
	
	$('#first_memo_plus').click(function(){
		console.log('클릭');
		$.ajax(
				{
					type : "get",
					url  : "memo_write.do",
					dataType : "html",
					success : function(data){
						console.log("data: "+data); 
						$('#memo_plus_div').html(data);
					}
				}		
			)
	});
	
	$("#first_memo_content").keyup(function() {
		  console.log("메모 수정중 내용 : " +$('#first_memo_content').val()+"/"+$('#first_update_memo_no').val());
		  first_memo_ajax();
	});
	
	$("#first_memo_title").keyup(function() {
		  console.log("메모 수정중 내용 : " +$('#first_memo_title').val()+"/"+$('#first_update_memo_no').val());
		  first_memo_ajax();
	});
	
	
	function first_memo_ajax(){
		$.ajax(
				{
					type : "post",
					url  : "private_memo_update.do",
					data : {
						"update_memo_no" : $('#first_update_memo_no').val(),
						"memo_content" :$('#first_memo_content').val(),
						"memo_title" : $('#first_memo_title').val()
					},
					success : function(data){
						console.log("메모 수정 저장"); 
					}
				}		
			)
	}

	
});
</script>
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
                    <li><a href="index.do">Home</a></li>
                  <!--   <li>
                        <span>Private_memo</span>
                    </li> -->
                    <li class="active">
                        <span>Memo</span>
                    </li>
                </ol>
            </div>
            <h2 class="font-light m-b-xs">
                Memo
            </h2>
            <small>개인 메모를 입력하세요.</small>
        </div>
    </div>
</div>

<div class="content animate-panel">
    <div class="row">
        <div class="col-md-3">
            <div class="hpanel panel-group">
             <form action="private_memo.do" method="GET"  onchange="submit()">
                <div class="panel-body" style="background-color:#f8f8f8">
                    <div class="text-center text-muted font-bold">
                    	<select class="form-control input-sm" name="ps" >
                    		<option value="5" <c:if test="${ps==5}">selected</c:if>>5개</option>
                    		<option value="10" <c:if test="${ps==10}">selected</c:if>>10개</option>
                    		<option value="15" <c:if test="${ps==15}">selected</c:if>>15개</option>
                    	</select>
                    </div>
                    <br>
                     <div class="panel-section">     
                    <div class="input-group">
                        <input type="text" class="form-control input-sm" name="q" placeholder="Search memo....">
                           <span class="input-group-btn">
                                <button class="btn btn-default input-sm" type="submit" style="color: #fd7d86"><b><span class="fa fa-search"></span></b></button>
                           </span>
                    </div>                
                    <button type="button" data-toggle="collapse" data-target="#notes"
                            class="btn-sm visible-xs visible-sm collapsed btn-default btn btn-block m-t-sm">
                        All notes <i class="fa fa-angle-down"></i>
                    </button>
                </div>
                </div>
				</form>


                <div id="notes" class="collapse">
                	<c:choose>
                		<c:when test="${empty list}"> </c:when>
                		<c:otherwise>
							<c:forEach var="list" items="${list}">
								<div class="panel-body note-link"
									style="background-color:${list.color}">
									<%-- <a href="private_memo.do?memo_no=${list.memo_no}"> --%>
									<a href="#" class="memo_detail" id="${list.memo_no}"> <small class="pull-right text-muted">${list.memo_date}</small>
										<h5>${list.title}</h5>
										<div class="small">${list.memo_content}</div>
									</a>
								</div>
							</c:forEach>
						</c:otherwise>
                	</c:choose>
				
                </div>
                
             
                <div class="panel-body" style="text-align:center">
                	<c:choose>
                		<c:when test="${empty pg}"> </c:when>
                		<c:otherwise>
                			  <div class="btn-group">
								<c:if test="${pg>1}">
									<a  class="btn btn-default" href="private_memo.do?pg=${pg-1}&q=${q}&ps=${ps}">
										&nbsp;<i class="fa fa-chevron-left"></i>
									</a>
								</c:if>

								<c:forEach var="i" begin="1" end="${pagecount}">
									<c:choose>
										<c:when test="${pg==i}">
											<button class="btn btn-default active" style="background-color: #DAD9FF">
												<b>${i}</b>
											</button>
										</c:when>
										<c:otherwise>
											<a class="btn btn-default" href="private_memo.do?pg=${i}&q=${q}&ps=${ps}">
												${i}
											</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>

								<c:if test="${pg < pagecount}">
									<a class="btn btn-default" href="private_memo.do?pg=${pg+1}&q=${q}&ps=${ps}">
										&nbsp;<i class="fa fa-chevron-right"></i>
									</a>
								</c:if>
							</div>
                		
                		</c:otherwise>
                	</c:choose>
		                 
	                </div>
	                
	                
            </div>
        </div>
        
      
        
        <!-- 메모 상세 -->
        <div id="memo_plus_div">
        <div class="col-md-9" >
            <div class="hpanel">
                <div class="panel-body" style="background: ${first_memo.color};" id="memo_detail_panel_body_color">					
					<c:choose>
						<c:when test="${empty first_memo}">
							<div class="text-center">
		                        	<a href="removememo.do?memo_no=${first_memo.memo_no}" id="first_memo_delete"><b><span class="glyphicon glyphicon-trash"></span></b></a> 메모가 없습니다.
		                    </div>
	                    </c:when>
	                    <c:otherwise>
		                    <div class="tab-content">
		                     <a  href="#"id="first_memo_plus"><span class="glyphicon glyphicon-plus"></span></a>
		                      <div class="pull-right">
		                      	<a href="removememo.do?memo_no=${first_memo.memo_no}" id="first_memo_delete"><b><span class="glyphicon glyphicon-trash"></span></b></a>
		                     </div>             
		                     	<input type="hidden" id="first_update_memo_no" value="${memo_no_chk}">     	
		                        <div id="note1" class="tab-pane active">
		                            <div class="pull-right text-muted m-l-lg" id="memo_detail_date" >
		                                ${first_memo.memo_date}
		                            </div>
		                            <h3 ><input type="text"  id="first_memo_title" value="${first_memo.title}" style="border:0px;background-color:${first_memo.color}"></h3>
		                            <hr/>
		                            <div class="note-content" style="background: ${first_memo.color};" id="memo_detail_background">
		                                <textarea class="form-control" style="background: ${first_memo.color};"  id="first_memo_content" >${first_memo.memo_content}</textarea>
		                            </div>
		                        </div>
		                    </div>
		                   </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
        </div>
        
        
    </div>
</div>