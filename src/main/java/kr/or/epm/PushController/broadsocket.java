package kr.or.epm.PushController;

import java.io.IOException;
import java.io.StringWriter;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.OnClose;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.epm.DAO.PushDAO;

@ServerEndpoint("/broadsocket")
public class broadsocket {

	// 유저 집합 리스트
	static List<Session> sessionUsers = Collections.synchronizedList(new ArrayList<Session>());

	/*
	 *      웹 소켓이 접속되면 유저리스트에 세션을 넣는다.      @param userSession 웹 소켓 세션
	 */
	@OnOpen
	public void handleOpen(Session userSession) throws IOException {
		System.out.println("연결?ㅎㅎㅎ");
		sessionUsers.add(userSession);
		
		
		/*
		 * System.out.println(sessionUsers.get(0).getUserPrincipal().getName());
		 */
		
		String username = null;
		try {
			System.out.println("Try문 시작");
			username = sessionUsers.get(0).getUserPrincipal().getName();

		} catch (Exception e) {
			System.err.println(e.getMessage());
		} finally {
			System.out.println("파이널리 !!##### : "+username);
			if(username == null){
				userSession.getUserProperties().put("username", "로그인 후 시도하세요");
				userSession.getBasicRemote().sendText(buildJsonData("System", "" + "로그인 후 시도하세요"));
				return;
			}
			//username이 있으면 전체에게 메시지를 보낸다.
			Iterator<Session> iterator = sessionUsers.iterator();
			while(iterator.hasNext()){
				iterator.next().getBasicRemote().sendText(buildJsonData(username,"알림 테스트"));
			}	

		}
		

	}
	

	@OnClose
	public void handleClose(Session userSession) {
		sessionUsers.remove(userSession);
	}
	/*
	 * json타입의 메시지 만들기
	 * 
	 * @param username
	 * 
	 * @param message
	 * 
	 * @return
	 */

	public String buildJsonData(String username, String string) {
		System.out.println("빌드제이슨데이타");
		System.out.println("유저네임 : " + username);
		System.out.println("문자 데이터 : " + string);
		JsonObject jsonObject = Json.createObjectBuilder().add("message", "New" + " : " + string).build();
		StringWriter stringwriter = new StringWriter();
		try (JsonWriter jsonWriter = Json.createWriter(stringwriter)) {
			jsonWriter.write(jsonObject);
		}
		;
		return stringwriter.toString();
	}
	
}
