//
//작성 일 : 2016-12-02
//작성 자 : 하재현
//목   적  : 관리자 > 급여 관리 메뉴에서 사용하는 js 파일

var show = 0;

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
	
	
	//급여 설정 숨겨놓기
	$('#settingAddDate').hide();
	
	//급여 설정 폼 부분 보여주기
	$('#showBtn').click(function(){
		if(show == 0){
		$('#settingAddDate').show();
		show ++;	
		}else{
			$('#settingAddDate').hide();
			show=0; 
		}
		
	});
	
	//급여 설정 하기 - 
	$('#savepayDateBtn').click(function(){
		alert("저장 클릭");
		var set_date = dateChek();
			
		var hidden = $('#dayJudgement').val();
		alert('급여일 있니? : '+hidden);
		$.ajax
				(
						{
							url : "payAddDate.do",
							data : {
								        set_date: set_date,
										pay_date : $('#daySelect option:selected').val(),
										pay_date_num: hidden
							         },
							success : function(data){
								alert(data.result);
								window.location.reload();
							 },
							error : function(){
								alert('등록 실패');
							}
						}
				);
	});
	
	//상여금 지급 여부 설정 > 확정 버튼 클릭시
	$('#add_pay_div').click(function(){
		
		
		var dept_no='';
		
		$("input[name=checkboxadd]:checked").each(function() {
			var id = $(this).attr('id');
			
			dept_no+=id +",";
			alert(dept_no);
		});
		
		
		if(dept_no != ''){
			return true;
		}else{
			alert("지급 여부를 설정할 부서를 선택해주세요!");
			return false;
		}
		
	});
	
	
});

//급여 상세 보기 클릭시 실행 됨 - 
function detailPay(obj){
	
	var id = $(obj).attr("id");
	alert("버튼  아이디 값 : "+id);
	location.href="adminSalaryListDetail.do?date="+id;
}
	