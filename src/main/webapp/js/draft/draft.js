
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
	toastr.options = {	 
			 "closeButton": true,
			  "debug": false,
			  "newestOnTop": false,
			  "progressBar": false,
			  "positionClass": "toast-top-center",
			  "preventDuplicates": false,
			  "onclick": null,
			  "showDuration": "300",
			  "hideDuration": "1000",
			  "timeOut": "2000",
			  "extendedTimeOut": "1000",
			  "showEasing": "swing",
			  "hideEasing": "linear",
			  "showMethod": "fadeIn",
			  "hideMethod": "fadeOut"
	       };

	

		
	 //주소록 추가시  검색해서 보여주는 script
    $('#con_ins_org_sea_btn').click(function(){  	
    	pre_empInfoArray.splice(0,pre_empInfoArray.length);
    	console.log('field : '+ $('#con_ins_org_sea_field').val()+"/word:"+$('#con_ins_org_sea_query').val());
    	testEmpSelectNumber = $('#org_sea_btn_sel').val();
    	console.log("testEmpSelectNumber : " + testEmpSelectNumber);
    	$.ajax(
				{
					type : "post",
					url  : "contact_insert_search.do",
					data : {
						"field" : $('#con_ins_org_sea_field').val(),
						"query" : $('#con_ins_org_sea_query').val()
						
					},
					success : function(data){
						console.log(data);
						 var emp = "";
		                    $.each(data, function(index){
		                       emp = data[index];
		                       console.log("객체 : "+emp);
								console.log("emp:"+ data[index]);    		                       	
		                   });
		                    console.log("객체s : "+emp[0]);
		                  
		                   var makeTable = "<table class='table table-condensed table-hover table-bordered'><tr style='background-color:#f8f8f8;'><th style='text-align:center'>선택</th><th style='text-align:center'>사번</th><th style='text-align:center'>이름</th><th style='text-align:center'>직위</th></tr>";
		                   $.each(emp, function(index){
		                	   makeTable += "<tr style='text-align:center'><td><input type='checkbox'  name='chkbtn2' value='"+emp[index].emp_name+"'></td><td>"+emp[index].emp_no+"</td><td>"+emp[index].emp_name+"</td><td>"+emp[index].position_name+"</td></tr>";   
		                  
		                   });
		                   makeTable += "</table><div class='pull-right'><input type='button' class='btn btn-success btn-sm' style='font-weight: bold ' value='선택' onclick=check()></div>";
		                   $('#empList2').empty();
		                   $('#empList2').append(makeTable); 
					}
				}		
			)    	
    });
    
    
	// 결재라인 선택 (1)
	$('#draft_line_Icon').click(function(){
		firstTree = 0 ;
		$('#org_sea_btn_sel').val('1');
		var empSelectNumber = 1;
		var litag = "<ul style='list-style:none;margin-left:-40px;'>";   	
		
		$('#sanction_DraftOk_no_td').empty();
		$('#sanction_DraftName_td').empty();
    	$('#organization').empty();
        $('#empList').empty();
        $('#empList2').empty();
        $('#con_ins_org_sea_query').val('');
        $('#draft_Ok_emp_no').val('');
        $('#draft_Ok_emp_name').val('');
       
        $('#empList_list').html('<span style="color:red"><br>선택된 사원이 없습니다.<br><br></span>');
        pre_empInfoArray.splice(0,pre_empInfoArray.length);
        
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
		firstTree = 0 ;
		$('#org_sea_btn_sel').val('2');
		var empSelectNumber = 2;
		var litag = "<ul style='list-style:none;margin-left:-40px;'>";   		
 		$('#organization').empty();
 		$('#empList').empty();
 		$('#empList2').empty();
		$('#con_ins_org_sea_query').val('');
		
		$('#sanction_writeNo_td').empty();
		$('#sanction_writename_td').empty();
        $('#draft_ref_emp_name').val('');
        $('#draft_ref_emp_no').val('');
        $('#empList_list').html('<span style="color:red"><br>선택된 사원이 없습니다.<br><br></span>');
        //$('#empList_list').empty();
        pre_empInfoArray.splice(0,pre_empInfoArray.length);
        
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
 
 // 사원정보 뽑아서 담을 배열의 선택전 배역
 var pre_empInfoArray = new Array();
 
 // 부서 선택 시
 var departcho;
 // 하위 부서 선택 시
 var low_deptNumber;
 // 사원
 var empListNumber;
 
 var choose;


 function seeDepart(obj, empSelectNumber, choose) {
	 
	 console.log("seeDepart 클릭");
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
    			console.log("seeDepart 클릭2");
    			var dept;
    			console.log(data);
    			$.each(data, function(index) {
    				dept = data[index];
    			});
    			
      			if(firstTree == 0){
      				console.log("seeDepart 클릭3");
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
	    			console.log("seeDepart 클릭4");
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
  	  				litag += "<li><i class='fa fa-long-arrow-right'></i><span>"+low_dept[index].low_dept_name+"("+low_dept[index].low_dept_no+")</span> <input type='button' class='btn btn-xs btn-success' style='margin-left: 8px; font-size: 5pt;font-weight: bold ' value='선 택' onclick='check2("+index+")'></li>";
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
  	      				litag +=")'>"+'<i class="fa fa-long-arrow-right"></i><span>'+low_dept[index].low_dept_name+"("+low_dept[index].low_dept_no+")</span></li>";
  	      				
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
  	    $("#myModal7").modal("hide");
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
    	                         makeTable += "<tr><td><input type='checkbox'  name='chkbtn' value='"+emp[index].emp_name+"'></td><td>"+emp[index].emp_no+"</td><td>"+emp[index].emp_name+" ("+emp[index].position_name+")</td></tr>";   
    	                      }
    	                      else if(empSelectNumber == 2){
    	                         makeTable += "<tr><td><input type='checkbox'   name='chkbtn' value='"+emp[index].emp_name+"'></td><td>"+emp[index].emp_no+"</td><td>"+emp[index].emp_name+" ("+emp[index].position_name+")</td></tr>";
    	                        //협조문 쓸때 사용하는 것.
    	                      }else if(empSelectNumber == 3){
    	                    	  makeTable += "<tr><td>"+emp[index].emp_no+"</td><td>"+emp[index].emp_name+"</td><td><button class='btn btn-outline btn-success' onclick='recF(this)' ><i class='fa fa-check'></i></button></td></tr>";   
    	                      }
    	                   });
    	                   
    	                   makeTable += "</table>";
    	                   $('#empList').empty();
    	                   $('#empList').append(makeTable);
    	                 }    
    	             }
    	        );
    }
    
    //체크박스 클릭후 보여주기
    function precheck(){
    	 $('#empList_list').empty();
    	console.log('precheck 함수');
    	var tablemake2 ="";
        var checkarr = new Array();

       $(":checkbox[name='chkbtn']:checked").each(function(pi,po){
    	   console.log('------------------------------');
    	   var result  = 0;
    	  
	       	if(pre_empInfoArray.length == 0){  //처음에
	       		console.log('pre_empInfoArray.length == 0');
	       		// 이름 
	            checkarr[pi] = po.value;
	            // 사번
	            pre_empInfoArray.push(new empInfo($(this).parent().next().html(), checkarr[pi]));
	            console.log("===> 사번 : "+$(this).parent().next().html()+"/이름: "+checkarr[pi]);
	            //console.log("this:"+$(this));
	       	}else{	       		
	       	 //중복값 검사
		       	for(var i = 0; i < pre_empInfoArray.length; i++){
		       		console.log("배열 사번 pre_empInfoArray["+ i +"].emp_no : " + pre_empInfoArray[i].emp_no);
		       		console.log("선택된사번"+ i +" : " + $(this).parent().next().html());
		       		if($(this).parent().next().html() == pre_empInfoArray[i].emp_no){
		       			result = 1;  //같은 값이 있다.
		       		}
		       	}
		       	
		    	if(result == 0 ){ //중복된 값 없을때 추가
		       		// 이름 
		         	checkarr[pi] = po.value;
		            // 사번
		            pre_empInfoArray.push(new empInfo($(this).parent().next().html(), checkarr[pi]));
		            console.log("===> 사번 : "+$(this).parent().next().html()+"/이름: "+checkarr[pi]);
		       	}	
	       	}
	       
	       	//체크박스 속성 false
	        $(this).attr("checked", false);
       });
       
      	 if(pre_empInfoArray.length >= 1) { 
      		   tablemake2 = '<div class="row">';
      		   tablemake2 += "<table class='table table-condensed table-hover' >";
      		 	          
               for(var i = 0; i < pre_empInfoArray.length; i++){
            	   tablemake2 += "<tr><td style='text-align:center'><input type='checkbox' checked   name='chkbtn2' value='"+pre_empInfoArray[i].emp_name+"'></td><td style='text-align:center'>"+pre_empInfoArray[i].emp_no+"</td><td>"+pre_empInfoArray[i].emp_name+"</td></tr>";  
               }   
               tablemake2 += '</table></div>';
               tablemake2 += "<div ><input type='button' class='btn btn-sm btn-success btn-block btn-outline' style='font-weight: bold' value='선 &nbsp;&nbsp;&nbsp;택' onclick=check()><br></div>";
               
               $('#empList_list').empty();
               $('#empList_list').append(tablemake2);       
      	 }
    }
    
    //선택된 체크박스 취소
    function precheck_cancel(){
    	var pre_no = new Array();
    	console.log('함수 탐');
    	$(":checkbox[name='chkbtn2']:checked").each(function(pi,po){           
    		pre_no.push($(this).parent().next().html());  //서번넣기   		
            var tr = $(this).parent().parent();
    	    //라인 삭제
    	    tr.remove();
         });
    	
    	console.log("pre_empInfoArray.length : " + pre_empInfoArray.length);
    	
    	//배열에서 사번 삭제
    	for(var i = 0; i < pre_empInfoArray.length; i++){
    		console.log("pre_empInfoArray["+ i +"].emp_no : " + pre_empInfoArray[i].emp_no);
    		for(var j = 0; j < pre_no.length; j++){
    			console.log("pre_no["+ j +"] : " + pre_no[j]);
    			if(pre_no[j] == pre_empInfoArray[i].emp_no){
    				//사번 지우기
    	        	pre_empInfoArray.splice( i, 1);
    			}
    		}
    	}
    	
    	console.log("pre_empInfoArray.length : " + pre_empInfoArray.length);
    	console.log("pre_empInfoArray : " + pre_empInfoArray);
    }
    
    // 체크박스 선택후 버튼 클릭시 호출
    function check(low_deptNumber){
    	console.log('클릭');
    	var checkNumber = testEmpSelectNumber;
    	 console.log("testEmpSelectNumber : " + testEmpSelectNumber);
       // 체크박스 크기만큼 배열 생성
       var checkResult = new Array();
       empInfoArray.splice(0,empInfoArray.length);
       $(":checkbox[name='chkbtn2']:checked").each(function(pi,po){
          // 이름 
          checkResult[pi] = po.value;
          // 사번
          empInfoArray.push(new empInfo($(this).parent().next().html(), checkResult[pi]));
          console.log("사번 : "+$(this).parent().next().html()+"/이름: "+checkResult[pi]);
       });
       
       console.log("checkNumber : " + checkNumber);
       if(checkNumber == 1){
      	 if(empInfoArray.length > 1) {
               // 화면에 보이는 input 은 그냥 때려넣음
               $("#draft_Ok_emp_no").val(empInfoArray[0].emp_no);
               $("#draft_Ok_emp_name").val(empInfoArray[0].emp_name);
               
               var input_no = "";
               var input_name = "";
               
               for(var i = 1; i < empInfoArray.length; i++){
                  input_no += "<input type='text' class='form-control input-sm' readonly class='forDelete' name='draft_line_emp_no' value='"+empInfoArray[i].emp_no+"'>";
                  input_name +="<input type='text' class='form-control input-sm' readonly class='forDelete' value='"+empInfoArray[i].emp_name+"'>";
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
                input_no += "<input type='text' class='form-control input-sm' readonly class='forDelete' name='draft_ref_emp_no' value='"+empInfoArray[i].emp_no+"'>";
                input_name +="<input type='text' class='form-control input-sm' readonly class='forDelete' value='"+empInfoArray[i].emp_name+"'>";
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
       empInfoArray.splice(0,empInfoArray.length);
       $('#empList_list').empty();
    }
    
    //수신자 선택시
    function recF(obj){
       //수신자 이름
       var rec_name = $(obj).parent().parent().children().eq(1).html();
       $('#CooperationDepartInput').val(dept_Name);
       $('#CooperationNameInput').val(rec_name);
       $('#CooperationModal').modal("hide");
       $('#hiddenMenuName').val(rec_emp_no);
    }
    
  //협조문 - 부서 선택 버튼 클릭시 ////////
    function CooperationBtnFunction(){
    	var empSelectNumber = 3;
		var litag = "<ui style='list-style:none;'>";   		
 		$('#corganization').empty();
 		$('#cempList').empty();
              
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
        				    litag +=")'>"+departMent[index].branch_name+" ("+departMent[index].branch_no+")</li>";
        					litag +="</ul>";
        					
        					litag+="<div id='dept_div"
        					litag+=departMent[index].branch_no
        					litag+="'></div>";
           				});

       				$('#corganization').html(litag);

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
		
		//draft.method = "post";
		
		
		if($(':radio[name="cg_no"]:checked').length < 1){
			toastr.warning('결재유형을 선택해 주세요');                
			$('#radio1').focus();
			return false;
		}
		
		if ($('#draft_Ok_emp_no').val() == "") {
			toastr.warning('결재라인을 입력해 주세요');
			$('#draft_Ok_emp_no').focus();
			return false;
		}
		
		if ($('#draft_Ok_emp_name').val() == "") {
			toastr.warning('결재라인을 입력해 주세요');
			$('#draft_Ok_emp_name').focus();
			return false;
		}
		
		if ($('#draft_ref_emp_no').val() == "") {
			toastr.warning('참조자를 입력해 주세요');
			$('#draft_ref_emp_no').focus();
			return false;
		}
		
		if ($('#draft_ref_emp_name').val() == "") {
			toastr.warning('참조자를 입력해 주세요');
			$('#draft_ref_emp_name').focus();
			return false;
		}
		
		//대외공문1  office
		if($(":input:radio[name=cg_no]:checked").val() == 1){
			console.log('대외공문');
			if ($('#rec_place').val() == "") {
				toastr.warning('수신처를 입력해 주세요');
				$('#rec_place').focus();
				return false;
			}
			
		}
		//협조문2  cooperation
		if($(":input:radio[name=cg_no]:checked").val() == 2){
			console.log('협조문');				
			if ($('#choosedept_name').val() == "") {
				toastr.warning('협조문 수신 부서를 선택해 주세요');
				$('#choosedept_name').focus();
				return false;
			}
		} 
		//휴가신청서3  break
		if($(":input:radio[name=cg_no]:checked").val() == 3){
			console.log('휴가신청서');  
			if ($('#breakdatepicker1').val() == "") {
				toastr.warning('휴가기간을 입력해 주세요');
				$('#breakdatepicker1').focus();
				return false;
			}
			
			if ($('#breakdatepicker2').val() == "") {
				toastr.warning('휴가기간을 입력해 주세요');
				$('#breakdatepicker2').focus();
				return false;
			}
		}
		
		if ($('#draft_title').val() == "") {
			toastr.warning('제목을 입력해 주세요');
			$('#draft_title').focus();
			return false;
		}
		
		
		
		
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
	        changeYear: true,
	        beforeShowDay: function(date){
                var loadDt = new Date();
                var dayday =new Date(Date.parse(loadDt) - 1 * 1000 * 60 * 60 * 24);
                
                if(date < dayday) return [false];
                return [true];
             }, 
             onSelect: function(selected) {
                $('.breakdatepicker2').datepicker("option","minDate", selected)
            }
		});
		$("#breakdatepicker2").datepicker({
			changeMonth: true, 
	        dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
	        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
	        monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	        dateFormat: 'yy-mm-dd',
	        changeYear: true,
	        beforeShowDay: function(date){
                var loadDt = new Date();
                var dayday =new Date(Date.parse(loadDt) - 1 * 1000 * 60 * 60 * 24);
                
                if(date < dayday) return [false];
                return [true];
             }, 
             onSelect: function(selected) {
                $('.breakdatepicker1').datepicker("option","maxDate", selected)
            }
	        
		});
	}
	
	function choosedept() {
		//alert("협조문 수신부서 누름")
		var empSelectNumber = 3;
		var litag = "<ul style='list-style:none;margin-left:-40px;'>";   		
 		$('#corganization').empty();
 		$('#cempList').empty();
              
          	$.ajax({
    			url : "taskWriteModal.do",
    			success : function(data) {
    				 $('#myModal7').modal();
    				choose = 2;
    				var departMent = "";

    				$.each(data, function(index) {
    					departMent = data[index];
    				});

    				$.each(departMent, function(index) {
       					litag += "<li  style='padding:2px;' onclick='seeDepart(this,"
       						litag +=empSelectNumber +","
       						litag +=departMent[index].branch_no
        				    litag +=")'><i class='fa fa-sitemap'></i><span>"+departMent[index].branch_name+" ("+departMent[index].branch_no+")</span></li>";
        					litag+="<div id='dept_div"
        					litag+=departMent[index].branch_no
        					litag+="'></div>";
           				});
    				litag +="</ul>";	
       				$('#corganization').html(litag);
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
    
  
    
    
    
    
    
    