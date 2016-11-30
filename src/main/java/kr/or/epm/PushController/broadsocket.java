package kr.or.epm.PushController;

import java.util.Date;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class broadsocket extends TextWebSocketHandler {

	private Map<String, WebSocketSession> users = new ConcurrentHashMap<>();

	@Override
	public void afterConnectionEstablished(
			WebSocketSession session) throws Exception {
		
		log(session.getId() + " 연결 됨");
		String parammsg = (String) session.getAttributes().get("emp_no");
		//접속한 session을 users 맵에 저장
		users.put(parammsg, session);
		
		System.out.println("여기는 핸들러 : " + parammsg);
		
	}

	@Override
	public void afterConnectionClosed(
			WebSocketSession session, CloseStatus status) throws Exception {
		log((String) session.getAttributes().get("emp_no") + " 연결 종료됨");
		//접속한 session을 users 맵에서 제거
		users.remove((String) session.getAttributes().get("userId"));
	}

	
	
	@Override
	protected void handleTextMessage(
			WebSocketSession session, TextMessage message) throws Exception {
			log((String) session.getAttributes().get("emp_no")+ "로부터 메시지 수신: " + message.getPayload());
		    System.out.println("handleTextMessage()");
		    
		    log(session.getAttributes().get("emp_no")+ message.getPayload());
		    
		    if(session.getAttributes().get("emp_no").equals(message.getPayload())){
		    	//map에 저장된 session들에게 메세지를 보냄
		    	for (WebSocketSession s : users.values()) {
		    		s.sendMessage(new TextMessage("1"));		    		
		    		log(session.getAttributes().get("emp_no")+ message.getPayload());
		    	}
		    	
		    }
		    
	        
	}

	@Override
	public void handleTransportError(
			WebSocketSession session, Throwable exception) throws Exception {
		log((String) session.getAttributes().get("emp_no") + " 익셉션 발생: " + exception.getMessage());
	}

	private void log(String logmsg) {
		System.out.println(new Date() + " : " + logmsg);
	}
	

}