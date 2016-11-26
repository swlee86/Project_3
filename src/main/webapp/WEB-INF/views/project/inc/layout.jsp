<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>    
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
    
    <!--텍스트 에디터 사용시 추가해야할 css -->
    <link rel="stylesheet" href="vendor/summernote/dist/summernote.css" />
    <link rel="stylesheet" href="vendor/summernote/dist/summernote-bs3.css" />
    
    <!-- App styles -->
    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css" />
    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/css/helper.css" />
    <link rel="stylesheet" href="styles/style.css">
    
	<!--jQuery UI CSS-->
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	
	<script>
	$(function(){
	    //참조자 아이콘 클릭시
	    $('#organization_add').click(function() {
	   		var  empSelectNumber = 1;
			var litag = "<ui style='list-style:none;''>";   		
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
	    					litag +="</ul>";
	    					
	    					litag+="<div id='dept_div"
	    					litag+=departMent[index].branch_no
	    					litag+="'></div>";
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
		alert("부서 : "+choose);
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
	
	
	//참조자 선택시
	function recF(obj){
	   //수신자 사번
	   var emp_no = $(obj).parent().parent().children().eq(0).html();
	   var name = $(obj).parent().parent().children().eq(1).html();
	   
	   
	   console.log("emp_no : "+ emp_no);
	   console.log("name : "+ name);
	   $('#myModal6').modal("hide");
	  
	}
	</script>
</head>
<body class="fixed-navbar fixed-sidebar">

<!-- Simple splash screen-->
<div class="splash"> <div class="color-line"></div><div class="splash-title"><h1>2PM</h1><p>Now loading...</p><div class="spinner"> <div class="rect1"></div> <div class="rect2"></div> <div class="rect3"></div> <div class="rect4"></div> <div class="rect5"></div> </div> </div> </div>
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
<script src="vendor/metisMenu/dist/metisMenu.min.js"></script>
<script src="vendor/iCheck/icheck.min.js"></script>
<script src="vendor/sparkline/index.js"></script>
<script src="vendor/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="vendor/jquery-flot/jquery.flot.js"></script>
<script src="vendor/jquery-flot/jquery.flot.resize.js"></script>
<script src="vendor/jquery-flot/jquery.flot.pie.js"></script>
<script src="vendor/flot.curvedlines/curvedLines.js"></script>
<script src="vendor/jquery.flot.spline/index.js"></script>
<script src="vendor/summernote/dist/summernote.min.js"></script>
<script src="vendor/peity/jquery.peity.min.js"></script>

<!-- App scripts -->
<script src="scripts/homer.js"></script>
<script>
$(function () {

    // Initialize summernote plugin
    $('.summernote').summernote();

    var sHTML = $('.summernote').code();

    console.log(sHTML);

    $('.summernote1').summernote({
        toolbar: [
            ['headline', ['style']],
            ['style', ['bold', 'italic', 'underline', 'superscript', 'subscript', 'strikethrough', 'clear']],
            ['textsize', ['fontsize']],
            ['alignment', ['ul', 'ol', 'paragraph', 'lineheight']],
        ]
    });

    $('.summernote2').summernote({
        airMode: true,
    });
	
	
		//프로젝트 시작일
		$('#formstartDate').datepicker({
			     changeMonth: true, 
		         dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
		         dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
		         monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
		         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		         dateFormat: 'yy-mm-dd',
		         changeYear: true
		});	
		

		$('#formendDate').datepicker({
			 changeMonth: true, 
	         dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
	         dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
	         monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	         dateFormat: 'yy-mm-dd',
	         changeYear: true
		});
 
		
		$('.selectpeople').click(function(){  
			var emp_no = ($(this).attr('id')).substr(9);
			//console.log(emp_no);
			//console.log("html: " +$('#m_name').html());
			$.ajax(
					{
						type : "post",
						url  : "pjd_people.do",
						data : {
							"emp_no" : emp_no,						
						},
						success : function(data){
							console.log(data.data);
							$('#m_name').html(data.data.emp_name);
							$('#m_dept').html(data.data.branch_name + '\n' + data.data.dept_name+ '\n' +data.data.low_dept_name);
							$('#m_cell').html(data.data.cell_phone);
							$('#m_img').attr('src',data.data.pic);
						}
					});
			});
				
	});

	//상세보기 클릭시 실행
	function detailProjectCheckList(mybtn){
		
		var btn = mybtn;
		var upbtn = btn.parentNode.previousSibling.previousSibling.childNodes;
		var upbtn2;
		
		for(var i = 0; i < upbtn.length; i++){
			upbtn2 = upbtn[3];
		}
	
		console.log(upbtn2);
		//히든 값 담은 변수
		var hiddenValue = upbtn2.value;
		location.href="projectDetailCheckView.do?hidden="+hiddenValue;
	}
	
	

			
</script>
</body>
</html>