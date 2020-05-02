package com.ln.service;

import com.ln.dao.OrderDao;
import com.ln.dao.UserDao;
import com.ln.dao.WorkDao;
import com.ln.entity.Order;
import com.ln.entity.User;
import com.ln.entity.Work;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    OrderDao orderDao;
@Autowired
    WorkDao workDao;
@Autowired
    UserDao userDao;
    @Override
    public String addOrder(Order order) {
        Work work = workDao.queryWorkByWorkId(order.getWorkId());
        //Integer remain=;
        work.setRemain(work.getRemain()-1);
        work.setUserCount(work.getUserCount()+1);
        workDao.updateWork(work);
        order.setCreateTime(new Date());
        order.setOrderId(new Date().getTime()+"");
        order.setStatus("已预约");
        orderDao.addOrder(order);
        return "ok";
    }

    @Override
    public String deleteOrder(String orderId) {
        orderDao.deleteOrder(orderId);
        return "删除成功";
    }

    @Override
    public String updateOrder(Order order) {
        if (order.getStatus().equals("已取消")) {
            Work work = workDao.queryWorkByWorkId(order.getWorkId());
            work.setRemain(work.getRemain()+1);
            work.setUserCount(work.getUserCount()-1);
            workDao.updateWork(work);
            orderDao.updateOrder(order);
            return "取消预约成功";
        } else {
            orderDao.updateOrder(order);
            return "预约完成";
        }

    }

    @Override
    public Map<String, Object> queryOrder(Order order, Integer page) {
        HashMap<String, Object> map = new HashMap<>();
        Integer start = (page - 1) * 5;
        List<Order> orders = orderDao.queryOrder(order, start);
        Integer sum=orderDao.getOrderCount(order);
        Integer total = sum % 5 == 0 ? sum / 5 : sum / 5+ 1;
        if (order.getUserId()!=null){
            User user = userDao.queryByUserId(order.getUserId());
            map.put("user",user);
        }
        map.put("orders",orders);
        map.put("sum",sum);
        map.put("total",total);
        map.put("page",page);
        return map;
    }
}
