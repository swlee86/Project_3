<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script>
function pagePrint(obj){
	var w = obj.offsetWidth;
	var h = obj.offsetHeight;
	
	var features = "menubar=no,toolbar=no,location=no,directories=no,scrollbars=yes,resizable=yes,width="+w+",height="+h+",left=0,top=0";
	var PrintPage = window.open("about:blank",obj.id.features);
	
	PrintPage.document.open();
	PrintPage.document.write("<html><head> <h4><img alt='로고' src='img/logo1.png'></h4><title>d</title><style type='text/css'>body,tr,td,input,textarea{font-family:Tahoma;font-size:11pt;}</style>\n</head>\n<body>"+obj.innerHTML+"\n</body></html>");
	PrintPage.document.close();
	
	PrintPage.document.title = document.domain;
	PrintPage.print(PrintPage.location.reload());
}
</script>
<div class="normalheader transition animated fadeIn media-body">
<div class="content animate-panel content-boxed">
<div style="margin: 10px;">
	<span class="up_btn">
		<a class="btn btn-outline btn-primary btn-m bgcolor" aria-controls="print" onclick="pagePrint(document.getElementById('print_page'))">
			<i class="pe-7s-print"></i>&nbsp;
		</a>
	</span>
	<span class="up-btn pull-right">
		<button class="btn btn-outline btn-primary btn-m bgcolor" data-toggle="modal" data-target="#draft_process_Modal">
			승인 처리
		</button>
	</span>
</div>

        <div class="row" id="print_page">
            <div class="col-lg-12">
                <div class="hpanel blog-article-box" id="print">
                    <div class="panel-heading" style="padding-bottom: 15px;">
                        <h4>휴가 신청서</h4>
                    </div>
                    <div class="panel-body" style="color: black; font-size: 13px; border-top: 5px solid #34495E;">
                       <table width="100%" id="datatable">
                       		<tr>
                       			<td width="13%" class="flag">문서 번호</td>
                       			<td>제 ${ detail.draft_no }호</td>
                       			<td></td>
                       			<td></td>
                       			<td></td>
                       			<td></td>
                       		</tr>
                       		<tr height="15px"></tr>
                       		<tr>
                       			<td colspan="6" class="flag">참조자 &nbsp; ${ refcount }인 </td>
                       		</tr>
                       		<c:if test="${ refcount != 0 }">                     			
                       		<c:forEach var="ref" items="${ refdetail }">  
                       			<tr>
                       				<td class="flag">사원 번호</td>
                       				<td>${ ref.emp_no }</td>
                       				<td class="flag">사원 명</td>
                       				<td>${ ref.emp_name }</td>
                       			</tr>
                       		</c:forEach>
                       		</c:if>
                       		<c:if test="${ refcount == 0 }">
                       			<td colspan="6" style="padding-left: 10px;">참조자가 없습니다</td>
                       		</c:if>
                       		<tr height="20px"></tr>
                       		<tr>
                       			<td colspan="6" class="flag">결재라인 &nbsp; ${ linecount }인 </td>
                       		</tr>
                       		<c:forEach var="line" items="${ linedetail }">
                       			<tr>
                       				<td class="flag">사원 번호</td>
                       				<td>${ line.emp_no }</td>
                       				<td class="flag">사원 명</td>
                       				<td>${ line.emp_name }</td>
                       				<td>
                       					<c:choose>
                       						<c:when test="${ line.app_check == '1' }">
                       							<img alt="승인" src="img/approval.png" style="width:100%; height: 30px;">
                       						</c:when>
                       						<c:when test="${ line.app_check == '2' }">
                       							<img alt="반려" src="img/denied.png" style="width:100%; height: 30px;">
                       						</c:when>
                       						<c:when test="${ line.app_check == '3' }">
                       							<img alt="보류" src="img/pending.png" style="width: 100%; height: 30px;">
                       						</c:when>
                       					</c:choose>
                       				</td>
                       			</tr>
                       		</c:forEach>
                       		
                       		<tr height="20px"></tr>
                       		<tr>
                       			<td class="flag">소속</td>
                       			<td colspan="5">${ detail.branch_name } &nbsp;&nbsp; ${ detail.dept_name } &nbsp;&nbsp; ${ detail.low_dept_name }</td>
                       		</tr>
                       		<tr>
                       			<td class="flag">사원번호</td>
                       			<td>${ detail.emp_no }</td>
                       			<td class="flag" width="10%">직위</td>
                       			<td width="18%">${ detail.position_name }</td>
                       			<td class="flag" width="10%">성명</td>
                       			<td>${ detail.emp_name }</td>
                       		</tr>
                       		<tr style="text-align:center; font-weight: bold;">
                       			<td colspan="6" height="130px">상기 본인은 아래와 같이 휴가를 신청하오니 허락하여주시기 바랍니다.</td>
                       		</tr>
                       		<tr>
                       			<td class="flag">휴가 내역</td>
                       			<td colspan="5">${ detail.break_cg_name }</td>
                       		</tr>
                       		<tr>
                       			<td class="flag">휴가 기간</td>
                       			<td width="28%">${ detail.break_start } &nbsp; 부터 &nbsp; ${ detail.break_end } &nbsp; 까지</td>
                       			<td colspan="4">(${ detail.break_term }) 일간</td>
                       		</tr>
                       		<tr style="border-bottom: 2px solid black;">
                       			<td class="flag" colspan="6">휴가 사유</td>
                       		</tr>
                       		<tr>
                       			<td colspan="6" height="300px" style="padding: 10px; vertical-align: text-top;">${ detail.draft_content }</td>
                       		</tr>
                       		<tr>
                       			<td class="flag" style="height: 50px;">비상연락처</td>
                       			<td colspan="5">${ detail.break_tel }</td>
                       		</tr>
                       		<tr>
                       			<td class="flag">신청일</td>
                       			<td colspan="3">${ detail.draft_date }</td>
                       		</tr>
                       		<tr style="text-align:center; font-weight: bold;">
                       			<td colspan="6" height="80px">
                       				상기 내용을 정확하게 기입하십시오. 정확하게 미기입 시 추후에 불이익을 당할 수 있습니다.
                       			</td>
                       		</tr>
                       </table>
                    </div>
                    <br><br>
                    
                    <div class="pull-right" style="text-align: center;">
                    	<input type="button" id="backBtn"
							   class="btn btn-sm btn-default" value="뒤로가기"
							   style="padding-right: 15px; padding-left: 15px; font-weight: 600; font-size: 13px">
						<input type="button"
							   class="btn btn-sm btn-danger" value="삭제" onclick="delete.do?draft_no=${detail.draft_no}"
							   style="padding-right: 15px; padding-left: 15px; font-weight: 600; font-size: 13px">
					
					</div>
					
					<br><br>
					<br><br>
                </div>
            </div>
        </div>
    </div>
    
