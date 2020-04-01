package com.ln.service;

import com.ln.dao.AdminDao;
import com.ln.entity.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    AdminDao adminDao;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Map<String,Object> login(String name, String password, String code, HttpSession session) {
        Map<String, Object> map = new HashMap<>();
        String imgCode = (String) session.getAttribute("code");
        if (code.equals(imgCode)) {
            Admin admin = adminDao.findByName(name);
            if (admin != null) {
                if (password.equals(admin.getPassword())) {
                    map.put("msg", "ok");
                    session.setAttribute("admin",admin);
                    System.out.println("session"+session.getAttribute("admin"));
                    return map;
                } else {
                    map.put("msg", "密码错误");
                    return map;
                }
            } else {
                map.put("msg", "用户名不存在");
                return map;
            }

        } else {
            map.put("msg", "验证码错误");
            return map;
        }

    }

    @Override
    public void logout( HttpSession session) {
        session.removeAttribute("admin");
    }
}
