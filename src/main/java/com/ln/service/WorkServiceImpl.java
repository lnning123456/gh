package com.ln.service;

import com.ln.dao.DoctorDao;
import com.ln.dao.WorkDao;
import com.ln.entity.Doctor;
import com.ln.entity.Work;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class WorkServiceImpl implements WorkService {
    @Autowired
    WorkDao workDao;
    @Autowired
    DoctorDao doctorDao;
    @Override
    public Map<String, Object> queryWork(Work work, Integer page,String  compare) {
        HashMap<String, Object> map = new HashMap<>();
        Integer start = (page - 1) * 5;
        List<Work> works = workDao.queryWork(work, start,compare);
        Integer sum = workDao.getWorkCount(work,compare);
        Integer total = sum % 5 == 0 ? sum / 5 : sum / 5 + 1;
        map.put("works", works);
        map.put("doctor", doctorDao.queryDoctorByDoctorId(work.getDoctorId()));
        map.put("sum", sum);
        map.put("total", total);
        map.put("page", page);
        return map;
    }

    @Override
    public String addWork(Work work) {
        Doctor doctor = doctorDao.queryDoctorByDoctorId(work.getDoctorId());
        if(doctor.getStatus().equals("休息")){
            return doctor.getDoctorName()+"医生目前在休息，添加工作失败";
        }else {
            work.setWorkId(new Date().getTime() + "");
            work.setUserCount(0);
            workDao.addWork(work);
            return "添加成功";
        }

    }

    @Override
    public String updateWork(Work work) {

        workDao.updateWork(work);
        return "修改成功";
    }

    @Override
    public String deleteWork(String workId) {
            workDao.deleteWork(workId);
            return "删除成功";
    }

    @Override
    public List<Work> followingWork(String doctorId) {
        return workDao.followingWork(doctorId);
    }
}
