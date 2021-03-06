//
//작성 일 : 2016-12-02
//작성 자 : 하재현
//목   적  : 관리자 > 급여 관리 메뉴에서 사용하는 js 파일

var show = 0;

$(function(){
	//급여 마감 조회
	$('#salaryCloseForm').submit(function(){
		
		var today = dateChek();
		var dbdate = db_dateChek();
		var result2 = calDateRange(today,dbdate);
		//alert(" 날짜 차이============today :"+ today+"dbdate : "+dbdate +" 날짜차이   "+result2);
		//기간이 3일 이하
		if(result2 <= 3){
		//if(result2 == 0){
		var pay_no2='';
		$("input[name=checkbox]:checked").each(function() {
			
			pay_no2+=$(this).val() +",";
		});
		
			if(pay_no2 != ''){
			//pay_no
				$('#hiddenPay').val(pay_no2);
				//급여일
				$('#hidden_date').val(dbdate);
				return true;
			}else{
				toastr.warning("급여 마감하실 사원을 선택하세요!");
				return false;
			}
		
		}else{
			toastr.warning("마감 기간이 아닙니다.");
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
		var set_date = dateChek();
			
		var hidden = $('#dayJudgement').val();
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
								toastr.warning(data.result);
								window.location.reload();
							 },
							error : function(){
								toastr.warning('등록 실패');
							}
						}
				);
	});
	
	//상여금 지급 여부 설정 > 확정 버튼 클릭시
	$('#add_pay_div').click(function(){
		
		var arr = new Array();
		var dept_no='';
		
		$("input[name=checkboxadd]:checked").each(function() {
			
			var obj = new Object();
			
			dept_no = $(this).attr('id');
			var bonus_check = $("#selectbonus"+dept_no+" option:selected").text();
		
		    obj.dept_no=dept_no;
			obj.bonus_check=bonus_check;
			
			arr.push(obj);
		});
		
		
		if(dept_no != ''){
			//return true;
			
			 var param = JSON.stringify(arr);
			    
				$.ajax(
						   {
								url : "give_bonus_check.do",
								type: "post",
								data : {
											param : param
								       },
								success : function(data){
		                          
									swal({
		                                title: "상여금 지급 여부 확정",
		                                text: "지급 확정에 성공하였습니다",
		                                type: "success"
		                            });	
		                            
		                            window.location.reload();
								}
				           }
				      );
			
		}else{
			toastr.warning("지급 여부를 설정할 부서를 선택해주세요!");
			return false;
		}
		
		
	});
	
	
	//급여 마감 전체선택 체크박스 
	$('#allCheck').click(function(){
		if($("#allCheck").prop("checked")) {
			$("input[type=checkbox]").prop("checked",true);
		}else{
			$("input[type=checkbox]").prop("checked",false);
		}				
	});
	
});

//급여 상세 보기 클릭시 실행 됨 - 
function detailPay(obj){
	
	var id = $(obj).attr("id");
	location.href="adminSalaryListDetail.do?date="+id;
}


//디비 에서 읽어온 날짜.  매월 25일 임
function db_dateChek(){
	var date = new Date();
	var year  = date.getFullYear();
    var month = date.getMonth() + 1; // 0부터 시작하므로 1더함 더함
    var day   = $('#give_dateC').val();
   
    if (("" + month).length == 1) { month = "0" + month; }
    if (("" + day).length   == 1) { day   = "0" + day;   }
	//오늘 날짜 전역변수에도 담음
    var today = year+"-"+month+"-"+day;
	
    
    return today;
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
