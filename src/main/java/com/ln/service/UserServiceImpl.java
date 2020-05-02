package com.ln.service;

import com.ln.dao.UserDao;
import com.ln.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao userDao;

    @Override
    public String userRegister(User user,HttpSession session) {
        System.out.println("user = " + user);
        User queryUser= userDao.queryUserByCall(user.getCall());
        if (queryUser!=null){
            return "该手机号已被注册，请重新输入";
        }else {

            user.setUserId(new Date().getTime()+"");
            user.setStatus("正常");
            userDao.addUser(user);
            session.setAttribute("user",user);
            return "ok";
        }
    }

    @Override
    public String login(User user, String code,HttpSession session) {
        User queryUser = userDao.queryUserByCall(user.getCall());
        String imgCode = (String) session.getAttribute("code");
        if (!imgCode.equals(code)) {
            return "验证码错误";
        }else  if(queryUser==null){
            return "该用手机号不存在";
        }else if(!user.getPassword().equals(queryUser.getPassword())){
            return "密码输入错误";
        }else if(queryUser.getStatus().equals("注销")){
            return "账号异常";
        }else{
            session.setAttribute("user",queryUser);
            return "登录成功";
        }
    }

    @Override
    public String logout(HttpSession session) {
        session.removeAttribute("user");
        return "退出成功";
    }

    @Override
    public Map<String, Object> userList(User user,Integer page) {
        HashMap<String, Object> map = new HashMap<>();
        Integer start = (page - 1) * 5;
        List<User> users = userDao.queryPageUser(user,start);
        Integer sum=userDao.getUserCount(user);
        Integer total = sum % 5 == 0 ? sum / 5 : sum / 5+ 1;
        map.put("users",users);
        map.put("sum",sum);
        map.put("total",total);
        map.put("page",page);
        return map;
    }

    @Override
    public User queryUserByCall(String call) {
        return userDao.queryUserByCall(call);
    }

    @Override
    public String updateUserPassword(User user ,String oldPassword) {
        User updateUser = userDao.queryByUserId(user.getUserId());
        if (updateUser.getPassword().equals(oldPassword)){
            userDao.updateUser(user);
            return "密码修改完成";
        }
        return  "密码输入错误";

    }
    @Override
    public String updateUserStatus(User user) {
        userDao.updateUser(user);
        return "用户状态修改完成";
    }
}
