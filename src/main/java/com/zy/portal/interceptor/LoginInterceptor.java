package com.zy.portal.interceptor;

import com.zy.portal.common.Anonymous;
import com.zy.portal.common.RequestUser;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if(handler instanceof HandlerMethod) {

            HandlerMethod hm = (HandlerMethod)handler;
            Anonymous anonymous = hm.getMethodAnnotation(Anonymous.class);
            if(null == anonymous) {
                return true;
            }

            request.getSession().removeAttribute("requestUrl");
            request.getSession().setAttribute("requestUrl", "index");
            if(null == RequestUser.getCurrentUser()) {
                // TODO: 2018/12/30 跳转登录界面
                request.getSession().setAttribute("requestUrl", request.getRequestURL().toString());
                response.sendRedirect("/login");
                return false;
            }
        }
        return true;
    }
}
