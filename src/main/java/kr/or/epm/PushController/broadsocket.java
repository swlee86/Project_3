package kr.or.epm.PushController;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.json.JsonArray;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.apache.commons.collections.map.HashedMap;
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

	
	
	@Override
	protected void handleTextMessage(
			WebSocketSession session, TextMessage message) throws Exception {
			System.out.println("@@@@@@@@@@@@@@@@@@메세지 도착!!@@@@@@@@@@@@@@@");
			log((String) session.getAttributes().get("emp_no")+ "로부터 메시지 수신: " + message.getPayload());
		    System.out.println("handleTextMessage()");
		    String emp_no = null;
		    String menuname = null;
		    log(session.getAttributes().get("emp_no")+" / " + message.getPayload());
		    
		    String jsoninfo = message.getPayload();
		    System.out.println("JSONINFO로 받는 것부터_____________________________ : " + jsoninfo);
		    try{
		    	System.out.println("(((((((((((((((((((((((((((JSON PARSER 시작))))))))))))))))))))))))))))");
		    	JSONParser jsonParser = new JSONParser();
		    	JSONObject jsonObj = (JSONObject)jsonParser.parse(jsoninfo);
		    	emp_no = jsonObj.get("emp_no").toString();
		    	menuname = jsonObj.get("menuname").toString();	
		    	System.out.println("--------------------------emp_no : " + emp_no +"////////////////////////////////   menuname "+ menuname);
		    }catch(Exception e){
		    	
		    }
		    
	     	
			    for (String mapkey : users.keySet()){
			    	System.out.println(mapkey);
			    	if(mapkey.equals(emp_no)){
			    		//map에 저장된 session들에게 메세지를 보냄
			    		System.out.println("Map에서 아이디 뽑음 : " + mapkey + " / " + users.get(mapkey));
			    		Map<String, WebSocketSession> messageSend = new HashMap<String, WebSocketSession>();
			    		messageSend.put(mapkey, users.get(mapkey));
			    		for (WebSocketSession s : messageSend.values()) {
			    			System.out.println("입력한 Map value 데이터 : " + messageSend.values());
			    					System.out.println("이건 최종 유저 벨류 : " + users.values());
			    					System.out.println("############################여기 들어오긴 하냐?");
			    					System.out.println("일치해서 들어온 맵키 : " + mapkey);
			    			        JSONObject jsonObject = new JSONObject();
			    			        JSONArray dataArray = new JSONArray();
			    			        JSONObject dataInfo = new JSONObject();
			    			        dataInfo.put("alarm", "1");
			    			        dataInfo.put("project", "1");
			    			        dataArray.add(dataInfo);
			    			        jsonObject.put("data", dataArray);
			    			        String jsonInfo = jsonObject.toJSONString();
			    			        System.out.println("JsonInfo 만들어진 값 확인 :  ========================" + jsonInfo);
			    			        s.sendMessage(new TextMessage(jsonInfo));
			    					log("들어온 최종 값 : "+ message.getPayload());
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