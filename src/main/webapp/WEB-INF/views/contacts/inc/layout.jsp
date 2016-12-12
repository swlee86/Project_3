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
<title>2PM</title>

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<!--<link rel="shortcut icon" type="image/ico" href="favicon.ico" />-->

<!-- Vendor styles -->
<link rel="stylesheet" href="vendor/fontawesome/css/font-awesome.css" />
<link rel="stylesheet" href="vendor/metisMenu/dist/metisMenu.css" />
<link rel="stylesheet" href="vendor/animate.css/animate.css" />
<link rel="stylesheet" href="vendor/bootstrap/dist/css/bootstrap.css" />
<link rel="stylesheet" href="vendor/sweetalert/lib/sweet-alert.css" />
  <link rel="stylesheet" href="vendor/toastr/build/toastr.min.css" />
  
<!-- App styles -->
<link rel="stylesheet" href="fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css" />
<link rel="stylesheet" href="fonts/pe-icon-7-stroke/css/helper.css" />
<link rel="stylesheet" href="styles/style.css">

<!--jQuery UI CSS-->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>


<style>
.contact-panelt h3 {
	margin-bottom: 2px;
}

.contact-panelt h3 a {
	color: inherit;
}

.contact-panelt p {
	font-size: 13px;
	line-height: 16px;
	margin-bottom: 0;
}

