////////////////
//작성 일 : 2016-11-26\
//작성 자 : 박성준
//목   적  : 전자 결재시 각 문서들 작업시 사용하는 js 파일




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


//트리구조 출력시 접히기 하려고. 만듬//////////////////
var firstTree = 0;
var secondTree = 0;
///////////////////////////////////////////

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
	

	//sanction_Modal  - > 모달 아이콘.
	//결재자 아이콘 클릭시 - > 트리 구조.	
	$('#draft_Ok_Icon').click(function(){
		var empSelectNumber = 1;
		var litag = "<ul style='list-style:none;margin-left:-40px;'>";   		
    	$('#organization').empty();
        $('#empList').empty();
        $.ajax({
           url : "taskWriteModal.do",
           success : function(data) {
              choose = 1;
              var departMent = "";

              $('#myModal6').modal();
              $.each(data, function(index) {

                 departMent = data[index];
              });

              console.log("departMent : " + departMent);

              $.each(departMent, function(index) {
 					litag += "<li style='padding:2px;' onclick='seeDepart(this,"
   						litag +=empSelectNumber +","
   						litag +=departMent[index].branch_no
    				    litag +=")'><i class='fa fa-sitemap'>"+departMent[index].branch_name+"/"+departMent[index].branch_no+"</li></i>";	
    					litag+="<div id='dept_div"
    					litag+=departMent[index].branch_no
    					litag+="'></div>";
              });
              
              litag +="</ul>";
              $('#organization').html(litag);

           }
        })
     });
	
	//참조자 아이콘 버튼 클릭시
	$('#draft_line_Icon').click(function(){
		
		var empSelectNumber = 2;
		var litag = "<ul style='list-style:none;margin-left:-40px;'>";   		
 		$('#organization').empty();
 		$('#empList').empty();
              
          	$.ajax({
    			url : "taskWriteModal.do",
    			success : function(data) {
    				 $('#myModal6').modal();
    				choose = 2;
    				var departMent = "";

    				$.each(data, function(index) {
    					departMent = data[index];
    				});

    				$.each(departMent, function(index) {
       					litag += "<li  style='padding:2px;' onclick='seeDepart(this,"
       						litag +=empSelectNumber +","
       						litag +=departMent[index].branch_no
        				    litag +=")'><i class='fa fa-sitemap'>"+departMent[index].branch_name+"/"+departMent[index].branch_no+"</li></i>";
        					litag+="<div id='dept_div"
        					litag+=departMent[index].branch_no
        					litag+="'></div>";
           				});
    				litag +="</ul>";	
       				$('#organization').html(litag);

    			}
    		})

	});
	
	
	
	
	$('#writeOtherAttendace').datepicker({
	     changeMonth: true, 
        dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
        monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        dateFormat: 'yy-mm-dd',
        changeYear: true
	});	
	
	$('#writeOtherAttendace2').datepicker({
	     changeMonth: true, 
       dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
       dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
       monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
       monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
       dateFormat: 'yy-mm-dd',
       changeYear: true
	});
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
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



//전자 결재 입니다.
//부서 출력 하는 아작스

