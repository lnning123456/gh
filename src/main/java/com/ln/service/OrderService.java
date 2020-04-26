package com.ln.service;

import com.ln.entity.Order;

import java.util.List;
import java.util.Map;

public interface OrderService {
    String  addOrder(Order order);
    String deleteOrder(String[] orderIds);
    String updateOrder(Order order);
    Map<String,Object> queryOrder(Order order, Integer start);
}
