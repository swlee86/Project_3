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
			<div class="row">
				<div class="form-group col-sm-4">
					<h2 class="font-light m-b-xs">급여 조회</h2>
				</div>
			</div>
			<form class="form-inline">
	    		<label class="form-control">급여연월</label>
	    		<input type="text" class="form-control" id="Monthly">
				<button type="button" class="btn btn-sm btn-default" id="MonthlySal">
					<span id="searchicon" class="fa fa-search"></span>
				</button>		 
			</form>
          </div>
	   </div>
	</div>
 			

<!--월별 급여 보기-->

<div class="content animate-panel">
	<div class="row">
	   <div class="col-sm-12">
			<div class="hpanel style="text-align: center">
    		   <div class="panel-body">
					<h4>
						<i class="pe-7s-angle-right"></i><span class="font-icon-name"></span>&nbsp;&nbsp;&nbsp;급여정보
					</h4>
					<div class="table-responsive">
						<table cellpadding="1" cellspacing="1" class="table table-bordered">
							<tr>
								<td>지급기준일</td>
								<td>2016-11-25</td>
								<td>지급총액</td>
								<td>20.000.000</td>
								<td>공제총액</td>
								<td>1.000.000</td>
								<td>실지급액</td>
								<td>19.000.000</td>
							</tr>
					
						</table>
					</div>
				</div>
			</div>
		</div>
   </div>
   </div>

<div class="content animate-panel">
	<div class="row">
	
		<div class="col-sm-12">
			<div class="hpanel" style="text-align: center">

				<div class="panel-body">
					<div class="table-responsive">
						<table cellpadding="1" cellspacing="1" class="table table-bordered">
							<tr>
								<th colspan="1" style="text-align:center">No</th>
								<th colspan="2" style="text-align:center">지급항목</th>
							    <th colspan="2" style="text-align:center">공제항목</th>
							</tr>
						<tr>
							    <td>1</td>	  
								<td>기본급</td>
								<td>100</td>	
								<td>소득세</td>
								<td>10</td>		
							</tr>
						    <tr>
							    <td>2</td>
								<td>휴일근무수당</td>
								<td>100</td>
								<td>주민세</td>
								<td>10</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>



     </div>
   </div>

			
<!--월별 캘린더.-->  
<script src="<c:url value="/js/jquery.mtz.monthpicker.js"/>"></script> 
	
<script>
$(function(){
	var currentYear = (new Date()).getFullYear();
    var startYear = currentYear-10;
	var options = {
	           startYear: startYear,
	           finalYear: currentYear,
	           pattern: 'yyyy-mm',
	           monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
	   };
	//데이트피커
	$('#Monthly').monthpicker(options);
	//$('#sevdate1').monthpicker(options);
	
	$('#searchicon').click(function(){
		var date = $('#Monthly').val();
		alert("선택한 날짜 : "+date);
		
	});
	

		
});
</script>		
	
			
			