<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- alert 창 -->
<!--  
	작성자	: 박성준,하재현
	작성일	: 2016-11-18
	목 적  	: 사내 공지사항 페이지 이동 view
-->
<link rel="stylesheet" href="vendor/sweetalert/lib/sweet-alert.css" />
<script src="vendor/sweetalert/lib/sweet-alert.min.js"></script>
<script>
	location.replace('${link}');
</script>