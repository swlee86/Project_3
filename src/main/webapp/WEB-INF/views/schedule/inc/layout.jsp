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
<link rel="stylesheet"
	href="vendor/fullcalendar/dist/fullcalendar.print.css" media='print' />
<link rel="stylesheet"
	href="vendor/fullcalendar/dist/fullcalendar.min.css" />
<link rel="stylesheet" href="vendor/select2-3.5.2/select2.css" />
<link rel="stylesheet"
	href="vendor/select2-bootstrap/select2-bootstrap.css" />
<link rel="stylesheet"
	href="vendor/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.css" />
<link rel="stylesheet"
	href="vendor/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" />

<!-- App styles -->
<link rel="stylesheet"
	href="fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css" />
<link rel="stylesheet" href="fonts/pe-icon-7-stroke/css/helper.css" />
<link rel="stylesheet" href="styles/style.css">

<!-- jquery ui -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />

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
	<script src="vendor/moment/min/moment.min.js"></script>
	<script src="vendor/fullcalendar/dist/fullcalendar.min.js"></script>
	<script src="vendor/select2-3.5.2/select2.min.js"></script>
	<script src="vendor/moment/moment.js"></script>
	<script
		src="vendor/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js"></script>
	<!-- App scripts -->
	<script src="scripts/homer.js"></script>

	<script>



	var title;
	var start;
	var end;

  $(function () {
		
	  $('#addScheduleBtn').click(function(){
		 location.href="registration_schedule.do"; 
	  });
	  
    	$('#start').datepicker({
    		   changeMonth: true, 
		         dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
		         dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
		         monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
		         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		         dateFormat: 'yy-mm-dd'
    	});
    	$('#end').datepicker({
    		     changeMonth: true, 
		         dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
		         dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
		         monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
		         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		         dateFormat: 'yy-mm-dd'
    	});

        /* initialize the calendar
        -----------------------------------------------------------------*/
       var date = new Date();
       var d = date.getDate();
       var m = date.getMonth();
       var y = date.getFullYear();
      
       
         
        $('#calendar').fullCalendar({
           header: {
               left: 'prev,next today',
               center: 'title',
               right: 'month,agendaWeek,agendaDay'
           },
       		eventClick: function(calEvent, jsEvent, view) {
		
			$('#calendarmodalForm').modal("toggle");
		
		},
           
           editable: true,
           droppable: true, // this allows things to be dropped onto the calendar
           drop: function() {
               // is the "remove after drop" checkbox checked?
               if ($('#drop-remove').is(':checked')) {
                   // if so, remove the element from the "Draggable Events" list
                   $(this).remove();
               }
           },
		    selectable:true,
		    selectHelper:true,
            select: function(start, end){        
            	
            	$('#myModal').modal();	
            	
            	$('#resultBtn').click(function(){
            		
            	 title =$('#mytitle').val(); 
        		 start =$('#start').val(); 
        		 end =$('#end').val(); 
            		if(title != ""){	
        				   var eventData;
                           eventData= {
                             title: title,
                             start: start,
                             end: end
                          };
                           
                           title = "";
                           start = "";
                           end = "";
                           $('#mytitle').val('');
                           $('#start').val('');
                           $('#end').val('');
                           alert("여기탄다");
                           $('#myModal').modal('toggle');
                           
                          $('#calendar').fullCalendar('renderEvent', eventData, true);
                      
                   	}else{
                   		alert("일정을 등록하세요");
                   	}
            		
            	});
            },  
           
      	
        });
        
  });


</script>

</body>
</html>