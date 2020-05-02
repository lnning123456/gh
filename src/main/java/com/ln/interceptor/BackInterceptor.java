package com.ln.interceptor;

import com.ln.entity.Admin;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
public class BackInterceptor  implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

       Admin admin= (Admin) request.getSession().getAttribute("admin");
        System.out.println("admin = " + admin);
        if (admin== null) {
            System.out.println("======111111111===");
            String url=request.getContextPath()+"/back/login.jsp";
            System.out.println(url);
           response.sendRedirect("https://www.baidu.com");
            return false;
           }else {
            System.out.println("======1111111112===");
            return true;
           }

        //return true;


    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        System.out.println("======22222222111111111===");
    }
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        System.out.println("======3333333333333111111111===");
    }
}
