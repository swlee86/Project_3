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

$(function() {
	
	//서브밋 함수 
	$('#documentForm').submit(function(){
		
		var selectChoose = $('#sanction_cg option:selected').val();
		
		if(selectChoose == '1'){
			
		}else if(selectChoose =='2'){
			
		}else if(selectChoose == '3'){
			
			var start = $('#vacationStartDate').val();
			var end = $('#vacationEndDate').val();
			var resultDate = calDateRange(start, end);		
			alert("날 차이 확인 : "+resultDate);
			
			
		}else {
			alert("문서 종류를 선택해 주세요 !");
			return false;
		}
		
		
		
	});
	
	//문서 종류 셀렉트 박스 선택시
	$('#sanction_cg').change(
			function() {
				var selectChoose = $('#sanction_cg option:selected').val();
				alert("선택하신 문서 : " + selectChoose);

				//협조문
				if (selectChoose == '1') {

					$.ajax({
						url : "CooperationDocument.do",
						dataType : "html",
						success : function(data) {
							$('#documentTable').empty();
							$('#documentTable').html(data);
						}
					});

					//대외발생
				} else if (selectChoose == '2') {

					$.ajax({
						url : "office.do",
						dataType : "html",
						success : function(data) {
							$('#documentTable').empty();
							$('#documentTable').html(data);
						}
					});

					//휴가신청	 
				} else if (selectChoose == '3') {

					$.ajax({
						url : "VacationDocument.do",
						dataType : "html",
						success : function(data) {
							$('#documentTable').empty();
							$('#documentTable').html(data);
							//휴가 시작일
							$('#vacationStartDate').datepicker(
									{
										changeMonth : true,
										dayNames : [ '월요일', '화요일', '수요일',
												'목요일', '금요일', '토요일', '일요일' ],
										dayNamesMin : [ '월', '화', '수', '목',
												'금', '토', '일' ],
										monthNamesShort : [ '1', '2', '3', '4',
												'5', '6', '7', '8', '9', '10',
												'11', '12' ],
										monthNames : [ '1월', '2월', '3월', '4월',
												'5월', '6월', '7월', '8월', '9월',
												'10월', '11월', '12월' ],
										dateFormat : 'yy-mm-dd',
										changeYear : true
									});
							//휴가 종료일
							$('#vacationEndDate').datepicker(
									{
										changeMonth : true,
										dayNames : [ '월요일', '화요일', '수요일',
												'목요일', '금요일', '토요일', '일요일' ],
										dayNamesMin : [ '월', '화', '수', '목',
												'금', '토', '일' ],
										monthNamesShort : [ '1', '2', '3', '4',
												'5', '6', '7', '8', '9', '10',
												'11', '12' ],
										monthNames : [ '1월', '2월', '3월', '4월',
												'5월', '6월', '7월', '8월', '9월',
												'10월', '11월', '12월' ],
										dateFormat : 'yy-mm-dd',
										changeYear : true
									});
						
						}
					});

				} else {
					alert("메뉴를 선택해주세요 !");
				}

			});

});