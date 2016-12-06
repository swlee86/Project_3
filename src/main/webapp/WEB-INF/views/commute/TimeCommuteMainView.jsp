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
	
<div class="row">
	<div class="col-lg-12">
		<div class="normalheader transition animated fadeIn">
			<div class="hpanel">
				<div class="panel-heading hbuilt">
					<form action="" class="form-inline">
						<label class="form-control">일일근태</label>  
						<!-- <input type="text" class="form-control" id="mydate">
						<button type="button" class="btn btn-sm btn-default" id="addCommute">
							<span class="fa fa-search"></span>
						</button> --> 

					</form>

				</div>
				<div class="panel-body">
					<br />

					<div class="row">
						<div class="col-lg-12">
							<div class="col-md-9">
								<input class="btn btn-info" type="button" value="출근" id="startWorkBtn">
									 &nbsp;&nbsp;&nbsp;
								<input class="btn btn-primary2" type="button" value="퇴근" id="endWorkBtn">
							</div>
							<div class="col-md-3">
								<div id="flipcountdownbox1" class="xdsoft" align="right"></div>
							</div>
						</div>
					</div>
					<br>
					<div class="panel-body">
		                <div>
		                    <div id="CommuteChart"></div>
		                </div>
		            </div>
					<br />
					<div class="table-responsive">
						<table cellpadding="1" cellspacing="1"
							class="table table-bordered table-striped"">
							<tr>
								<th>사원번호</th>
								<th>성명</th>
								<th>출근시각</th>
								<th>퇴근시각</th>
								<th>근무시간</th>
							</tr>
							<tr>
								<td id="commute_empno">${commute.emp_no}</td>
								<td id="commute_empname">${commute.emp_name}</td>
								<td id="start">${commute.in_time}</td>
								<td id="end">${commute.out_time}</td>
								<td id="workTime">${commute.commute_time}</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<script  src="vendor/flipcountdown-master/jquery.min.js"></script>
<script  src="vendor/flipcountdown-master/jquery.flipcountdown.js"></script>
<link rel="stylesheet" type="text/css" href="vendor/flipcountdown-master/jquery.flipcountdown.css" />
<script>
// 디지털 시계
jQuery(function($){
	$('#flipcountdownbox1').flipcountdown({
		size:"sm"

	});
});
</script>


