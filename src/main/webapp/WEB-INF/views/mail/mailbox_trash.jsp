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
                	휴지통
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
		
    	<div class="col-lg-9">
        <div class="hpanel">
        	<div class="panel-heading">
             	안읽은 메일 <b><font color="coral" style="text-decoration:underline;">10</font></b> 통 /&nbsp; 전체메일  <b><font color="gray"  style="text-decoration:underline;">10</font></b>통
           	 </div>
            <div class="panel-body">
            	<div class="row" >
            		<div class="col-md-8 m-b-md">
							<div class="btn-group">
								<button class="btn btn-default btn-sm">
									&nbsp;&nbsp;<i class="fa fa-envelope"></i>&nbsp;&nbsp;
								</button>
								<button class="btn btn-default btn-sm">
									&nbsp;&nbsp;<i class="fa fa-close"></i>&nbsp;&nbsp;
								</button>
								<button class="btn btn-default btn-sm">
									&nbsp;&nbsp;<i class="fa fa-mail-reply"></i>&nbsp;&nbsp;
								</button>
							</div>
					</div>
					
					<div class="col-md-4 mailbox-pagination m-b-md">
						<form action="">
							<div class="input-group">
								<input type="text"  class="form-control input-sm" name="s"/>
								<div class="input-group-btn">
									<button class="btn btn-sm btn-default" type="submit" style="color:#f05050">&nbsp;<span class="fa fa-search" ></span> </button>
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
									<th>보낸사람</th>
									<th>제목</th>
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