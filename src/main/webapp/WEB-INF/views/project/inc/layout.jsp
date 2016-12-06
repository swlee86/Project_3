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
	<!--풀캘린더 관련 css -->
	<link rel="stylesheet"
	href="vendor/fullcalendar/dist/fullcalendar.print.css" media='print' />
	<link rel="stylesheet"
	href="vendor/fullcalendar/dist/fullcalendar.min.css" />
	
	<link rel="stylesheet" href="vendor/fooTable/css/footable.core.min.css" />
	<link rel="stylesheet" href="vendor/sweetalert/lib/sweet-alert.css" />
	  
    <!-- App styles -->
    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css" />
    <link rel="stylesheet" href="fonts/pe-icon-7-stroke/css/helper.css" />
    <link rel="stylesheet" href="styles/style.css">
	
	<!--jQuery UI CSS-->
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css"/>
	
	<!--텍스트 에디터 사용시 추가해야할 css -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <Style>
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
  </Style> 
<script>
	//조직도 트리 할때 사용하는 전역변수
	var firstTree = 0;
	var secondTree = 0;
	
    //전체 프로젝트 참조자 선택시 - 탭선택시
     function recF2(obj){
        var name = $(obj).parent().parent().children().eq(2).html();
        var emp_no = $(obj).parent().parent().children().eq(1).html();
        
        console.log("name : "+name);
        console.log("emp_no : "+ emp_no);
  
        $('#hiddenEmp_no').val(emp_no);
 	   $('#rec_emp_no').val(emp_no);
 	   $('#rec_emp_name').val(name);

 	   $('#myModal6').modal("hide");
     }	

