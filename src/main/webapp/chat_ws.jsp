<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<c:url value="/static/js/jquery-1.11.2.js"/>" ></script>
<script type="text/javascript" src="<c:url value="/static/sockjs-0.3.4.js"/>" ></script>
<script type="text/javascript">
 
    $(document).ready(function(){
        
        $("#sendBtn").click(function(){
            sendMessage();
        });
        
    
    });
    var sock;
    
    function sendMessage() {
        
        sock = new SockJS("<c:url value="/echo"/>");
        //sock = new SockJS("http://localhost:8080/TestMVC/echo");
        sock.onmessage = onMessage;
        sock.onclose = onClose;
        sock.onopen = function() {
            sock.send( $("#message").val() );
        };
    }
    
    function onMessage(evt) {
        var data = evt.data;
        $("#data").append(data);
        sock.close();
    }
    
    function onClose(evt) {
        $("#data").append("Connection Closed!");
    }
    
</script>
</head>
<body>
 
    <input type="text" id="message" />
    <input type="button" id="sendBtn" value="SEND" />
    <div id="data"></div>
    
</body>
</html>