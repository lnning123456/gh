package com.ln;

import com.ln.dao.OrderDao;
import com.ln.entity.Order;
import com.ln.service.OrderService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@SpringBootTest(classes = GhApplication.class)
@RunWith(SpringRunner.class)
public class OrderTest {
    @Autowired
    OrderService orderService;
    @Autowired
    OrderDao orderDao;
      @Test
    public  void query(){
          Order order = new Order();
         order.setUserId("1");
       //   order.setStatus("已预约");
          List<Order> orders = orderDao.queryOrder(order,0);
          for (Order order1 : orders) {
              System.out.println("order1 = " + order1);
          }
      }
      @Test
    public  void add(){
        Order order = new Order();
        order.setWorkId("3");
        order.setUserId("1");
        String s = orderService.addOrder(order);
        System.out.println("s = " + s);
    }
      @Test
    public  void queryByWorkId(){
        List<Order> orders = orderDao.queryOrderByWorkId("1");
        for (Order order : orders) {
            System.out.println("order = " + order);
        }

    }
    @Test
    public  void queryCount(){
        Order order = new Order();
        order.setUserId("1");
        //   order.setStatus("已预约");
        Integer orderCount = orderDao.getOrderCount(order);
        System.out.println("orderCount = " + orderCount);
    }
    @Test
    public  void compare(){
          String compare=">";
        System.out.println("compare = " + compare);
        if (compare.equals(">")){
            System.out.println("1");
        }else {
            System.out.println("2");
        }
    }
}