$(function(){
	//주소록 추가시  검색해서 보여주는 script
    $('#con_ins_org_sea_btn').click(function(){
    	console.log("몇개선택?? : "+ $('#con_ins_org_sea_btn_sel').val());
    	console.log('field : '+ $('#con_ins_org_sea_field').val()+"/word:"+$('#con_ins_org_sea_query').val());
    	
        var choice = $('#con_ins_org_sea_btn_sel').val();
        
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
    						 	var  makeTable;
    						 	
    		                    $.each(data, function(index){
    		                    	emp = data[index];
    		                        console.log("객체 : "+emp);
									console.log("emp:"+ data[index]);    		                       	
    		                    });
    		                    
    		                    if(choice == 1){  
    		                    	makeTable = "<table class='table table-condensed'><tr style='background-color:#f8f8f8;'><th style='text-align:center'>번호</th><th style='text-align:center'>사번</th><th style='text-align:center'>이름</th><th style='text-align:center'>선택</th></tr>";
    		                    }else if(choice ==2){
    		                    	makeTable = "<table class='table table-condensed'><tr style='background-color:#f8f8f8;'><th style='text-align:center'>번호</th><th style='text-align:center'>선택</th><th style='text-align:center'>사번</th><th style='text-align:center'>이름</th></tr>";
    		                    }
    		                    
    		                    $.each(emp, function(index){
    		  	                  if(choice == 1){   
    		  	                     makeTable += "<tr style='text-align:center'><td>"+(index+1)+"</td><td>"+emp[index].emp_no+"</td><td>"+emp[index].emp_name+"</td><td><button class='btn btn-outline btn-success' onclick='recF2(this)'><i class='fa fa-check'></i></button></td></tr>";   
    		  	                  }
    		  	                  else if(choice == 2){  //여러명
    		  	                     makeTable += "<tr style='text-align:center'><td>"+(index+1)+"</td><td><input type='checkbox'  name='chkbtn2' value='"+emp[index].emp_name+"'></td><td>"+emp[index].emp_no+"</td><td>"+emp[index].emp_name+"</td></tr>";
    		  	                  }
    		  	               });
    		  	               
    		  	             	if(choice == 1){  
    		  	            		makeTable += "</table>";
 		                    	}else if(choice ==2){
 		                    		makeTable += "</table><br><input type='button' class='btn btn-success' value='선택' onclick=check2()>";
 		                    	}
    		                   
    		                   $('#empList2').empty();
    		                   $('#empList2').append(makeTable); 
    					}
    				}		
    			)
        });

		
       /////////////////////////////////////////////////////////////////////////////////	
       
	    //전체프로젝트 - 참조자 아이콘 클릭시
	    $('#organization_add').click(function() {
	    	console.log("몇개선택?? : "+ $('#con_ins_org_sea_btn_sel').val());
	    	var choice = $('#con_ins_org_sea_btn_sel').val();   // 1 : 한개 선택(전체프로젝특)  2: 두개 선택(상세프로젝트기본) 
	    	
	   		var  empSelectNumber = Number(choice);
			var litag = "<ui style='list-style:none; margin-left:-40px;'>";   		
			$('#organization').empty();
			$('#empList').empty();
			$('#empList2').empty();
    		$('#con_ins_org_sea_query').val('');
    		
    		if(choice == 2){
    			$('.multiDiv_0').empty();
    		}
	 		

	        $.ajax(
	        		{
	   					url : "taskWriteModal.do",
	   					success : function(data) {
	   				 			$('#myModal6').modal();
	   							choose = Number(choice);
	   							var departMent = "";
	
	   							$.each(data, function(index) {
	   								departMent = data[index];
	   							});
	
	   							$.each(departMent, function(index) {
	   									litag += "<li style='padding:2px;' onclick='seeDepart(this,"
	   									litag +=empSelectNumber +","
	   									litag +=departMent[index].branch_no
	    				    			litag +=")'><i class='fa fa-sitemap'></i><span class='org_list_class'>"+departMent[index].branch_name+"&nbsp;("+departMent[index].branch_no+")</span></li>";
	    								//litag +="</ul>";
	    								litag+="<div id='dept_div"
	    								litag+=departMent[index].branch_no
	    								litag+="'></div>";
	       							});
	   							litag +="</ul>";
	   							$('#organization').html(litag);
	   						}
	   					})
	    			}
	    	);   
	    
	/*   	//상세 프로젝트 - 참조자 아이콘 버튼 클릭시
		$('#organization_addd').click(function(){
			
			var empSelectNumber = 2;
			var litag = "<ui style='margin-left:-40px; list-style:none;'>";   		
	 		$('#organization').empty();
	 		$('#empList').empty();
	 		$('.multiDiv_0').empty();
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
	       					litag += "<li style='padding:2px;' onclick='seeDepart(this,"
	       						litag +=empSelectNumber +","
	       						litag +=departMent[index].branch_no
	        				    litag +=")'><i class='fa fa-sitemap'></i><span class='org_list_class'>"+departMent[index].branch_name+"&nbsp;("+departMent[index].branch_no+")</span></li>";
	        					//litag +="</ul>";			
	        					litag+="<div id='dept_div"
	        					litag+=departMent[index].branch_no
	        					litag+="'></div>";
	           				});
	    				litag +="</ul>";
	       				$('#organization').html(litag);
	    			}
	    		})
		}); */
		
		
	});

	

	
	
	
	 //부서 출력 하는 아작스
	function seeDepart(obj, empSelectNumber, choose) {
		//전역 부서 선택시
	    departcho = choose;
		var div_id = "dept_div"+choose;
		$("#"+div_id).empty();
		var litag = "<ui style='list-style:none; padding:5px;'>";
	
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
							litag +=")' >"+'<i class="fa fa-long-arrow-right"></i><span>'+dept[index].dept_name+" ("+dept[index].dept_no+")</span></li>";
							//litag +="</ul>";
								
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
		alert("부서 : "+choose);
		deptNumber= departcho;
		var litag = "<ui style='list-style:none;'>";
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
	   console.log("@@@@@@empSelectNumber : " + empSelectNumber);
	   console.log(obj);
	   
	   //클릭한 text 값 뽑아옴.
	   var low_dept = $(obj).text();
	   //alert("taskEmpModal : "+low_dept);
	   //alert("selectNo : " + empSelectNumber);
	   var makeTable = "";
	  
	   if(empSelectNumber == 1){
	    makeTable = "<table class='table table-condensed'><tr style='background-color:#f8f8f8'><th>사번</th><th>이름</th><th>선택</th></tr>";
	   }else{
	    makeTable = "<table  class='table table-condensed'><tr style='background-color:#f8f8f8'><th><input type='checkbox'></th><th>사번</th><th>이름</th></tr>";
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
	                   console.log("emp 머나오징:"+emp);
	               });
	               
	               
	               $.each(emp, function(index){
	                  if(empSelectNumber == 1){   
	                     makeTable += "<tr><td>"+emp[index].emp_no+"</td><td>"+emp[index].emp_name+"</td><td><button class='btn btn-outline btn-success' onclick='recF(this)'><i class='fa fa-check'></i></button></td></tr>";   
	                  }
	                  else if(empSelectNumber == 2){  //여러명
	                     makeTable += "<tr><td><input type='checkbox' name='chkbtn2' value='"+emp[index].emp_name+"'></td><td>"+emp[index].emp_no+"</td><td>"+emp[index].emp_name+"</td></tr>";
	                  }
	               });
	               
	               if(empSelectNumber == 1){
	           	    	makeTable += "</table>";
	           	   }else{
	           		  	makeTable += "</table><br><input type='button' class='btn btn-success' value='선택' onclick=check2()>";
	           	   }
	               
	             
	               $('#empList').empty();
	               $('#empList').append(makeTable);
	             }    
	            
	         }
	     );
	}
	
	
	//참조자 선택시 - 조직도에서
	function recF(obj){
	   //수신자 사번
	   var emp_no = $(obj).parent().parent().children().eq(0).html();
	   var name = $(obj).parent().parent().children().eq(1).html();
		console.log("=>아이디 조직도 :emp_no : "+ emp_no);
	    console.log("name: "+ name);
	   
	   $('#hiddenEmp_no').val(emp_no);
	   $('#rec_emp_no').val(emp_no);
	   $('#rec_emp_name').val(name);

	   $('#myModal6').modal("hide");
	}
	
	
	
	///////////////////////////////////////////////////////////////////////////////////////////
	//상세프로젝트1
	 function empInfo2(emp_no, emp_name){
		    this.emp_no = emp_no;
		    this.emp_name = emp_name;
		 }
		 
		 //사원정보 뽑아서 담을 배열
		 var empInfoArray2 = new Array();
		 
		 //부서 선택시
		 var departcho;
		 //하위 부서 선택시
		 var low_deptNumber;
		 //사원
		 var empListNumber;
		 
		 var choose;
		 
	
	   //체크박스 선택후 버튼 클릭시 호출
    function check2(){

		   
       //체크박스 크기만큼 배열 생성
       var checkResult2 = new Array();
       $(":checkbox[name='chkbtn2']:checked").each(function(pi,po){
          //이름 
          checkResult2[pi] = po.value;
          //사번
          empInfoArray2.push(new empInfo2($(this).parent().next().html(),checkResult2[pi]));
       });
       console.log("####사원  정보: "+empInfoArray2);
       console.log("####배열 사이즈: "+empInfoArray2.length);
          if(empInfoArray2.length > 1){
             //화면에 보이는 input 은 그냥 때려넣음
             //$("#multiDiv").val(empInfoArray[0].emp_no);
             //$('#multiDiv').val(empInfoArray[0].emp_name);
             // $('#pjd_emp_no_' + pjd_count).val(empInfoArray[0].emp_no);
	  		   //$('#pjd_emp_name_' + pjd_count).val(empInfoArray[0].emp_name);
	  			
             var input_no2 = "";
             var input_name2 = "";
             for(var i = 0; i < empInfoArray2.length; i++){
	              console.log("pjd_count: "+ 0 + "/ input : " +empInfoArray2[i].emp_no +" / "+empInfoArray2[i].emp_name);
                input_no2 += "<input type='hidden' class='form-control' name='pjd[0].rec_emp_no' value='"+empInfoArray2[i].emp_no+"'>";
                input_name2 +="<input type='text' class='form-control input-sm' name='pjd[0].rec_emp_name' value='"+empInfoArray2[i].emp_name+"'>";
             }
            
             empInfoArray2.splice(0,empInfoArray2.length);
             console.log("####사원  정보 지우기 : "+empInfoArray2);
             console.log("empInfoArray2 지우기 : " + empInfoArray2.length);
               $('.multiDiv_0').append(input_no2);
	           $('.multiDiv_0').append(input_name2);
          }else{
             $('.multiDiv_0').val(empInfoArray2[0].emp_no);
             $('.multiDiv_0').val(empInfoArray2[0].emp_name);            
          }
       
       $("#myModal6").modal("hide");
    }
	
	
	
	
	
	
	
	
	
	
	/////////////////////////////////////////////////////////////////////////////////
	//상세 프로젝트 추가
	$(function(){
		var pjd_count = 0; 
		
		$('#pjd_detail_btn').click(function(){	
			pjd_count = $('#pjd_count').val();
			console.log('추가번튼 클릭 ' + pjd_count);

			$.ajax({
				url : "project_detail_plus.do",
				dataType : "html",
				success : function(data) {
					pjd_count = Number(pjd_count) + 1;			 
					console.log("=>name pjd_count : "+pjd_count);
					$('#kung_pjd_table').append(data);
					
					calendar();
							
					$('.pdplus').addClass('pdplus_' + pjd_count);
					$('.pdplus').removeClass('pdplus');
					
					$('.showhide3').attr('id','pdplus_' + pjd_count);
					$('.showhide3').removeClass('showhide3');
					
					$('.showup3').attr('id','pdplus_' + pjd_count);
					$('.showup3').removeClass('showup3');
					
					
					$('.pjd_start_plus').attr('name','pjd[' + pjd_count + '].pjd_start');
					$('.pjd_start_plus').removeClass('pjd_start_plus');
					
					$('.pjd_end_plus').attr('name','pjd[' + pjd_count + '].pjd_end'); 
					$('.pjd_end_plus').removeClass('pjd_end_plus');
					
					$('.pjd_title_plus').attr('name','pjd[' + pjd_count + '].pjd_title');
					$('.pjd_title_plus').removeClass('pjd_title_plus');
					
				/* 	$('.pjd_emp_no_plus').attr('name','pjd[' + pjd_count + '].emp_no');
					$('.pjd_emp_no_plus').attr('id','pjd_emp_no_' + pjd_count);
					$('.pjd_emp_no_plus').removeClass('pjd_emp_no_plus'); */
					
					
					$('.pjd_count_plus').attr('value',pjd_count);
					$('.pjd_count_plus').removeClass('pjd_count_plus');
					
					$('.multiDiv').addClass('multiDiv_'+pjd_count);
					$('.multiDiv').removeClass('multiDiv');
					
					
					/* $('.pjd_emp_name_plus').attr('name','pjd[' + pjd_count + '].emp_name');
					$('.pjd_emp_name_plus').attr('id','pjd_emp_name_' + pjd_count);
					$('.pjd_emp_name_plus').removeClass('pjd_emp_name_plus'); */
					
					$('.pjd_content_plus').attr('name','pjd[' + pjd_count + '].pjd_content');
					$('.pjd_content_plus').removeClass('pjd_content_plus');
					
					$('.pjd_plus').attr('value',pjd_count);
					$('.pjd_plus').removeClass('pjd_plus');
					
					$('#pjd_count').val(pjd_count);
					
				}
			});
		});
			
	});	
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

