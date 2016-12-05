<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="right-sidebar" class="animated fadeInRight"
	style="opacity: 0.6;">
	<div class="p-m" style="opacity: 0.6;">
		<button id="sidebar-close"
			class="right-sidebar-toggle sidebar-button btn btn-default m-b-md">
			<i class="pe pe-7s-close"></i>
		</button>
		<div>
			<span class="font-bold no-margins"> 채팅 </span> <br>
		</div>
	</div>
	<div class="p-m bg-light border-bottom border-top"
		style="opacity: 0.8;">

		<textarea class="form-control" rows="25" cols="10"
			style="opacity: 0.8;" readonly="readonly" id="chatTextArea"></textarea>

		<div class="m-t-md">
			<div class="social-talk">
				<div class="media social-profile clearfix">
					<span class="input-group"> <input type="text"
						class="form-control" id="chatMessage"> <a type="button"
						class="btn btn-success input-group-addon" id="sendChattingBtn"
						onclick='send()'> <span style="color: #fd7d86"> <i
								class="fa fa-twitter"></i>
						</span>
					</a>
					</span>
				</div>
			</div>
		</div>

	</div>
</div>

<script src="vendor/jquery/dist/jquery.min.js"></script>


<script>

var webSocket;	
webSocket = new WebSocket("ws://192.168.43.217:8090/epm/chat_ws");

var mytextA = document.getElementById('chatMessage');
var content = document.getElementById('chatTextArea');

webSocket.onerror = function(event) {
  onError(event)
};
webSocket.onopen = function(event) {
   onOpen(event)
};

//메세지가 서버로부터 올때
webSocket.onmessage = function(event) {
   onMessage(event)
};   


//서버로부터 데이터 넘어올때.
function onMessage(event) {
   var text = "";
   var msg = JSON.parse(event.data);
  content.value += msg.id +" : "+msg.text+"\n";
}
function onOpen(event) {
    
    content.value += "연결성공\n\n ";
 }
 function onError(event) {
   alert(event.data);
 }

 function send() {
     
     var msg = {
           type : "message",
           text : mytextA.value,
           id : "${sessionScope.chatName}"
         }
     content.value += msg.id + " : " + mytextA.value +"\n";
      
  
     //webSocket.send(mytextA.value);
      webSocket.send(JSON.stringify(msg));
      mytextA.value = "";
  }


  webSocket.onclose = function(e) {
		console.log("연결 닫힘: " + e.reason);
	}


</script>



