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
        System.out.println("order = " + order);
        return orderService.addOrder(order);
    }
    @RequestMapping("deleteOrder")
    String deleteOrder(String[] orderIds){
        for (String orderId : orderIds) {
            System.out.println("orderId = " + orderId);
        }
        return  orderService.deleteOrder(orderIds);
    }
    @RequestMapping("updateOrder")
    String updateOrder(Order order){
        System.out.println("updateOrder order = " + order);
        return orderService.updateOrder(order);
    }
    @RequestMapping("queryOrder")
    Map<String,Object> queryOrder(Order order, Integer start){
        System.out.println("order = " + order);
        System.out.println("start = " + start);
        return  orderService.queryOrder(order,start);
    }
}
