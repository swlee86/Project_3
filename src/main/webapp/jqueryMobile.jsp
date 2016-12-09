<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>2PM</title>
<!-- 모바일 디바이스를 위한 설정 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<style>
	.custom_class{
		height: auto !important;
	}
</style>
</head>
<body>

	
<div data-role="page" id="pageone">
  <div data-role="panel" id="userlist"> 
    <h2>접속중인 유저</h2>
     <ul data-role="listview" data-inset="true">
      <li>박성준</li>
      <li>하재현</li>
    </ul>
  </div> 

  <div data-role="header">
    <h1>2PM_채팅</h1>
    <a href="#userlist" class="ui-btn ui-btn-left ui-corner-all ui-shadow ui-icon-star ui-btn-icon-left">참여자 보기</a>
  </div>

  <div data-role="main" class="ui-content">
    	<textarea rows="15" cols="25" class="custom_class"></textarea>
    	<input type="text" data-type="write" name="search" id="write" value="" placeholder="내용을 입력하세요">
  </div>

  <div data-role="footer">
    <h1>Page Footer</h1>
  </div> 
</div> 
	
	
</body>
</html>