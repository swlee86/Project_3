<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Page title -->
<title>EPM | WebApp admin theme</title>

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<!--<link rel="shortcut icon" type="image/ico" href="favicon.ico" />-->

<!-- Vendor styles -->
<link rel="stylesheet" href="vendor/fontawesome/css/font-awesome.css" />
<link rel="stylesheet" href="vendor/metisMenu/dist/metisMenu.css" />
<link rel="stylesheet" href="vendor/animate.css/animate.css" />
<link rel="stylesheet" href="vendor/bootstrap/dist/css/bootstrap.css" />
<link rel="stylesheet" href="vendor/sweetalert/lib/sweet-alert.css" />

<link rel="stylesheet"
   href="vendor/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" />
<link rel="stylesheet" href="vendor/select2-3.5.2/select2.css" />
<link rel="stylesheet"
   href="vendor/select2-bootstrap/select2-bootstrap.css" />



<!-- App styles -->
<link rel="stylesheet"
   href="fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css" />
<link rel="stylesheet" href="fonts/pe-icon-7-stroke/css/helper.css" />
<link rel="stylesheet" href="styles/style.css">


<!--jQuery UI CSS-->
<link rel="stylesheet"
   href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
   type="text/css" />

<!-- jquery ui -->
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
   text-indent: 3.25em;
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
   text-indent: .9em;
   color: red;
   width: 0.1em;
}

input.radioa:hover:not (:checked ) ~ label {
   color: #3498db;
}

input.radior:hover:not (:checked ) ~ label {
   color: #e67e22;
}

input.radiow:hover:not (:checked ) ~ label {
   color: #a86ebf;
}

input.radioa:checked ~ label:before {
   content: '승인';
   text-indent: .9em;
   width: 100%;
   color: white;
   text-align: center;
   padding-left: 10px;
   background-color: #3498db;
}

input.radior:checked ~ label:before {
   content: '거부';
   text-indent: .9em;
   width: 100%;
   color: white;
   text-align: center;
   background-color: #e67e22;
}

