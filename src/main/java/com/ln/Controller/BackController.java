package com.ln.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("back/")
public class BackController {
    @RequestMapping("/main")
    public String backMain(){
        return "back/main";
    }
    @RequestMapping("login")
    public String backLogin(){
        return "back/login";
    }
    @RequestMapping("department/department")
    public String departmentDepartment(){
        return "back/department/department";
    }
    @RequestMapping("department/addDepartment")
    public String departmentAddDepartment(){
        return "back/department/addDepartment";
    }
    @RequestMapping("doctor/doctor")
    public  String doctorDoctor(){
        return  "back/doctor/doctor";
    }
    @RequestMapping("doctor/addDoctor")
    public  String doctorAddDoctor(){
        return  "back/doctor/addDoctor";
    }
    @RequestMapping("user/user")
    public String userUser(){
        return  "back/user/user";
    }

    @RequestMapping("doctor/updateDoctor")
    public String doctorUpdateDoctor(String doctorId){
        return "back/doctor/updateDoctor";
    }
    @RequestMapping("doctor/work")
    public  String doctorWork(String doctorId){
        return  "back/doctor/work";
    }
   @RequestMapping("user/order")
    public  String userOrder(){
        return  "back/user/order";
   }
    @RequestMapping("doctor/addWork")
    public  String doctorAddWork(String doctorId){
        return  "back/doctor/addWork";
    }
}
