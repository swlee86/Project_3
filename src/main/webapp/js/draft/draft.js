
//우편 API
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


// 트리구조 출력시 접을 수 있도록 하기 위해
var firstTree = 0;
var secondTree = 0;

$(function() {
	// 결재라인 선택 (1)
	$('#draft_line_Icon').click(function(){
		var empSelectNumber = 1;
		var litag = "<ul style='list-style:none;margin-left:-40px;'>";   	
		
    	$('#organization').empty();
        $('#empList').empty();
        $('#empList2').empty();
        $('#con_ins_org_sea_query').val('');
        
        $.ajax({
           url : "taskWriteModal.do",
           success : function(data) {
              choose = 1;
              var departMent = "";
              $('#myModal6').modal();
              $.each(data, function(index) {
                 departMent = data[index];
              });

              $.each(departMent, function(index) {
 					litag += "<li style='padding:2px;' onclick='seeDepart(this,"
   					litag += empSelectNumber +","
   					litag += departMent[index].branch_no
    				litag += ")'><i class='fa fa-sitemap'></i><span class='org_list_class'>"+departMent[index].branch_name+"&nbsp;("+departMent[index].branch_no+")</span></li>";	
    				litag += "<div id='dept_div"
    				litag += departMent[index].branch_no
    				litag += "'></div>";
              });
              
              litag +="</ul>";
              $('#organization').html(litag);
           }
        })
     });
	
	// 참조자 선택 (2)
	$('#draft_ref_Icon').click(function(){
		var empSelectNumber = 2;
		var litag = "<ul style='list-style:none;margin-left:-40px;'>";   		
 		$('#organization').empty();
 		$('#empList').empty();
 		$('#empList2').empty();
		$('#con_ins_org_sea_query').val('');
		
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
        				    litag +=")'><i class='fa fa-sitemap'></i><span class='org_list_class'>"+departMent[index].branch_name+"&nbsp;("+departMent[index].branch_no+")</span></li>";
        					litag+="<div id='dept_div"
        					litag+=departMent[index].branch_no
        					litag+="'></div>";
           				});
    				litag +="</ul>";	
       				$('#organization').html(litag);
    			}
    		})

	});
	
	// 드래그앤드롭 적용
	$("#cg_1").sortable();
	$("#cg_2").sortable();
	$("#cg_3").sortable();
	
	// 드롭하는 영역
    $("#dragarea").droppable({
    	drop: function(event, ui) {
    		$(this).empty();
    		
    		var id = ui.helper["0"].id;
    		
    		if(id == 'one') {
    			$(this).css('background', 'rgb(98,203,49)');
    			$(this).append("승인");
    		} else if(id == 'two') {
    			$(this).css('background', 'rgb(231,76,60)');
    			$(this).append("반려");
    		} else if(id == 'three') {
    			$(this).css('background', 'rgb(155,89,182)');
    			$(this).append("보류");
    		} 
        }
    });
    
    // 승인 처리 부분에서 '처리' 버튼을 눌렀을 때!!
    $("#app_check").click(function() {
    	var app_check = $(this).parent().prev().contents("#dragarea").text();
    	var app_check_no = 0;
    	
    	if(app_check == '승인') app_check_no = 1;
    	else if(app_check === '반려') app_check_no = 2;
    	else if(app_check == '보류') app_check_no = 3;
    	
    	var draft_no = $("#draft_no_hidden").val();
    	
    	$.ajax({
    		url		: "updateDraft_approval.do",
    		type	: "post",
    		data	: {
    					draft_no : draft_no,
    					app_check : app_check_no
    				  },
    		success	: function(data) {
    			 swal({
                     title: "전자결재",
                     text: "승인 처리가 완료되었습니다",
                     type: "success"
                 });
    			 location.href("draft_rec.do");
    		}
    	});
    	
    });
	
}); // onload

