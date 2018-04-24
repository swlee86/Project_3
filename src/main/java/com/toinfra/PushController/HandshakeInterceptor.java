package com.toinfra.PushController;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
  
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;
  

public class HandshakeInterceptor extends HttpSessionHandshakeInterceptor{
  
    @Override
    public boolean beforeHandshake(ServerHttpRequest request,ServerHttpResponse response, WebSocketHandler wsHandler,
         Map<String, Object> attributes) throws Exception {     
    
        // 위의 파라미터 중, attributes 에 값을 저장하면 웹소켓 핸들러 클래스의 WebSocketSession에 전달된다  
        ServletServerHttpRequest ssreq = (ServletServerHttpRequest) request;
  
        //session key에 name으로 담은 session을 뽑아낸다
        HttpServletRequest req =  ssreq.getServletRequest();
        String emp_no = (String)req.getSession().getAttribute("emp_no");    
        //session에 관련된 map에 저장
        attributes.put("emp_no", emp_no);
        return super.beforeHandshake(request, response, wsHandler, attributes);
    }
  
    @Override
    public void afterHandshake(ServerHttpRequest request,
            ServerHttpResponse response, WebSocketHandler wsHandler,
            Exception ex) {
        
        super.afterHandshake(request, response, wsHandler, ex);
    }
  
}