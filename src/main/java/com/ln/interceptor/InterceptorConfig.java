package com.ln.interceptor;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@Configuration
public class InterceptorConfig implements WebMvcConfigurer {
    @Override
    public void addViewControllers(ViewControllerRegistry registry) {

    }
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new BackInterceptor()).addPathPatterns("/back/**")
                .excludePathPatterns("/", "/back/login");
        registry.addInterceptor(new FrontInterceptor())
                .addPathPatterns("/front/**")
                .excludePathPatterns("/","/front/doctor")
                .excludePathPatterns("/front/register")
                .excludePathPatterns("/front/main")
                .excludePathPatterns("/front/work")
               ;
    }

}
