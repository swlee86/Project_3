/**
 * 작성일 : 2016-11-28 작성자 : 박성준 목 적 : 풀캘린더 관련 스크립트 파일
 */


var dbdate = [];
$(function() {
	
	
	
	var date = new Date();
	var d = date.getDate();
	var m = date.getMonth();
	var y = date.getFullYear();
	
	
	$.ajax({
		url : "projectcalendarData.do",
		dataType : "json",
		
		success : function(data) {
			
			//내가 참여자로 들어가있는 것
			var data2 = data.list;
			//내가 쓴 프로젝트 리스트만
			//var data3 = data.list;
			
			var loginEmp_no = data.emp_no;
			
			
			 for(var i = 0; i < data2.length; i++){
				 
				 
				 //console.log("제목  : " +data2[i].pj_title + " / 시작날 : "+data2[i].pj_start+" /종료날 "+data2[i].pj_end);
				 //console.log("#######이엠피 엔오 : " +data2[i].emp_no+ "  / 내 이엠피 로그인  : "+loginEmp_no);
				 if(loginEmp_no == data2[i].emp_no){
				 //내가 쓴 것
					eventData= {
							 title: data2[i].pj_title ,
							 start: data2[i].pj_start,
							 end: data2[i].pj_end,
							 id : data2[i].pj_no, 
							 backgroundColor : "#9b59b6",
							 color:"#9b59b6"
				 			}

				 dbdate.push(eventData);
				 }else{
					 //내가 참여자
					 eventData= {
						 title: data2[i].pj_title ,
						 start: data2[i].pj_start,
						 end: data2[i].pj_end,
						 id : data2[i].pj_no,
						 dept : data2[i].dept_name,
						 name : data2[i].emp_name,
						 backgroundColor : "#F0AD4E",
						 color:"#F0AD4E"
				 	}
				dbdate.push(eventData);	 	
				 }
				 
			 }
	
			 
			 calendar();
		},
		error : function(request, status, error) {
			if (request.status != '0') {
				alert("code : " + request.status
						+ "\r\nmessage : "
						+ request.reponseText + "\r\nerror : "
						+ error);
			}
		}
	});
	
	
	//calendar.fullCalendar('renderEvent', eventData , true);
	
	
});

function goProejct(){
	
	
	/*console.log("0번째 c차일드  이큐ㄹㄹ부모 의 이전 : " +$(this).parent().prev().children().eq(0).val());*/
	console.log("자식놈 까지만 html : " +$(this).parent().prev().text());
	
}

function calendar(){
	$('#fullCal').fullCalendar(
			{
			header : {
				left : 'prev,next today',
				center : 'title',
				right : 'month,agendaWeek,agendaDay'
			},

			selectable : true, // 사용자가 클릭 및 드래그하여 선택을 할 수 있도록
			selectHelper : true,// 사용자가 드래그되는 동안 "자리"이벤트를 그릴 것인지 여부를 지정할 수
								// 있습니다.
			editable : false, // 수정 가능
			
			// DB에서 가져온 값으로 해당 날짜에 붙이는 기능
			events : dbdate,
			eventClick: function(event){
				console.log("이벤트 확인좀 : "+event.id);
				//시작 날짜
				var startDate = new Date(event.start);
				startDate=dateToYYYYMMDD(startDate);
				
				var endDate = new Date(event.end);
				endDate=dateToYYYYMMDD(endDate);
				
				$('#CalendarModal').modal();
				$('#charge').html(event.name);
				$('#depart').html(event.dept);
				$('#projectId').html(event.title);
				$('#startDate').html(startDate);
				$('#endDate').html(endDate);
				$('#hiddenCal').html(event.id);
				var resultDate = calDateRange(startDate, endDate);
				$('#playProject').html(resultDate);
			}
			
		});
}

//날짜 format 변환 함수
function dateToYYYYMMDD(date){
    function pad(num) {
        num = num + '';
        return num.length < 2 ? '0' + num : num;
    }
    return date.getFullYear() + '-' + pad(date.getMonth()+1) + '-' + pad(date.getDate());
}

//날짜 차이 구하는 함수
function calDateRange(val1, val2)
{
 var FORMAT = "-";
 // FORMAT을 포함한 길이 체크
 if (val1.length != 10 || val2.length != 10)
     return null;
 // FORMAT이 있는지 체크
 if (val1.indexOf(FORMAT) < 0 || val2.indexOf(FORMAT) < 0)
     return null;
 // 년도, 월, 일로 분리
 var start_dt = val1.split(FORMAT);
 var end_dt = val2.split(FORMAT);
 // 월 - 1(자바스크립트는 월이 0부터 시작하기 때문에...)
 // Number()를 이용하여 08, 09월을 10진수로 인식하게 함.
 start_dt[1] = (Number(start_dt[1]) - 1) + "";
 end_dt[1] = (Number(end_dt[1]) - 1) + "";

 var from_dt = new Date(start_dt[0], start_dt[1], start_dt[2]);
 var to_dt = new Date(end_dt[0], end_dt[1], end_dt[2]);
 var result = (to_dt.getTime() - from_dt.getTime());
 var result1 = result/1000/60/60/24;
 return result1;
}



