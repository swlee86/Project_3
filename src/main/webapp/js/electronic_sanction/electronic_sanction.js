 
//우편 API 사용 시 씀.
function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
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