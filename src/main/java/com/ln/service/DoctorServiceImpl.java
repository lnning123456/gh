package com.ln.service;

import com.ln.dao.DoctorDao;
import com.ln.dao.WorkDao;
import com.ln.entity.Doctor;
import com.ln.entity.Work;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service
public class DoctorServiceImpl implements DoctorService {
    @Autowired
    WorkDao workDao;
    @Autowired
    DoctorDao doctorDao;

    @Override
    public List<Doctor> queryAllDoctor() {
        return doctorDao.queryAllDoctor();
    }



    @Override
    public Map<String,Object> queryDoctor(Doctor doctor, Integer page ) {
        HashMap<String, Object> map = new HashMap<>();
        Integer start = (page - 1) * 10;
        List<Doctor> doctors = doctorDao.queryDoctor(doctor, start);
        Integer sum=doctorDao.queryDoctorCount(doctor);
        Integer total = sum % 10 == 0 ? sum / 10 : sum / 10+ 1;
        map.put("doctor",doctors);
        map.put("sum",sum);
        map.put("total",total);
        map.put("page",page);
        return map;
    }

    @Override
    public Doctor queryDoctorByDoctorId(String doctorId) {
        return doctorDao.queryDoctorByDoctorId(doctorId);
    }


    @Override
    public String addDoctor(Doctor doctor) {
        doctor.setDoctorId(UUID.randomUUID().toString());
        doctor.setStatus("工作");
        doctorDao.addDoctor(doctor);
        return doctor.getDoctorName() + "添加成功";
    }

    @Override
    public String updateDoctor(Doctor doctor) {
        List<Work> works = workDao.queryWorkByDoctorId(doctor.getDoctorId());
        doctorDao.updateDoctor(doctor);
        System.out.println("doctor = " + doctor);
        if (works.size()!=0&&doctor.getStatus().equals("休息")){
            return doctor.getDoctorName() + "医生还有"+works.size()+"个值班，不能休息";
        }else{
            return doctor.getDoctorName() + "修改成功";
        }

    }

    @Override
    public String deleteDoctor(String doctorId) {
        List<Work> works = workDao.queryWorkByDoctorId(doctorId);
        Doctor doctor = doctorDao.queryDoctorByDoctorId(doctorId);
        if (works.size()!=0) {
            return doctor.getDoctorName()+"医生还有"+works.size()+"个值班，不能删除";
        } else {
            doctorDao.deleteDoctor(doctorId);
            return doctor.getDoctorName()+"删除成功";
        }

    }
}
