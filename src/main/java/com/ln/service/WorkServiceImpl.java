package com.ln.service;

import com.ln.dao.OrderDao;
import com.ln.dao.WorkDao;
import com.ln.entity.Work;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;

public class WorkServiceImpl implements WorkService {
    @Autowired
    WorkDao workDao;
    @Autowired
OrderDao orderDao;
    @Override
    public List<Work> queryWorkByDoctor(String doctorId) {
        return workDao.queryWorkByDoctorId(doctorId);
    }

    @Override
    public String addWork(Work work) {
        work.setWorkId(new Date().getTime()+"");
        work.setUserCount(0);
return "添加成功";
    }

    @Override
    public String deleteWork(String workId) {
workDao.deleteWork(workId);
return  "删除成功";
    }
}
