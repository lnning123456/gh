package com.ln.service;

import com.ln.entity.User;

import javax.servlet.http.HttpSession;
import java.util.Map;

public interface UserService {
    String userRegister(User user,HttpSession session);
    String login(User user,HttpSession session);
    String logout(HttpSession session);
    Map<String,Object> userList(Integer page);
    User queryUser(User user);
    String updateUserPassword(User user);
    String updateUserStatus(User user);
}
