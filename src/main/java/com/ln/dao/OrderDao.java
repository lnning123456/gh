package com.ln.dao;

import com.ln.entity.Order;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderDao {
    void  addOrder(Order order);
    void  deleteOrder(String orderId);
    void  updateOrder(Order order);
    List<Order> queryOrder(@Param("order") Order order,@Param("start")Integer start,@Param("compare")String compare);
    Integer   getOrderCount(@Param("order") Order order,@Param("compare")String compare);
    List<Order> queryOrderByWorkId(String workId);


 }
