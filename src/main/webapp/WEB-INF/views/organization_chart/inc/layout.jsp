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
    <link rel="stylesheet" href="vendor/sweetalert/lib/sweet-alert.css" />
    
    <!-- App styles -->
    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css" />
    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/css/helper.css" />
    <link rel="stylesheet" href="styles/style.css">
<link rel="stylesheet" href="styles/static_custom.css">
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
<script src="vendor/sweetalert/lib/sweet-alert.min.js"></script>
<!-- App scripts -->
<script src="scripts/homer.js"></script>


<script>

    $(function () {
        $('.demo2').click(function(){
            swal({
                title: "",
                text: "주소록에 추가 되었습니다.",
                type: "success"
            });
        });
        
        
    	//조직도 아이콘 클릭시
    	$('#organicSelect').click(function(){
    		var litag = "<ul>";
    		$('#organization').empty();
    		$('#empList').empty();
    		$.ajax({
    			url : "oranicChartFirst.do",
    			success : function(data) {
    				choose = 1;
    				var departMent = "";

    				$.each(data, function(index) {

    					departMent = data[index];
    				});

    				console.log("departMent : " + departMent);

    				$.each(departMent, function(index) {
    					litag += "<li onclick='seeDepart(this, choose)'>"+departMent[index].branch_name+"</li>";
    				});
    				litag +="</ul>";

    				$('#organization').html(litag);

    			}
    		})
    	});
    });


//부서 출력 하는 아작스
function seeDepart(obj, choose) {
	//전역 부서 선택시
    departcho = choose;

	var name = $(obj).text();

	$.ajax({
		url : "deptOrganicChart.do",
		type : "GET",
		data : {
			branch_name : name
		},
		success : function(data) {
			var dept;
			console.log(data);
			$.each(data, function(index) {
				dept = data[index];
			});

			$.each(dept, function(index) {
				$(obj).append(
						"<br>&nbsp;&nbsp;<span onclick='seelow_Depart(this,departcho)'>"
								+ dept[index].dept_name + "</span>");
			});
		}
	});
}

//하위 부서 클릭시
function seelow_Depart(obj,departcho) {
	alert("부서 : "+choose);
	
	low_deptNumber= departcho;
	var low_dept = $(obj).text();

	$.ajax({
		url : "low_deptOrgaicChart.do",
		data : {
			dept_name : low_dept
		},

		success : function(data) {

			var low_dept = "";
			$.each(data, function(index) {
				low_dept = data[index];
			});

			$.each(low_dept, function(index) {
				$(obj).append(
						"<br>&nbsp;&nbsp&nbsp;&nbsp;<span onclick='seeEmpMember(this,low_deptNumber)'>"
						+ low_dept[index].low_dept_name + "</span>");

			});
		}

	});
}


//사원 뽑아오기
function seeEmpMember(obj,low_deptNumber){
   //체크
   empListNumber = low_deptNumber;
   alert("사원뽑기 : "+empListNumber);
   
   
   //클릭한 text 값 뽑아옴.
   var low_dept = $(obj).text();
   alert("seeEmpMember : "+low_dept);
   var makeTable = "";
   
   $.ajax(
         {
            url: "empChartMember.do",
            data:{
                   low_dept_name: low_dept
                 },
            success:function(data){
               var emp = "";
               $.each(data, function(index){
                  emp = data[index];
                  console.log(emp);
               });
               
               $.each(emp, function(index){
            	   makeTable+="<div class='col-md-4'>"
            	   makeTable+="<div class='hpanel hgreen contact-panel'>"
            	   makeTable+="<div class='panel-body'>"
            	   makeTable+="<h3>"	   
            	   makeTable+="<a href='' data-toggle='modal' data-target="	
            	   makeTable+="#myModal"
            	   makeTable+=emp[index].emp_no
            	   makeTable+=">"+emp[index].emp_name
            	   makeTable+="<span style='font-size: 15px'>"+emp[index].emp_no+"</span>"		
            	   makeTable+="</a></h3>"            		
            	   makeTable+="<div class='text-muted font-bold m-b-xs'>"+emp[index].branch_name+"</div>"   
            	   makeTable+="<p>01020768626 <br>"+emp[index].branch_name+" > "+ emp[index].dept_name+" > "+emp[index].low_dept_name+"</p></div></div></div>"
            	   

               });
              
               $('#empList').empty();
               $('#empList').append(makeTable);
             }    
            
         }
         );
}
    
</script>

</body>
</html>