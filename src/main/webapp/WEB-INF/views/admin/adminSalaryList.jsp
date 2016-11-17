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
				<div class="p-sm">
					<span class="vertical-date pull-right"> Saturday <br /> <small>12:17:43
							PM</small>
					</span>
				</div>
			</div>
			<h2 class="font-light m-b-xs">당월 지급 예정 급여 내역</h2>
		</div>
	</div>
</div>


<div class="content animate-panel">
	<div class="row">
	
    <div class="col-lg-12">
        <div class="hpanel">
            <div class="panel-heading">
                	전체 사원: <font color="#ff757f">100</font> 명
            </div>
            <div class="panel-body">
					<div class="row text-right">
						<div class="col-md-7"></div>
						<form action="" class="form-inline ">
							<div class="col-md-2">
								<div class="form-group">
									<select class="form-control input-sm">
										<option>지점</option>
										<option>부서</option>
										<option>하위부서</option>
										<option>사번</option>
										<option>이름</option>
									</select>
								</div>
							</div>

							<div class="col-md-3">
								<div class="form-group">
									<div class="input-group">
										<input type="text" class="form-control input-sm" name="salaryPlaninput" />
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
                        <th  style="text-align:center;"> NO </th>
                        <th  style="text-align:center;">사 번</th>
                        <th  style="text-align:center;">이 름</th> 
                        <th  style="text-align:center;">지점</th>
                        <th  style="text-align:center;">부서</th>
                        <th  style="text-align:center;">하위 부서</th>
                        <th  style="text-align:center;">직위</th>
                        <th  style="text-align:center;">총 근무시간</th>
                        <th  style="text-align:center;">총 추가 근무시간</th>
                        <th  style="text-align:center;">확정 여부</th>
                        <th  style="text-align:center;">실지급액</th>
                    </tr>
                    </thead>
                    
                    <tbody>
                  
                    <tr>
                      <th  style="text-align:center;"> 1 </th>
                        <th  style="text-align:center;">91001111</th>
                        <th  style="text-align:center;">박지은</th> 
                        <th  style="text-align:center;">서울</th>
                        <th  style="text-align:center;">개발부</th>
                        <th  style="text-align:center;">개발1팀</th>
                        <th  style="text-align:center;">대리</th>
                        <th  style="text-align:center;">70:00</th>
                        <th  style="text-align:center;">70:00</th>
                        <th  style="text-align:center;">확정</th>
                        <th  style="text-align:center;">1.000.000</th>
                    </tr>
                    <tr>
                        <th  style="text-align:center;"> 2</th>
                        <th  style="text-align:center;">91001111</th>
                        <th  style="text-align:center;">박지은</th> 
                        <th  style="text-align:center;">서울</th>
                        <th  style="text-align:center;">개발부</th>
                        <th  style="text-align:center;">개발1팀</th>
                        <th  style="text-align:center;">대리</th>
                        <th  style="text-align:center;">70:00</th>
                        <th  style="text-align:center;">70:00</th>
                        <th  style="text-align:center;">확정</th>
                        <th  style="text-align:center;">1.000.000</th>
                    </tr>
                    </tbody>
                </table>    
			</div>
		    <div class="row" style="text-align:right; margin-right:5px;">
            	<button type="button"  class="btn btn-sm btn-success" onclick="location.href='adminSalaryView.do'">목록</button>
            </div>	
		  </div>		
		</div> 	       
   </div>  
</div>
</div>		