//부서 출력 하는 아작스
//스크립트 생성자
 function empInfo(emp_no, emp_name){
    this.emp_no = emp_no;
    this.emp_name = emp_name;
 }
 
 //사원정보 뽑아서 담을 배열
 var empInfoArray = new Array();
 
 //부서 선택시
 var departcho;
 //하위 부서 선택시
 var low_deptNumber;
 //사원
 var empListNumber;
 
 var choose;


    function seeDepart(obj, empSelectNumber, choose) {
    	//전역 부서 선택시
        departcho = choose;
		var div_id = "dept_div"+choose;
		$("#"+div_id).empty();
		var litag = "<hr/><ul style='list-style:none; padding:5px;'>";
	
    	var name = $(obj).text();

    	$.ajax({
    		url : "taskDeptModal.do",
    		type : "GET",
    		data : {
    			branch_no : departcho
    		},
    		success : function(data) {
    			var dept;
    			console.log(data);
    			$.each(data, function(index) {
    				dept = data[index];
    			});
    			

      			if(firstTree == 0){
      				firstTree = 1;
    			$.each(dept, function(index) {
    				
    				litag += "<li  onclick='seelow_Depart(this, "
  					litag +=empSelectNumber+","
  				    litag +=dept[index].dept_no
  				    litag +=")'>"+'<i class="fa fa-long-arrow-right"></i>'+dept[index].dept_name+"/"+dept[index].dept_no+"</li>";
  					
  					
  					litag+="<div id='low_dept_div"
  					litag+=dept[index].dept_no
  					litag+="'></div>";
    			});
    			litag +="</ul><hr/>";
    			$("#"+div_id).html(litag);
    			
	    		}else{
	    			firstTree = 0;
					$("#"+div_id).html();	
    			}
    		}
    	});
    }

    var dept_Name = "";
    //하위 부서 클릭시
    function seelow_Depart(obj,empSelectNumber,departcho) {	
  	deptNumber= departcho;
  	var litag = "<ul style='list-style:none;'>";
  	var div_id = "low_dept_div"+departcho;
  	$("#"+div_id).empty();
    	$.ajax({
    		url : "tasklow_deptModal.do",
    		data : {
    			dept_no : deptNumber
    		},

    		success : function(data) {

    			var low_dept = "";
    			$.each(data, function(index) {
    				low_dept = data[index];
    			});
    			
    			if(secondTree == 0){
      				secondTree = 1;
    			$.each(low_dept, function(index) {
  				litag += "<li onclick='seeEmpMember(this, "
      				litag += empSelectNumber+","
      				litag +=low_dept[index].low_dept_no
      				litag +=")'>"+'<i class="fa fa-long-arrow-right"></i>'+low_dept[index].low_dept_name+"/"+low_dept[index].low_dept_no+"</li>";
      				litag +="</ul>";
      				dept_Name = low_dept[index].low_dept_name;	
    			});
    			litag +="</ul><hr/>";
    			$("#"+div_id).html(litag);
    		
	    		}else{
	    			secondTree = 0;
					$("#"+div_id).html();	
	    		}
    		}
    	});
    }
    
    
    //전역변수  셋팅  - 결재 라인때문에 추가
    var testEmpSelectNumber = "";
    
    //사원 뽑아오기
    function seeEmpMember(obj,empSelectNumber,low_dept_no){
       //체크
       var empListNumber = low_dept_no;
 		 alert("사원뽑기 : "+empListNumber);         
       console.log(obj);
       //클릭한 text 값 뽑아옴.
       var low_dept = $(obj).text();
       alert("taskEmpModal : "+low_dept);
       alert("selectNo : " + empSelectNumber);
       
       var makeTable ="";
       if(empSelectNumber != 3){
    	   makeTable = "<table class='table'><tr><th><input type='checkbox'></th><th>사번</th><th>이름</th>";
       }else{
    	    makeTable = "<table class='table'><tr><th>사번</th><th>이름</th><th/>";
       }
     
       $.ajax(
             {
                url: "taskEmpModal.do",
                data:{
              	  low_dept_no: empListNumber
                     },
                success:function(data){
              	  
              	  testEmpSelectNumber = empSelectNumber;
              	  alert("테스트 이엠피 셀렉트 넘버 !!! : " +testEmpSelectNumber);
                    
              	  var emp = "";
                    $.each(data, function(index){
                       emp = data[index];
                       console.log(emp);
                   });
                   
                   $.each(emp, function(index){
                      if(empSelectNumber == 1){   
                         makeTable += "<tr><td><input type='checkbox' name='chkbtn' value='"+emp[index].emp_name+"'></td><td>"+emp[index].emp_no+"</td><td>"+emp[index].emp_name+"</td></tr>";   
                      }
                      else if(empSelectNumber == 2){
                         makeTable += "<tr><td><input type='checkbox' name='chkbtn' value='"+emp[index].emp_name+"'></td><td>"+emp[index].emp_no+"</td><td>"+emp[index].emp_name+"</td></tr>";
                        //협조문 쓸때 사용하는 것.
                      }else if(empSelectNumber == 3){
                    	  makeTable += "<tr><td>"+emp[index].emp_no+"</td><td>"+emp[index].emp_name+"</td><td><input type='button' class='btn btn-default' onclick='recF(this)' value='선택'></td></tr>";   
                      }
                   });
                   makeTable += "</table><br><input type='button' class='btn btn-success' value='선택' onclick=check()>";
                   $('#empList').empty();
                   $('#empList').append(makeTable);
                 }    
                
             }
             );
    }
 
    
    //체크박스 선택후 버튼 클릭시 호출
    function check(low_deptNumber){
    	var checkNumber = testEmpSelectNumber;
  	  alert("empSelectNumber : "+checkNumber);
    	
    	
       //체크박스 크기만큼 배열 생성
       var checkResult = new Array();
       $(":checkbox[name='chkbtn']:checked").each(function(pi,po){
          //이름 
          checkResult[pi] = po.value;
          //사번
          empInfoArray.push(new empInfo($(this).parent().next().html(),checkResult[pi]));
       });
       console.log("사원 : "+empInfoArray);
       
       if(checkNumber == 1){
      	 
      	 
      	 if(empInfoArray.length > 1){
               console.log("if 내부 : " +empInfoArray[0].emp_no +" / "+empInfoArray[0].emp_name);
               //화면에 보이는 input 은 그냥 때려넣음
               $("#draft_Ok_emp_no").val(empInfoArray[0].emp_no);
               $('#draft_Ok_emp_name').val(empInfoArray[0].emp_name);
               
               var input_no = "";
               var input_name = "";
               for(var i = 1; i < empInfoArray.length; i++){
                  input_no += "<input type='text' class='form-control' name='emp_no' value='"+empInfoArray[i].emp_no+"'>";
                  input_name +="<input type='text' class='form-control' value='"+empInfoArray[i].emp_name+"'>";
               }
               
               console.log("info Array IF 탐 "+input_no);
               
               $('#sanction_DraftOk_no_td').append(input_no);
               $('#sanction_DraftName_td').append(input_name);
            
      	 }else{
             
            	console.log("info Array ELSE 탐");
               $("#draft_Ok_emp_no").val(empInfoArray[0].emp_no);
               $('#draft_Ok_emp_name').val(empInfoArray[0].emp_name);            
            }
                 	 
      	 empInfoArray = new Array();        	 
      	  $("#myModal6").modal("hide");
      	 
      	  
      //참조자 부분	  
       }else if(checkNumber == 2){
       
          if(empInfoArray.length > 1){
             console.log("if 내부 : " +empInfoArray[0].emp_no +" / "+empInfoArray[0].emp_name);
             //화면에 보이는 input 은 그냥 때려넣음
             $("#draft_line_emp_no").val(empInfoArray[0].emp_no);
             $('#draft_line_emp_name').val(empInfoArray[0].emp_name);
             
             var input_no = "";
             var input_name = "";
             for(var i = 1; i < empInfoArray.length; i++){
                input_no += "<input type='text' class='form-control' name='emp_no' value='"+empInfoArray[i].emp_no+"'>";
                input_name +="<input type='text' class='form-control' value='"+empInfoArray[i].emp_name+"'>";
             }
             
             console.log("info Array IF 탐 "+input_no);
             
             $('#sanction_writeNo_td').append(input_no);
             $('#sanction_writename_td').append(input_name);
          }else{
           
          	console.log("info Array ELSE 탐")
          	
             $("#draft_line_emp_no").val(empInfoArray[0].emp_no);
             $('#draft_line_emp_name').val(empInfoArray[0].emp_name);            
          }
       	
			empInfoArray = new Array();
          $("#myModal6").modal("hide");
       }  
          
    }
    
    //수신자 선택시
    function recF(obj){
       //수신자 이름
       var rec_name = $(obj).parent().parent().children().eq(1).html();
       $('#CooperationDepartInput').val(dept_Name);
       $('#CooperationNameInput').val(rec_name);
       $('#CooperationModal').modal("hide");
    }
    
  //협조문 - 부서 선택 버튼 클릭시///////////////////////////////////////////////////////////////////////////
    function CooperationBtnFunction(){
    	
    	var empSelectNumber = 3;
		var litag = "<ui style='list-style:none;'>";   		
 		$('#organization').empty();
 		$('#empList').empty();
              
          	$.ajax({
    			url : "taskWriteModal.do",
    			success : function(data) {
    				 $('#CooperationModal').modal();
    				choose = 2;
    				var departMent = "";

    				$.each(data, function(index) {
    					departMent = data[index];
    				});

    				$.each(departMent, function(index) {
       					litag += "<li onclick='seeDepart(this,"
       						litag +=empSelectNumber +","
       						litag +=departMent[index].branch_no
        				    litag +=")'>"+departMent[index].branch_name+"/"+departMent[index].branch_no+"</li>";
        					litag +="</ul>";
        					
        					litag+="<div id='dept_div"
        					litag+=departMent[index].branch_no
        					litag+="'></div>";
           				});

       				$('#organization').html(litag);

    			}
    		});
    }
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////