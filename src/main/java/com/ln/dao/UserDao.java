package com.ln.dao;

import com.ln.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {
    User queryUser(User user);
    User queryByUserId(String userId);
    void addUser(User user);
    void updateUser(User user);
    List<User> queryPageUser(Integer start);
    Integer getUserCount();
}
