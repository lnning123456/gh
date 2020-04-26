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
        System.out.println("user = " + user);
        return userService.userRegister(user,session);
    }
    @RequestMapping("login")
    String login(User user,HttpSession session){
        System.out.println("user = " + user);
        return userService.login(user,session);
    }

    @RequestMapping("logout")
    String logout(HttpSession session){
        System.out.println("logout");
        return userService.logout(session);
    }
    @RequestMapping("userList")
    Map<String,Object> userList(Integer page){
        System.out.println("page = " + page);
        return  userService.userList(page);
    }
    @RequestMapping("queryUser")
    User queryUser(User user){
        System.out.println("user = " + user);
        return userService.queryUser(user);
    }
    @RequestMapping("updateUserPassword")
    String updateUserPassword(User user){
        System.out.println("updateUserPassword user = " + user);
    return  userService.updateUserPassword(user);
    }
    @RequestMapping("updateUserStatus")
    String updateUserStatus(User user){
        System.out.println("updateUserStatus user = " + user);
   return userService.updateUserStatus(user);
    }
}
