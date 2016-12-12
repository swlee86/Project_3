<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="vendor/sweetalert/lib/sweet-alert.css" />	
<script src="vendor/sweetalert/lib/sweet-alert.min.js"></script>

<script type="text/javascript">
	alert('${msg}');
	/*  swal({
         title: "",
         text: "${msg}",
         type: "success"
     });
	 */
	 window.location.replace('${link}');
</script>