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
    <link rel="stylesheet" href="vendor/fullcalendar/dist/fullcalendar.print.css" media='print'/>
    <link rel="stylesheet" href="vendor/fullcalendar/dist/fullcalendar.min.css" />
  	<link rel="stylesheet" href="vendor/select2-3.5.2/select2.css" />
  	<link rel="stylesheet" href="vendor/select2-bootstrap/select2-bootstrap.css" />
  	<link rel="stylesheet" href="vendor/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.css" />
    <link rel="stylesheet" href="vendor/bootstrap-datepicker-master/dist/css/bootstrap-datepicker3.min.css" />
    <link rel="stylesheet" href="vendor/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" />
  	
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
<script src="vendor/bootstrap-datepicker-master/dist/js/bootstrap-datepicker.min.js"></script>
<script src="vendor/select2-3.5.2/select2.min.js"></script>
<script src="vendor/moment/moment.js"></script>
<script src="vendor/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js"></script>
<!-- App scripts -->
<script src="scripts/homer.js"></script>

<script>

    $(function () {
		
    
        $('#external-events div.external-event').each(function() {

            // store data so the calendar knows to render an event upon drop
            $(this).data('event', {
                title: $.trim($(this).text()), // use the element's text as the event title
                stick: true // maintain when user navigates (see docs on the renderEvent method)
            });

            // make the event draggable using jQuery UI
            $(this).draggable({
                zIndex: 1111999,
                revert: true,      // will cause the event to go back to its
                revertDuration: 0  //  original position after the drag
            });

        });

           

    	
    	$('.input-group.date').datepicker();


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
           editable: true,
           droppable: true, // this allows things to be dropped onto the calendar
           drop: function() {
               // is the "remove after drop" checkbox checked?
               if ($('#drop-remove').is(':checked')) {
                   // if so, remove the element from the "Draggable Events" list
                   $(this).remove();
               }
           },
          /*  select: function(start, end){            
               // prompt 함수 : alert가 input태그처럼 뜸, 거기서 확인을 누르면  return true, 취소를 누르면 retrun false임
               //             -> 그래서 if 조건문에 들어감! 개 신기방기함
               var title = prompt('제목 : ');
               var eventData;
               
               // start. end : 드래그할 때 시작일과, 종료일을 parameter로 받아 오는 듯!
                  eventData= {
                     title: title,
                     start: start,
                     end: end
                  };
                  //'renderEvent' 값이면, events들을 새로 불러와서 띄워줌!
                  $('#calendar').fullCalendar('renderEvent', eventData, true);
                  //'unselect' 값이면, events들에 변화를 안줌
                  //$('#calendar').fullCalendar('unselect');
           }, */
           select: function(){            
               // prompt 함수 : alert가 input태그처럼 뜸, 거기서 확인을 누르면  return true, 취소를 누르면 retrun false임
               //             -> 그래서 if 조건문에 들어감! 개 신기방기함
               var title = prompt('제목 : ');
               var eventData;
               
               // start. end : 드래그할 때 시작일과, 종료일을 parameter로 받아 오는 듯!
                  eventData= {
                     title: title,
                     start: start,
                     end: end
                  };
                  //'renderEvent' 값이면, events들을 새로 불러와서 띄워줌!
                  $('#calendar').fullCalendar('renderEvent', eventData, true);
                  //'unselect' 값이면, events들에 변화를 안줌
                  //$('#calendar').fullCalendar('unselect');
           },
           events: [
               {
                   title: 'All Day Event',
                   start: new Date(y, m, 1)
               },
               {
                   title: 'Long Event',
                   start: new Date(y, m, d-5),
                   end: new Date(y, m, d-2),
               },
               {
                   id: 999,
                   title: 'Repeating Event',
                   start: new Date(y, m, d-3, 16, 0),
                   allDay: false,
               },
               {
                   title: 'Homer task',
                   start: new Date(y, m, d + 5, 19, 0),
                   end: new Date(y, m, d + 6, 22, 30),
                   allDay: false,
                   backgroundColor: "#62cb31",
                   borderColor: "#62cb31"
               },
               {
                   id: 999,
                   title: 'Repeating Event',
                   start: new Date(y, m, d+4, 16, 0),
                   allDay: false
               },
               {
                   title: 'Meeting',
                   start: new Date(y, m, d, 10, 30),
                   allDay: false
               },
               {
                   title: 'Lunch',
                   start: new Date(y, m, d, 12, 0),
                   end: new Date(y, m, d, 14, 0),
                   allDay: false
               },
               {
                   title: 'Birthday Party',
                   start: new Date(y, m, d+1, 19, 0),
                   end: new Date(y, m, d+1, 22, 30),
                   allDay: false
               },
               {
                   title: 'Click for Google',
                   start: new Date(y, m, 28),
                   end: new Date(y, m, 29),
                   url: 'http://google.com/'
               }
           ],
       });

    $('#searchicon').click(function(){
    	
    	
    });
    
       
       
   //퇴직금 계산 조회버튼 클릭
   $('#sevSearchbtn').click(function(){
	   var option = $("#selected option:selected").val();
	   
	   var date = $('#selectDate').val();
	   
	   if(option == '' || date == ''){
		   alert("조회할 조건을 선택하세요");
	   }else{
	   
	     $.ajax(
			{
				url:"sevSearch.do",
				data: {
					    select:option,
					    date:date
				      },
                success:function(data){
                	alert('퇴직금 조회');
                	$('#sevResult').html("data: "+data.select);
                }
				
			}   
	       );  
	   }
   });    
       
       
   });


</script>

</body>
</html>