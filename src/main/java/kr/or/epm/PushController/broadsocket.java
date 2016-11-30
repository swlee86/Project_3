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
		
	
		log(session.getId()+ " 연결 됨");
		String taskcount = (String)session.getAttributes().get("taskcount");
		String projectcount = (String)session.getAttributes().get("projectcount");
		users.put(taskcount, session);
		users.put(projectcount, session);
		System.out.println("여기는 broadsocket : " + taskcount);
		System.out.println("여기는 broadsocket : " + projectcount);
		
		
		log((String) session.getAttributes().get("taskcount") + " 건의 미처리 업무가 있습니다");
		
	    System.out.println("handleTextMessage()");
	    
	    log(session.getAttributes().get("taskcount")+ " 건의 미처리 업무가 있습니다. 확인하세요");

	    //map에 저장된 session들에게 메세지를 보냄
	    
     	for (WebSocketSession s : users.values()) {
     			s.sendMessage(new TextMessage(
     									"<li><a style='color:red;' href='taskRequest.do'>확인하지 않은 " + session.getAttributes().get("taskcount") + "개의 업무가 있습니다</a></li>"+
     									"<li style='color:red;'>승인이 필요한 " + session.getAttributes().get("taskcount") + "개의 프로젝트가 있습니다</li>"+
     									"<li style='color:blue;'>진행중인 " + session.getAttributes().get("projectcount") + "개의 프로젝트가 있습니다</li>"
     					));	
     			
     			
     			log(session.getAttributes().get("taskcount") + "개의 맥스 카운트");
     			log(session.getAttributes().get("taskcount")+ "건의 미처리 업무가 있습니다 -------------final log");     			
     		
    	}
		
	}

	@Override
	public void afterConnectionClosed(
			WebSocketSession session, CloseStatus status) throws Exception {
		log((String) session.getAttributes().get("taskcount") + " 연결 종료됨");
		//접속한 session을 users 맵에서 제거
		users.remove((String) session.getAttributes().get("taskcount"));
	}

	@Override
	protected void handleTextMessage(
			WebSocketSession session, TextMessage message) throws Exception {
		
		
			log((String) session.getAttributes().get("userId")+ "로부터 메시지 수신: " + message.getPayload());
	
		    System.out.println("handleTextMessage()");
		    
		    log(session.getAttributes().get("userId")+ message.getPayload());
	
		    //map에 저장된 session들에게 메세지를 보냄
	     	for (WebSocketSession s : users.values()) {
				s.sendMessage(new TextMessage( message.getPayload()+"  id- "+session.getAttributes().get("userId")));
				
				log(session.getAttributes().get("userId")+ message.getPayload());
	    	}
	        
	}

	@Override
	public void handleTransportError(
			WebSocketSession session, Throwable exception) throws Exception {
		log((String) session.getAttributes().get("userId") + " 익셉션 발생: " + exception.getMessage());
	}

	private void log(String logmsg) {
		System.out.println(new Date() + " : " + logmsg);
	}
	

}