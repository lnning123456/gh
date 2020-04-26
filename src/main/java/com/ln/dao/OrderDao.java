package com.ln.dao;

import com.ln.entity.Order;
import com.ln.entity.Work;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderDao {
    void  addOrder(Order order);
    void  deleteOrder(String[] orderIds);
    void  updateOrder(Order order);
    List<Order> queryOrder(@Param("order") Order order,@Param("start")Integer start);
    Integer   getOrderCount(Order order);


 }
