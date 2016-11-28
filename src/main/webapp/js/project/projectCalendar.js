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
			alert("이엪ㅁ피!!^^");
			var myno = data.emp_no;
			console.log("내꺼 이엠피 : " +myno);
			//내가 참여자로 들어가있는 것
			var data2 = data.list;
			//내가 쓴 프로젝트 리스트만
			var data3 = data.list;
			
			 for(var i = 0; i < data2.length; i++){
				 //console.log("제목  : " +data2[i].pj_title + " / 시작날 : "+data2[i].pj_start+" /종료날 "+data2[i].pj_end);
				
					 eventData= {
							 title: data2[i].pj_title ,
							 start: data2[i].pj_start,
							 end: data2[i].pj_end,
							 id : data2[i].pj_no
                 	}
				 
				 dbdate.push(eventData);
			 }
			 
			 for(var i = 0; i < data3.length; i++){
				 
				 eventData= {
	                       title: data3[i].pj_title ,
	                       start: data3[i].pj_start,
	                       end: data3[i].pj_end,
	                       id : "2"
	             }
				 dbdate.push(eventData);
			 }
			 
			 console.log("내가 참여자 : " +dbdate + " / 내가 쓴 것 : "+dbWdate);
			 
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
			events : dbWrite
			
		});
}
