<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--근태 관리 메인 페이지-->
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
			<h2 class="font-light m-b-xs">일일근태등록</h2>
		</div>
	</div>
</div>
<div class="normalheader transition animated fadeIn">    
    <div class="hpanel">
    	<div class="panel-body">
    		<form class="form-inline">
	    		<label class="form-control">일일근태</label>
	    		<input type="text" class="form-control" id="mydate">
				<button type="button" class="btn btn-sm btn-default" id="addAttendace">
					<span class="fa fa-search"></span>
				</button>		 
			</form>
    	</div>
    </div>
</div>    
<div class="row">
<div class="col-lg-12">
<div class="normalheader transition animated fadeIn">    
    <div class="hpanel">
    	<div class="panel-body">
    		<div class="row">
    			<div class="col-sm-10">
    				<h4>접속 IP : ${ip}</h4>
			     </div>
			     <div class="col-sm-1">
			     	    <input class="btn btn-default" type="button" value="출근" id="startWorkBtn">
			     </div>
			     <div class="col-sm-1">
				     	<input class="btn btn-default" type="button" value="퇴근" id="endWorkBtn">
				 </div>	
			</div>     
			<br/><br/>     
				<div class="table-responsive">
				     <table cellpadding="1" cellspacing="1" class="table table-bordered table-striped"">
				     	<tr>
				     		<th>사원번호</th>
				     		<th>성명</th>
				     		<th>출근시각</th>
				     		<th>퇴근시각</th>
				     		<th>근무시간</th>
				     	</tr>
				     	<tr>
				     		<td>테스트</td>
				     		<td>박성준</td>
				     		<td id="start"></td>
				     		<td id="end"></td>
				     		<td id="workTime"></td>
				     	</tr>
				     </table>
			    </div> 
    		
    	</div>
    </div>
</div>
</div>
</div>

<script src="vendor/jquery/dist/jquery.min.js"></script>


<script>
//전역변수 - 시작 날짜 시간 
var startWorkStatus = new Date();
//전역변수 - 퇴근 날짜 시간
var endWorkStatus = new Date();

	$(function(){
		
		//시작 시간
		var stTime = $('#start').html();
		//종료 시간
		var endTime = $('#end').html();
		workingTime(stTime, endTime);
		
		//데이트피커
		$('#mydate').datepicker({
			     changeMonth: true, 
		         dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
		         dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
		         monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
		         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		         dateFormat: 'yy-mm-dd'
		});	
		
		//출근 버튼 클릭시 - ajax 로 현재시간 디비에 넣어줘야 함.
		$('#startWorkBtn').click(function(){
			
			var date = new Date();
			//시간
			var h = date.getHours();
			h = checkTime(h);
			//분
			var m = date.getMinutes();
			m = checkTime(m);
			
			//출근시간 전역 변수에 셋팅
			startWorkStatus.setHours(h, m, 0, 0);
			
			$('#start').html(h + ":" + m);

			//시작 시간
			stTime = $('#start').html();
			
			//종료 시간
			endTime = $('#end').html();
			workingTime(stTime, endTime);
			
		});
		
		//퇴근 버튼 클릭시 - ajax 로 현재 시간 디비에 넣어줘야 함.
		$('#endWorkBtn').click(function(){
			var date = new Date();
			var h = date.getHours();
			h = checkTime(h);
			var m = date.getMinutes();
			m = checkTime(m);
			$('#end').html(h + ":" + m);
			
			endWorkStatus.setHours(h, m, 0, 0);
		
			//시작 시간
			stTime = $('#start').html();
			//종료 시간
			endTime = $('#end').html();
			workingTime(stTime, endTime);
		});
		
		
		
	});
	
	//근무시간 구하는 함수.
	function workingTime(stTime, endTime){
		
		var st = stTime;
		var et = endTime;
		
		if(st != '' && et != ''){
		 
		/* 	var sthour = st.substr(0,2);
			//분
			var stMin = st.substr(3,5);
				
			//퇴근 시간 자른 부분
			var enhour = et.substr(0,2);
			var enMin = et.substr(3,5);
			
		 */	
			alert("전역 : "+endWorkStatus+"/"+startWorkStatus);
			
		 	 //분
		     var result = (endWorkStatus-startWorkStatus)/60000;
		     checkTime(result); 
		 	 
		     //시간
		 	 var resultHour = (endWorkStatus-startWorkStatus)/60000 / 60; 
			 var resultHour2 = Math.floor(resultHour)
		     
		     
		 	 alert("시간 ? "+resultHour2);
		 	 
			 var resultTime = resultHour2 + " : " + result; 
			 
			 $('#workTime').html(resultTime);
		}else{
			alert("else 탐");
			$('#workTime').html("00:00");
		}
		
	}
	
	
	
	//시간 0 붙여주기
	function checkTime(i){
		if(i<10){
			i = "0"+i;
		}	
		return i;
	}
	
</script>
