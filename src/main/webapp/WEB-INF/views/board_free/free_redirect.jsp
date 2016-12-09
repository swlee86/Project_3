<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- alert 창 -->
<link rel="stylesheet" href="vendor/sweetalert/lib/sweet-alert.css" />
<script src="vendor/sweetalert/lib/sweet-alert.min.js"></script>
    
<script>
	alert('${msg}');
	/* swal({
		title: "",
	      text: '${msg}',
	      type: "success"
	    }
	);
	
 */	
	location.replace('${link}');
</script>