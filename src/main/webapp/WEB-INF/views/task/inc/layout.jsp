<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Page title -->
<title>2PM</title>

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<!--<link rel="shortcut icon" type="image/ico" href="favicon.ico" />-->

<!-- Vendor styles -->
<link rel="stylesheet" href="vendor/fontawesome/css/font-awesome.css" />
<link rel="stylesheet" href="vendor/metisMenu/dist/metisMenu.css" />
<link rel="stylesheet" href="vendor/animate.css/animate.css" />
<link rel="stylesheet" href="vendor/bootstrap/dist/css/bootstrap.css" />

<link rel="stylesheet" href="vendor/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" />
<link rel="stylesheet" href="vendor/select2-3.5.2/select2.css" />
<link rel="stylesheet" href="vendor/select2-bootstrap/select2-bootstrap.css" />

<!-- App styles -->
<link rel="stylesheet" href="fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css" />
<link rel="stylesheet" href="fonts/pe-icon-7-stroke/css/helper.css" />
<link rel="stylesheet" href="styles/style.css">
<link rel="stylesheet" href="vendor/toastr/build/toastr.min.css" />


<!--jQuery UI CSS-->
<link rel="stylesheet"
   	  href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
   	  type="text/css" />

<!-- alert 창 -->
<link rel="stylesheet" href="vendor/sweetalert/lib/sweet-alert.css" />

<style>
span.sty {
   clear: both;
}

label.sty {
   width: 100px;
   margin-right: 30px;
   text-align: center;
   border-radius: 3px;
   border: 1px solid #ccc;
   color: #999;
}

/* hide input */
input.radio:empty {
   margin-left: -2999px;
}

input[type="radio"] {
   visibility: hidden;
}

/* style label */
input.radio:empty ~ label {
   position: relative;
   float: left;
   line-height: 2.5em;
   text-align: center;
   margin-top: 2em;
   cursor: pointer;
   -webkit-user-select: none;
   -moz-user-select: none;
   -ms-user-select: none;
   user-select: none;
}

input.radio:empty ~ label:before {
   position: absolute;
   display: block;
   top: 0;
   bottom: 0;
   left: 0;
   content: '';
   width: 0.1em;
   background: white;
   border-radius: 3px 0 0 3px;
}

/* toggle hover */
input.radio:hover:not (:checked ) ~ label:before {
   content: '';
   text-align: center;
   color: red;
   width: 0.1em;
}

/* 승인 단계 */
input.radioa:hover:not (:checked ) ~ label {
   color: #3498db;
}

input.radiob:hover:not (:checked ) ~ label {
   color: #ED7B6F;
}

input.radioc:hover:not (:checked ) ~ label {
   color: #a86ebf;
}

input.radiod:hover:not (:checked ) ~ label {
   color: #e67e22;
}

/* 진행 단계 */
input.radioaa:hover:not (:checked ) ~ label {
   color: #E67E22;
}

input.radiobb:hover:not (:checked ) ~ label {
   color: #A86EBF;
}

input.radiocc:hover:not (:checked ) ~ label {
   color: #e6a300;
}

input.radiodd:hover:not (:checked ) ~ label {
   color: #3498DB;
}

input.radioee:hover:not (:checked ) ~ label {
   color: #ED7B6F;
}

/* 승인 단계 */
input.radioa:checked ~ label:before {
   content: '승인';
   width: 100%;
   color: white;
   text-align: center;
   padding-left: 10px;
   background-color: #3498db;
}

input.radiob:checked ~ label:before {
   content: '반려';
   width: 100%;
   color: white;
   text-align: center;
   background-color: #ED7B6F;
}

input.radioc:checked ~ label:before {
   content: '보류';
   width: 100%;
   color: white;
   text-align: center;
   background-color: #a86ebf;
}

input.radiod:checked ~ label:before {
   content: '미승인';
   width: 100%;
   color: white;
   text-align: center;
   background-color: #e67e22;
}

/* 진행 단계 */
input.radioaa:checked ~ label:before {
   content: '미진행';
   width: 100%;
   color: white;
   text-align: center;
   padding-left: 10px;
   background-color: #E67E22;
}