<!-- 승인 처리하기 Modal창 -->
<div class="modal fade hmodal-success" id="draft_process_Modal" tabindex="-1"
	 role="dialog" aria-hidden="true" style="display: none;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="color-line"></div>
			
			<div class="modal-header">
				<h4 class="modal-title">승인 처리</h4>
				<small class="font-bold">제 ${ detail.draft_no }호 문서의 승인을 처리합니다.</small>
				<input type="hidden" id="draft_no_hidden" value="${ detail.draft_no }">
			</div>
			
			<div class="modal-body">
					<c:choose>
						<c:when test="${ app_check == '1' }">
							<span class="marginbottom color textcenter flag dragdrop" id="dragarea"
								  style="background-color: rgb(98,203,49)" value="승인"> </span>
						</c:when>
						<c:when test="${ app_check == '2' }">
							<span class="marginbottom color textcenter flag dragdrop" id="dragarea"
								  style="background-color: rgb(231,76,60)" value="반려"> </span>
						</c:when>
						<c:when test="${ app_check == '3' }">
							<span class="marginbottom color textcenter flag dragdrop" id="dragarea"
								  style="background-color: rgb(155,89,182)" value="보류"> </span>
						</c:when>
						<c:when test="${ app_check == '4' }">
							<span class="marginbottom color textcenter flag dragdrop" id="dragarea"></span>
						</c:when>
					</c:choose>
					<div class="row ui-sortable">
                    <div class="col-md-4 border-right" id="cg_1"> 
                    	<div class="contact-stat gradLi ui-sortable-handle h-bg-green color"
                    		 style="border: 4px solid #4EA327;" id="one">
                    		<strong>승인</strong>
                    	</div> 
                    </div>
                    <div class="col-md-4" id="cg_2"> 
                    	<div class="contact-stat gradLi ui-sortable-handle h-bg-red color"
                    		 style="border: 4px solid #B93D30;" id="two">
                    		<strong>반려</strong>
                    	</div> 
                    </div>
                    <div class="col-md-4 border-right" id="cg_3"> 
                    	<div class="contact-stat gradLi ui-sortable-handle h-bg-violet color"
                    		 style="border: 4px solid #7C4792;" id="three">
                    		<strong>보류</strong>
                    	</div> 
                    </div>
                </div>
			</div>
			<div class="modal-footer">
				<button type="button" id="app_check" class="btn btn-outline btn-success" data-dismiss="modal">
					<i class="fa fa-check"></i>
					<span class="bold">처리</span>
				</button>
			</div>
		</div>
	</div>
</div>
</div>