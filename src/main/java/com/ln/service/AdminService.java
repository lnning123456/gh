package com.ln.service;


import javax.servlet.http.HttpSession;
import java.util.Map;

public interface AdminService {

    Map<String, Object> login(String name, String password, String enCode, HttpSession session);

    void logout(HttpSession session);
}
