package com.toinfra.PushController;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
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
		 for (String mapkey : users.keySet()){
			 System.out.println("핸들러 접속시 키 확인 ; " +mapkey);			 
		 }
		
	}

	@Override
	public void afterConnectionClosed(
			WebSocketSession session, CloseStatus status) throws Exception {
		log((String) session.getAttributes().get("emp_no") + " 연결 종료됨");
		//접속한 session을 users 맵에서 제거
		users.remove((String) session.getAttributes().get("emp_no"));
	}

	
	//header.jsp 에서 send() 메서지 호출시 메세지를 받아옴
	@Override
	protected void handleTextMessage(
			WebSocketSession session, TextMessage message) throws Exception {
			log((String) session.getAttributes().get("emp_no")+ "로부터 메시지 수신: " + message.getPayload());
		    String emp_no = null;
		    String menuname = null;
		    log(session.getAttributes().get("emp_no")+" / " + message.getPayload());
		    
		    String jsoninfo = message.getPayload();
		    try{
		    	JSONParser jsonParser = new JSONParser();
		    	JSONObject jsonObj = (JSONObject)jsonParser.parse(jsoninfo);
		    	emp_no = jsonObj.get("emp_no").toString();
		    	menuname = jsonObj.get("menuname").toString();	
		    }catch(Exception e){
		    	
		    }
		 		//특정 사람 뽑는 부분
			    for (String mapkey : users.keySet()){
			    	if(mapkey.equals(emp_no)){
			    		//map에 저장된 session들에게 메세지를 보냄
			    		Map<String, WebSocketSession> messageSend = new HashMap<String, WebSocketSession>();
			    		messageSend.put(mapkey, users.get(mapkey));
			    		for (WebSocketSession s : messageSend.values()) {
			    			    
			    			        JSONObject dataInfo = new JSONObject();
			    			        
			    			        
			    			        if(menuname.equals("업무")){
			    			        	dataInfo.put("alarm", "2");
			    			        	dataInfo.put("work", "1");
			    			        	dataInfo.put("workapproval", "1");
			    			        	dataInfo.put("project", "0");
			    			        	dataInfo.put("projectApproval", "0");
			    			        }
			    			        
			    			        if(menuname.equals("프로젝트")){
			    			        	dataInfo.put("alarm", "1");
			    			        	dataInfo.put("work", "0");
			    			        	dataInfo.put("workapproval", "0");
			    			        	dataInfo.put("project", "1");
			    			        	dataInfo.put("projectApproval", "0");
			    			        }
			    			        
			    			        if(menuname.equals("프로젝트승인"))
			    			        {
			    			        	dataInfo.put("alarm", "1");
			    			        	dataInfo.put("work", "0");
			    			        	dataInfo.put("workapproval", "0");
			    			        	dataInfo.put("project", "0");
			    			        	dataInfo.put("projectApproval", "1");
			    			        }
			    			       
			    			        //알람 숫자 증가 후 다시 돌려주면 - > header.jsp  > onmessage 로 돌아감 json 들고 
			    			        String jsonInfo = dataInfo.toJSONString();
			    			        s.sendMessage(new TextMessage(jsonInfo));
			    			}
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