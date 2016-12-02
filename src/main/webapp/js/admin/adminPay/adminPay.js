//
//작성 일 : 2016-12-02
//작성 자 : 하재현
//목   적  : 관리자 > 급여 관리 메뉴에서 사용하는 js 파일



$(function(){
	//급여 마감 조회
	$('#salaryCloseForm').submit(function(){
		alert("테스트!!");
		//var pay_no = new Array();
		var pay_no2='';
		$("input[name=checkbox]:checked").each(function() {
			//pay_no.push($(this).val());
			pay_no2+=$(this).val() +",";
		});
		
		
		if(pay_no2 != ''){
			$('#hiddenPay').val(pay_no2);
			return true;
		}else{
			alert("선택 요망!");
			return false;
		}
		
	});
	
	
	$('#savepayDateBtn').click(function(){
		alert("저장 클릭");
		alert($('#daySelect option:selected').val());
		
		var hidden = $('#dayJudgement').val();
		
		$.ajax
				(
						{
							url : "payAddDate.do",
							data : {day : $('#daySelect option:selected').val()},
							success : function(data){
								alert("성공!!");
							}
						}
				);
	});
	
});
