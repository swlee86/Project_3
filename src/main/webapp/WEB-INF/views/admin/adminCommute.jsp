<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
					<li><span>App views</span></li>
					<li class="active"><span>Calendar</span></li>
				</ol>
			</div>
			<h2 class="font-light m-b-xs">시간 정보 관리 페이지</h2>
		</div>
	</div>
</div>


<div class="content animate-panel">
	<div class="row">
	
    <div class="col-lg-12">
        <div class="hpanel">
            <div class="panel-body">
            	<h4>출퇴근 시간 목록</h4>
				 	  <br/>
					<div class="row text-right">
						<div class="col-md-7"></div>
						<form action="" class="form-inline ">
							<div class="col-md-2">
								<div class="form-group">
									<select class="form-control input-sm">
										<option>지점</option>
										<option>부서</option>
										<option>하위부서</option>
									</select>
								</div>
							</div>

							<div class="col-md-3">
								<div class="form-group">
									<div class="input-group">
										<input type="text" class="form-control input-sm">
										<span class="input-group-btn">
											<button class="btn btn-default input-sm" type="submit">
												<span class="fa fa-search"></span>
											</button>
										</span>
									</div>
								</div>
							</div>
						</form>
					</div>



				<br>     
                <hr style="border:1px solid gray; margin-bottom:0px">
                <div class="table-responsive">
                <table cellpadding="1" cellspacing="1" class="table table-hover table-bordered table-condensed" >
                    <thead>
                    <tr style="background-color:#f9fafc">
                    	<th style="text-align:center;padding-bottom:10px;">
							<div class="checkbox checkbox-success">
                            	<input type="checkbox" class="i-checks" id="commute">
                               	<label for="checkbox"></label> 
                       		</div>
						</th>
                        <th  style="text-align:center;padding-bottom:20px;">지점</th>
                        <th  style="text-align:center;padding-bottom:20px;">부서</th>
                        <th  style="text-align:center;padding-bottom:20px;">하위부서</th>
                        <th  style="text-align:center;padding-bottom:20px;">출근시간</th>
                        <th  style="text-align:center;padding-bottom:20px;">퇴근시간</th>
                      </tr>
                    </thead>
                    
                    <tbody>
                    <tr style="height:10px;">
                    	<td  style="text-align:center">
                    		<div class="checkbox checkbox-success">
                            	<input type="checkbox" class="i-checks">
                               	<label for="checkbox"></label> 
                       		</div>
						</td>
                        <td  style="text-align:center;padding-top:15px;">서울</td>
                        <td  style="text-align:center;padding-top:15px;">개발부</td>
                        <td  style="text-align:center;padding-top:15px;">개발1팀</td>
                        <td  style="text-align:center;padding-top:15px;">09:00</td>
                        <td  style="text-align:center;padding-top:15px;">06:00</td>
                      
                    </tr>
                    </tbody>
                </table>    
			</div>
		    <div class="row" style="text-align:right; margin-right:5px;">
            	<button type="button"  class="btn btn-sm btn-success" onclick="location.href='adminTimeInfo.do'">등록</button>
            	<button type="button"  class="btn btn-sm btn-default" >삭제</button>
            </div>

            </div>
             
        </div> 
            
         
   </div>  
</div>
</div>


<div class="content animate-panel">
	<div class="row">
	
    <div class="col-lg-12">
        <div class="hpanel">
            <div class="panel-body">
            	<h4>홈페이지 접근 가능 시간 목록</h4>
				 	  <br/>
					<div class="row text-right">
						<div class="col-md-7"></div>
						<form action="" class="form-inline ">
							<div class="col-md-2">
								<div class="form-group">
									<select class="form-control input-sm">
										<option>지점</option>
										<option>부서</option>
										<option>하위부서</option>
									</select>
								</div>
							</div>

							<div class="col-md-3">
								<div class="form-group">
									<div class="input-group">
										<input type="text" class="form-control input-sm">
										<span class="input-group-btn">
											<button class="btn btn-default input-sm" type="submit">
												<span class="fa fa-search"></span>
											</button>
										</span>
									</div>
								</div>
							</div>
						</form>
					</div>



				<br>     
                <hr style="border:1px solid gray; margin-bottom:0px">
                <div class="table-responsive">
                <table cellpadding="1" cellspacing="1" class="table table-hover table-bordered table-condensed" >
                    <thead>
                    <tr style="background-color:#f9fafc">
                    	<th style="text-align:center;padding-bottom:10px;">
							<div class="checkbox checkbox-success">
                            	<input type="checkbox" class="i-checks">
                               	<label for="checkbox"></label> 
                       		</div>
						</th>
                        <th  style="text-align:center;padding-bottom:20px;">지점</th>
                        <th  style="text-align:center;padding-bottom:20px;">부서</th>
                        <th  style="text-align:center;padding-bottom:20px;">하위부서</th>
                        <th  style="text-align:center;padding-bottom:20px;">시작시간</th>
                        <th  style="text-align:center;padding-bottom:20px;">마감시간</th>
                      </tr>
                    </thead>
                    
                    <tbody>
                    <tr style="height:10px;">
                    	<td  style="text-align:center">
                    		<div class="checkbox checkbox-success">
                            	<input type="checkbox" class="i-checks">
                               	<label for="checkbox"></label> 
                       		</div>
						</td>
                        <td  style="text-align:center;padding-top:15px;">서울</td>
                        <td  style="text-align:center;padding-top:15px;">개발부</td>
                        <td  style="text-align:center;padding-top:15px;">개발1팀</td>
                        <td  style="text-align:center;padding-top:15px;">09:00</td>
                        <td  style="text-align:center;padding-top:15px;">06:00</td>
                      
                    </tr>
                    </tbody>
                </table>    
			</div>
		    <div class="row" style="text-align:right; margin-right:5px;">
            	<button type="button"  class="btn btn-sm btn-success" onclick="location.href='adminTimeInfo.do'">등록</button>
            	<button type="button"  class="btn btn-sm btn-default" >삭제</button>
            </div>

            </div>
             
        </div> 
            
         
   </div>  
</div>
</div>