input.radiow:checked ~ label:before {
   content: '보류';
   text-indent: .9em;
   width: 100%;
   color: white;
   text-align: center;
   background-color: #a86ebf;
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
   <!-- App scripts -->
   <script src="scripts/homer.js"></script>
   
	<!-- alert -->
	<script src="vendor/sweetalert/lib/sweet-alert.min.js"></script>

   <script type="text/javascript">
   
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
   
   // 업무 삭제하기
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
               dayNamesMin : [ '월', '화', '수', '목', '금', '토', '일' ],
               monthNamesShort : [ '1', '2', '3', '4', '5', '6', '7', '8',
                     '9', '10', '11', '12' ],
               monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
                     '8월', '9월', '10월', '11월', '12월' ],
               dateFormat : 'yy-mm-dd',
               changeYear : true
            });

      $('#makeuserUpdateDate2').datepicker(
            {
               changeMonth : true,
               dayNames : [ '월요일', '화요일', '수요일', '목요일', '금요일', '토요일',
                     '일요일' ],
               dayNamesMin : [ '월', '화', '수', '목', '금', '토', '일' ],
               monthNamesShort : [ '1', '2', '3', '4', '5', '6', '7', '8',
                     '9', '10', '11', '12' ],
               monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
                     '8월', '9월', '10월', '11월', '12월' ],
               dateFormat : 'yy-mm-dd',
               changeYear : true
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
      $('.demo2').click(function() {
         swal({
            title : "등록성공",
            text : "정상적으로 업무가 등록되었습니다.",
            type : "success"
         });
      });
      
      
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
      
   
      //송신탭 >  업무 제목 클릭시
      function sendTab_task_no(obj){
    	  //업무 이름 (span) > 부모 td > 이전 형제 td > 첫번째 자식 > 텍스트 노드 선택
    	  console.log(obj.parentNode.previousSibling.firstChild.nodeValue);
    	  var task_no = obj.parentNode.previousSibling.firstChild.nodeValue;
    	  location.href="taskRequest_Transmit_Detail.do?task_no="+task_no;
      }
      
      //참여탭 > 업무 제목 클릭시
      function particTab_task_no(obj){
    	  //업무 이름 (span) > 부모 td > 이전 형제 td > 첫번째 자식 > 텍스트 노드 선택
    	  console.log(obj.parentNode.previousSibling.firstChild.nodeValue);
    	  var task_no = obj.parentNode.previousSibling.firstChild.nodeValue;
    	  alert("참여 업무번호 : "+task_no);
    	  location.href="taskRequest_Participation_Detail.do?task_no="+task_no;
      }
      
      
      $(function() {
         
    	  //송신 탭 클릭 시 
    	  $('#sendTab').click(function(){
    		  $.ajax(
    					{
    			  			url : "taskRequest_Transmit_List.do",
    			  			dataType : 'json',
    			  			success : function(data){
    			  				var table="";
    			  				console.log(data.json[0].length);
    			  				var array = data.json[0];
    			  				console.log(array);
    			  				for(var i = 0; i < data.json[0].length; i++){
    			  					table += "<tr>";			
    			  					table += "<td><input type='checkbox' style='margin-left:20px'></td>"
    			  					table+="<td>"+array[i].task_no+"</td>";
    			  					table+="<td><span onclick='sendTab_task_no(this);'>"+array[i].task_name+"</span></td>";
    			  					table+="<td>"+array[i].deadline+"</td>";
    			  					table+="<td>"+array[i].rec_name+"</td>";
    			  					table+="<td>"+array[i].send_date+"</td>";
    			  					table+="<td>"+array[i].step_no+"</td>";
    			  					table +="</tr>";
    			  				}
    			  				$('#secondTbody').html(table);
    			  			}
    		  			}
    				);
    	  });
    	  
    	  //참여 탭 클릭 시
    	  $('#partnerTab').click(function(){
    		  $.ajax(
    					{
    						url : "taskRequest_Participation_List.do",
    					    success : function(data){
    					    	var table = "";
    					    	var array = data.list;
    					    	console.log("참여 : "+data.list.length);
    					    	for(var i = 0; i < data.list.length; i++){
    					    		table += "<tr>";			
    			  					table += "<td><input type='checkbox' style='margin-left:20px'></td>"
    			  					table+="<td>"+array[i].task_no+"</td>";
    			  					table+="<td><span onclick='particTab_task_no(this);'>"+array[i].task_name+"</span></td>";
    			  					table+="<td>"+array[i].deadline+"</td>";
    			  					table+="<td>"+array[i].emp_name+"</td>";
    			  					table+="<td>"+array[i].send_date+"</td>";
    			  					table+="<td>진행률</td>";
    			  					table +="</tr>";
    					    	}
    					    	$('#thirdBody').html(table);
    					    }
    					}  
    		        )
    	  });
    	  
    	  //기본배열 넘기기 테스트
    	/*   $('#test').click(function(){
    		 alert("테스트!!");
    		 var array = new Array();
    		 array.push("헬로");
    		 array.push("하이");
    		 console.log(array);
    		// jQuery.ajaxSettings.traditional = true;
    		 $.ajax(
    				 {
    					url:"test.do",
    					data :{
    						array : array
    					},
    					success : function(data){
    						alert("성공")
    					}
    				 }
    			   ); 
    		 
    	  }); */
    	  
         $('#taskForm').submit(function(){
            var startDate = $('#makeuserUpdateDate').val();
            var lastDate = $('#makeuserUpdateDate2').val();
            
            //var result = calDateRange(startDate,lastDate);
            //alert("차이 결과 : "+result);
            
            $('#deadline').val(lastDate);
            
            
            //라디오버튼
            var st = $("input[type=radio][name=cg_noT]:checked").val();
            alert("st??? : "+st);
            var cg = '';
            if(st == "업무요청"){
               cg = 1;
               $('#cg_name').val('업무요청');
            }else if(st == "업무보고"){
               cg = 2;
               $('#cg_name').val('업무보고');
            }else if(st == "업무일지"){
               cg = 3;
               $('#cg_name').val('업무일지');
            }
            
            $('#cg_no').val(cg);
            
            
            
            return true;
         });
         
         
         //참조자 아이콘 클릭시
         $('#deptA').click(function() {
        		  var  empSelectNumber = 1;
                  var litag = "<ul>";
                  $('#organization').empty();
                  $('#empList').empty();
                  
              	$.ajax({
        			url : "taskWriteModal.do",
        			success : function(data) {
        				 $('#myModal6').modal();
        				choose = 1;
        				var departMent = "";

        				$.each(data, function(index) {
        					departMent = data[index];
        				});

        				$.each(departMent, function(index) {
        					litag += "<li onclick='seeDepart(this,"
        						litag +=empSelectNumber +","
            				    litag +=departMent[index].branch_no
            				    litag +=")'>"+departMent[index].branch_name+"/"+departMent[index].branch_no+"</li>";
            				});
        				litag +="</ul>";

        				$('#organization').html(litag);

        			}
        		})
               });
         
         
         //수신자 아이콘 클릭시
         $('#recIcon').click(function(){
        	var empSelectNumber = 2;
            var litag = "<ul>";
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
  					litag += "<li onclick='seeDepart(this,"
						litag +=empSelectNumber +","
    				    litag +=departMent[index].branch_no
    				    litag +=")'>"+departMent[index].branch_name+"/"+departMent[index].branch_no+"</li>";
      				});
                  

                  $('#organization').html(litag);

               }
            })
         });
         
      });

      //부서 출력 하는 아작스
      function seeDepart(obj, empSelectNumber, choose) {
      	//전역 부서 선택시
          departcho = choose;

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

      			$.each(dept, function(index) {
      				$(obj).append(
      						"<br>&nbsp;&nbsp;<span onclick='seelow_Depart(this,"+empSelectNumber+","+dept[index].dept_no+")'>"
      						+dept[index].dept_name + "</span>");
      			});
      		}
      	});
      }

      //하위 부서 클릭시
      function seelow_Depart(obj,empSelectNumber,departcho) {
      	alert("부서 : "+departcho);
      	deptNumber= departcho;

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
      			$.each(low_dept, function(index) {
      				$(obj).append(
      						"<br>&nbsp;&nbsp&nbsp;&nbsp;<span onclick='seeEmpMember(this,"+empSelectNumber+","+low_dept[index].low_dept_no+")'>"
      						+ low_dept[index].low_dept_name + "</span>");
      			});
      		}

      	});
      }
      
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
         var makeTable = "";
         if(empSelectNumber == 1){
          makeTable = "<table class='table'><tr><th>사번</th><th>이름</th><th/>";
         }else{
          makeTable = "<table class='table'><tr><th><input type='checkbox'></th><th>사번</th><th>이름</th>";
         }
         
         $.ajax(
               {
                  url: "taskEmpModal.do",
                  data:{
                	  low_dept_no: empListNumber
                       },
                  success:function(data){
                	  var emp = "";
                      $.each(data, function(index){
                         emp = data[index];
                         console.log(emp);
                     });
                     
                     $.each(emp, function(index){
                        if(empSelectNumber == 1){   
                           makeTable += "<tr><td>"+emp[index].emp_no+"</td><td>"+emp[index].emp_name+"</td><td><input type='button' class='btn btn-default' onclick='recF(this)' value='선택'></td></tr>";   
                        }
                        else if(empSelectNumber == 2){
                           makeTable += "<tr><td><input type='checkbox' name='chkbtn' value='"+emp[index].emp_name+"'></td><td>"+emp[index].emp_no+"</td><td>"+emp[index].emp_name+"</td></tr>";
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
      
         //체크박스 크기만큼 배열 생성
         var checkResult = new Array();
         $(":checkbox[name='chkbtn']:checked").each(function(pi,po){
            //이름 
            checkResult[pi] = po.value;
            //사번
            empInfoArray.push(new empInfo($(this).parent().next().html(),checkResult[pi]));
         });
         console.log("사원 : "+empInfoArray);
         
            if(empInfoArray.length > 1){
               console.log("if 내부 : " +empInfoArray[0].emp_no +" / "+empInfoArray[0].emp_name);
               //화면에 보이는 input 은 그냥 때려넣음
               $("#task_no").val(empInfoArray[0].emp_no);
               $('#task_name').val(empInfoArray[0].emp_name);
               
               var input_no = "";
               var input_name = "";
               for(var i = 1; i < empInfoArray.length; i++){
                  input_no += "<input type='text' class='form-control' name='emp_no' value='"+empInfoArray[i].emp_no+"'>";
                  input_name +="<input type='text' class='form-control' value='"+empInfoArray[i].emp_name+"'>";
               }
               $('#task_no_td').append(input_no);
               $('#task_name_td').append(input_name);
            }else{
               $("#task_no").val(empInfoArray[0].emp_no);
               $('#task_name').val(empInfoArray[0].emp_name);            
            }
         
         $("#myModal6").modal("hide");
      }
      
      //수신자 선택시
      function recF(obj){
         //수신자 사번
         var rec_emp_no = $(obj).parent().parent().children().eq(0).html();
         //수신자 이름
         var rec_name = $(obj).parent().parent().children().eq(1).html();
         $('#rec_emp_no').val(rec_emp_no);
         $('#rec_name').val(rec_name);
         $('#myModal6').modal("hide");
      }
      
      // 검색하기
      function search() {
    	  var selected = $('#selectSearch option:selected').val();
    	  console.log("선택된 값 : " + selected);
    	  
    	  if(selected == 'deadline' || selected == 'send_date') {
    		  var data = "<div class='form-inline'>";
    		  data += "<div class='input-group date'>";
    		  data += "<input type='text' class='form-control input-sm' name='input' id='input'>";
    		  data += "<span class='input-group-addon' style='color:#fd7d86'><i class='fa fa-calendar'></i></span>";
    		  
    		  data += "</div></div>";
    		  $('#searchInput').empty().html(data);
    		  calendarIcon();
    	  } else {
    		  var data = "<input type='text' class='form-control input-sm'";
    		  data += "width='90%' style='height: 27px;' name='input' id='input'>";
    		  
    		  $('#searchInput').empty().html(data);
    	  }
      }
      
      
      function calendarIcon(){
    	  var text = $('#searchInput').children().first().children().first().children().first().datepicker({
    		  changeMonth : true,
              dayNames : [ '월요일', '화요일', '수요일', '목요일', '금요일', '토요일',
                    '일요일' ],
              dayNamesMin : [ '월', '화', '수', '목', '금', '토', '일' ],
              monthNamesShort : [ '1', '2', '3', '4', '5', '6', '7', '8',
                    '9', '10', '11', '12' ],
              monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
                    '8월', '9월', '10월', '11월', '12월' ],
              dateFormat : 'yy-mm-dd',
              changeYear : true
    		  
    	  });
    	  
      }
      
   </script>
</body>
</html>