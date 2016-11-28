/**
 * 작성일 : 2016-11-28
 * 작성자 : 박성준
 * 목 적 : 풀캘린더 관련 스크립트 파일
 */

$(function() {

	$('#fullCal').fullCalendar({
		defaultDate : "2016-05-12",
		editable : true,
		eventLimit : true,
		eventSources : [ {
			// 배경색이 빨간색인 이벤트
			events : [ {
				title : "All Day Event",
				start : "2016-05-03"
			}, {
				title : "Long Event",
				start : "2016-05-07",
				end : "2016-05-10"
			}, {
				title : "Long Event",
				start : "2016-05-07",
				end : "2016-05-10"
			}, {
				title : "Long Event",
				start : "2016-05-07",
				end : "2016-05-10"
			}, {
				title : "Long Event",
				start : "2016-05-07",
				end : "2016-05-10"
			}, {
				title : "Long Event",
				start : "2016-05-07",
				end : "2016-05-10"
			}

			],
			color : "#FF0000",
			textColor : "#FFFF00"
		}, {
			// 배경색이 파랑색인 이벤트
			events : [ {
				title : "All Day Event",
				start : "2016-05-27"
			}, {
				title : "Long Event",
				start : "2016-05-17",
				end : "2016-05-19"
			} ],
			color : "#0000FF",
			textColor : "#FFFFFF"
		}, {
			// 배경색이 초록색인 이벤트
			events : [ {
				title : "All Day Event",
				start : "2016-05-21"
			}, {
				title : "Long Event",
				start : "2016-05-23",
				end : "2016-05-26"
			} ],
			color : "#00CC00",
			textColor : "#000000"
		} ]
	});
});
