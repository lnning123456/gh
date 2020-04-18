package com.ln.dao;

import com.ln.entity.Order;

import java.util.List;

public interface OrderDao {
    void  addOrder(Order order);
    void  deleteOrder(String orderId);
    void  updateOrder(Order order);
    List<Order> findOrderByUsername(String usernameId);
    List<Order> findOrderByWork(String workId);
 }
