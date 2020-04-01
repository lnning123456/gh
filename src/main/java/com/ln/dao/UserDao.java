package com.ln.dao;

import com.ln.entity.User;

import java.util.List;

public interface UserDao {
    User findUserByUsernameAndPassword(String username,String password);
    void addUser(User user);
    void updateUser(User user);

}
