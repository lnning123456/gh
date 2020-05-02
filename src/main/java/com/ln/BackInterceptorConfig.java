package com.ln;

import com.ln.BackInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@Configuration
public class BackInterceptorConfig implements WebMvcConfigurer {
    @Autowired
    BackInterceptor backInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
      /*  registry.addInterceptor(backInterceptor)
                .addPathPatterns("/back/**" )
                .excludePathPatterns("/back/login.jsp")
        ;*/
        InterceptorRegistration addInterceptor = registry.addInterceptor(backInterceptor);
        addInterceptor.addPathPatterns("/back/**");
        addInterceptor.excludePathPatterns("/back/login.jsp");

    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {

    }
}
