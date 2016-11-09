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
                	보낸메일함
            </h2>
            <small>Show users list in nice and color panels</small>
        </div>
    </div>
</div>

<div class="content animate-panel">
	<div class="row">
		<div class="col-md-3">
			<jsp:include page="/sidebar/mailLeftList_side.jsp"></jsp:include>
		</div>

		<div class="col-md-9">	
        <div class="hpanel">
            <div class="panel-body">
            
            	<div class="row" >
            		<div class="col-md-8 m-b-md">
							<div class="btn-group">
								<button class="btn btn-default btn-sm">
									<i class="pe pe-7s-mail"> </i> 메일보내기
								</button>
								<button class="btn btn-default btn-sm">
									<i class="pe pe-7s-trash"> </i> 삭제
								</button>
							</div>
					</div>
					
					<div class="col-md-4 mailbox-pagination m-b-md">
						<form action="">
							<div class="input-group">
								<input type="text"  class="form-control input-sm" name="s"/>
								<div class="input-group-btn">
									<button class="btn btn-sm btn-default" type="submit">&nbsp;<span class="fa fa-search" ></span> </button>
								</div>			
							</div>
						</form>
					</div>
                </div>  
                
                
                              	
                <br>     
                 <hr style="border:1px solid gray; margin-bottom:0px">
                	<div class="table-responsive">
						<table class="table table-hover table-mailbox" >
							<thead>
								<tr>
									<th>
										<div class="checkbox">
											<input type="checkbox"> <label></label>
										</div>
									</th>
									<th>받는사람</th>
									<th>제목</th>
									<th>수신확인</th>
									<th>발송취소</th>
									<th>날짜</th>
								</tr>
							</thead>
							<tbody>	
								<tr>
									<td>
										<div class="checkbox">
											<input type="checkbox"> <label></label>
										</div>
									</td>
									<td>송중기</td>
									<td><a href="#">안녕하세요요요요요요요요요요요요ㅛ요용</a></td>
									<td>읽음</td>
									<td></td>
									<td>16.11.09 10:27</td>
								</tr>
								<tr>
									<td>
										<div class="checkbox">
											<input type="checkbox"> <label></label>
										</div>
									</td>
									<td>송중기</td>
									<td><a href="#">요요요요요요요요ㅛ요용</a></td>
									<td><font color=colar><b>안읽음</b></font></td>
									<td>
										<button class="btn btn-default btn-xs" style="margin:0px">
											발송취소
										</button>
									</td>
									<td>16.11.09 10:27</td>
								</tr>
								<tr>
									<td>
										<div class="checkbox">
											<input type="checkbox"> <label></label>
										</div>
									</td>
									<td>송중기</td>
									<td><a href="#">안녕하세요요요요요요요요요요요요ㅛ요용</a></td>
									<td>읽음</td>
									<td></td>
									<td>16.11.09 10:27</td>
								</tr>
								<tr>
									<td>
										<div class="checkbox">
											<input type="checkbox"> <label></label>
										</div>
									</td>
									<td>송중기</td>
									<td><a href="#">안녕하세요요요요요요요요요요요요ㅛ요용</a></td>
									<td>읽음</td>
									<td></td>
									<td>16.11.09 10:27</td>
								</tr>
							</tbody>
						</table>
					</div>

            </div>
             <div class="panel-footer"  style="text-align:center;">
                <div class="btn-group">
                    <button type="button" class="btn btn-default"><i class="fa fa-chevron-left" style=" font-size: 20px;"></i></button>
                    <button class="btn btn-default active">1</button>
                    <button class="btn btn-default  ">2</button>
                    <button class="btn btn-default">3</button>
                    <button class="btn btn-default">4</button>
                    <button type="button" class="btn btn-default "><i class="fa fa-chevron-right" style=" font-size: 20px;"></i></button>
                </div>
              </div>
        </div> 
            
         
   </div>  
</div>
</div>