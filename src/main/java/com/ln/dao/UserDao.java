package com.ln.dao;

import com.ln.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {
    User queryUserByUsername(String Call);
    void addUser(User user);
    void updateUser(User user);
    List<User> queryUser(@Param("user") User user,@Param("start")Integer start);
    Integer getUserCount(User user);
}