input.radiobb:checked ~ label:before {
   content: '보류';
   width: 100%;
   color: white;
   text-align: center;
   background-color: #A86EBF;
}

input.radiocc:checked ~ label:before {
   content: '진행';
   width: 100%;
   color: white;
   text-align: center;
   background-color: #e6a300;
}

input.radiodd:checked ~ label:before {
   content: '완료';
   width: 100%;
   color: white;
   text-align: center;
   background-color: #3498DB;
}

input.radioee:checked ~ label:before {
   content: '중단';
   width: 100%;
   color: white;
   text-align: center;
   background-color: #ED7B6F;
}

input.radio:checked ~ label {
   color: white;
}

input.radio:focus ~ label:before {
   box-shadow: 0 0 0 3px #999;
}

ul {
   padding-left: 0px;
}
	.group-clicked2{
	background : #beebff;
	border-radius : 2px;
	box-shadow : inset 0 0 1px #999;
}
.groupdiv2 span:hover {
	background : #e7f4f9;
	border-radius : 2px;
	box-shadow : inset 0 0 1px #ccc;
}

</style>
</head>

<body class="fixed-navbar fixed-sidebar">

   <!-- Simple splash screen-->
   <div class="splash">
      <div class="color-line"></div>
      <div class="splash-title">
         <h1>2PM</h1>
         <p>Now loading...</p>
         <div class="spinner">
            <div class="rect1"></div>
            <div class="rect2"></div>
            <div class="rect3"></div>
            <div class="rect4"></div>
            <div class="rect5"></div>
         </div>
      </div>
   </div>

