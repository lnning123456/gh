package com.ln.service;

import com.ln.entity.User;

import javax.servlet.http.HttpSession;
import java.util.Map;

public interface UserService {
    String userRegister(User user,HttpSession session);
    String login(User user, String code,HttpSession session);
    String logout(HttpSession session);
    Map<String,Object> userList(User user,Integer page);
    User queryUserByCall(String call);
    String updateUserPassword(User user,String oldPassword);
    String updateUserStatus(User user);
}
