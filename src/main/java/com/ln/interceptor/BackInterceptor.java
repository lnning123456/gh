package com.ln.interceptor;

import com.ln.entity.Admin;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
public class BackInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
        Admin admin = (Admin) request.getSession().getAttribute("admin");
       if (admin==null){
           try {
               response.sendRedirect("http://localhost:8989/gh/back/login");
           } catch (IOException e) {
               e.printStackTrace();
           }
           return false;
       }else {
           return true;
       }

    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {

    }
}