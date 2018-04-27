package com.toinfra.Filter;

import kr.or.phonejob.Service.LogSaveService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SslInterCeptor extends HandlerInterceptorAdapter {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (logger.isDebugEnabled()) {
            logger.debug("======================================          SSL Filter START         ======================================");
            logger.debug(" Request URI \t:  " + request.getRequestURI());


    }
        return super.preHandle(request, response, handler);
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {


        // SSL 적용
        String url = request.getRequestURL().toString();
        if(url.startsWith("http://") && url.indexOf("localhost") < 0) {
            url = url.replaceAll("http://", "https://");
            response.sendRedirect(url);
        }


        if (logger.isDebugEnabled()) {
            logger.debug("======================================           SSL Filter END          ======================================\n");
        }
    }
}
