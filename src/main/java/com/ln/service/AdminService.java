package com.ln.service;



import com.ln.entity.Admin;

import javax.servlet.http.HttpSession;
import java.util.Map;
import java.util.Objects;

public interface AdminService {

    Map<String, Object> login(String name, String password, String enCode, HttpSession session);
void logout( HttpSession session);
}
