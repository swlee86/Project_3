<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>   
<!--  
	작성자	: 이상원, 박성준
	작성일	: 2016-11-22
	목 적  	: 조직도  layout, css, script 기능
--> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Page title -->
    <title>ToInfra</title>

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
    <link rel="stylesheet" href="styles/layer.css">
</head>
<body class="fixed-navbar fixed-sidebar">

<!-- Simple splash screen-->
<div class="splash"> <div class="color-line"></div><div class="splash-title"><h1>ToInfra</h1><p>Now loading...</p><div class="spinner"> <div class="rect1"></div> <div class="rect2"></div> <div class="rect3"></div> <div class="rect4"></div> <div class="rect5"></div> </div> </div> </div>

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
<script src="js/layer/layerpop.js"></script>

<script>

	var firstTree = 0;
	var secondTree = 0;
	
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
    		$('#organization').empty();
    		$('#empList').empty();
    		
    		
    		$.ajax({
    			url : "oranicChartFirst.do",
    			success : function(data) {
    				var litag = "<ul style='list-style:none;margin-left:-40px;'>";
    				choose = 1;
    				var departMent = "";

    				$.each(data, function(index) {
    					departMent = data[index];
    				});

    				$.each(departMent, function(index) {
    					litag += "<li style='padding:2px; cursor:pointer;' onclick='seeDepart(this, "
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
    });


//부서 출력 하는 아작스
function seeDepart(obj, choose) {
	//전역 부서 선택시
    departcho = choose;
	var div_id = "dept_div"+choose;
	$("#"+div_id).empty();
	var litag = "<ul style='list-style:none; padding:5px;'>";

	var name = $(obj).text();

	$.ajax({
		url : "deptOrganicChart.do",
		type : "GET",
		data : {
			branch_no : departcho
		},
		success : function(data) {
			var dept;
			$.each(data, function(index) {
				dept = data[index];
			});
			
			if(firstTree == 0){
			firstTree = 1;	
			$.each(dept, function(index) {
					litag += "<li style='padding:2px; cursor:pointer;' onclick='seelow_Depart(this, "
				    litag +=dept[index].dept_no
				    litag +=")'>&nbsp;&nbsp;&nbsp;"+'<i class="fa fa-long-arrow-right"></i>'+dept[index].dept_name+"/"+dept[index].dept_no+"</li>";
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
function seelow_Depart(obj,departcho) {
	deptNumber= departcho;
	var div_id = "low_dept_div"+departcho;
	$("#"+div_id).empty();
	
	$.ajax({
		url : "low_deptOrgaicChart.do",
		data : {
			dept_no : deptNumber
		},

		success : function(data) {
			var litag = "<ul style='list-style:none;'>";
			var low_dept = "";
			$.each(data, function(index) {
				low_dept = data[index];
			});
			
			if(secondTree == 0){
			secondTree = 1;	
			$.each(low_dept, function(index) {
				litag += "<li style='padding:2px; cursor:pointer' onclick='seeEmpMember(this, "
				litag +=low_dept[index].low_dept_no
				litag +=")'>"+'<i class="fa fa-long-arrow-right"></i>'+low_dept[index].low_dept_name+"/"+low_dept[index].low_dept_no+"</li>";
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
function seeEmpMember(obj,low_dept_no){
   //체크
   var empListNumber = low_dept_no;
   
   //클릭한 text 값 뽑아옴.
   var low_dept = $(obj).text();
   //alert("seeEmpMember : "+empListNumber);
   var makeTable = "";
   
   $.ajax(
         {
            url: "empChartMember.do",
            data:{
                   low_dept_no: empListNumber
                 },
            success:function(data){
            	console.log("데이터 : " + data.msg);
               var userDto = "";
               
               if(data.msg==null){
               $.each(data.userDto, function(index){
               	   userDto = data.userDto[index];
                   makeTable+="<div class='col-md-4'>"
               	   makeTable+="<div class='hpanel hgreen contact-panel'>"
               	   makeTable+="<div class='panel-body'>"
               	   makeTable+="<h3>"	   
               	   makeTable+="<a href='' data-toggle='modal' data-target="	
               	   makeTable+="#myModal"
               	   makeTable+= userDto.emp_no
               	   makeTable+=">"+userDto.emp_name
               	   makeTable+="<span style='font-size: 15px'>"+userDto.emp_no+"</span>"
               	   makeTable+="</a></h3>"            		
               	   makeTable+="<div class='text-muted font-bold m-b-xs'>"+userDto.branch_name+"</div>"
               	   makeTable+="<p>H.P&nbsp;:&nbsp;"+userDto.cell_phone+"<br>"+userDto.branch_name+">"+userDto.dept_name+" > "+userDto.low_dept_name+"</p></div></div></div>"
               });
               
               }else{
            	   makeTable+="<div style='text-align: center;'><span style='font-size: 15px;'>"+data.msg+"</span></div>"	;
            	   console.log(makeTable);            	   
            	   
               }            
               
            	   
			 
         
               
               if(data.master != null){
            	   //대표 이름 뿌리는 것 
                   $('#masterName').html(data.master.emp_name);
                   
                   //부서 전화번호
                   $('#phone').html(data.master.tel);
                   //부서 팩스번호
                   $('#fax').html(data.master.fax);
                   
                   //부서 이름
                   $('#deptName').html(data.master.low_dept_name);
                   
                   //총인원수
                   $('#total').html(data.count);
               }else{
            	 //대표 이름 뿌리는 것 
                   $('#masterName').html('');
                   
                   //부서 전화번호
                   $('#phone').html('');
                   //부서 팩스번호
                   $('#fax').html('');         
                   //부서 이름
                   $('#deptName').html('');                   
                   //총인원수
                   $('#total').html('');
               }
                      	
               $('#empList').empty();
               $('#empList').append(makeTable);
             }    
            
         }
         );
}
    
</script>

</body>
</html>