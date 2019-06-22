package com.uestc.common.util;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 拦截器
 * description：统计每个访问的处理时间
 */
public class HandleTimeInterceptor extends HandlerInterceptorAdapter {
    private Logger logger = LoggerFactory.getLogger(HandleTimeInterceptor.class);

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        long startTime = System.currentTimeMillis();
        request.setAttribute("startTime",startTime);
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
     long currentTime = System.currentTimeMillis();
     long startTime = (long)request.getAttribute("startTime");
     long handleTime = currentTime-startTime;
     logger.debug("请求处理时间为："+handleTime+"ms");
    }


}
