package com.ln.service;

import com.ln.dao.DoctorDao;
import com.ln.dao.WorkDao;
import com.ln.entity.Doctor;
import com.ln.entity.Work;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class DoctorServiceImpl implements DoctorService {
    @Autowired
    WorkDao workDao;
    @Autowired
    DoctorDao doctorDao;

    @Override
    public List<Doctor> findAllDoctor() {
        return doctorDao.findAllDoctor();
    }



    @Override
    public List<Doctor> findDoctor(Doctor doctor) {
        return doctorDao.findDoctor(doctor);
    }

    @Override
    public Doctor findDoctorByDoctorId(String doctorId) {
        return doctorDao.findDoctorByDoctorId(doctorId);
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
        List<Work> works = workDao.findWorkByDoctorId(doctor.getDoctorId());
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
        List<Work> works = workDao.findWorkByDoctorId(doctorId);
        Doctor doctor = doctorDao.findDoctorByDoctorId(doctorId);
        if (works != null) {
            return doctor.getDoctorName()+"医生还有"+works.size()+"个值班，不能删除";
        } else {
            doctorDao.deleteDoctor(doctorId);
            return doctor.getDoctorName()+"删除成功";
        }

    }
}
