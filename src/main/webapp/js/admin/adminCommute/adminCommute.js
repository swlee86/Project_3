	
  //날짜 포맷팅 함수 - 현재 날짜 구함 
    function dateChek(){
	  	
    	var date = new Date();
    	var year  = date.getFullYear();
        var month = date.getMonth() + 1; // 0부터 시작하므로 1더함 더함
        var day   = date.getDate();

        if (("" + month).length == 1) { month = "0" + month; }
        if (("" + day).length   == 1) { day   = "0" + day;   }
    	//오늘 날짜 전역변수에도 담음
        var today = year+"-"+month+"-"+day;
        return today;
    }
  
  //디비 에서 읽어온 날짜.  매월 25일 임
    function db_dateChek(){
		var date = new Date();
    	var year  = date.getFullYear();
        var month = date.getMonth() + 1; // 0부터 시작하므로 1더함 더함
        var day   = "${pay_date}";
        if (("" + month).length == 1) { month = "0" + month; }
        if (("" + day).length   == 1) { day   = "0" + day;   }
    	//오늘 날짜 전역변수에도 담음
        var today = year+"-"+month+"-"+day;
    	return today;
    }
  

$(function(){
	$('#commuteForm').submit(function(){
		// 오늘 날짜 구함
		var today = dateChek();
		
		var dbdate = db_dateChek();
		
		var result2 = calDateRange(today,dbdate);
		
			
		// 기간이 5일 이하
		if(result2 <= 5){
		
			var commute_no2='';
			var emp_no = '';
			$("input[name=checkbox]:checked").each(function() {
				// pay_no.push($(this).val());
				var mgr_check = $(this).parent().parent().children().last().text();
				
				if(mgr_check != '확정'){
					commute_no2+=$(this).val() +",";
					emp_no +=$(this).parent().next().next().html()+",";
				}
			});
			 if(commute_no2 != ''){
				 // 번호값 뽑아서 셋팅함
				  $('#hiddenCommute').val(commute_no2);
				 $('#emp_no').val(emp_no);
				 return true;
			 }else{
				 toastr.warning("근태 마감하실 사원을 선택하세요");
				 return false;	 
			 }
		}else{
			toastr.warning("마감 기간이 아닙니다.");
			return false;
			
		}
		
	});
});