<!--[if lt IE 7]>
<p class="alert alert-danger">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
<![endif]-->

   <!-- Header -->
   <tiles:insertAttribute name="header" />

   <!-- Navigation -->
   <tiles:insertAttribute name="sidebar" />

   <!-- Main Wrapper -->
   <div id="wrapper">
      <tiles:insertAttribute name="content" />

      <!-- Right sidebar -->
      <tiles:insertAttribute name="rightsidebar" />

      <!-- Footer-->
      <tiles:insertAttribute name="footer" />
   </div>

   <!-- Vendor scripts -->
   <script src="vendor/jquery/dist/jquery.min.js"></script>
   <script src="vendor/jquery-ui/jquery-ui.min.js"></script>
   <script src="vendor/slimScroll/jquery.slimscroll.min.js"></script>
   <script src="vendor/bootstrap/dist/js/bootstrap.min.js"></script>
   <script src="vendor/jquery-flot/jquery.flot.js"></script>
   <script src="vendor/jquery-flot/jquery.flot.resize.js"></script>
   <script src="vendor/jquery-flot/jquery.flot.pie.js"></script>
   <script src="vendor/flot.curvedlines/curvedLines.js"></script>
   <script src="vendor/jquery.flot.spline/index.js"></script>
   <script src="vendor/metisMenu/dist/metisMenu.min.js"></script>
   <script src="vendor/iCheck/icheck.min.js"></script>
   <script src="vendor/peity/jquery.peity.min.js"></script>
   <script src="vendor/sparkline/index.js"></script>
   <script src="vendor/sweetalert/lib/sweet-alert.min.js"></script>
   <script src="vendor/toastr/build/toastr.min.js"></script>
   <!-- App scripts -->
   <script src="scripts/homer.js"></script>
   
   <!-- alert -->
   <script src="vendor/sweetalert/lib/sweet-alert.min.js"></script>

   <script type="text/javascript">
   
   // 공통
   
   //스크립트 생성자
   function empInfo(emp_no, emp_name){
      this.emp_no = emp_no;
      this.emp_name = emp_name;
   }
   
   //사원정보 뽑아서 담을 배열
   var empInfoArray = new Array();
	
   // 사원정보 뽑아서 담을 배열의 선택전 배역
   var pre_empInfoArray = new Array();
   
   //트리구조 출력시 접히기 하려고. 만듬//////////////////
   var firstTree = 0;
   var secondTree = 0;
   ///////////////////////////////////////////
   
   //부서 선택시
   var departcho;
   //하위 부서 선택시
   var low_deptNumber;
   //사원
   var empListNumber;
   var choose;
   
   // 업무 삭제하기
   // 송/수신 나눠야 하는데 일단 보류
   function removeTask() {
	   console.log("삭제해볼까나");
	    
	   var arr = new Array();

		$("input[name='checkbox']:checked").each(function(i) {
			
			// console.log("글번호 : " + $(this).attr('id'));
			
			var task_no = $(this).attr('id');
			// console.log("task_no : " + task_no);
			
           arr.push(task_no);

		});
		
		console.log(arr);
		
			$.ajax(
					   {
							url : "task_remove.do",
							type: "post",
							data : {
										arr : arr
							       }
			           }
			      );
		}
   
   
      $('#makeuserUpdateDate').datepicker(
            {
               changeMonth : true,
               dayNames : [ '월요일', '화요일', '수요일', '목요일', '금요일', '토요일',
                     '일요일' ],
               dayNamesMin : [ '일','월', '화', '수', '목', '금', '토'],
               monthNamesShort : [ '1', '2', '3', '4', '5', '6', '7', '8',
                     '9', '10', '11', '12' ],
               monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
                     '8월', '9월', '10월', '11월', '12월' ],
               dateFormat : 'yy-mm-dd',
               changeYear : true,
               beforeShowDay: function(date){
                   var loadDt = new Date();
                   var dayday =new Date(Date.parse(loadDt) - 1 * 1000 * 60 * 60 * 24);
                    
                   if(date < dayday) return [false];  //선택못해
                   return [true];
                 },
                 onSelect: function(selected) {
                    $('.formendDate').datepicker("option","minDate", selected)
                 }
            });
      
      
      $('.demo4').click(function() {
         swal({
            title : "삭제 하시겠습니까?",
            text : "확인을 누르시면 선택하신  업무가 삭제 됩니다.",
            type : "warning",
            showCancelButton : true,
            confirmButtonColor : "#DD6B55",
            confirmButtonText : "확인",
            cancelButtonText : "취소",
            closeOnConfirm : false,
            closeOnCancel : false
         }, function(isConfirm) {
            if (isConfirm) {
            	removeTask();
               swal("삭제되었습니다", "선택하신 업무가 삭제되었습니다", "success");
               window.location.reload();
            } else {
               swal("취소되었습니다.", "선택하신 업무가 유지됩니다 :)", "error");
            }
         });
      });
    /*   $('.demo2').click(function() {
         swal({
            title : "등록성공",
            text : "정상적으로 업무가 등록되었습니다.",
            type : "success"
         });
      }); */
      
      

      
      $(function() {
    	  

    	  
    	  //검색
          $('#con_ins_org_sea_btn').click(function(){
        	  console.log("@@@@con_sear 머나오닝ㅇㅇㅇㅇ???? : "+con_sear);
        	  console.log("@@@@con_sear 머나오닝ㅇㅇㅇㅇ???? : "+(con_sear==2));
          	console.log('field : '+ $('#con_ins_org_sea_field').val()+"/word:"+$('#con_ins_org_sea_query').val());
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
      						 var userDto = "";
      						 var  makeTable ;
      		                    $.each(data, function(index){
      		                       userDto = data[index];
      		                       console.log("객체 : "+userDto);
  									console.log("userDto:"+ data[index]);
      		                   });
      		                    console.log("객체s : "+userDto[0]);
      		                  
      		                    
      		                  if(con_sear == 1){  
                                  makeTable = "<table class='table table-condensed table-bordered  table-hover'><tr style='background-color:#f8f8f8;'><th style='text-align:center'>사번</th><th style='text-align:center'>이름</th><th style='text-align:center'>직위</th><th style='text-align:center'>선택</th></tr>";
                               }else if(con_sear ==2){
                                  makeTable = "<table class='table table-condensed table-bordered  table-hover'><tr style='background-color:#f8f8f8;'><th style='text-align:center'>선택</th><th style='text-align:center'>사번</th><th style='text-align:center'>이름</th><th style='text-align:center'>직위</th></tr>";
                               }
                               
                               $.each(userDto, function(index){
                                  if(con_sear == 1){   
                                     makeTable += "<tr style='text-align:center'><td>"+userDto[index].emp_no+"</td><td>"+userDto[index].emp_name+"</td><td>"+userDto[index].position_name+"</td><td><button class='btn btn-outline btn-success btn-sm' onclick='recF(this)'><i class='fa fa-check'></i></button></td></tr>";
                                  }
                                  else if(con_sear == 2){  //여러명
                                     makeTable += "<tr style='text-align:center'><td><input type='checkbox'  name='chkbtn2' value='"+userDto[index].emp_name+"'></td><td>"+userDto[index].emp_no+"</td><td>"+userDto[index].emp_name+"</td><td>"+userDto[index].position_name+"</td></tr>";
                                  }
                               });
                               
                                if(con_sear == 1){  
                                  makeTable += "</table>";
                               }else if(con_sear ==2){
                                  makeTable += "</table><div class='pull-right'><input type='button' class='btn btn-success' value='선택' onclick=check()></div>";
                               }
      		                    
      		                   $('#empList2').empty();
      		                   $('#empList2').append(makeTable); 
      		                 	con_sear = 0;
      					}
      				}		
      			)
          	
          });
          

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
    	   
    	   //업무등록시  유효성
			$('#submitBtn').click(function() {
				console.log("이거탐?");
				if ($('#upmoo').val() == "") {
					toastr.warning('업무명을 입력해 주세요');
					$('#upmoo').focus();
					return false;
				}
				
				if($(':radio[name="cg_no"]:checked').length < 1){
					toastr.warning('업무유형을 입력해 주세요');                
					$('#inlineRadio1').focus();
					return false;
				}
				
				if ($('#rec_emp_no').val() == "") {
					toastr.warning('수신자사번을 입력해 주세요');
					$('#rec_emp_no').focus();
					return false;
				}
				
				
				if ($('#rec_name').val() == "") {
					toastr.warning('수신자명을 입력해 주세요');
					$('#rec_name').focus();
					return false;
				}
				
				if ($('#chamjoInput').val() == "") {
					toastr.warning('참조자사번을 입력해 주세요');
					$('#chamjoInput').focus();
					return false;
				}
				
				if ($('#task_name').val() == "") {
					toastr.warning('참조자명을 입력해 주세요');
					$('#task_name').focus();
					return false;
				}
				
				if ($('#makeuserUpdateDate').val() == "") {
					toastr.warning('업무기한을 입력해 주세요');
					$('#makeuserUpdateDate').focus();
					return false;
				}
				
				if ($('#content').val() == "") {
					toastr.warning('내용을 입력해 주세요');
					$('#content').focus();
					return false;
				}
				
			
				 swal({
			            title : "등록성공",
			            text : "정상적으로 업무가 등록되었습니다.",
			            type : "success"
			         });	
				
			}); 
    	  
    	  
    	  
    	  
    	  //모달 창 닫기 
    	  $('#closeModal').click(function(){
    		 firstTree = 0;
    		 secondTree = 0;
    		 $('#myModal6').modal('toggle'); 
    	  });
    	  
    	  
      // 입력한 datepicker의 업무 기한 넘겨주기
         $('#taskForm').submit(function(){
            var deadline = $('#makeuserUpdateDate').val();
            console.log("값 좀 보자 : " + deadline);
            
            $('#deadline').val(deadline);
            
            return true;
         });
         
         
         // 참조자 아이콘 클릭시
         $('#deptA').click(function() {
        	 
        	 con_sear = 2;
        	 console.log("@@@@con_sear : "+con_sear);
        	var empSelectNumber = 2;
 			var litag = "<ul style='list-style:none;margin-left:0px;'>"; 
 			
     		$('#organization').empty();
     		$('#empList').empty();
     		$('#empList2').empty();
     		$('#con_ins_org_sea_query').val('');
     		
     		$('#chamjoInput').val('');
     		$('#task_name').val('');   
     		$('#task_no_td').empty();
     		$('#task_name_td').empty();
     		
     		//사이즈변경, 지우기
     		$('#modal_size').removeClass('modal-md');
     		$('#modal_size').addClass('modal-lg');
     		
     		$('.groupdiv2').removeClass('col-md-4');
     		$('.groupdiv2').addClass('col-md-3');
     		
     		$('#empList').removeClass('col-md-8');
     		$('#empList').addClass('col-md-4');
     		
     		$('#modal_size_sea').removeClass('col-md-3');
     		$('#modal_size_sea').addClass('col-md-2');
     		
     		$('#modal_size_option').show();
     		
     		$('#empList_list').html('<span style="color:red"><br>선택된 사원이 없습니다.<br><br></span>');
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
          					litag += "<li style='padding:2px;'onclick='seeDepart(this,"
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
         
         var con_sear = 0;
         
         //수신자 아이콘 클릭시
         $('#recIcon').click(function(){
        	 con_sear = 1;
        	 console.log("@@@@con_sear : "+con_sear);
        	var empSelectNumber = 1;
 			var litag = "<ul style='list-style:none;margin-left:0px;'>";   		
        	$('#organization').empty();
            $('#empList').empty();
        	$('#empList2').empty();
     		$('#con_ins_org_sea_query').val('');
     		
     		$('#rec_emp_no').val('');
     	    $('#rec_name').val('');
     	   //	$('#rec_no_td').empty();
   			//$('#rec_name_td').empty();
     		
     		//$('#empList_list').html('<span style="color:red"><br>선택된 사원이 없습니다.<br><br></span>');
     		//pre_empInfoArray.splice(0,pre_empInfoArray.length);
     		
     		//사이즈변경, 지우기
     		$('#modal_size').removeClass('modal-lg');
     		$('#modal_size').addClass('modal-md');
     		
     		$('.groupdiv2').removeClass('col-md-3');
     		$('.groupdiv2').addClass('col-md-4');
     		
     		$('#empList').removeClass('col-md-4');
     		$('#empList').addClass('col-md-8');
     		
     		$('#modal_size_sea').removeClass('col-md-2');
     		$('#modal_size_sea').addClass('col-md-3');
     		
     		$('#modal_size_option').hide();
     		
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
        				    litag +=")'><i class='fa fa-sitemap'></i><span class='org_list_class'>"+departMent[index].branch_name+"&nbsp;("+departMent[index].branch_no+")</span></li>";
        					litag+="<div id='dept_div"
        					litag+=departMent[index].branch_no
        					litag+="'></div>";
                  });
                  litag +="</ul>";
                  $('#organization').html(litag);

               }
            });
         
         });
      });

      //부서 출력 하는 아작스
      function seeDepart(obj, empSelectNumber, choose) {
      	//전역 부서 선택시
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
      				
      				litag += "<li onclick='seelow_Depart(this, "
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

      //하위 부서 클릭시
      function seelow_Depart(obj,empSelectNumber,departcho) {	
    	deptNumber= departcho;
    	var litag = "<ul style='list-style:none;margin-left:30px;'>";
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
        				litag +=")'>"+'<i class="fa fa-long-arrow-right"></i><span>'+low_dept[index].low_dept_name+"("+low_dept[index].low_dept_no+")</span></li>";
      			});
      			litag +="</ul>";
    			$("#"+div_id).html(litag);
      			}else{
      				secondTree = 0;
    				$("#"+div_id).html();	
    			}
    			
      		}

      	});
      }
      
    
      //사원 뽑아오기
      function seeEmpMember(obj,empSelectNumber,low_dept_no){
         //체크
         var empListNumber = low_dept_no;
   		 //alert("사원뽑기 : "+empListNumber);
         
         console.log(obj);
         
         //클릭한 text 값 뽑아옴.
         var low_dept = $(obj).text();
         //alert("taskEmpModal : "+low_dept);
        // alert("selectNo : " + empSelectNumber);
         var makeTable = "";
         if(empSelectNumber == 1){
          makeTable = "<table class='table table-condensed table-hover'><tr style='background-color:#f8f8f8'><th>사번</th><th>이름</th><th>직위</th><th>선택</th></tr>";
         }else{
          makeTable = "<table class='table table-condensed table-hover'><tr style='background-color:#f8f8f8'><th>선택</th><th>사번</th><th>이름</th></tr>";
         }
         
         $.ajax(
               {
                  url: "taskEmpModal_exclude.do",
                  data:{
                	  low_dept_no: empListNumber
                       },
                  success:function(data){
                	  var userDto = "";
                      $.each(data, function(index){
                         userDto = data[index];
                         console.log(userDto);
                     });
					
                      
                      
                     $.each(userDto, function(index){
                        if(empSelectNumber == 1){   
                           makeTable += "<tr><td>"+userDto[index].emp_no+"</td><td>"+userDto[index].emp_name+"</td><td>"+userDto[index].position_name+"</td><td><button class='btn  btn-outline btn-success btn-sm' onclick='recF(this)'><i class='fa fa-check'></i></button></td></tr>";
                        }
                        else if(empSelectNumber == 2){
                           makeTable += "<tr><td><input type='checkbox' name='chkbtn' value='"+userDto[index].emp_name+"'></td><td>"+userDto[index].emp_no+"</td><td>"+userDto[index].emp_name+" ("+userDto[index].position_name+")</td></tr>";
                        }
                     });
                     makeTable += "</table>";  //<br><input type='button' class='btn btn-success' value='선택' onclick=check()>
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
      
      
      
      
      
      
      
      
      
      
      
      
      
   
      
      //체크박스 선택후 버튼 클릭시 호출
      function check(low_deptNumber){
         //체크박스 크기만큼 배열 생성
         var checkResult = new Array();
         $(":checkbox[name='chkbtn2']:checked").each(function(pi,po){
            //이름 
            checkResult[pi] = po.value;
            //사번
            empInfoArray.push(new empInfo($(this).parent().next().html(),checkResult[pi]));
         });
         console.log("사원  정보#############: "+empInfoArray);
         console.log("배열 싸이즈 ############ : "+empInfoArray.length);
            if(empInfoArray.length > 1){
               console.log("if 내부 : " +empInfoArray[0].emp_no +" / "+empInfoArray[0].emp_name);
               //화면에 보이는 input 은 그냥 때려넣음
               $("#chamjoInput").val(empInfoArray[0].emp_no);
               $('#task_name').val(empInfoArray[0].emp_name);
               
               var input_no = "";
               var input_name = "";
               for(var i = 1; i < empInfoArray.length; i++){
                  input_no += "<input type='text' readonly class='form-control input-sm' name='emp_no' value='"+empInfoArray[i].emp_no+"'>";
                  input_name +="<input type='text' readonly class='form-control input-sm' value='"+empInfoArray[i].emp_name+"'>";
               }
               $('#task_no_td').append(input_no);
               $('#task_name_td').append(input_name);
            }else{
               $("#chamjoInput").val(empInfoArray[0].emp_no);
               $('#task_name').val(empInfoArray[0].emp_name);            
            }
           empInfoArray.splice(0,empInfoArray.length);
           console.log("####사원  정보 지우기 : "+empInfoArray);
         $("#myModal6").modal("hide");
      }
      
      //수신자 선택시
      function recF(obj){
    	
         //수신자 사번
         var rec_emp_no = $(obj).parent().parent().children().eq(0).html();
         //수신자 이름
         var rec_name = $(obj).parent().parent().children().eq(1).html();
         $('#rec_emp_no').val(rec_emp_no);
         $('#hiddenEmp_no').val(rec_emp_no);
         $('#rec_name').val(rec_name);
         $('#myModal6').modal("hide");
         con_sear = 0;
      }
      

      
      // 검색하기
      function search() {
    	  var selected = $('#selectSearch option:selected').val();
    	  console.log("선택된 값 : " + selected);
    	  
    	  if(selected == 'deadline' || selected == 'send_date') {
    		  var data = "<div class='form-inline'>";
    		  data += "<div class='input-group date'>";
    		  data += "<input type='text' class='form-control input-sm' name='q_rec' id='input'>";
    		  data += "<span class='input-group-addon' style='color:#fd7d86'><i class='fa fa-calendar'></i></span>";
    		  
    		  data += "</div></div>";
    		  $('#searchInput').empty().html(data);
    		  calendarIcon();
    	  } else {
    		  var data = "<input type='text' class='form-control input-sm'";
    		  data += "width='90%' style='height: 27px;' name='q_rec' id='input'>";
    		  
    		  $('#searchInput').empty().html(data);
    	  }
      }
      
      function search2() {
    	  var selected = $('#selectSearch2 option:selected').val();
    	  console.log("선택된 값 : " + selected);
    	  
    	  if(selected == 'deadline' || selected == 'send_date') {
    		  var data = "<div class='form-inline'>";
    		  data += "<div class='input-group date'>";
    		  data += "<input type='text' class='form-control daydaydate input-sm' name='q_song' id='input'>";
    		  data += "<span class='input-group-addon' style='color:#fd7d86'><i class='fa fa-calendar'></i></span>";
    		  
    		  data += "</div></div>";
    		  $('#searchInput2').empty().html(data);
    		  daydaydate();
    	  } else {
    		  var data = "<input type='text' class='form-control input-sm'";
    		  data += "width='90%' style='height: 27px;' name='q_song' id='input'>";
    		  
    		  $('#searchInput2').empty().html(data);
    	  }
      }
      
      function search3() {
    	  var selected = $('#selectSearch3 option:selected').val();
    	  console.log("선택된 값 : " + selected);
    	  
    	  if(selected == 'deadline' || selected == 'send_date') {
    		  var data = "<div class='form-inline'>";
    		  data += "<div class='input-group date'>";
    		  data += "<input type='text' class='form-control daydaydate input-sm' name='q_parti' id='input'>";
    		  data += "<span class='input-group-addon' style='color:#fd7d86'><i class='fa fa-calendar'></i></span>";
    		  
    		  data += "</div></div>";
    		  $('#searchInput3').empty().html(data);
    		  daydaydate2();
    	  } else {
    		  var data = "<input type='text' class='form-control input-sm'";
    		  data += "width='90%' style='height: 27px;' name='q_parti' id='input'>";
    		  
    		  $('#searchInput3').empty().html(data);
    	  }
      }
      
      function calendarIcon(){
    	  var text = $('#searchInput').children().first().children().first().children().first().datepicker({
    		  changeMonth : true,
              dayNames : [ '월요일', '화요일', '수요일', '목요일', '금요일', '토요일',
                    '일요일' ],
              dayNamesMin : ['일','월', '화', '수', '목', '금', '토'],
              monthNamesShort : [ '1', '2', '3', '4', '5', '6', '7', '8',
                    '9', '10', '11', '12' ],
              monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
                    '8월', '9월', '10월', '11월', '12월' ],
              dateFormat : 'yy-mm-dd'
              
              
    	  });
    	  
      }
      
      function daydaydate(){
    	  var text= $('#searchInput2').children().first().children().first().children().first().datepicker({
    		  changeMonth : true,
              dayNames : [ '월요일', '화요일', '수요일', '목요일', '금요일', '토요일',
                    '일요일' ],
              dayNamesMin : ['일','월', '화', '수', '목', '금', '토'],
              monthNamesShort : [ '1', '2', '3', '4', '5', '6', '7', '8',
                    '9', '10', '11', '12' ],
              monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
                    '8월', '9월', '10월', '11월', '12월' ],
              dateFormat : 'yy-mm-dd'
              
              
    	  });
    	 }
   
      function daydaydate2(){
    	  var text= $('#searchInput3').children().first().children().first().children().first().datepicker({
    		  changeMonth : true,
              dayNames : [ '월요일', '화요일', '수요일', '목요일', '금요일', '토요일',
                    '일요일' ],
              dayNamesMin : ['일','월', '화', '수', '목', '금', '토'],
              monthNamesShort : [ '1', '2', '3', '4', '5', '6', '7', '8',
                    '9', '10', '11', '12' ],
              monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
                    '8월', '9월', '10월', '11월', '12월' ],
              dateFormat : 'yy-mm-dd'
              
              
    	  });
    	 }
      
   </script>
</body>
</html>