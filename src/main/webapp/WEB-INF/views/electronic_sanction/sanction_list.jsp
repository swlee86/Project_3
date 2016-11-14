<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
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
                    <li><a href="index.html">Dashboard</a></li>
                    <li>
                        <span>App views</span>
                    </li>
                    <li class="active">
                        <span>Contacts</span>
                    </li>
                </ol>
            </div>
            <h2 class="font-light m-b-xs">
                	결재대기함
            </h2>
            <small>Show users list in nice and color panels</small>
        </div>
    </div>
</div>

<div class="content animate-panel">
	<div class="row">
	
    <div class="col-lg-12">
        <div class="hpanel">
            <div class="panel-heading">
                	전체 : <font color="coral">10</font> 개
            </div>
            <div class="panel-body">
            	<div class="row" style="background-color:#f3f3f3">
	            	<form action="" class="form-inline">
	            		<table style="margin-top:10px; margin-bottom:10px;" width="100%">
	                 		<tr > 
	                 			<td width="10%"></td>
	                 			<th style="text-align:right;padding-right:20px;">기안자 </th>
	                 			<td><input type="text" class="form-control input-sm" style="width:60%; height: 27px; "></td>
	                 			<td width="10%"></td>
	                 			<th style="text-align:right;padding-right:20px;">양식명 </th>
	                 			<td><input type="text" class="form-control input-sm" style="width:60%; height: 27px;"></td>
	                 			<td width="10%"></td>
	                 		</tr> 
	                 		<tr> <td colspan="7">&nbsp;</td>
	                 		</tr>
	                 		<tr>
	                 			<td></td>
	                 			<th style="text-align:right;padding-right:20px;">문서제목 </th>
	                 			<td><input type="text" class="form-control input-sm" width="100%" style="width:100%; height: 27px;"></td>
	                 			<td></td>
	                 			<td></td>
	                 			<td><button class="btn btn-sm" style="background-color:#ff757f;color:white" type="submit"><span class="fa fa-search"></span>&nbsp; 검색  &nbsp;</button></td>
	                 			<td></td>
	                 		</tr>            
	               		</table>
	                </form>   
                </div>  
                       	
                <br>     
                <hr style="border:1px solid gray; margin-bottom:0px">
                <div class="table-responsive">
                <table cellpadding="1" cellspacing="1" class="table table-hover">
                    <thead>
                    <tr>
                    	<th> </th>
                        <th>NO</th>
                        <th>서식함</th>
                        <th>유형</th>
                        <th>문서제목</th>
                        <th>기안자</th>
                        <th>기안부서</th>
                        <th>기안일</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                    	<td><input type="checkbox"></td>
                        <td>4</td>
                        <td>공통</td>
                        <td>결재</td>
                        <td><a href="sanction_approve_view.do">기안용지_승인_프로세스_재기안</a></td>
                        <td>통삼일</td>
                        <td>그룹웨어팀</td>
                        <td>2016.11.09 19:24</td>
                    </tr>
                    <tr>
                    	<td><input type="checkbox"></td>
                        <td>3</td>
                        <td>공통</td>
                        <td>결재</td>
                        <td>기안용지_승인_프로세스_재기안</td>
                        <td>통삼일</td>
                        <td>그룹웨어팀</td>
                        <td>2016.11.09 19:24</td>
                    </tr>
                    <tr>
                    	<td><input type="checkbox"></td>
                        <td>2</td>
                        <td>공통</td>
                        <td>결재</td>
                        <td>기안용지_승인_프로세스_재기안</td>
                        <td>통삼일</td>
                        <td>그룹웨어팀</td>
                        <td>2016.11.09 19:24</td>
                    </tr>                    
                    <tr>
                    	<td><input type="checkbox"></td>
                        <td>1</td>
                        <td>공통</td>
                        <td>결재</td>
                        <td>기안용지_승인_프로세스_재기안</td>
                        <td>통삼일</td>
                        <td>그룹웨어팀</td>
                        <td>2016.11.09 19:24</td>
                    </tr>
                    </tbody>
                </table>
                <div class="row" style="text-align:right; margin-right:5px;">
                	<button type="button"  class="btn w-xs btn-primary" data-dismiss="modal" data-toggle="modal" data-target="#myModal1">요청 취소</button>
                	<button type="button"  class="btn w-xs btn-primary" onclick="window.location.href='sanction_write.do'">요청 등록</button>
                </div>
			</div>

            </div>
             <div class="panel-footer"  style="text-align:center;">
                <div class="btn-group">
                    <button type="button" class="btn btn-default">&nbsp;<i class="fa fa-chevron-left"></i></button>
                    <button class="btn btn-default active">1</button>
                    <button class="btn btn-default  ">2</button>
                    <button class="btn btn-default">3</button>
                    <button class="btn btn-default">4</button>
                    <button type="button" class="btn btn-default ">&nbsp;<i class="fa fa-chevron-right"></i></button>
                </div>
              </div>
        </div> 
            
         
   </div>  
</div>
</div>


<div class="modal fade hmodal-success" id="myModal1" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog  modal-sm">
		<div class="modal-content">
			<div class="color-line"></div>
			<div class="modal-header text-center">
		 		확인을 누르시면 선택하신 ㅇㅇ 요청이 취소 처리가 됩니다.<br>
		 		정말 처리하시겠습니까?
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default btn-sm" data-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary btn-sm demo2" data-dismiss="modal" data-toggle="modal" data-target="#myModal5">확인</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade hmodal-success" id="myModal5" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="color-line"></div>
			<div class="modal-header">
				<h4 class="modal-title"><font color="#6a6c6f">처리 결과<i class="fa fa-table"></i></font></h4>
				<small class="font-bold">Lorem Ipsum is simply dummy text.</small>
			</div>
			<div class="modal-body">
				<table class="table table-bordered" style="text-align:center">
					<tr style="background-color:#f5f5f5;">
						<th style="text-align:center">순번</th>
						<th style="text-align:center">결재자</th>
						<th style="text-align:center">결제유형</th>
						<th style="text-align:center">결재</th>
						<th style="text-align:center">배정일시</th>
						<th style="text-align:center">확인일시</th>
						<th style="text-align:center">결재일시</th>
					</tr>
					<tr>
						<td>1</td>
						<td>박성준 - (사단)한국소프트웨어기술진흥협회</td>
						<td>결재</td>
						<td>진행</td>
						<td>2016.11.08 11:49</td>
						<td>2016.11.08 12:42</td>
						<td>2016.11.08 12:42</td>
					</tr>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>