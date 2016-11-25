<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">

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

<!-- App styles -->
<link rel="stylesheet" href="fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css" />
<link rel="stylesheet" href="fonts/pe-icon-7-stroke/css/helper.css" />
<link rel="stylesheet" href="styles/style.css">

</head>
<body class="fixed-navbar fixed-sidebar">

<!-- Simple splash screen-->
<div class="splash"> <div class="color-line"></div><div class="splash-title"><h1>2PM</h1><p>Now loading...</p><div class="spinner"> <div class="rect1"></div> <div class="rect2"></div> <div class="rect3"></div> <div class="rect4"></div> <div class="rect5"></div> </div> </div> </div>
	<!--[if lt IE 7]>
<p class="alert alert-danger">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
<![endif]

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
	<script src="vendor/metisMenu/dist/metisMenu.min.js"></script>
	<script src="vendor/iCheck/icheck.min.js"></script>
	<script src="vendor/sparkline/index.js"></script>
	<script src="electronic_sanction/"></script>
	
	<!--전자결재 script  -->
	<script src="js/electronic_sanction/electronic_sanction.js"></script>

	<!-- App scripts -->
	<script src="scripts/homer.js"></script>
<!--월별 캘린더.-->  
<script src="<c:url value="/js/jquery.mtz.monthpicker.js"/>"></script>  
  
<script>
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
		var litag = "<ui>";
	
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
      				
      				litag += "<li onclick='seelow_Depart(this, "
    					litag +=empSelectNumber+","
    				    litag +=dept[index].dept_no
    				    litag +=")'>"+'&nbsp;&nbsp;ㄴ'+dept[index].dept_name+"/"+dept[index].dept_no+"</li>";
    					litag +="</ul>";
    					
    					litag+="<div id='low_dept_div"
    					litag+=dept[index].dept_no
    					litag+="'></div>";
      			});
      			$("#"+div_id).html(litag);
      		}
      	});
      }

      //하위 부서 클릭시
      function seelow_Depart(obj,empSelectNumber,departcho) {	
    	deptNumber= departcho;
    	var litag = "<ui>";
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
      			$.each(low_dept, function(index) {
    				litag += "<li onclick='seeEmpMember(this, "
        				litag += empSelectNumber+","
        				litag +=low_dept[index].low_dept_no
        				litag +=")'>"+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㄴ'+low_dept[index].low_dept_name+"/"+low_dept[index].low_dept_no+"</li>";
        				litag +="</ul>";
		
      			});
    			$("#"+div_id).html(litag);
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
         
        
         
         var makeTable = "<table class='table'><tr><th><input type='checkbox'></th><th>사번</th><th>이름</th>";
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
         }else{
         
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
         //수신자 사번
         var rec_emp_no = $(obj).parent().parent().children().eq(0).html();
         //수신자 이름
         var rec_name = $(obj).parent().parent().children().eq(1).html();
         $('#rec_emp_no').val(rec_emp_no);
         $('#rec_name').val(rec_name);
         $('#myModal6').modal("hide");
      }


$(function(){
	
	//sanction_Modal  - > 모달 아이콘.
	
	//결재자 아이콘 클릭시	
	$('#draft_Ok_Icon').click(function(){
		var empSelectNumber = 1;
			var litag = "<ui style='list-style:none;''>";   		
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
    					litag +="</ul>";
    					
    					litag+="<div id='dept_div"
    					litag+=departMent[index].branch_no
    					litag+="'></div>";
              });
              

              $('#organization').html(litag);

           }
        })
     });
	
	//참조자 아이콘 버튼 클릭시
	$('#draft_line_Icon').click(function(){
		
		var empSelectNumber = 2;
		var litag = "<ui style='list-style:none;'>";   		
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
	
	//
	$('#documentTable').click(function(){
		
	});
	
});
</script>
</body>
</html>