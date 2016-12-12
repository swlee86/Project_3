<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="vendor/toastr/build/toastr.min.css" />
<script src="vendor/toastr/build/toastr.min.js"></script>
<script>
toastr.options = {    
        "closeButton": true,
         "debug": false,
         "newestOnTop": false,
         "progressBar": false,
         "positionClass": "toast-top-center",
         "preventDuplicates": false,
         "onclick": null,
         "showDuration": "1000",
         "hideDuration": "1000",
         "timeOut": "5000",
         "extendedTimeOut": "1000",
         "showEasing": "swing",
         "hideEasing": "linear",
         "showMethod": "fadeIn",
         "hideMethod": "fadeOut"
         };
</script>
</head>
<body>
<script type="text/javascript">	
	toastr.warning('${msg}');
	window.location.replace('${link}');
</script>
</body>
</html>