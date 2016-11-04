package kr.or.epm.ws;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class EchoHandler extends TextWebSocketHandler {
    
    private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
    
    /**
     * 클라이언트 연결 이후에 실행되는 메소드
     */
    @Override
    public void afterConnectionEstablished(WebSocketSession session)
            throws Exception {
        
        logger.info(" {0} conntected ", session.getId());
    }
    /**
     * 클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행되는 메소드
     */
    @Override
    protected void handleTextMessage(WebSocketSession session,
            TextMessage message) throws Exception {
        logger.info("From {0}, recieved Message : {1} ", session.getId(), message.getPayload() );
        
        //연결되어있는 모든 클라이언트들에게 메시지를 전송한다
        session.sendMessage(new TextMessage("echo: " + message.getPayload()));
    }
    /**
     * 클라이언트가 연결을 끊었을 때 실행되는 메소드
     */
    @Override
    public void afterConnectionClosed(WebSocketSession session,
            CloseStatus status) throws Exception {
        logger.info(" {0} Connection Closed ", session.getId());
        super.afterConnectionClosed(session, status);
    }
 
}
 
