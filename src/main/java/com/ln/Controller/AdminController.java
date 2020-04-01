package com.ln.Controller;

import com.ln.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.Map;

@RestController
@RequestMapping("admin")
public class AdminController {
    @Autowired
    AdminService adminService;
    @RequestMapping("login")

    public Map<String, Object> login(String name, String password, String code, HttpSession session) {
        return  adminService.login(name, password, code, session);
    }
    @RequestMapping("logout")
    public  void logout( HttpSession session){
        adminService.logout(session);
    }
}
