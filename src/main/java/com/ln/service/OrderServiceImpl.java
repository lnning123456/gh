package com.ln.service;

import com.ln.dao.OrderDao;
import com.ln.dao.WorkDao;
import com.ln.entity.Doctor;
import com.ln.entity.Order;
import com.ln.entity.Work;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    OrderDao orderDao;
@Autowired
    WorkDao workDao;
    @Override
    public String addOrder(Order order) {
        Work work = workDao.queryWorkByWorkId(order.getWorkId());
        work.setRemain(work.getRemain()-1);
        work.setUserCount(work.getUserCount()+1);
        workDao.updateWork(work);
        order.setCreateTime(new Date());
        order.setOrderId(new Date().toString()+"");
        order.setStatus("已预约");
        orderDao.addOrder(order);
        return "挂号成功，请进入个人中心查看";
    }

    @Override
    public String deleteOrder(String[] orderIds) {
        orderDao.deleteOrder(orderIds);
        return "删除成功";
    }

    @Override
    public String updateOrder(Order order) {
        if (order.getStatus().equals("已取消")) {
            System.out.println("已取消");
            orderDao.updateOrder(order);
            return "取消预约成功";
        } else {
            orderDao.updateOrder(order);
            System.out.println("已完成");
            return "预约已完成";
        }

    }

    @Override
    public Map<String, Object> queryOrder(Order order, Integer page) {
        HashMap<String, Object> map = new HashMap<>();
        Integer start = (page - 1) * 5;
        List<Order> orders = orderDao.queryOrder(order, start);
        Integer sum=orderDao.getOrderCount(order);
        Integer total = sum % 5 == 0 ? sum / 5 : sum / 5+ 1;
        map.put("orders",orders);
        map.put("sum",sum);
        map.put("total",total);
        map.put("page",page);
        return map;
    }
}
