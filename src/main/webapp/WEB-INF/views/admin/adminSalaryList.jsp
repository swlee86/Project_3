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
			<h2 class="font-light m-b-xs">급여 관리 페이지</h2>
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
										<option>사번</option>
										<option>이름</option>
										<option>부서</option>
										<option>하위부서</option>
									</select>
								</div>
							</div>

							<div class="col-md-3">
								<div class="form-group">
									<div class="input-group">
										<input type="text" class="form-control input-sm" name="salaryinput" />
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
                        <th  style="text-align:center;">하위 부서</th>
                        <th  style="text-align:center;">직위</th>
                        <th  style="text-align:center;">입사일자</th>
                        <th  style="text-align:center;">연락처</th>
                    </tr>
                    </thead>
                    
                    <tbody>
                  
                    <tr>
                        <td  style="text-align:center;">2</td>
                        <td  style="text-align:center;">91001111</td>
                        <td  style="text-align:center;"><a href="adminSalaryDetail.do">이지은</a></td>
                        <td  style="text-align:center;">전문경영</td>
                        <td  style="text-align:center;">대리</td>
                        <td  style="text-align:center;">2010-05-05</td>
                        <td  style="text-align:center;">01011111111</td>
                    </tr>
                    <tr>
                        <td  style="text-align:center;">1</td>
                        <td  style="text-align:center;">91001111</td>
                        <td  style="text-align:center;"><a href="adminSalaryDetail.do">박지은</a></td>
                        <td  style="text-align:center;">전문경영</td>
                        <td  style="text-align:center;">차장</td>
                        <td  style="text-align:center;">2010-10-05</td>
                        <td  style="text-align:center;">01011111111</td>
                    </tr>
                    </tbody>
                </table>    
			</div>
		    <div class="row" style="text-align:right; margin-right:5px;">
            	<button type="button"  class="btn btn-sm btn-success" onclick="location.href='adminSalaryManage.do'">등록</button>
            </div>	
		  </div>		
		</div> 	       
   </div>  
</div>
</div>		

