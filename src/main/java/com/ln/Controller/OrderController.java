package com.ln.Controller;

import com.ln.entity.Order;
import com.ln.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;
@RestController
@RequestMapping("order")
public class OrderController {
    @Autowired
    OrderService orderService;
    @RequestMapping("addOrder")
    String  addOrder(Order order){
        return orderService.addOrder(order);
    }
    @RequestMapping("deleteOrder")
    String deleteOrder(String orderId){
        return  orderService.deleteOrder(orderId);
    }
    @RequestMapping("updateOrder")
    String updateOrder(Order order){
        return orderService.updateOrder(order);
    }
    @RequestMapping("queryOrder")
    Map<String,Object> queryOrder(Order order, Integer page,String compare){
        System.out.println("compare = " + compare);
        return  orderService.queryOrder(order,page,compare);
    }
}