<script src="vendor/jquery-flot/jquery.flot.js"></script>
<script src="vendor/jquery-flot/jquery.flot.resize.js"></script>
<script src="vendor/jquery-flot/jquery.flot.pie.js"></script>
<script src="vendor/flot.curvedlines/curvedLines.js"></script>
<script src="vendor/jquery.flot.spline/index.js"></script>
<script src="vendor/summernote/dist/summernote.min.js"></script>
<script src="vendor/peity/jquery.peity.min.js"></script>

<script src="vendor/sparkline/index.js"></script>
<script src="vendor/fooTable/dist/footable.all.min.js"></script>
<script src="vendor/sweetalert/lib/sweet-alert.min.js"></script>

<!-- App scripts -->
<script src="scripts/homer.js"></script>
<!--풀캘린더 스크립트-->
<script src="vendor/moment/min/moment.min.js"></script>
<script src="vendor/fullcalendar/dist/fullcalendar.min.js"></script>
<script>

	$(function(){
	    // Initialize Example 1
	    $('#example1').footable();
	    
		// Initialize summernote plugin
 	    $('.summernote').summernote();

	    var sHTML = $('.summernote').code();

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
		$('.formstartDate').datepicker({
			     changeMonth: true, 
		         dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
		         dayNamesMin: ['일','월', '화', '수', '목', '금', '토'], 
		         monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
		         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		         dateFormat: 'yy-mm-dd',
		         changeYear: true
		});	
		

		$('.formendDate').datepicker({
			 changeMonth: true, 
	         dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
	         dayNamesMin: ['일','월', '화', '수', '목', '금', '토'], 
	         monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	         dateFormat: 'yy-mm-dd',
	         changeYear: true
		});
 
		
		$('#contact').submit(function(){
		
			$.ajax(
					{
						type : "post",
						url  : "addContact_pjd.do",
						data : {
							"emp_no" : $('#h_emp_no').val(),
							"name" : $('#h_emp_name').val(),
							"attach" : $('#h_emp_attach').val(),
							"tel1" : $('#h_emp_tel1').val(),
							"tel2" : $('#h_emp_tel2').val(),
							"birth" : $('#h_emp_birth').val(),
							"pic" : $('#h_emp_pic').val(),
							"mail" : $('#h_emp_mail').val(),
							
						},
						success : function(data){
							alert("주소록 등록을 성공했습니다")
							console.log("last : " + data.last_result);			
						}
					});
		});
		
		
		$('.selectpeople').click(function(){  
			var emp_no = ($(this).attr('id')).substr(9);
			alert(emp_no);
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
							$('#m_img').attr('src','${pageContext.request.contextPath}/img/upload/'+data.data.pic);
							
							
							$('#h_emp_no').val(data.data.emp_no);
							$('#h_emp_name').val(data.data.emp_name);
							$('#h_emp_attach').val(data.data.branch_name+'&nbsp;'+data.data.dept_name+ '&nbsp;' +data.data.low_dept_name);
							$('#h_emp_tel1').val(data.data.cell_phone);
							$('#h_emp_tel2').val(data.data.emp_tel);
							$('#h_emp_birth').val(data.data.birth);
							$('#h_emp_pic').val(data.data.pic);
							$('#h_emp_mail').val(data.data.email);
							
							console.log($('#h_emp_name').val());

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
 <script src="js/project/projectCalendar.js"></script>
</body>
</html>