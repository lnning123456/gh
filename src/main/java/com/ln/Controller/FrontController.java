package com.ln.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("front")
public class FrontController {
    @RequestMapping("main")
    public String frontMain(){
        return "front/main";
    }
    @RequestMapping("register")
    public  String register(){
        return "front/register";
    }
    @RequestMapping("my")
    public String my(){
        return  "front/my";
    }
    @RequestMapping("doctor")
    public  String doctor(){
        return  "front/doctor";
    }
    @RequestMapping("order")
    public  String order(){
        return  "front/order";
    }
    @RequestMapping("updatePassword")
    public  String updatePassword(){
        return "front/updatePassword";
    }
    @RequestMapping("work")
    public  String work(String doctorId){
        return  "front/work";
    }
    @RequestMapping("addOrderSuccess")
    public String addOrderSuccess(){
        return  "front/addOrderSuccess";
    }
}
