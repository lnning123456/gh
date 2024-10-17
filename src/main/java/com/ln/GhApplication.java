package com.ln;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@MapperScan("com.ln.dao")
@SpringBootApplication
public class GhApplication {

    public static void main(String[] args) {
        SpringApplication.run(GhApplication.class, args);
    }

}
