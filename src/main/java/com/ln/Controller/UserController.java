package com.ln.Controller;

import com.ln.entity.User;
import com.ln.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.Map;

@RestController
@RequestMapping("user")
public class UserController {
    @Autowired
    UserService userService;
    @RequestMapping("userRegister")
    String userRegister(User user, HttpSession session){
        return userService.userRegister(user,session);
    }
    @RequestMapping("login")
    String login(User user,String code,HttpSession session){
        return userService.login(user,code,session);
    }

    @RequestMapping("logout")
    String logout(HttpSession session){
        return userService.logout(session);
    }
    @RequestMapping("userList")
    Map<String,Object> userList(User user,Integer page){
        return  userService.userList(user,page);
    }
    @RequestMapping("queryUser")
    User queryUser(String call){
        return userService.queryUserByCall(call);
    }
    @RequestMapping("updateUserPassword")
    String updateUserPassword(User user,String oldPassword){
    return  userService.updateUserPassword(user,oldPassword);
    }
    @RequestMapping("updateUserStatus")
    String updateUserStatus(User user){
   return userService.updateUserStatus(user);
    }
}