<script src="vendor/jquery/dist/jquery.min.js"></script>
<script>
	//전역변수 - 시작 날짜 시간 
	var startWorkStatus = new Date();
	//전역변수 - 퇴근 날짜 시간
	var endWorkStatus = new Date();
	//전역변수 - 조퇴 날짜 시간
	/* var stopWorkStatus = new Date(); */

	$(function() {

		//시작 시간
		var stTime = $('#start').html();
		//종료 시간
		var endTime = $('#end').html();
		
		//workingTime(stTime, endTime);

		//데이트피커
		$('#mydate').datepicker(
				{
					changeMonth : true,
					dayNames : [ '월요일', '화요일', '수요일', '목요일', '금요일', '토요일',
							'일요일' ],
					dayNamesMin : [ '월', '화', '수', '목', '금', '토', '일' ],
					monthNamesShort : [ '1', '2', '3', '4', '5', '6', '7', '8',
							'9', '10', '11', '12' ],
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					dateFormat : 'yy-mm-dd'
				});

		//출근 버튼 클릭시 - ajax 로 현재시간 디비에 넣어줘야 함.
		$('#startWorkBtn').click(function() {

			if(stTime==''){
				var date = new Date();
				//시간
				var h = date.getHours();
				h = checkTime(h);
				//분
				var m = date.getMinutes();
				m = checkTime(m);
				
				//출근시간 전역 변수에 셋팅
				startWorkStatus.setHours(h, m, 0, 0);

				var startTime = h+":"+m;
				//$('#start').html(h + ":" + m);

				//시작 시간
				//stTime = $('#start').html();

				//종료 시간
				//endTime = $('#end').html();
				//workingTime(stTime, endTime);
				
				
				$.ajax(
						 {
							url : "insertCommute_in.do",
							data : {
										in_time : startTime,
										//,emp_no : '91001050',  //현 로그인 계쩡의 emp_no로 수정해야함
								   },
							success : function(data){	
								if(data.result=="2"){
									alert("출근시간 오류!\n관리자에게 문의하세요")
								}else{
									console.log("@@@@@@@@@@@@data: "+data + "/ data.emp : "+data.emp);
									console.log("data.emp.emp_no : "+data.emp.emp_no);
									console.log("data.emp.emp_name : "+data.emp.emp_name);
									$('#start').html(startTime);
									$('#commute_empno').html(data.emp.emp_no);
									$('#commute_empname').html(data.emp.emp_name);
								}
							}
						 }
				)
			}
		});

		//퇴근 버튼 클릭시 - ajax 로 현재 시간 디비에 넣어줘야 함.
		$('#endWorkBtn').click(function() {
			
			if(stTime!='' && endTime==''){
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
				
				$.ajax(
						 {
							url : "updateCommute_out.do",
							data : {
										out_time : $("#end").html()
										/* ,emp_no : '91001050', */
								   },
							success : function(data){			
								
								}
							} 
				)
			}
		});
		
		//조퇴 버튼 클릭시 - ajax 로 현재 시간 디비에 넣어줘야 함.
		/* $('#stopWorkBtn').click(function() {
			var date = new Date();
			var h = date.getHours();
			h = checkTime(h);
			var m = date.getMinutes();
			m = checkTime(m);
			$('#stop').html(h + ":" + m);

			endWorkStatus.setHours(h, m, 0, 0);

			//시작 시간
			stTime = $('#start').html();
			//종료 시간
			endTime = $('#end').html();
			workingTime(stTime, endTime);
		}); */

		
		
				
	});

	//근무시간 구하는 함수.
	function workingTime(stTime, endTime) {

		var st = $('#start').html();
		var h = st.substr(0,2);
		var m = st.substr(3,5);

		startWorkStatus.setHours(h,m,0,0);

		var st = stTime;
		var et = endTime;

		if (st != '' && et != '') {	
			/* 	var sthour = st.substr(0,2);
				//분
				var stMin = st.substr(3,5);
					
				//퇴근 시간 자른 부분
				var enhour = et.substr(0,2);
				var enMin = et.substr(3,5);
				
			 */
			//alert("전역 : " + endWorkStatus + "/" + startWorkStatus);

			//시간
			var resultHour = (endWorkStatus - startWorkStatus) / 60000 / 60;
			var resultHour2 = Math.floor(resultHour);
			
			var tempHour = 60*resultHour2;
			
			//분
			var result = ((endWorkStatus - startWorkStatus) / 60000 -tempHour);
			resultMin = checkTime(result);
			resultHour = checkTime(resultHour2);

			var resultTime = resultHour + ":" + resultMin;
	
			$('#workTime').html(resultTime);
			var emp_no_val;
			
			$.ajax(
					 {
						url : "updateCommute_commutetime.do",
						data : {
									commute_time : $("#workTime").html()
									//,emp_no : '91001050',  //현 로그인 계쩡의 emp_no로 수정해야함
							   },
						success : function(data){	
							console.log("updateCommute_commutetime ajax : "+data.emp_no);
							emp_no_val = data.emp_no;
							
							$.ajax(
									 {
										url : "updateCommute_add.do",
										data : {
													emp_no : emp_no_val
											   },
										success : function(data){
											$.ajax(
													 {
														url : "updateCommute_acc.do",
														data : {
																	emp_no : emp_no_val
															   },
														success : function(data){
															
														}
													 }
											)
										}
									 }
							)
						}
					 }
			)
		} else {
			//alert("else 탐");
			$('#workTime').html("00:00");
		}

	}

	//시간 0 붙여주기
	function checkTime(i) {
		if (i < 10) {
			i = "0" + i;
		}
		return i;
	}
</script>



<!-- c3 Stacked Bar Chart 차트 -->
<link rel="stylesheet" href="vendor/c3/c3.min.css" />
<script src="vendor/d3/d3.min.js"></script>
<script src="vendor/c3/c3.min.js"></script>
<script>
$(function(){
	var jsondata = ${chartcommute};
	var regdate = [];
	var c_time = [];
	var a_time = [];
	c_time.push('정상근무시간');
	a_time.push('추가근무시간');
	 $.each(jsondata.chartlist,function(index,obj){
		 regdate.push(obj.regdate);
		 c_time.push(obj.c_time);
		 a_time.push(obj.a_time);
		 console.log(obj.regdate +"/"+obj.c_time+"/"+obj.a_time);
	 });
	c3.generate({
		 bindto: '#CommuteChart',
		 
         data:{

             columns: [
            	 c_time,
            	 a_time
             ],
             colors:{
            	 정상근무시간: '#62cb31',
            	 추가근무시간: '#ffb606'
             },
             type: 'bar',
             groups: [
                 ['정상근무시간', '추가근무시간']
             ]
         },
         axis : {
             x : {
            	  type: 'category',
                  categories: regdate,
                  tick: {
                     entered: true,
                 },
            
             },
             y:{
            	 tick:{
            		 format : function(d){return d+'분';}
            	 }
             }
         }
	});
		
});

</script>