// 부서 출력
// 스크립트 생성자
 function empInfo(emp_no, emp_name){
    this.emp_no = emp_no;
    this.emp_name = emp_name;
 }
 
 // 사원정보 뽑아서 담을 배열
 var empInfoArray = new Array();
 
 // 부서 선택 시
 var departcho;
 // 하위 부서 선택 시
 var low_deptNumber;
 // 사원
 var empListNumber;
 
 var choose;


 function seeDepart(obj, empSelectNumber, choose) {
    	// 전역 부서 선택시
        departcho = choose;
		var div_id = "dept_div"+choose;
		$("#"+div_id).empty();
		
		var litag = "<ul style='list-style:none; padding:5px;'>";
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
  				    litag +=")'>"+'<i class="fa fa-long-arrow-right"></i><span>'+dept[index].dept_name+" ("+dept[index].dept_no+")</span></li>";
  					litag+="<div id='low_dept_div"
  					litag+=dept[index].dept_no
  					litag+="'></div>";
    			});
    			litag +="</ul>";
    			$("#"+div_id).html(litag);
    			
	    		}else{
	    			firstTree = 0;
					$("#"+div_id).html();	
    			}
    		}
    	});
    }

    var dept_Name = "";
    var dept_Name2 = new Array();
 	var dept_No = new Array();
    
    //하위 부서 클릭시
    function seelow_Depart(obj,empSelectNumber,departcho) {
  	deptNumber = departcho;
  	var litag = "<ul style='list-style:none;'>";
  	var div_id = "low_dept_div"+departcho;
  	$("#"+div_id).empty();
    	$.ajax({
    		url : "tasklow_deptModal.do",
    		data : {
    			dept_no : deptNumber
    		},

    		success : function(data) {
    			if(empSelectNumber == '3') {
  					
  	      			var low_dept = "";
  	    			$.each(data, function(index) {
  	    				low_dept = data[index];
  	    			});
  	    			
  	    			if(secondTree == 0){
  	      				secondTree = 1;
  	    			$.each(low_dept, function(index) {
  	    				dept_No.push(low_dept[index].low_dept_no)
  	      				dept_Name2.push(low_dept[index].low_dept_name);
  	      				dept_Name = low_dept[index].low_dept_name;
  	  				litag += "<li><i class='fa fa-long-arrow-right'></i>"+low_dept[index].low_dept_name+"/"+low_dept[index].low_dept_no+"<input type='button' class='btn btn-success' style='margin-left: 8px; font-size: 9pt; height: 4pt;' value='선택' onclick='check2("+index+")'></li></ul>";
  	    			});
  	    			litag +="</ul>";
  	    			$("#"+div_id).html(litag);
  	    		
  		    		}else{
  		    			secondTree = 0;
  						$("#"+div_id).html();	
  		    		}	
  				} else {
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
  	      				litag +=")'>"+'<i class="fa fa-long-arrow-right"></i>'+low_dept[index].low_dept_name+"("+low_dept[index].low_dept_no+")</span></li>";
  	      				litag +="</ul>";
  	      				dept_Name = low_dept[index].low_dept_name;
  	    			});
  	    			litag +="</ul>";
  	    			$("#"+div_id).html(litag);
  	    		
  		    		}else{
  		    			secondTree = 0;
  						$("#"+div_id).html();	
  		    		}
  				}
    		}
    	});
    }
    
    function check2(index) {
    	var choosedept_no =  dept_No[index];
    	var choosedept_name = dept_Name2[index];
    	// 협조문에서 수신부서 선택 시
        $("#choosedept_name").val(choosedept_name);
        $("#choosedept_no").val(choosedept_no);
  	    $("#myModal6").modal("hide");
    };
    
    //전역변수  셋팅  - 결재 라인때문에 추가
    var testEmpSelectNumber = "";
    
    // 사원 뽑아오기
    function seeEmpMember(obj,empSelectNumber, low_dept_no){
    	//체크
    	       var empListNumber = low_dept_no;       
    	       console.log(obj);
    	       //클릭한 text 값 뽑아옴.
    	       var low_dept = $(obj).text();
    	       
    	       var makeTable ="";
    	       if(empSelectNumber != 3){
    	    	   makeTable = "<table class='table table-condensed' ><tr style='background-color:#f8f8f8'><th>선택</th><th>사번</th><th>이름</th></tr>";
    	       }else{
    	    	    makeTable = "<table class='table table-condensed'><tr style='background-color:#f8f8f8'><th>사번</th><th>이름</th></tr>";
    	       }
    	     
    	       $.ajax(
    	             {
    	                url: "taskEmpModal_exclude.do",
    	                data:{
    	              	  low_dept_no: empListNumber
    	                     },
    	                success:function(data){
    	              	  
    	              	  testEmpSelectNumber = empSelectNumber;
    	                    
    	              	  var emp = "";
    	                    $.each(data, function(index){
    	                    	console.log("@@@@@@ data:"+data[index]);
    	                       emp = data[index];
    	                   });
    	                   
    	                   $.each(emp, function(index){
    	                      if(empSelectNumber == 1){   
    	                         makeTable += "<tr><td><input type='checkbox' name='chkbtn' value='"+emp[index].emp_name+"'></td><td>"+emp[index].emp_no+"</td><td>"+emp[index].emp_name+" ("+emp[index].position_name+")</td></tr>";   
    	                      }
    	                      else if(empSelectNumber == 2){
    	                         makeTable += "<tr><td><input type='checkbox' name='chkbtn' value='"+emp[index].emp_name+"'></td><td>"+emp[index].emp_no+"</td><td>"+emp[index].emp_name+" ("+emp[index].position_name+")</td></tr>";
    	                        //협조문 쓸때 사용하는 것.
    	                      }else if(empSelectNumber == 3){
    	                    	  makeTable += "<tr><td>"+emp[index].emp_no+"</td><td>"+emp[index].emp_name+"</td><td><button class='btn btn-outline btn-success' onclick='recF(this)' ><i class='fa fa-check'></i></button></td></tr>";   
    	                      }
    	                   });
    	                   makeTable += "</table><br><input type='button' class='btn btn-success' value='선택' onclick=check()>";
    	                   $('#empList').empty();
    	                   $('#empList').append(makeTable);
    	                 }    
    	             }
    	        );
    }
    
    // 체크박스 선택후 버튼 클릭시 호출
    function check(low_deptNumber){
    	var checkNumber = testEmpSelectNumber;
       // 체크박스 크기만큼 배열 생성
       var checkResult = new Array();
       empInfoArray.splice(0,empInfoArray.length);
       $(":checkbox[name='chkbtn']:checked").each(function(pi,po){
          // 이름 
          checkResult[pi] = po.value;
          // 사번
          empInfoArray.push(new empInfo($(this).parent().next().html(), checkResult[pi]));
       });
       
       if(checkNumber == 1){
      	 if(empInfoArray.length > 1) {
               // 화면에 보이는 input 은 그냥 때려넣음
               $("#draft_Ok_emp_no").val(empInfoArray[0].emp_no);
               $("#draft_Ok_emp_name").val(empInfoArray[0].emp_name);
               
               var input_no = "";
               var input_name = "";
               
               for(var i = 1; i < empInfoArray.length; i++){
                  input_no += "<input type='text' class='form-control' readonly class='forDelete' name='draft_line_emp_no' value='"+empInfoArray[i].emp_no+"'>";
                  input_name +="<input type='text' class='form-control' readonly class='forDelete' value='"+empInfoArray[i].emp_name+"'>";
               }
               
               $('#sanction_DraftOk_no_td').append(input_no);
               $('#sanction_DraftName_td').append(input_name);
            
      	 	}else{
      	 		// 한 명일 경우
               $("#draft_Ok_emp_no").val(empInfoArray[0].emp_no);
               $("#draft_Ok_emp_name").val(empInfoArray[0].emp_name);            
            }
                 	 
      	 //empInfoArray = new Array();        	 
      	  $("#myModal6").modal("hide");
      	 
      	  
      //참조자 부분	  
       }else if(checkNumber == 2){
       
          if(empInfoArray.length > 1){
             //화면에 보이는 input 은 그냥 때려넣음
             $("#draft_ref_emp_no").val(empInfoArray[0].emp_no);
             $('#draft_ref_emp_name').val(empInfoArray[0].emp_name);
             
             var input_no = "";
             var input_name = "";
             for(var i = 1; i < empInfoArray.length; i++){
                input_no += "<input type='text' class='form-control' readonly class='forDelete' name='draft_ref_emp_no' value='"+empInfoArray[i].emp_no+"'>";
                input_name +="<input type='text' class='form-control' readonly class='forDelete' value='"+empInfoArray[i].emp_name+"'>";
             }
             
             $('#sanction_writeNo_td').append(input_no);
             $('#sanction_writename_td').append(input_name);
          }else{
           
             $("#draft_ref_emp_no").val(empInfoArray[0].emp_no);
             $('#draft_ref_emp_name').val(empInfoArray[0].emp_name);            
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
    
  //협조문 - 부서 선택 버튼 클릭시 ////////
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
    
 // 결재 유형을 변경할 때마다
	function checkDraft() {
		
		$('#document_table').empty();
		$('#draft_Ok_emp_no').empty();
		$('#draft_Ok_emp_name').empty();
		$('#draft_ref_emp_no').empty();
		$('#draft_ref_emp_name').empty();
		$('.forDelete').empty();
		
		var choose = $("input[name='cg_no']:checked").val();

		$.ajax({
			url : "draftForm.do",
			type : "get",
			data : {
					cg_no : choose
				   },
			success : function(result) {
				$("#document_table").html(result);
				draft_datepicker();
			}
		});
	};
	
	$("#submitBtn").click(function() {
		var choose = $("input[name='cg_no']:checked").val();
		
		draft.method = "post";
		
		if(choose == '1') {
			draft.action = "draftOffice.do";
		} else if(choose == '2') {
			draft.action = "draftCooperation.do";
		} else if(choose == '3') {
			draft.action = "draftBreak.do";
		}
		
		draft.submit();
	});
	
	function draft_datepicker() {
		$("#breakdatepicker1").datepicker({
			changeMonth: true, 
	        dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
	        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
	        monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	        dateFormat: 'yy-mm-dd',
	        changeYear: true
		});
		$("#breakdatepicker2").datepicker({
			changeMonth: true, 
	        dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
	        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
	        monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	        dateFormat: 'yy-mm-dd',
	        changeYear: true
		});
	}
	
	function choosedept() {
		alert("협조문 수신부서 누름")
		var empSelectNumber = 3;
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
    		});
	}
	
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var fullAddr = ''; 
                var extraAddr = '';

                if (data.userSelectedType === 'R') {
                    fullAddr = data.roadAddress;

                } else { 
                    fullAddr = data.jibunAddress;
                }

                if(data.userSelectedType === 'R'){
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                document.getElementById('rec_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
    
    // 뒤로가기 버튼
    $("#backBtn").click(function() {
    	history.back();
    });
    
    // 상세 페이지에서 modal 창 보여주기
    var modal = $modal.open({
        templateUrl: 'views/draft/office_detail.jsp',
        controller: ModalInstanceCtrl,
        windowClass: "hmodal-success"
    });
    
  
    
    
    
    
    
    