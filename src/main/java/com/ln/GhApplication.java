package com.ln;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.ln.dao")
public class GhApplication {

    public static void main(String[] args) {
        SpringApplication.run(GhApplication.class, args);
    }

}
