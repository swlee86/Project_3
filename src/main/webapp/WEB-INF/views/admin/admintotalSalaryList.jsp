<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 기지급 급여 목록 페이지 -->
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
			<h2 class="font-light m-b-xs"> <i onclick="location.href='adminSalaryView.do'" class="fa fa-chevron-circle-left"></i>&nbsp;&nbsp;급여 내역 조회</h2>
		</div>
	</div>
</div>

<div class="content animate-panel">
	<div class="row">
	
    <div class="col-lg-12">
        <div class="hpanel">
            <div class="panel-body">
					<div class="row text-right">
						<div class="col-md-6"></div>
						<form action="" class="form-inline ">
							<div class="col-md-6">
								<input type="text" class="form-control" id="totalSalListdate">
						              <button type="button" class="btn btn-sm btn-default"
							           id="TotalSalbtn">
							    <span id="searchicon" class="fa fa-search"></span>
						              </button>
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
                        <th  style="text-align:center;">날짜</th>
                        <th  style="text-align:center;">지급총액</th> 
                        <th  style="text-align:center;">공제총액</th>
                        <th  style="text-align:center;">실지급액</th>
                    </tr>
                    </thead>
                    
                     <tbody>
                  
                    <tr>
                        <td  style="text-align:center;"> 1 </td>
                        <td  style="text-align:center;"><a href="adminSalaryListDetail.do">2016-11</a></td>
                        <td  style="text-align:center;">6.000.000</td> 
                        <td  style="text-align:center;">1.000.000</td>
                        <td  style="text-align:center;">5.000.000</td>
                    </tr>
                      <tr>
                      <td  style="text-align:center;"> 2 </td>
                        <td  style="text-align:center;"><a href="adminSalaryListDetail.do">2016-10</a></td>
                        <td  style="text-align:center;">6.000.000</td> 
                        <td  style="text-align:center;">1.000.000</td>
                        <td  style="text-align:center;">5.000.000</td>
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
                    