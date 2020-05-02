package com.ln;

import com.ln.dao.UserDao;
import com.ln.entity.User;
import com.ln.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@SpringBootTest(classes = GhApplication.class)
@RunWith(SpringRunner.class)
public class UserTest {
    @Autowired
    UserDao userDao;
    @Autowired
    UserService userService;
    @Test
    public  void  queryPage(){
        User user1 = new User();
        List<User> users = userDao.queryPageUser(user1,0);
        for (User user : users) {
            System.out.println("user = " + user);
        }
    }
    @Test
    public  void  getCount(){
        User user = new User();
        Integer userCount = userDao.getUserCount(user);
        System.out.println("userCount = " + userCount);
    }
    @Test
    public  void  query(){
        User user = new User();
        //user.setUserId("1");
     //  user.setUsername("we");
        user.setCall("125475152");
        User user1 = userService.queryUserByCall(user.getCall());
        System.out.println("user1 = " + user1);
    }
    @Test
    public  void update(){
        User user = new User();
        user.setUserId("1");
        user.setStatus("注销");
     //   user.setCall("125475152");
        //user.setPassword("321");
        userDao.updateUser(user);
        //System.out.println("s = " + s);
    }
    @Test
    public  void login(){
        User user = new User();
       // user.setUsername("we");
        user.setCall("12345666");
        User user1 = userDao.queryUserByCall(user.getCall());
        System.out.println("user1 = " + user1);
    }
    @Test
    public  void testNull(){
        User user=userDao.queryUserByCall("123456");
                if (user!=null){
                    System.out.println("user = " + user);
                }else {
                    System.out.println("is null");
                }
    }

}