.contact-panelt img {
	width: 75px;
	height: 75px;
	margin-right: 30px;
}
.tabstyle > li a:hover {
  background: transparent;
  border-color: #e4e5e7;
}
.groupdiv .group-clicked{
	background : #beebff;
	border-radius : 2px;
	box-shadow : inset 0 0 1px #999;
}
.groupdiv a:hover {
	background : #e7f4f9;
	border-radius : 2px;
	box-shadow : inset 0 0 1px #ccc;
}
.grouplineimg{
	display:inline-block;
	text-decoration:none;
	margin:0;
	padding:0;
	vertical-align:top;
	text-align:left;
	width:10px;
	height:10px;	
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

 <script>
 	//조직도 트리 할때 사용하는 전역변수
 	var firstTree = 0;
	var secondTree = 0;
	
	//조직도에서 그룹 클릭시 이벤트
	function orgclick(){
		$('span .org_list_class').click(function(){
			$(this).addClass("group-clicked2");
			$('.org_list_class').removeClass("group-clicked2");
			$(this).addClass("group-clicked2");	
		});
	}
		
 	function ajaxjieun(index) {
 		$.ajax(
				{
					type : "post",
					url  : "contact_detail.do",
					data : {
						"contact_no" : $('#contact_no_'+index).val()
					},
					success : function(data){
						$('#m_name').html(data.name);
						$('#m_attach').html(data.attach);
						$('#m_birth').html(data.birth);
						$('#m_mail').html(data.mail);
						$('#m_tel1').html(data.tel1);
						$('#m_tel2').html(data.tel2);
						$('#m_memo').html(data.memo);
						$('#m_img').attr('src','${pageContext.request.contextPath}/img/upload/'+data.pic);
						$('#contact_modla_delete').attr('href','contacts_delete.do?contact_no='+data.contact_no);
						$('#contact_modla_update').attr('href','contacts_update.do?contact_no='+data.contact_no);
					}
				}		
			)
 	}
 		
 
	$(function(){			
		//주소록 그룹 등록 - 이름 필수
		$('#contact_group_from_submit').click(function() {
			if ($('#group_name').val() == "") {
				toastr.warning('그룹이름을 입력해 주세요');
				$('#group_name').focus();
				return false;
			}
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
		
		 //주소록 등록시 - 제목 필수
		$('#submit_btn').click(function() {
			if ($('#enrol_name').val() == "") {
				toastr.warning('이름을 입력해 주세요');
				$('#enrol_name').focus();
				return false;
			}
		});
			
		var listsize = $('#listsize').val();
		
		if(listsize > 0){
			$('#conmodal_0').click(function(){  //0 일떄
				ajaxjieun(0);
			});	
			
			$('#conmodal_1').click(function(){  //1 일떄
				ajaxjieun(1);
			});	
			
			
			$('#conmodal_2').click(function(){  //2 일떄
				ajaxjieun(2);
			});	
	
			$('#conmodal_3').click(function(){  //3 일떄
				ajaxjieun(3);
			});			
		}
		

		/*주소록 그룹관리*/
		//그룹추가
		$('#contact_group_enroll_btn').click(function(){
			$('#group_name').val('');
			$('#contact_group_from_action').attr('action','contacts_group_insert.do');
			$('#contact_group_from_submit').val('저장');
			$('#contact_group_delete_btn').hide();
			$('#contact_group_from').show();
			$('#pre_group_no').hide();
		});
		
		$('#contact_group_from').hide();		
		
		var id;
		//그룹수정
		$('.contact_group_class').click(function(){
			id = $(this).attr('id');
			var no = $(this).attr('id').replace("a","");
			
			$('.contact_group_class').removeClass("group-clicked");
			$('#'+id).addClass("group-clicked");
			$('#contact_group_from').show();
			$('#group_name').val($('#'+id).html());
			$('#contact_group_from_action').attr('action','contacts_group_update.do');
			$('#pre_group_no').show();
			$('#pre_group_no').val(no);
			$('#contact_group_from_submit').val('수정');
			$('#contact_group_delete_btn').attr('href','contacts_group_delete.do?group_no='+no);
			$('#contact_group_delete_btn').show();
		});
				
		//목록 -> 주소록 그룹
		$('.contact_list_group_class').click(function(){
			id = $(this).attr('id');
			$('.contact_list_group_class').removeClass("group-clicked");
			$('#'+id).addClass("group-clicked");
			$('#'+id).attr('href','contacts.do?group='+id);  
		});
					
		//수정 사진 유지 확인
		$('#contact_img_update').change(function(){
			 if($("#contact_img_update").is(":checked")){
		            $('#empimg').val($('#empimgload').val());   
					$('#uploadfile').hide();
		        }else{
		        	 $('#uploadfile').show(); 
		        	 $('#empimg').val(''); 
		 			 $('#empimg').hide();
		        }
		});		
				
		//그룹이름 
		var groupnumber = $('#groupnumber').val();
		$('#'+groupnumber).addClass("group-clicked");		
		
		/* 초성별 */
		$('#all').click(function(){
			location.replace('contacts.do?group='+groupnumber);
		});
		
		$('#ga').click(function(){
			location.replace('contacts.do?tapno=2&group='+groupnumber);
		});
		
		$('#na').click(function(){
			location.replace('contacts.do?tapno=3&group='+groupnumber);
		});
		
		$('#da').click(function(){
			location.replace('contacts.do?tapno=4&group='+groupnumber);
		});
		
		$('#la').click(function(){
			location.replace('contacts.do?tapno=5&group='+groupnumber);
		});
		
		$('#ma').click(function(){
			location.replace('contacts.do?tapno=6&group='+groupnumber);
		});
		
		$('#ba').click(function(){
			location.replace('contacts.do?tapno=7&group='+groupnumber);
		});
		
		$('#sa').click(function(){
			location.replace('contacts.do?tapno=8&group='+groupnumber);
		});
		
		$('#aa').click(function(){
			location.replace('contacts.do?tapno=9&group='+groupnumber);
		});
		
		$('#ja').click(function(){
			location.replace('contacts.do?tapno=10&group='+groupnumber);
		});
		
		$('#cha').click(function(){
			location.replace('contacts.do?tapno=11&group='+groupnumber);
		});
		
		$('#ca').click(function(){
			location.replace('contacts.do?tapno=12&group='+groupnumber);
		});
		
		$('#ta').click(function(){
			location.replace('contacts.do?tapno=13&group='+groupnumber);
		});
		
		$('#pa').click(function(){
			location.replace('contacts.do?tapno=14&group='+groupnumber);
		});
		
		$('#ha').click(function(){
			location.replace('contacts.do?tapno=15&group='+groupnumber);
		});
		
		$('#alp').click(function(){
			location.replace('contacts.do?tapno=16&group='+groupnumber);
		});
		
		$('#num').click(function(){
			location.replace('contacts.do?tapno=17&group='+groupnumber);
		});
		
/* 		$('#conmodal').click(function(){
			console.log('모달클릭함');  //비동기로 정보가져옴
			console.log('클릭한 번호 :'+$('#contact_no').val());
		}); */

	    //참조자 아이콘 클릭시
        $('#organization_add').click(function() {
        	orgclick();
       		var  empSelectNumber = 1;
			var litag = "<ul style='margin-left:-40px; list-style:none;'>";   		
    		$('#organization').empty();
    		$('#empList').empty();
    		$('#empList2').empty();
    		$('#con_ins_org_sea_query').val('');
    		  
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
       		})
        });
	    
    	//조직도에서 그룹 클릭시 이벤트
		$('span .org_list_class').click(function(){
			$(this).addClass("group-clicked2");
			$('.org_list_class').removeClass("group-clicked2");
			$(this).addClass("group-clicked2");
		});
		
	    //주소록 추가시  검색해서 보여주는 script
        $('#con_ins_org_sea_btn').click(function(){
        	$.ajax(
    				{
    					type : "post",
    					url  : "contact_insert_search.do",
    					data : {
    						"field" : $('#con_ins_org_sea_field').val(),
    						"query" : $('#con_ins_org_sea_query').val()
    						
    					},
    					success : function(data){
    						 var emp = "";
    		                    $.each(data, function(index){
    		                       emp = data[index];	                       	
    		                   });
    		                  
    		                   var  makeTable = "<table class='table table-condensed'><tr style='background-color:#f8f8f8;'><th style='text-align:center'>번호</th><th style='text-align:center'>사번</th><th style='text-align:center'>이름</th><th style='text-align:center'>선택</th></tr>";
    		                   $.each(emp, function(index){
    		                         makeTable += "<tr style='text-align:center'><td>"+(index+1)+"</td><td>"+emp[index].emp_no+"</td><td>"+emp[index].emp_name+"</td><td><button class='btn  btn-outline btn-success' onclick='recF2(this)'><i class='fa fa-check'></i></button></td></tr>";   
    		                   });
    		                   makeTable += "</table>";
    		                   $('#empList2').empty();
    		                   $('#empList2').append(makeTable); 
    					}
    				}		
    			)
        	
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
	    				litag +=")' >"+'<i class="fa fa-long-arrow-right"></i><span>'+low_dept[index].low_dept_name+"("+low_dept[index].low_dept_no+")</span></li>";
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
       
       //클릭한 text 값 뽑아옴.
       var low_dept = $(obj).text();
       var makeTable = "";
       if(empSelectNumber == 1){
        makeTable = "<table class='table table-condensed'><tr style='background-color:#f8f8f8'><th>사번</th><th>이름</th><th>선택</th></tr>";
       }else{
        makeTable = "<table class='table'><tr><th>선택</th><th>사번</th><th>이름</th></tr>";
       }
       
       $.ajax(
             {
                url: "taskEmpModal_exclude.do",
                data:{
              	  low_dept_no: empListNumber
                     },
                success:function(data){
              	  var emp = "";
                    $.each(data, function(index){
                       emp = data[index];
                   });
                   
                   $.each(emp, function(index){
                      if(empSelectNumber == 1){   
                         makeTable += "<tr><td>"+emp[index].emp_no+"</td><td>"+emp[index].emp_name+"</td><td><button class='btn  btn-outline btn-success' onclick='recF(this)'><i class='fa fa-check'></i></button></td></tr>";   
                      }
                      else if(empSelectNumber == 2){
                         makeTable += "<tr><td><input type='checkbox' name='chkbtn' value='"+emp[index].emp_name+"'></td><td>"+emp[index].emp_no+"</td><td>"+emp[index].emp_name+"</td></tr>";
                      }
                   });
                   makeTable += "</table>";
                   $('#empList').empty();
                   $('#empList').append(makeTable);
                 }    
                
             }
             );
    }

    
    //주소록 선택시
        function recF(obj){
       //수신자 사번
       var name = $(obj).parent().parent().children().eq(1).html();
       var emp_no = $(obj).parent().parent().children().eq(0).html();
             
       $.ajax(
				{
					type : "post",
					url  : "contact_fam_insert.do",
					data : {
						"emp_no" : emp_no
					},
					success : function(data){
						if(data != null){
							$('#enrol_name').val(name);
							$('#addenrollDate').val(data.birth);
							$('#attach').val(data.branch_name+' '+data.dept_name+' '+data.low_dept_name);
							$('#mail').val(data.email);
							$('#tel1').val(data.emp_tel);
							$('#tel2').val(data.cell_phone);
						 	$('#empimg').val(data.pic); 
						 	$('#uploadfile').hide();
							$('#myModal6').modal("hide");
						}
					}
				}		
			)
    }
    
    //탭선택시
    function recF2(obj){
       //수신자 사번
       var name = $(obj).parent().parent().children().eq(2).html();
       var emp_no = $(obj).parent().parent().children().eq(1).html();
  
       $.ajax(
				{
					type : "post",
					url  : "contact_fam_insert.do",
					data : {
						"emp_no" : emp_no
					},
					success : function(data){
						if(data != null){
							$('#enrol_name').val(name);
							$('#addenrollDate').val(data.birth);
							$('#attach').val(data.branch_name+' '+data.dept_name+' '+data.low_dept_name);
							$('#mail').val(data.email);
							$('#tel1').val(data.emp_tel);
							$('#tel2').val(data.cell_phone);
						 	$('#empimg').val(data.pic); 
						 	$('#uploadfile').hide();
							$('#myModal6').modal("hide");
						}
					}
				}		
			)
    }
	
	</script> 
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
	<script src="vendor/metisMenu/dist/metisMenu.min.js"></script>
	<script src="vendor/iCheck/icheck.min.js"></script>
	<script src="vendor/sparkline/index.js"></script>
	<script src="vendor/sweetalert/lib/sweet-alert.min.js"></script>
	<script src="vendor/toastr/build/toastr.min.js"></script>
	<!-- App scripts -->
	<script src="scripts/homer.js"></script>

	<script>
	$(function(){
	$('#addenrollDate').datepicker({
	     changeMonth: true, 
	        dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
	        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
	        monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	        dateFormat: 'yy-mm-dd',
	        changeYear: true
	});	
	
	});
</script>


</body>
</html>