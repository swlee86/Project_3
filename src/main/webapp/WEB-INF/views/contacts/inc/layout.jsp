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
.groupdiv ul > li a:hover {
	background : #e7f4f9;
	border-radius : 2px;
	box-shadow : inset 0 0 1px #ccc;
}
</style>

 <script>
 
 	function ajaxjieun(index) {
 		$.ajax(
				{
					type : "post",
					url  : "contact_detail.do",
					data : {
						"contact_no" : $('#contact_no_'+index).val()
					},
					success : function(data){
						console.log(data);
						console.log("contact_no : "+data.contact_no);
						$('#m_name').html(data.name);
						$('#m_attach').html(data.attach);
						$('#m_birth').html(data.birth);
						$('#m_mail').html(data.mail);
						$('#m_tel1').html(data.tel1);
						$('#m_tel2').html(data.tel2);
						$('#m_memo').html(data.memo);
					}
				}		
			)
 	}
 
	$(function(){
		
		var listsize = $('#listsize').val();
		console.log("listsize  : "+listsize);
		
		if(listsize > 0){
			$('#conmodal_0').click(function(){  //0 일떄
				console.log("conmodal_0 : 클릭함 / "+ "주소록 번호 : "+$('#contact_no_0').val());
				ajaxjieun(0);
			});	
			
			$('#conmodal_1').click(function(){  //1 일떄
				console.log("conmodal_1 : 클릭함 / "+ "주소록 번호 : "+$('#contact_no_1').val());
				ajaxjieun(1);
			});	
			
			
			$('#conmodal_2').click(function(){  //2 일떄
				console.log("conmodal_2 : 클릭함 / "+ "주소록 번호 : "+$('#contact_no_2').val());
				ajaxjieun(2);
			});	
			
			
			$('#conmodal_3').click(function(){  //3 일떄
				console.log("conmodal_3 : 클릭함 / "+ "주소록 번호 : "+$('#contact_no_3').val());
				ajaxjieun(3);
			});			
		}
		

		/*주소록 그룹관리*/
		$('#contact_group_enroll_btn').click(function(){
			console.log('contact_group_enroll_btn 클릭');
			$('#group_name').val('');
			$('#contact_group_from').attr('action','contacts_group_insert.do');//???
			$('#contact_group_from_submit').val('저장');
			$('#contact_group_delete_btn').hide();
			$('#contact_group_from').show();
		});
		
		$('#contact_group_from').hide();
		
		console.log("grouplistsize : "+$('#grouplistsize').val());
		
		var id;
		
		$('.contact_group_class').click(function(){
			console.log('.contact_group_class 클릭');
			console.log('id값 : ' + $(this).attr('id') );
			id = $(this).attr('id');
			console.log('그룹명 : ' + $('#'+id).html());
			
			$('.contact_group_class').removeClass("group-clicked");
			$('#'+id).addClass("group-clicked");
			$('#contact_group_from').show();
			$('#group_name').val($('#'+id).html());
			$('#contact_group_from').attr('action','contacts_group_update.do');
			$('#contact_group_from_submit').val('수정');
			$('#contact_group_delete_btn').show();
		});
		
		
		
		
		
		
		
		
		
		
		
		/* 초성별 */
		$('#all').click(function(){
			console.log('all 탭 클릭함');
			location.replace('contacts.do');
		});
		
		$('#ga').click(function(){
			console.log('가 탭 클릭함');
			location.replace('contacts.do?tapno=2');
		});
		
		$('#na').click(function(){
			console.log('나 탭 클릭함');
			location.replace('contacts.do?tapno=3');
		});
		
		$('#da').click(function(){
			console.log('다 탭 클릭함');
			location.replace('contacts.do?tapno=4');
		});
		
		$('#la').click(function(){
			console.log('라 탭 클릭함');
			location.replace('contacts.do?tapno=5');
		});
		
		$('#ma').click(function(){
			console.log('마 탭 클릭함');
			location.replace('contacts.do?tapno=6');
		});
		
		$('#ba').click(function(){
			console.log('바 탭 클릭함');
			location.replace('contacts.do?tapno=7');
		});
		
		$('#sa').click(function(){
			console.log('사 탭 클릭함');
			location.replace('contacts.do?tapno=8');
		});
		
		$('#aa').click(function(){
			console.log('아 탭 클릭함');
			location.replace('contacts.do?tapno=9');
		});
		
		$('#ja').click(function(){
			console.log('자 탭 클릭함');
			location.replace('contacts.do?tapno=10');
		});
		
		$('#cha').click(function(){
			console.log('차 탭 클릭함');
			location.replace('contacts.do?tapno=11');
		});
		
		$('#ca').click(function(){
			console.log('카 탭 클릭함');
			location.replace('contacts.do?tapno=12');
		});
		
		$('#ta').click(function(){
			console.log('타 탭 클릭함');
			location.replace('contacts.do?tapno=13');
		});
		
		$('#pa').click(function(){
			console.log('파 탭 클릭함');
			location.replace('contacts.do?tapno=14');
		});
		
		$('#ha').click(function(){
			console.log('하 탭 클릭함');
			location.replace('contacts.do?tapno=15');
		});
		
		$('#alp').click(function(){
			console.log('알파벳 탭 클릭함');
			location.replace('contacts.do?tapno=16');
		});
		
		$('#num').click(function(){
			console.log('숫자 탭 클릭함');
			location.replace('contacts.do?tapno=17');
		});
		
		$('#conmodal').click(function(){
			console.log('모달클릭함');  //비동기로 저보가져옴
			console.log('클릭한 번호 :'+$('#contact_no').val());
			
		});

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

    
    //주소록 선택시
    function recF(obj){
       //수신자 사번
       var emp_no = $(obj).parent().parent().children().eq(0).html();
       var name = $(obj).parent().parent().children().eq(1).html();
       
       
       console.log("emp_no : "+ emp_no);
		
       $.ajax(
				{
					type : "post",
					url  : "contact_fam_insert.do",
					data : {
						"emp_no" : emp_no
					},
					success : function(data){
						console.log("data : " + data);
						if(data != null){
							$('#name').val(name);
							$('#addenrollDate').val(data.birth);
							$('#attach').val('사내 사원');
							$('#mail').val(data.email);
							$('#tel1').val(data.emp_tel);
							$('#tel2').val(data.cell_phone);
						 	$('#empimg').val(data.pic); 
						 	console.log();
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
	<!-- App scripts -->
	<script src="scripts/homer.js"></script>

	<script>
	function modifyGroup(){	
		location.href = "contacts_update.do";
	}
	$(function(){
		
	$('#addenrollDate').datepicker({
	     changeMonth: true, 
	        dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
	        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
	        monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	        dateFormat: 'yy-mm-dd'
	});	
	
	});
</script>


</body>
</html>