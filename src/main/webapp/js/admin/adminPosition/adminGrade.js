/*
 * 작성일 : 2016-11-29
 * 작성자 : 박성준
 * 사용목적 : 직위 관련  스크립트
 */

//position 생성자
function position(position_name, step, basic_pay,set_date, add_pay){
	this.position_name = position_name;
	this.step = step;
	this.basic_pay = basic_pay;
	this.set_date = set_date;
	this.add_pay = add_pay;
}

//model 객체 정보 담을 배열
var positionArray=[];
//객체 배열
var oopArray = new Array();

$(function(){	
	var test = $('#hidin').val();
	positionArray=test;
	for(var i = 0; i < positionArray.length; i++){
		oopArray.push(new position(positionArray[i].position_name, positionArray[i].step, positionArray[i].basic_pay,positionArray[i].set_date,positionArray[i].add_pay));
	}
	
	$.each(oopArray,function(index){
		console.log("객체index배열 : "+oopArray[index]);
	});
	
	
	//기본 null 포인트 체크
	$('#addBtn').click(function(){
		
		//var basicPay = $('#basicPay').val();
		
		if($('#positionName').val() == ''){
			alert("직위 이름을 입력해 주세요 !");
			$('#positionName').focus();
			return false;
		}else if($('#basic_pay').val() == ''){
			alert("기본급여를 입력해주세요 !");
			$('#basic_pay').focus();
			return false;
		}else if($('#add_pay').val() == ''){
			alert("추가 급여를 입력해주세요 !");
			$('#add_pay').focus();
			return false;
		}
		
		checkPositionName();
		
	});
	
	//직위 정보 조회
	$('#modifyForm').submit(function(){
			//직위 번호
		var date = new Date();
		var year  = date.getFullYear();
        var month = date.getMonth() + 1; // 0부터 시작하므로 1더함 더함
        var day   = date.getDate();
    
        if (("" + month).length == 1) { month = "0" + month; }
        if (("" + day).length   == 1) { day   = "0" + day;   }
       
        //오늘 날짜 선택
        var mydate = year+"-"+month+"-"+day;
        
		
		var choosePosition = '';
		 $("select option:selected").each(function () {
	         choosePosition = $(this).val();
	      });
		
		 alert("번호 ? : "+choosePosition);
		 $('#position_no').val(choosePosition);
		 $('#step').val(choosePosition);
		 $('#set_date').val(mydate);
		 return true;
	});
	
	
	//직위 리스트 보기 추가 버튼 클릭 시
	$('#saveBtn').click(function(){
		//li 에 있는 것 담는다.
		var itemid = [];
		itemid = $.makeArray($('li').map(function(){
			return $(this).attr('value');
		}));
		console.log("배열 : "+itemid + " / 크기 : "+itemid.length);
		/*$.ajax(
				{
					url : "positionInsert.do",
					data : {
								
						   },
					success : function(data){
						
					}
				}
				
		      );*/
	});
	
});

//직위 등록시 유효성 검사.
function checkPositionName(){
		//내가 입력한 직위 이름
	var position = $('#positionName').val();
	
	//기존에 있는 li 읽어와서 각각 값 가져옴
	var itemid = [];
	itemid = $.makeArray($('li').map(function(){
		return $(this).attr('value');
	}));
	
	
	var searchResult = '';
	//비교 하는 for 문
	for(var i = 0; i < itemid.length; i++){
		if(position == itemid[i]){
			searchResult = '0';
			break;
		}else{
			searchResult = '1';
		}
	}
	
	alert("비교 결과avda : "+searchResult);
	if(searchResult == '0'){
		alert("이미 있는 아이디 입니다. 다른 이름을 입력해 주세요 !");
		return;
	}else{
		alert("등록 성공!");
		//내가 입력한것을 li 태그로 추가해줌
		var li = "<li class='gradLi ui-sortable-handle' value='"+position+"'><i class='fa fa-thumbs-o-up'></i>"+position+"</li>";
		//ul - li 에 추가
		$('#sortable').append(li);
	}
	
}

//정보 조회 - 셀렉트 박스 onchange 이벤트
function selectPosition(){
	var choosePosition = '';
	 $("select option:selected").each(function () {
         choosePosition = $(this).val();
      });
	 
	 if(choosePosition != '' || choosePosition != null){
		 alert("선택 : "+choosePosition);
		 $.ajax(
			 {
				 url:"adminGradeSelect.do",
				 type : "get",
				 data : 
				 {
					choose : choosePosition
				 },
				 dataType : "json",
				 success : function(data){
					 $('#dbpositionName').val('');
					 $('#dbbasic_pay').val('');
					 $('#dbadd_pay').val('');
					 $('#step').val('');	
					 $('#dbpositionName').val(data.position.position_name);
					 $('#dbbasic_pay').val(data.position.basic_pay);
					 $('#dbadd_pay').val(data.position.add_pay);
					 $('#step').val(data.position.step);
				 }
			 }
		   );
	
	 }else{
		 alert("선택해주세요 !");
	 }
	 
}

