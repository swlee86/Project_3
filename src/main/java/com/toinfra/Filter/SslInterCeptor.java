package com.toinfra.Filter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
/*
        // SSL 적용
        String url = request.getRequestURL().toString();
        logger.info("SSL 접근 URL : " + url);
        if(url.startsWith("http://") && url.indexOf("localhost") < 0) {
            url = url.replaceAll("http://", "https://");
            logger.info("SSL 적용 후 URL : " + url);
            response.sendRedirect(url);
            return false;
        }else{

        }

    */

        return super.preHandle(request, response, handler);
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {




        if (logger.isDebugEnabled()) {
            logger.debug("======================================           SSL Filter END          ======================================\n");
        }
    }
}
